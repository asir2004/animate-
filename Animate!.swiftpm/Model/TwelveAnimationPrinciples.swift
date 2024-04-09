import SwiftUI

struct AnimationPrinciple {
    let name: String
    let image: String
    let movie: String
    let detail: String
    
    init(name: String, image: String, movie: String, detail: String = "") {
        self.name = name
        self.image = image
        self.movie = movie
        self.detail = detail
    }
}

let TwelveAnimationPrinciples: [AnimationPrinciple] = [
    AnimationPrinciple(name: "PRINCIPLE_SQUASH_AND_STRETCH", image: "oval.fill", movie: "Squash and stretch", detail: "PRINCIPLE_SQUASH_AND_STRETCH_EXPLANATION"),
    AnimationPrinciple(name: "PRINCIPLE_ANTICIPATION", image: "gauge.with.dots.needle.0percent", movie: "Anticipation", detail: "PRINCIPLE_ANTICIPATION_EXPLANATION"),
    AnimationPrinciple(name: "PRINCIPLE_STAGING", image: "rectangle.stack.fill", movie: "Staging", detail: "PRINCIPLE_STAGING_EXPLANATION"),
    AnimationPrinciple(name: "PRINCIPLE_STRAIGHT_AHEAD_ACTION_AND_POSE_TO_POSE", image: "circlebadge.2.fill", movie: "Straight-ahead action and pose-to-pose", detail: "PRINCIPLE_STRAIGHT_AHEAD_ACTION_AND_POSE_TO_POSE_EXPLANATION"),
    AnimationPrinciple(name: "PRINCIPLE_FOLLOW_THROUGH_AND_OVERLAPPING", image: "moonphase.waning.gibbous.inverse", movie: "Follow through and overlapping", detail: "PRINCIPLE_FOLLOW_THROUGH_AND_OVERLAPPING_EXPLANATION"),
    AnimationPrinciple(name: "PRINCIPLE_SLOW_IN_AND_SLOW_OUT", image: "alternatingcurrent", movie: "Slow in and slow out", detail: "PRINCIPLE_SLOW_IN_AND_SLOW_OUT_EXPANATION"),
    AnimationPrinciple(name: "PRINCIPLE_ARC", image: "point.topleft.down.to.point.bottomright.curvepath.fill", movie: "Arc", detail: "PRINCIPLE_ARC_EXPLANATION"),
    AnimationPrinciple(name: "PRINCIPLE_SECONDARY_ACTION", image: "square.stack.3d.forward.dottedline.fill", movie: "Secondary action", detail: "PRINCIPLE_SECONDARY_ACTION_EXPLANATION"),
    AnimationPrinciple(name: "PRINCIPLE_TIMING", image: "clock", movie: "Timing", detail: ""),
    AnimationPrinciple(name: "PRINCIPLE_EXAGGERATION", image: "exclamationmark.questionmark", movie: "Exaggeration", detail: "PRINCIPLE_EXAGGERATION_EXPLANATION"),
    AnimationPrinciple(name: "PRINCIPLE_SOLID_DRAWING", image: "rotate.3d.fill", movie: "Solid drawing", detail: "PRINCIPLE_SOLID_DRAWING_EXPLANATION"),
    AnimationPrinciple(name: "PRINCIPLE_APPEAL", image: "rectangle.dashed", movie: "Appeal", detail: "PRINCIPLE_APPEAL_EXPLANATION"),
]
