import UIKit

class ViewController: UIViewController {

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }

    // MARK: - Private
    
    private let scrollView = SimpleScrollView()
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor(white: 0.16, alpha: 1.0)
        
        let img = UIImage(named: "metro_scheme")!
        let imgView = UIImageView(image: img)
        scrollView.contentView = imgView
        scrollView.contentSize = img.size
        scrollView.contentOffset = CGPoint(x: (img.size.width - view.bounds.width) / 2,
                                           y: (img.size.height - view.bounds.height) / 2)
    }

}

#if false
class ViewController: UIViewController {

    private let scrollView = SimpleScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Create a list of labels
        let container = UIView()

        // Example: 30 items, each 50-pts tall
        let itemCount = 100
        let labelHeight: CGFloat = 50
        for i in 0..<itemCount {
            let label = UILabel(frame: CGRect(
                x: 0,
                y: CGFloat(i) * labelHeight,
                width: view.bounds.width,
                height: labelHeight
            ))
            label.text = "Item #\(i)"
            label.textAlignment = .center
            label.backgroundColor = (i % 2 == 0) ? .systemGray5 : .systemGray4
            container.addSubview(label)
        }

        // Container needs a total height:
        let totalHeight = CGFloat(itemCount) * labelHeight
        container.frame = CGRect(
            x: 0,
            y: 0,
            width: view.bounds.width * 2,
            height: totalHeight
        )

        // Setup custom scroll view
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)

        // Insert the container into our scroll view
        scrollView.contentView = container
        scrollView.contentSize = CGSize(width: view.bounds.width * 2, height: totalHeight)

        view.addSubview(scrollView)
    }
}
#endif
