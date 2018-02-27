From: linux@roeck-us.net (Guenter Roeck)
Date: Tue, 27 Feb 2018 14:55:49 -0800
Subject: Building Risc-V Linux kernel images for qemu without rebuilding bbl
Message-ID: <20180227225549.GA20986@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi folks,

I have been trying to set up Risc-V qemu test builds on kerneltests.org.
Major hold-up at this point is the need to continuously rebuild bbl images
with embedded kernel images. Due to various reasons, this is all but
impossible with my auto-build system.

Is there a means to load bbl and vmlinux images separately into qemu,
or maybe a tool to attach the kernel to a pre-built bbl image ?
Of course, it would be even better if it was possible to just specify
"-kernel vmlinux" or something similar on the kernel command line.

Thanks,
Guenter
