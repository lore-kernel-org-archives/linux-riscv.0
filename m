From: lkcl@lkcl.net (Luke Kenneth Casson Leighton)
Date: Sat, 10 Nov 2018 05:12:39 +0000
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
Message-ID: <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Nov 10, 2018 at 2:42 AM Atish Patra <atish.patra@wdc.com> wrote:

> ## Conclusion
> This proposal is far from perfect and absolutely any suggestion is
> welcome. Obviously, there are many other functionalities that can be
> added to this proposal. However, I just wanted to start with something
> that is an incremental change at best to kick off the discussion. The
> aim here is to initiate a discussion that can lead to a robust SBI
> specification.

 very cool, atish.

 i would very much like to see the optional addition of multiple
serial lines, by adding a getchar and putchar function that takes just
one extra argument: the serial line index.

 there are a lot of different uses to which mult-serial lines may be put:

 * boot message separation from console login
 * boot management separation from other purposes (u-boot/coreboot)
 * virtual /dev/ttyS0-3
 * clean UPS reporting and management
 * remote virtual machine power management (power-on / off)
 * simple bog-standard multiple virtual login consoles
 * separation of debug messages (stdout/stderr) to ease debugging and
development
 * remote and virtual OpenOCD and kernel debugging without disrupting
the main serial console
 * PPP serial links.

this latter is one that i am particularly interested in, as i would
like to be able to boot a full GNU/Linux OS on spike, given the lower
barrier to entry in making modifications and experimenting with spike
than it is with qemu.

 if spike were able, through a multi-serial SBI interface, to have a
PPP serial line, it would be possible to run a root NFS (or other
network block device) without having to sacrifice console access.  it
would be possible to create an initramfs from a lower-capability
system like buildroot, containing PPP, enable it, and pivot-root out
to a full stock GNU/Linux OS such as debian or fedora.

 so there are huge benefits, reducing the development barrier to entry
into RISC-V experimentation and debugging, and opening up a much wider
range of capabilities and possibilities for machine and virtual system
management.

l.
