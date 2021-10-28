Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF50CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BACF61073
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BACF61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUamkkUQmwFNbklQSx3CZ6qd2opX+GaEmGDu3MnfKaA=; b=UEKqWZNcYYyL/v
	ctcsuciW/MoDRewx99hUjTYdgh16dn9M5s4AFS1PMvrXDqBxWF4uU+47ch+C8BSX07wgT9TfqF0YG
	cneTHtI8yFHQyZYFuvXagbJWyLbGRIOLGyivKY2xwDh3E3D5T9H4yR47rs0YchSo0c3ouw8IAUG/J
	IU6e0XOBf/lpRdHlYFwMkCQcTrLS4YVqQiRsuEGTCAzcJ51nvZQmDXnA7vS+E1fMjw4z9JNZIYwlZ
	/LCZp4r/Ssaon7Qi7hDgGPDwzJyX0I2SS4WEVH5K5yRS6P0mBzb9dMBPPjePPsa4zIbRC8SLuZRnO
	rtEaHrTQC+PiX6tMmZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7TR-008QkF-B5; Thu, 28 Oct 2021 15:37:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7TO-008QiD-3u
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 15:37:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d10so11014184wrb.1
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ajUUMnRMo/CfkqSYpjRKHF3O4uKdRUUoW9jGXm2YH/8=;
 b=YClg6r+Pjz+KcVotJsLNPXbLH9rBZDDotsVtGKPz45+pVaqV/8VvUjjmgxfln+tl16
 pNgJZteb1XcKJu8Rq2O+Ynz/a0nrl5R1VzAZCyQkBuj48jBJeEKmI91ATjk19ed3/slS
 C81BjQjFI0TIdMvGA8/1Np3r5VYzz1pIj+AiN8B5R5bQdSRzJ6eV67fmV1J/W1Ph864s
 bkD9r359wt5zBv00KUKa4W7rGTHW5SHb/bNIWtzdO8UdH441eq4XJD3GsByeCoLO5L8I
 ZMgcjyA79pYnH7Dabb/EbzZdbWJ8S5Kjtru5/7Zsbabr+kgD909eP4gs8/bUlW2SdT/L
 ns2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ajUUMnRMo/CfkqSYpjRKHF3O4uKdRUUoW9jGXm2YH/8=;
 b=sXxOLv8b/tWZnvpusaU5mpTMQI/BQ9SwhvtF4PsUq2g7Uvoq2RftcPJYYteJ+25aHt
 lZt++RJb869wSUN4XfGKyrbvgdOUVatHGwEo8MKBVQnv1pvTrT+Fl/XIIcquT6Ry1vm5
 hQOU1OdP9JH2OpM8h7K0HzPJtJPdlBEPc1qqBMbB/g6MnThYSQBSdeq+AzKpxDcXV89G
 cahW74/epq/I9ao5lGcyEJ5BHoMOF7vFVI2tpneGi00RRuqlv08h4ADgtniQFH/ReUrn
 hECH6CIeyfpAc4TfR8ajfT3DIl0bC0zU9sQ5GaQF0/6EPgYlnlHYoLzCPmOFxlwp8/gg
 VnhA==
X-Gm-Message-State: AOAM533kNDj5p/cSMwtriCqLbh91P1opG7Ulp6g1gFE/GCurBZgoqwx7
 tolx3uNS9izazHoljGjHzaeCKmJ2L0JYpqg2o91zfg==
X-Google-Smtp-Source: ABdhPJxSMxsPRNAYx8kcStvSGAzhyUcPtRJdvcLJU2SSsUAIOtS/6o5e+daLbr1h08HtBnOjMLBDhmaly+ryMxoJScw=
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr6700138wry.249.1635435463471; 
 Thu, 28 Oct 2021 08:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211026170136.2147619-2-anup.patel@wdc.com>
 <mhng-1044c135-bede-498b-b244-9f9c5f5ea89b@palmerdabbelt-glaptop>
