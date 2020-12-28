Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19E0C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:12:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC3A2074D
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC3A2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FSnVO0eQLPyS4F2f+nYzhRBd52DFrbe156MgmjzfdZ8=; b=TKUq7gmcW353GFUi48prkFSBy
	ObkWWS9mq7KWktJ5h2mDJ9b0Dy0QfxyqN5kxkHkcVp4LxOVPEs7Ea604pmug6tQIlmKr40ds8OAY0
	eapkL3dwtZ4+WId7UHcaKD680uDLHTeBvdb6d0lW1+Ln8rZBJ+KLl2OwsqQk1+PqbWaEslMRrNaJy
	oft6aD1bgQctopZKtvqvNaL+rEk0Nq1mUNdgket6UMRrwP4E1ELEYg+MpYX1qpSuPZa9XeSlmYRZf
	DJgCRxgbDnL5XdzreyrhrR3WQX4zuAKF409ie489iuSRyTOnLgR54xD9pIdOSinR/b5BeIq+eDfjM
	bRHUOEqDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktrOE-0000JU-Sm; Mon, 28 Dec 2020 12:12:42 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktrOC-0000Ik-1z
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 12:12:40 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 23so23381081lfg.10
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 04:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5dnI6hl/uAinnpfwjzW42khHlLLdEo6KFHybJaznUs=;
 b=Jjb/nwUvkEGmkSEzVwmXn+lIezhxSCwnCtBvaNxeeiDgCb7PMiokmM1cqfH3/4rb+e
 XyFo74xz0qxF8mjDYOFcbGd6H2sGCyh3XWCoBM9vLWRa09nq/idp+AWqYRHqIM3MPcK6
 7BwJZfHx4w+NSbgUlsmePG/yOTJRMlZ2+Gs/036xKf7gUovORvmdCSlLa2ACLiBEkwxG
 b/evgHVMvJD6nRbHECWe8o/Gqg33nOFw22LpGuRIkceZvlQC/QjVaFyBDnBYq3IiO2yn
 iHLT7/SY6TWLnAo3zwkFYcVZc4v6oV9CFwZv+pEukiOrqUSoQL9E5XdXZcwl4JuaW8GB
 RyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5dnI6hl/uAinnpfwjzW42khHlLLdEo6KFHybJaznUs=;
 b=iYseEghm4Mf6fP/rGeaKBhytQHFW0iXU1D8cgwyIwu1XHHZdqyNIcAnzgxIlKxhIks
 sTDJKxmD7BP60jgKtbs5+9aKqK9TrqPyl/aZlixAm1TrkAAoFuzsNhP0t8W+iOb3i1SS
 k82dzwCGxoeoHQN/wcQptVnwHUQ5kguhijVYh6jA+6t8QX/nnFezZeoiWuC0xCg80df0
 FZdCilOyRs03LfMU2OAtP0dBGNzCTSs1x99cuROIxZ1Bv2U34ybEmsQQ2aLbgXjVKqUW
 guFaqBOKhQgsDgGr3qFeXqjd0qc7po7EFjUqryk9YGj9Mto9G7BgfQt+7ppl2p9db9U8
 wYdQ==
X-Gm-Message-State: AOAM531+kk4WiuWluggHUvFy/PTJL1/39GlY/JIOH2jnTyGOTE59BlDM
 0liRhVbL4UswJ+2vjJN4WKQEU2MnbDi0uednNb1O0w==
X-Google-Smtp-Source: ABdhPJxwpJprr6pD65kQrg3HfTYT/inYom0+1ZwhUQegnwfPAS2avm2w25j3YRiAFyIflTh1hkDoKyEuPzX3x50S5o0=
X-Received: by 2002:a05:6512:34c5:: with SMTP id
 w5mr18333870lfr.214.1609157558710; 
 Mon, 28 Dec 2020 04:12:38 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-24-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-24-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 17:42:27 +0530
