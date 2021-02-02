Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462FCC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:50:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB41564E11
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB41564E11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n7zwSRj1dw9X4YnOvDF5/3z8YFw3vHW+sCUrbs0ARP8=; b=IuGRfKWC5PjWviq/Bt8TCvSkH
	dQkYnEINwN0JEYeo7iZqqJdZ6HtiW+5Ag2el5puJ1yDe5HyNVm38+3U2Zk+WGFerGA7wk3bigbXOM
	vY87bZeAw2KRCu84gVmSJ6igp80PjofrtBYe+Hh97j9AaGamVbtcpMe8TE5WqSGaFk0IlbG68ogki
	1/bY9o8Drb+z3DbQuSf2WFwXZt6Ja23h1x6q7HFVKULsdkqAaBPoIQOKwhLQs9V8/mRJ49STRFYOv
	UNK8JAR6rs589SKSR+URZcbqpqNBmEXfQW0g8zjyQZNIPjUKuhIamZxLZLFj0ZmvI1iAry7sg6Ns3
	HuEUi4LKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70kW-0007Pi-V0; Tue, 02 Feb 2021 18:50:05 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70kQ-0007OI-Ps
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 18:50:03 +0000
Received: by mail-io1-xd34.google.com with SMTP id f6so2289416ioz.5
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 10:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QdVGkDTpT4LKAfDaBOM/hVWZEHewWTCKVphyiL8dL10=;
 b=iLdTkU+VE4tcYTpGfjb+EmGaScIActNS33NIx/XL66N9Z0p7CSixRfgbpHxW1YLPJG
 VjtGhcMzkA/8dFpWzNddZSBpEqJcSW53puLka/oUbndjVGAFrsvFc27WmzMcBI3qxUes
 AohkFPLy37cS/ZbrIXLxWNa6fqV/TsEhinU18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QdVGkDTpT4LKAfDaBOM/hVWZEHewWTCKVphyiL8dL10=;
 b=EfjXYFXyiGwAvWYvGxFYg10dOJBQDEIFspoogFbCtdaxfj/8hDz0HBFoWRLNHww0EK
 g5oZv2hx4ArmJy4FllwCic/6zFuKgcAzQ/Ffpa1fJbNO1xl/vFMoPJ9HFdRk1sz5uEtu
 y6wflwr1KREDxBjmEwUfjMfqDgsVlG0rLbjfgJOObIy0LQbhwCcJbzE1ncX16X5RJCXn
 OwHGuIKeKFsCHAitM0le9/VbNHOxJb8k+162x4HH/jISv+ZRA+SzmDMLMK6qMbkWJQZ7
 lav2tnX6TFoJDjS8L4nPGqczq24i66ljvQjTtP3Gl3V8g//g+F1itmbzATVYRSl3K/sN
 uAAQ==
X-Gm-Message-State: AOAM5308YN9BkKTNeJ7WQEvDUcOf6VwPjYh1w4HvOGr/bAeWM3hCHFB9
 bWZE8AuUYpzZb1AtulwDR6GDMU6VqnlOGrFuHPu5
X-Google-Smtp-Source: ABdhPJxww+/1GuDfDKu/YqPhoXUoH5dtqHNxCSoSNelYr6K5jS73UkFZUDpZE4p+0ellKGEd2tpFLgSP0fsDOT5YE7M=
X-Received: by 2002:a05:6602:2d0d:: with SMTP id
 c13mr6478594iow.51.1612291796743; 
 Tue, 02 Feb 2021 10:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-16-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-16-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 10:49:45 -0800
