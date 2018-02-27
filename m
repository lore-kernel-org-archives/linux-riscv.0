From: sorear2@gmail.com (Stef O'Rear)
Date: Tue, 27 Feb 2018 15:12:36 -0800
Subject: Building Risc-V Linux kernel images for qemu without rebuilding
 bbl
In-Reply-To: <20180227225549.GA20986@roeck-us.net>
References: <20180227225549.GA20986@roeck-us.net>
Message-ID: <CADJ6UvN5iqcm5o2=swC5oryaJif-phqu8RBiQrbEFHn0hZ2ezA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Feb 27, 2018 at 2:55 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> Hi folks,
>
> I have been trying to set up Risc-V qemu test builds on kerneltests.org.
> Major hold-up at this point is the need to continuously rebuild bbl images
> with embedded kernel images. Due to various reasons, this is all but
> impossible with my auto-build system.
>
> Is there a means to load bbl and vmlinux images separately into qemu,
> or maybe a tool to attach the kernel to a pre-built bbl image ?
> Of course, it would be even better if it was possible to just specify
> "-kernel vmlinux" or something similar on the kernel command line.

This isn't currently possible, but several people have expressed an
interest in it.

Recent discussion:

https://github.com/sifive/freedom-u-sdk/issues/33#issuecomment-368260995

https://github.com/riscv/riscv-qemu/pull/109#issuecomment-367885879

-s
