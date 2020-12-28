Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEC9C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:11:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE6D2074D
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE6D2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zumobbwB0UX3eT8444IMEJ0lS8bc2yau01Fgwi5I1KQ=; b=QKHLzUR7lpLbE7UZH6uZyj/9C
	slF5d7IVTqV+EZcUNFOghcX4gFflvvFd10Qt8XhAciSnIyJhmJmIYhsVQrJSs7PBxywozYGqlVk/r
	Ek4FSzQyaIGgFeQkych1F2rCKUol4WmTB9tlGc0MMUQTTF1pcmFsAEJG09tOKeokrRZPrZMZ/JM7s
	2MvRzs9YrTaSg6nHvaRXk+T8fbnoFVGBKCKNpYpqve/6FL0ReiVdOc5J+jfvJXt5sKR5foC7zQ2XH
	JVEADLrd9Owny1R/XL5xuzy7AnIBbqH+V7O7gK8tZS/poovmcxj46E0t7A4mbNRkMJov/f9w8bVE5
	i3/Oaquwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktrNH-00008i-3j; Mon, 28 Dec 2020 12:11:43 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktrNF-00007f-2O
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 12:11:42 +0000
Received: by mail-lf1-x12b.google.com with SMTP id h22so23495070lfu.2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 04:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CULhUkBRiYm29lhM3YLs6YEHIN3sTkHriHdcNuafJOs=;
 b=ExHBslTf3V8vx0fIsjeihfj3WigPPCykwxPcTcS4wvt9GpAyg2eXu+N6yd70VGjWxw
 qkRpPFUWem3RcL7gqnTo72lLTJzm5P+t24LcYfpr9qP+HeMTPHNz0/z5cmmsHYsYnX9G
 UC1JAaleyjV7oPyB5TX/h/Ro0sMXBVqZUgCC1BTQQ42A8m4yjDHLonbq6k9jJTQ1kt/g
 3b7goIqdEYJbbp8ekS8cpDm+bvH/fP6nTGuKBxXuBH71ziXq0e0oF3lYM05AuffVCL8R
 Vv9tdh67MKp1giF3EjExi1KwytKNmphEOg4T6SSXgF5z0W3bFV1L3q526svITPjHx6YK
 YOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CULhUkBRiYm29lhM3YLs6YEHIN3sTkHriHdcNuafJOs=;
 b=bx9eBBSApt+d8Yxmd16fhgEdqxEkKuKb3iurJn0rTsjQIEc2vw17b3wFG0x6SaWVjW
 MhBKs2cVJlik+QiWhU7b2qlbXZY6M4ik9ME3l38Llbu94pFaLYzIM/NnVD2uBefrkZ2u
 0PDZIcCdDfskObU8av7nh57YjZ73oluh3JytXymMgF3MzMP46/LoHzyv35B+iKhLdelS
 lPjImDrXtykE1Wk79KlhUYE8rMOJhMzFuqFBpDl4WZW4wePA4lgU7dTv+wKViPfO2RXg
 eiFoU3IGlT6H9Ph5H5d/XqCwwKL84hovaam8o60/5rPVk1MtpvlgIO4otgXFaPFCgBPI
 hRRQ==
X-Gm-Message-State: AOAM5330aX5buwQav/1a57SALrNfyVsFMrefj74O/6vsJL1g0IzclPla
 lzoLdpE94kVwIFVQdLVMlID9N0pfaZb4QhtLqo8eHQ==
X-Google-Smtp-Source: ABdhPJwr3NT9vaFwrYG933RnTHu0NlgOn0Z2UNFeEZUmVQokVV9uUNdeAdJlcRmCRiFkACaZ1ffz1pL0fQaFtZDDwdg=
X-Received: by 2002:ac2:43ce:: with SMTP id u14mr20295131lfl.369.1609157499370; 
 Mon, 28 Dec 2020 04:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-23-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-23-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 17:41:27 +0530
Message-ID: <CAAhSdy2JLerbQpm1Vb-CAhSN90VYGrbqyr50p5zMKG+59_Uozw@mail.gmail.com>
Subject: Re: [PATCH v10 22/23] riscv: Update Canaan Kendryte K210 defconfig
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_071141_262244_E86E5754 
X-CRM114-Status: GOOD (  20.30  )
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
> ---
>  arch/riscv/configs/nommu_k210_defconfig | 37 +++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index 368a28cf1467..a099c29b4b14 100644
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
> @@ -25,15 +27,16 @@ CONFIG_EMBEDDED=y
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
>  # CONFIG_BLOCK is not set
>  CONFIG_BINFMT_FLAT=y
>  # CONFIG_COREDUMP is not set
> @@ -41,23 +44,47 @@ CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_FW_LOADER is not set
>  # CONFIG_ALLOW_DEV_COREDUMP is not set
> +# CONFIG_INPUT_LEDS is not set
>  # CONFIG_INPUT_KEYBOARD is not set
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_SERIO is not set
> +# CONFIG_VT is not set
> +# CONFIG_UNIX98_PTYS is not set
>  # CONFIG_LEGACY_PTYS is not set
>  # CONFIG_LDISC_AUTOLOAD is not set
>  # CONFIG_HW_RANDOM is not set
>  # CONFIG_DEVMEM is not set
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
>  # CONFIG_HWMON is not set
> -# CONFIG_VGA_CONSOLE is not set
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_USER=y
>  # CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
> +# CONFIG_FILE_LOCKING is not set
>  # CONFIG_DNOTIFY is not set
>  # CONFIG_INOTIFY_USER is not set
>  # CONFIG_MISC_FILESYSTEMS is not set
>  CONFIG_LSM="[]"
>  CONFIG_PRINTK_TIME=y
> +# CONFIG_SYMBOLIC_ERRNAME is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
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

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