Message-ID: <CAOnJCULJbjTA8adGvPg48=hFu_U0vpp8roFUpeMbkCNQ-ad_Ew@mail.gmail.com>
Subject: Re: [PATCH v14 15/16] riscv: Update Canaan Kendryte K210 defconfig
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_134958_942822_B8DB9CB5 
X-CRM114-Status: GOOD (  18.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 2:37 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Update the Kendryte k210 nommu default configuration file
> (nommu_k210_defconfig) to include device drivers for reset, reboot,
> I2C, SPI, gpio and LEDs support. Virtual Terminal support is also
> disabled as no terminal devices are supported and enabled. Disabling
> CONFIG_VT (removing the no longer needed override for
> CONFIG_VGA_CONSOLE) reduces the kernel image size by about 65 KB.
>
> This default configuration remains suitable for a system using an
> initramfs cpio file linked into the kernel image.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/configs/nommu_k210_defconfig | 44 ++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index 368a28cf1467..b16a2a12c82a 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -1,17 +1,19 @@
>  # CONFIG_CPU_ISOLATION is not set
> -CONFIG_LOG_BUF_SHIFT=15
> +CONFIG_LOG_BUF_SHIFT=13
>  CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
>  CONFIG_BLK_DEV_INITRD=y
> -CONFIG_INITRAMFS_FORCE=y
> +# CONFIG_RD_GZIP is not set
>  # CONFIG_RD_BZIP2 is not set
>  # CONFIG_RD_LZMA is not set
>  # CONFIG_RD_XZ is not set
>  # CONFIG_RD_LZO is not set
>  # CONFIG_RD_LZ4 is not set
> +# CONFIG_RD_ZSTD is not set
>  CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  # CONFIG_SYSFS_SYSCALL is not set
>  # CONFIG_FHANDLE is not set
>  # CONFIG_BASE_FULL is not set
> +# CONFIG_FUTEX is not set
>  # CONFIG_EPOLL is not set
>  # CONFIG_SIGNALFD is not set
>  # CONFIG_TIMERFD is not set
> @@ -25,15 +27,17 @@ CONFIG_EMBEDDED=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_SLOB=y
> -# CONFIG_SLAB_MERGE_DEFAULT is not set
>  # CONFIG_MMU is not set
>  CONFIG_SOC_CANAAN=y
> +CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
>  CONFIG_MAXPHYSMEM_2GB=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
>  CONFIG_CMDLINE="earlycon console=ttySIF0"
>  CONFIG_CMDLINE_FORCE=y
> -CONFIG_JUMP_LABEL=y
> +# CONFIG_SECCOMP is not set
> +# CONFIG_STACKPROTECTOR is not set
> +# CONFIG_GCC_PLUGINS is not set
>  # CONFIG_BLOCK is not set
>  CONFIG_BINFMT_FLAT=y
>  # CONFIG_COREDUMP is not set
> @@ -41,23 +45,47 @@ CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_FW_LOADER is not set
>  # CONFIG_ALLOW_DEV_COREDUMP is not set
> -# CONFIG_INPUT_KEYBOARD is not set
> -# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_INPUT is not set
>  # CONFIG_SERIO is not set
> +# CONFIG_VT is not set
> +# CONFIG_UNIX98_PTYS is not set
>  # CONFIG_LEGACY_PTYS is not set
>  # CONFIG_LDISC_AUTOLOAD is not set
>  # CONFIG_HW_RANDOM is not set
>  # CONFIG_DEVMEM is not set
> +CONFIG_I2C=y
> +# CONFIG_I2C_COMPAT is not set
> +CONFIG_I2C_CHARDEV=y
> +# CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> +CONFIG_SPI=y
> +# CONFIG_SPI_MEM is not set
> +CONFIG_SPI_DESIGNWARE=y
> +CONFIG_SPI_DW_MMIO=y
> +# CONFIG_GPIO_CDEV_V1 is not set
> +CONFIG_GPIO_DWAPB=y
> +CONFIG_GPIO_SIFIVE=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_SYSCON=y
>  # CONFIG_HWMON is not set
> -# CONFIG_VGA_CONSOLE is not set
> -# CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_USER=y
>  # CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +# CONFIG_SURFACE_PLATFORMS is not set
> +# CONFIG_FILE_LOCKING is not set
>  # CONFIG_DNOTIFY is not set
>  # CONFIG_INOTIFY_USER is not set
>  # CONFIG_MISC_FILESYSTEMS is not set
>  CONFIG_LSM="[]"
>  CONFIG_PRINTK_TIME=y
> +# CONFIG_SYMBOLIC_ERRNAME is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
> +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> +# CONFIG_FRAME_POINTER is not set
>  # CONFIG_DEBUG_MISC is not set
>  CONFIG_PANIC_ON_OOPS=y
>  # CONFIG_SCHED_DEBUG is not set
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
