Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CD9C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:49:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A84B64FB8
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A84B64FB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XzGml6G1M+dt77wpt4cN1zbH+WtIXiYZzV317Qf90Ng=; b=2pHNzZLB/e8E71CGsJYK/Ve2S
	rgnP0vjwtohdjyduZ7hmRMMiMxgMH2LEs+NBDJ3Wrnr/Mu4ZsE46t/CGyi1jA1sYA3vOxscrIHuYW
	qIO1fAk2916tWJmakZTaFyIJQjs851UuOyz3KQFv8JHoXGPcarvxtrMNHFV1kF5JqswISD/rAfqA2
	ZOTxjntQJrnBgq63EbblbNFMg600Rz7/oi9Ldfq1zuLWopTuHen1JIJwCKxAxvGUC5nPQ/27ar9L7
	d5r/C/EGJq11+3zPoazQc2s2BzmdJdithpkmpBi723OQfP26VjgmgbR5hpfnJ94wMbD+RZ+ANisYw
	UjfoJSwZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70jh-0007Gr-AM; Tue, 02 Feb 2021 18:49:13 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70je-0007Fl-J1
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 18:49:11 +0000
Received: by mail-il1-x131.google.com with SMTP id y17so20054435ili.12
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 10:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ezuwVIPfKPc0rxbccpyieNHVUUgHkyTcz6IbkX5+aaU=;
 b=dAB2LzaTxvyoRNYsmc5IExg/Ltd9QLSZl71IHgeVt2hE2fOWxBZhnd/6Sz6On2ad+w
 bd+msANLV1zQS83yMnyowWH3fhjyWonuCSRlNilchvW5a7MP/F1gaL+hi+LEPOBT+n9R
 xdpfnFXYHsIovfPFJ35G0aMHsQZB9mXFSCFqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ezuwVIPfKPc0rxbccpyieNHVUUgHkyTcz6IbkX5+aaU=;
 b=VjmT1mNikWVK8g4iZNTrHNmLbPTZZiLOhBX4vlIWWzJP2JjOPNTbtLDxMqplSmUG3T
 Wizl2k09L6fopjetsUyPN1sFrOC1kJLmfYudNHK7xEzirfftam7b8qvItfy92nu+28C2
 fBQtVan6h3NUfGYzawKG0fCb2XlTUGuAArUvKOw0LE4jd5aOwUkMY/YHaPLFdywu2j3i
 JK6FsH5lh2FqIxSFeU3grmzB4/W08/pCyyXcYDq22YC+SoAYfiFScJzbnSmFQNMUHzqb
 7qzdSLYRj6uThqexHmesetWSin6NQ2bykY4tKhlQsyW0nqtS7p8EuKOlwzv44XwFjV4F
 agmw==
X-Gm-Message-State: AOAM5335eQXQi965nQy+/m8iErmbRSy09zuvPaPPDMGS3W5wH7rwcTfc
 jmcWG5qY94Pt6D27vWwJ/ojBRvqS3mdUqNqdU1MH
X-Google-Smtp-Source: ABdhPJwlV9AUTlfYV/LFhTAjEEz1zwtwu9RaXzzh/GFIMFKgiqqaUzbpE8oZ79tFHq9LQnDS/lY3JOIdIoaKyTDyFEQ=
X-Received: by 2002:a92:6410:: with SMTP id y16mr18808784ilb.126.1612291748435; 
 Tue, 02 Feb 2021 10:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-17-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-17-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 10:48:57 -0800
Message-ID: <CAOnJCULsxNsGTyknKJ9-gBpHAdm9_aUNKkjokaSVtQT0_0F8pw@mail.gmail.com>
Subject: Re: [PATCH v14 16/16] riscv: Add Canaan Kendryte K210 SD card
 defconfig
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_134910_642660_C2B7D6B1 
X-CRM114-Status: GOOD (  25.35  )
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
> (sipeed_maix_bit, sipeed_maix_dock, sipeed_maix_go, sipeed_maixduino or
> canaan_kd233).
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  .../riscv/configs/nommu_k210_sdcard_defconfig | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
>
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> new file mode 100644
> index 000000000000..61f887f65419
> --- /dev/null
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -0,0 +1,92 @@
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
> +# CONFIG_GCC_PLUGINS is not set
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
> +# CONFIG_INPUT is not set
> +# CONFIG_SERIO is not set
> +# CONFIG_VT is not set
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
> +# CONFIG_GPIO_CDEV_V1 is not set
> +CONFIG_GPIO_DWAPB=y
> +CONFIG_GPIO_SIFIVE=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_SYSCON=y
> +# CONFIG_HWMON is not set
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
> +# CONFIG_SURFACE_PLATFORMS is not set
> +CONFIG_EXT2_FS=y
> +# CONFIG_FILE_LOCKING is not set
> +# CONFIG_DNOTIFY is not set
> +# CONFIG_INOTIFY_USER is not set
> +# CONFIG_MISC_FILESYSTEMS is not set
> +CONFIG_LSM="[]"
> +CONFIG_PRINTK_TIME=y
> +# CONFIG_SYMBOLIC_ERRNAME is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
> +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> +# CONFIG_FRAME_POINTER is not set
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


Reviewed-by: Atish Patra <atish.patra@wdc.com>

--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