Message-ID: <CAAhSdy0XSzrnucDJPWzVVr37Zn0iRxVQZf5X2KkxCkv2kDf4_Q@mail.gmail.com>
Subject: Re: [PATCH v10 23/23] riscv: Add Canaan Kendryte K210 SD card
 defconfig
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_071240_119257_58571C09 
X-CRM114-Status: GOOD (  26.67  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 13, 2020 at 7:22 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> The nommu_k210_defconfig default configuration allows booting a Canaan
> Kendryte K210 SoC based boards using an embedded intramfs cpio file.
> Modifying this configuration to enable support for the board SD card is
> not trivial for all users. To help beginners getting started with these
> boards, add the nommu_k210_sdcard_defconfig default configuration file
> to set all configuration options necessary to use the board mmc-spi sd
> card for the root file system.
>
> This new configuration adds support for the block layer, the mmc-spi
> driver and modifies the boot options to specify the rootfs device as
> mmcblk0p1 (first partition of the sd card block device). The ext2 file
> system is selected by default to encourage its use as that results in
> only about 4KB added to the kernel image size. As ext2 does not have
> journaling, the boot options specify a read-only mount of the file
> system. Similarly to the smaller nommu_k210_defconfig, this new default
> configuration disables virtual terminal support to reduce the kernel
> image size.
>
> The default device tree selected is unchanged, specifying the simple
> "k210_generic" device tree file. The user must change this setting to
> specify the device tree suitable for the board being used
> (k210_maix_bit, k210_maix_dock, k210_maix_go, k210_maixduino or
> k210_kd233).
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../riscv/configs/nommu_k210_sdcard_defconfig | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
>
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> new file mode 100644
> index 000000000000..a75388defd44
> --- /dev/null
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -0,0 +1,93 @@
> +# CONFIG_CPU_ISOLATION is not set
> +CONFIG_LOG_BUF_SHIFT=13
> +CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +# CONFIG_SYSFS_SYSCALL is not set
> +# CONFIG_FHANDLE is not set
> +# CONFIG_BASE_FULL is not set
> +# CONFIG_FUTEX is not set
> +# CONFIG_EPOLL is not set
> +# CONFIG_SIGNALFD is not set
> +# CONFIG_TIMERFD is not set
> +# CONFIG_EVENTFD is not set
> +# CONFIG_AIO is not set
> +# CONFIG_IO_URING is not set
> +# CONFIG_ADVISE_SYSCALLS is not set
> +# CONFIG_MEMBARRIER is not set
> +# CONFIG_KALLSYMS is not set
> +CONFIG_EMBEDDED=y
> +# CONFIG_VM_EVENT_COUNTERS is not set
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLOB=y
> +# CONFIG_MMU is not set
> +CONFIG_SOC_CANAAN=y
> +CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
> +CONFIG_MAXPHYSMEM_2GB=y
> +CONFIG_SMP=y
> +CONFIG_NR_CPUS=2
> +CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro"
> +CONFIG_CMDLINE_FORCE=y
> +# CONFIG_SECCOMP is not set
> +# CONFIG_STACKPROTECTOR is not set
> +# CONFIG_BLK_DEV_BSG is not set
> +# CONFIG_MQ_IOSCHED_DEADLINE is not set
> +# CONFIG_MQ_IOSCHED_KYBER is not set
> +CONFIG_BINFMT_FLAT=y
> +# CONFIG_COREDUMP is not set
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +# CONFIG_FW_LOADER is not set
> +# CONFIG_ALLOW_DEV_COREDUMP is not set
> +# CONFIG_BLK_DEV is not set
> +# CONFIG_INPUT_LEDS is not set
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_SERIO is not set
> +# CONFIG_VT is not set
> +# CONFIG_UNIX98_PTYS is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_LDISC_AUTOLOAD is not set
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_DEVMEM is not set
> +CONFIG_I2C=y
> +CONFIG_I2C_CHARDEV=y
> +# CONFIG_I2C_HELPER_AUTO is not set
> +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> +CONFIG_SPI=y
> +# CONFIG_SPI_MEM is not set
> +CONFIG_SPI_DESIGNWARE=y
> +CONFIG_SPI_DW_MMIO=y
> +# CONFIG_GPIO_SYSFS is not set
> +# CONFIG_GPIO_CDEV_V1 is not set
> +CONFIG_GPIO_DWAPB=y
> +CONFIG_GPIO_SIFIVE=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_SYSCON=y
> +# CONFIG_HWMON is not set
> +# CONFIG_HID is not set
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_MMC=y
> +# CONFIG_PWRSEQ_EMMC is not set
> +# CONFIG_PWRSEQ_SIMPLE is not set
> +CONFIG_MMC_SPI=y
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_USER=y
> +# CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +CONFIG_EXT2_FS=y
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +# CONFIG_INOTIFY_USER is not set
> +# CONFIG_MISC_FILESYSTEMS is not set
> +CONFIG_LSM="[]"
> +CONFIG_PRINTK_TIME=y
> +# CONFIG_SYMBOLIC_ERRNAME is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
> +# CONFIG_DEBUG_MISC is not set
> +CONFIG_PANIC_ON_OOPS=y
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_RCU_TRACE is not set
> +# CONFIG_FTRACE is not set
> +# CONFIG_RUNTIME_TESTING_MENU is not set
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
