From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 23:20:06 -0700
Subject: [PATCH v2] riscv: Do not overwrite initrd_start and initrd_end
In-Reply-To: <1535502826-23856-1-git-send-email-linux@roeck-us.net>
References: <1535502826-23856-1-git-send-email-linux@roeck-us.net>
Message-ID: <20180831062006.GA18424@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Aug 28, 2018 at 05:33:46PM -0700, Guenter Roeck wrote:
> setup_initrd() overwrites initrd_start and initrd_end if __initramfs_size
> is larger than 0, which is always true even if there is no embedded
> initramfs. This prevents booting qemu with "-initrd" parameter.
> Overwriting initrd_start and initrd_end is not necessary since
> __initramfs_start and __initramfs_size are used directly in
> populate_rootfs() to load the built-in initramfs, so just drop
> that code.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
