import UIKit

class StoryPromptViewController: UIViewController {

  @IBOutlet weak var storyPromptTextView: UITextView!

    var storyPrompt: StoryPromptEntry?
    var isNewStoryPromt: Bool = false

  override func viewDidLoad() {
    super.viewDidLoad()

    storyPromptTextView.text = storyPrompt?.description
      if isNewStoryPromt{
          let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
          let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
          navigationItem.leftBarButtonItem = cancelButton
          navigationItem.rightBarButtonItem = saveButton
      }
  }

    @objc func cancelStoryPrompt() {
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    
    @objc func saveStoryPrompt() {
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
}
