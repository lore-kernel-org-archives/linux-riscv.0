From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Thu, 30 Aug 2018 11:00:47 +0200
Subject: [PATCH v2] riscv: Do not overwrite initrd_start and initrd_end
In-Reply-To: <1535502826-23856-1-git-send-email-linux@roeck-us.net>
References: <1535502826-23856-1-git-send-email-linux@roeck-us.net>
Message-ID: <CAMuHMdV5_n=HqkBTZHZbpgzjoZD0_rmfxcT7GiGOpFxyZyiJ7A@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Guenter,

On Wed, Aug 29, 2018 at 2:34 AM Guenter Roeck <linux@roeck-us.net> wrote:
> setup_initrd() overwrites initrd_start and initrd_end if __initramfs_size
> is larger than 0, which is always true even if there is no embedded
> initramfs. This prevents booting qemu with "-initrd" parameter.
> Overwriting initrd_start and initrd_end is not necessary since
> __initramfs_start and __initramfs_size are used directly in

... since commit df52092f3c977885 ("fastboot: remove duplicate
unpack_to_rootfs()")...

To avoid -stable backporting this beyond v2.6.30 ;-)

> populate_rootfs() to load the built-in initramfs, so just drop
> that code.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
