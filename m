Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26365C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 22:12:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEBCC60EFE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 22:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEBCC60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=O5mDYOK3sU0zgu/qrdTlJFHgbfjcl2Pfxnn6af3GZhE=; b=1E6rwD4Dz01CMtBeBlRnUlqrWu
	acsW+9M1qUpKmUVoAx0xnlNw5DjfSZG36CP5kyoOtDwnb9HpmYJT1edNdi5elHXyFUtx6SGNKMbeY
	+whdrQPMcP2x7yGJ+TsJY//HaizR3Vlwt8Lh0fDEpLqTcYnSE+WSFDNuOOtDmLbA4bvbfX3yigoOF
	KlRCheO7qIeKjsOP4Eab5m4NN0o1dq3P8Tyh+AB0VV2xC0rqhB+XaEaP7wqgBWBxBvzbT1MdDMUjv
	U46YjywRdvOv8ZdmgtLa5p1bw8zYLRIU1zFLPqWwvFyK2CTf1L5iXa89cRruv3E3PwzDo35xXl3mm
	fAmC1mag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfr9u-006NqG-UC; Wed, 27 Oct 2021 22:12:34 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfr9s-006Np1-Sq
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 22:12:34 +0000
Received: by mail-pg1-x530.google.com with SMTP id t7so4334643pgl.9
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jtJ9mg6mkCM+HyrDKkQPfKHujvrubHvnFkuczrG0f/A=;
 b=QA2fDubt5NaeGhrWm07+haXkSxZJhyCdcj21Eb4WlFrgc01AqnujVk23mCJV9laDho
 MC6Uf1sny7w3wVylEiC14zzEOL4YXypzokzBi9lXvq8cWfceuSYo/GsqycUycrKzNE0c
 ZCO+cznB9wY82LJxTVtGup8imD2JiIiZfJj5R9w84XTfC7FrBZDhExGd350jWyvGhX4i
 HAc85WleWILO9PuOH4YlqtBYVPKhhOQVwRpPpx9I5C6+xNdJ6v2CweyeGJ+4AxP+/XTu
 B0pjyWNcgggv2yhZGinGixQadSrCpbfU49Mi/+SjT5zSvskh1WykthGG7R/4HK7NuaQU
 fgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jtJ9mg6mkCM+HyrDKkQPfKHujvrubHvnFkuczrG0f/A=;
 b=gSK+5KXSU6FxgwjI5bb2RYSHCXnOuuQi/2iG60onPa8oRuFA1g31r+Z6KQmwVMAZB6
 P/yH4MvKfSJNkfGS6zynbyc7TGjRSIG5RDXRg5A9a3IkCTy2qq8Apo47LbsjLvNMiCtX
 7aewfZrt1NXRh4aVyy/YHwixMEFeBsWUg6KoGMrGeQrqbW5eSOzD1IBCeCsXEGY+SacT
 7UG616pjaLQYXJdhbcDYe1gKK6gva+Lb808zSmLuXsFT4Z/QCVsbnnb5xTryH0wSZMHX
 1WiVUUo/MVrktijm1woatit9Dd5bGuythSSELDRuEBDF73JTP4DpCHbbgIq9Zh0U2hKu
 VZlQ==
X-Gm-Message-State: AOAM532gNtTbJDP2O0rhENEMhBn/37OF0erHqJBgBCVa17eMA2hDwBhu
 mBiuVGr/W4l3OiL+6eVo8XHsvw==
X-Google-Smtp-Source: ABdhPJwpI8y3nmvTnJXqOogIABbrz/ln1LK+9cVYlo5HciH5w8jSWsImVENT3vlg6zCh2DvtDvFuiQ==
X-Received: by 2002:a65:62d1:: with SMTP id m17mr333092pgv.370.1635372751485; 
 Wed, 27 Oct 2021 15:12:31 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:d96b:421d:2a73:9190])
 by smtp.gmail.com with ESMTPSA id o22sm952535pfu.50.2021.10.27.15.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 15:12:30 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:12:30 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 14:34:17 PDT (-0700)
Subject: Re: [PATCH 1/3] RISC-V: Enable KVM in RV64 and RV32 defconfigs as a
 module
In-Reply-To: <20211026170136.2147619-2-anup.patel@wdc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 pbonzini@redhat.com, Atish Patra <Atish.Patra@wdc.com>, anup@brainfault.org,
 kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-1044c135-bede-498b-b244-9f9c5f5ea89b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_151232_959806_E9DD6DFF 
X-CRM114-Status: GOOD (  17.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 26 Oct 2021 10:01:34 PDT (-0700), Anup Patel wrote:
> Let's enable KVM RISC-V in RV64 and RV32 defconfigs as module
> so that it always built along with the default kernel image.

Turning on KVM in the defconfigs seems like the right way to go, but 
this has more diff than just that.  Not sure if that's all just 
savedefconfig stuff, I usually try and split out the non-functional 
changes from anything that makes a change.

If you checked then

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

assuming you want to keep these together.  LMK if you want me to take 
this on its own (I'll split it up if you do).

>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/configs/defconfig      | 15 +++++++--------
>  arch/riscv/configs/rv32_defconfig |  8 ++++----
>  2 files changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 4ebc80315f01..40506dfab5cf 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
>  CONFIG_NO_HZ_IDLE=y
>  CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_BPF_SYSCALL=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_CGROUPS=y
> @@ -13,12 +14,14 @@ CONFIG_USER_NS=y
>  CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
> -CONFIG_BPF_SYSCALL=y
> +# CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
> -CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> @@ -68,14 +71,12 @@ CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
>  CONFIG_SPI=y
>  CONFIG_SPI_SIFIVE=y
> +# CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SIFIVE=y
> -# CONFIG_PTP_1588_CLOCK is not set
> -CONFIG_POWER_RESET=y
>  CONFIG_DRM=y
>  CONFIG_DRM_RADEON=y
>  CONFIG_DRM_VIRTIO_GPU=y
> -CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_USB=y
>  CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_PLATFORM=y
> @@ -85,10 +86,10 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_MMC=y
>  CONFIG_MMC_SDHCI=y
>  CONFIG_MMC_SDHCI_PLTFM=y
>  CONFIG_MMC_SDHCI_CADENCE=y
> -CONFIG_MMC=y
>  CONFIG_MMC_SPI=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_VIRTIO_PCI=y
> @@ -139,5 +140,3 @@ CONFIG_RCU_EQS_DEBUG=y
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=y
> -# CONFIG_SYSFS_SYSCALL is not set
> -CONFIG_EFI=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 434ef5b64599..44022e048efd 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
>  CONFIG_NO_HZ_IDLE=y
>  CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_BPF_SYSCALL=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_CGROUPS=y
> @@ -13,12 +14,14 @@ CONFIG_USER_NS=y
>  CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
> -CONFIG_BPF_SYSCALL=y
> +# CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> @@ -67,11 +70,9 @@ CONFIG_HW_RANDOM_VIRTIO=y
>  CONFIG_SPI=y
>  CONFIG_SPI_SIFIVE=y
>  # CONFIG_PTP_1588_CLOCK is not set
> -CONFIG_POWER_RESET=y
>  CONFIG_DRM=y
>  CONFIG_DRM_RADEON=y
>  CONFIG_DRM_VIRTIO_GPU=y
> -CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_USB=y
>  CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_PLATFORM=y
> @@ -130,4 +131,3 @@ CONFIG_RCU_EQS_DEBUG=y
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=y
> -# CONFIG_SYSFS_SYSCALL is not set

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
