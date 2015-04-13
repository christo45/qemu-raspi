# Qemu
#
# V1

FROM ubuntu:14.10

RUN apt-get update && apt-get install -y qemu-system-arm

RUN mkdir -p /home/raspi
ADD ./kernel-qemu /home/raspi/

VOLUME ./raspi/
WORKDIR /home/raspi

EXPOSE 80 22

ENTRYPOINT qemu-system-arm -kernel /home/raspi/kernel-qemu -cpu arm1176 -m 256 -M versatilepb -no-reboot -nographic -append "root=/dev/sda2 panic=1 console=ttyAMA0"
CMD -hda ./raspi.img

