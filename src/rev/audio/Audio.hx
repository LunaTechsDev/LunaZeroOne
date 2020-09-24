package rev.audio;

import kha.Sound;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;

typedef KAudio = kha.audio1.Audio;
typedef KAudioChannel = kha.audio1.AudioChannel;
typedef KSound = kha.Sound;
typedef Sound = KSound;

class Audio {
  public static var audioChannel: KAudioChannel;
  public static var audioStreamChannel: KAudioChannel;
  public static var soundChannel: KAudioChannel;
  public static var soundStreamChannel: KAudioChannel;

  public static function initialize() {}

  public static function playSound(sound: Sound, loop: Bool = false) {
    soundChannel = KAudio.play(sound, loop);
  }

  public static function playAudio(sound: Sound, loop: Bool = false) {
    audioChannel = KAudio.play(sound, loop);
  }

  public static function streamSound(sound: Sound, loop: Bool = false) {
    soundStreamChannel = KAudio.stream(sound, loop);
  }

  public static function streamAudio(sound: Sound, loop: Bool = false) {
    audioStreamChannel = KAudio.stream(sound, loop);
  }

  public static function resumeSound() {
    soundChannel.play();
  }

  public static function resumeAudio() {
    audioChannel.play();
  }

  public static function resumeSoundStream() {
    soundStreamChannel.play();
  }

  public static function resumeAudioStream() {
    audioStreamChannel.play();
  }

  public static function pauseSound() {
    soundChannel.pause();
  }

  public static function pauseSoundStream() {
    soundStreamChannel.pause();
  }

  public static function pauseAudio() {
    audioChannel.pause();
  }

  public static function pauseAudioStream() {
    audioStreamChannel.pause();
  }

  public static function stopSound() {
    soundChannel.stop();
  }

  public static function stopSoundStream() {
    soundStreamChannel.stop();
  }

  public static function stopAudio() {
    audioChannel.stop();
  }

  public static function stopAudioStream() {
    return audioStreamChannel.stop();
  }

  public static function setSoundVolume(volume: Float) {
    soundChannel.volume = volume;
  }

  public static function getSoundVolume() {
    return soundChannel.volume;
  }

  public static function setAudioVolume(volume: Float) {
    audioChannel.volume = volume;
  }

  public static function getAudioVolume() {
    return audioChannel.volume;
  }

  public static function setSoundStreamVolume(volume: Float) {
    soundStreamChannel.volume = volume;
  }

  public static function getSoundStreamVolume() {
    return soundStreamChannel.volume;
  }

  public static function setAudioStreamVolume(volume: Float) {
    audioStreamChannel.volume = volume;
  }

  public static function getAudioStreamVolume() {
    return audioStreamChannel.volume;
  }

  public static function isSoundPlaying() {
    return soundChannel != null ? soundChannel.finished : false;
  }

  public static function isAudioPlaying() {
    return audioChannel != null ? audioChannel.finished : false;
  }

  public static function isSoundStreaming() {
    return soundStreamChannel != null ? soundStreamChannel.finished : false;
  }

  public static function isAudioStreaming() {
    return audioStreamChannel != null ? audioStreamChannel.finished : false;
  }
}