In-Reply-To: <mhng-1044c135-bede-498b-b244-9f9c5f5ea89b@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Oct 2021 21:07:31 +0530
Message-ID: <CAAhSdy2SCjncCRP22Zfu+5vXPageteQkC-L3aEkkTXvuKjb4Gw@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: Enable KVM in RV64 and RV32 defconfigs as a
 module
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Atish Patra <Atish.Patra@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_083746_170335_B6958D36 
X-CRM114-Status: GOOD (  20.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 28, 2021 at 3:42 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Tue, 26 Oct 2021 10:01:34 PDT (-0700), Anup Patel wrote:
> > Let's enable KVM RISC-V in RV64 and RV32 defconfigs as module
> > so that it always built along with the default kernel image.
>
> Turning on KVM in the defconfigs seems like the right way to go, but
> this has more diff than just that.  Not sure if that's all just
> savedefconfig stuff, I usually try and split out the non-functional
> changes from anything that makes a change.

Other diffs in the defconfigs are generated by "make savedefconfig". I
guess this is because most people don't use "make savedefconfig"
to generate updated defconfigs.

>
> If you checked then
>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> assuming you want to keep these together.  LMK if you want me to take
> this on its own (I'll split it up if you do).

Thanks Palmer.

Regards,
Anup

>
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/configs/defconfig      | 15 +++++++--------
> >  arch/riscv/configs/rv32_defconfig |  8 ++++----
> >  2 files changed, 11 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 4ebc80315f01..40506dfab5cf 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
> >  CONFIG_POSIX_MQUEUE=y
> >  CONFIG_NO_HZ_IDLE=y
> >  CONFIG_HIGH_RES_TIMERS=y
> > +CONFIG_BPF_SYSCALL=y
> >  CONFIG_IKCONFIG=y
> >  CONFIG_IKCONFIG_PROC=y
> >  CONFIG_CGROUPS=y
> > @@ -13,12 +14,14 @@ CONFIG_USER_NS=y
> >  CONFIG_CHECKPOINT_RESTORE=y
> >  CONFIG_BLK_DEV_INITRD=y
> >  CONFIG_EXPERT=y
> > -CONFIG_BPF_SYSCALL=y
> > +# CONFIG_SYSFS_SYSCALL is not set
> > +CONFIG_SOC_MICROCHIP_POLARFIRE=y
> >  CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_VIRT=y
> > -CONFIG_SOC_MICROCHIP_POLARFIRE=y
> >  CONFIG_SMP=y
> >  CONFIG_HOTPLUG_CPU=y
> > +CONFIG_VIRTUALIZATION=y
> > +CONFIG_KVM=m
> >  CONFIG_JUMP_LABEL=y
> >  CONFIG_MODULES=y
> >  CONFIG_MODULE_UNLOAD=y
> > @@ -68,14 +71,12 @@ CONFIG_HW_RANDOM=y
> >  CONFIG_HW_RANDOM_VIRTIO=y
> >  CONFIG_SPI=y
> >  CONFIG_SPI_SIFIVE=y
> > +# CONFIG_PTP_1588_CLOCK is not set
> >  CONFIG_GPIOLIB=y
> >  CONFIG_GPIO_SIFIVE=y
> > -# CONFIG_PTP_1588_CLOCK is not set
> > -CONFIG_POWER_RESET=y
> >  CONFIG_DRM=y
> >  CONFIG_DRM_RADEON=y
> >  CONFIG_DRM_VIRTIO_GPU=y
> > -CONFIG_FRAMEBUFFER_CONSOLE=y
> >  CONFIG_USB=y
> >  CONFIG_USB_XHCI_HCD=y
> >  CONFIG_USB_XHCI_PLATFORM=y
> > @@ -85,10 +86,10 @@ CONFIG_USB_OHCI_HCD=y
> >  CONFIG_USB_OHCI_HCD_PLATFORM=y
> >  CONFIG_USB_STORAGE=y
> >  CONFIG_USB_UAS=y
> > +CONFIG_MMC=y
> >  CONFIG_MMC_SDHCI=y
> >  CONFIG_MMC_SDHCI_PLTFM=y
> >  CONFIG_MMC_SDHCI_CADENCE=y
> > -CONFIG_MMC=y
> >  CONFIG_MMC_SPI=y
> >  CONFIG_RTC_CLASS=y
> >  CONFIG_VIRTIO_PCI=y
> > @@ -139,5 +140,3 @@ CONFIG_RCU_EQS_DEBUG=y
> >  # CONFIG_FTRACE is not set
> >  # CONFIG_RUNTIME_TESTING_MENU is not set
> >  CONFIG_MEMTEST=y
> > -# CONFIG_SYSFS_SYSCALL is not set
> > -CONFIG_EFI=y
> > diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> > index 434ef5b64599..44022e048efd 100644
> > --- a/arch/riscv/configs/rv32_defconfig
> > +++ b/arch/riscv/configs/rv32_defconfig
> > @@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
> >  CONFIG_POSIX_MQUEUE=y
> >  CONFIG_NO_HZ_IDLE=y
> >  CONFIG_HIGH_RES_TIMERS=y
> > +CONFIG_BPF_SYSCALL=y
> >  CONFIG_IKCONFIG=y
> >  CONFIG_IKCONFIG_PROC=y
> >  CONFIG_CGROUPS=y
> > @@ -13,12 +14,14 @@ CONFIG_USER_NS=y
> >  CONFIG_CHECKPOINT_RESTORE=y
> >  CONFIG_BLK_DEV_INITRD=y
> >  CONFIG_EXPERT=y
> > -CONFIG_BPF_SYSCALL=y
> > +# CONFIG_SYSFS_SYSCALL is not set
> >  CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_VIRT=y
> >  CONFIG_ARCH_RV32I=y
> >  CONFIG_SMP=y
> >  CONFIG_HOTPLUG_CPU=y
> > +CONFIG_VIRTUALIZATION=y
> > +CONFIG_KVM=m
> >  CONFIG_JUMP_LABEL=y
> >  CONFIG_MODULES=y
> >  CONFIG_MODULE_UNLOAD=y
> > @@ -67,11 +70,9 @@ CONFIG_HW_RANDOM_VIRTIO=y
> >  CONFIG_SPI=y
> >  CONFIG_SPI_SIFIVE=y
> >  # CONFIG_PTP_1588_CLOCK is not set
> > -CONFIG_POWER_RESET=y
> >  CONFIG_DRM=y
> >  CONFIG_DRM_RADEON=y
> >  CONFIG_DRM_VIRTIO_GPU=y
> > -CONFIG_FRAMEBUFFER_CONSOLE=y
> >  CONFIG_USB=y
> >  CONFIG_USB_XHCI_HCD=y
> >  CONFIG_USB_XHCI_PLATFORM=y
> > @@ -130,4 +131,3 @@ CONFIG_RCU_EQS_DEBUG=y
> >  # CONFIG_FTRACE is not set
> >  # CONFIG_RUNTIME_TESTING_MENU is not set
> >  CONFIG_MEMTEST=y
> > -# CONFIG_SYSFS_SYSCALL is not set

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
