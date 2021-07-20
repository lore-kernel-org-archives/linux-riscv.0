Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA80C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:06:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707C6611C1
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 707C6611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W0mZx14VdPSFdjYwVGg3/fu06YE5fOhTm4uc8O/mSS8=; b=4zUuMHilYD+Z660YjOu/kodShZ
	eiAfNKLBAcdi5fOsDeVP4SkkSpsRDXVCYA6sJ6y0Xt4H6ZHFwte7ShhPoQmgvA43Z6IzT4FpUL/Go
	fkg9zeoNxynTSEpGQceIVGr+xnXZjy4BtJI7LbKQfRLvFrHKB152SDgbhTiogYwHII54Nop+TkHuv
	Ozk4rW+vPzMelVP9KjsKeIFVoutgh7KycvbRnf3yRv/El9jKLkxiV/BPv3hHA3dQ2POHqE8gk819p
	lzTIgX5YTs+6BN5hZTSI0rdzYtgVvGydNmZVJZ8PUq0K7AKWonzMjig73MKSp/djz4qUAdxB+ywzl
	DJxTdp5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5klC-00C9gz-0n; Tue, 20 Jul 2021 08:05:50 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5kl7-00C9ff-W3
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 08:05:49 +0000
Received: by mail-pg1-x532.google.com with SMTP id i16so4235954pgi.9
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=bOwgCetXqMtN52cjb0yepmtDbLxyw1F17rPFz0W08RY=;
 b=lRwlgcGEN4w3nLy306s3JPfImMFLlYErfYeLRLK+SREXwx4Bn4Y/E1Oc798kmGvytL
 PKVyXiQQjmW8SqboCMvgAms1sumNkcPqpoqmQ+I+SKnF7hHn0IzTEnM2g5zGU+E74mgW
 07Qg5IsGu1KbrVDKJ5xNIVtQUC7P/uX2kPebu3B/ED7HDOi8m2GZei8x4YdpHvMw5Cfg
 nbzgYD6wXP+PkfFsGe/eqspn/A3mMO7aZXuJo/2NFdcftNRrGkssblTny3pycLj+eyt4
 gxLMcASNT0UGBpAniP0ipYhxdXmYoENpsC+FeOBBt5T9GmVWo2b/mywh5i+P5kiMQGj2
 Nz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=bOwgCetXqMtN52cjb0yepmtDbLxyw1F17rPFz0W08RY=;
 b=NBnpwz9hz+1XqK1QnQVrz0YijVv5595ussL2a0inq+UBsmLDxJJw7jz6BFbybilfXz
 LHFLG1JUL/9AB5VmvN0r5FOl+CFyC/UwZxXDFqzeGXl0XEETp3QjyHVBPHffI3aA22RQ
 f9T8K+CdRh+2hMCHAqOKqye7bOAOXe4FtzXEFUD5iDqk+RG46wiKudZC/mG8SNDjpeXy
 JrF38xA1jakJPRErMMwDbvoBHTCMyGvq2ma5U7rY+ZGiHYOUnjyjEPo0d+zm/KMaF6B/
 i9mOISM0+chfb/O7dx8XEWKj3VEeRwC3+PfGS/S1UxyyMMzASM3M6h1IQKKtlFd3adlb
 0AhA==
X-Gm-Message-State: AOAM532pSWqRUWZMaN3SwOi9Elxpry2wGRHs7wNgBN4szx53NnzI02zF
 IaYCEtpLIfBBQYPIqewkjTQqwubAHmkoDxVy2aHUjlDHMHHLig==
X-Google-Smtp-Source: ABdhPJw6UX/SGKoqiA9QPRQWQk3b71dpJx7XgyWWWSrqaiW6WLaqpXOfYXXsVXQFVo+DDxeSFwGD+dFhIe1je/DnsNQ=
X-Received: by 2002:a65:44c3:: with SMTP id g3mr24749810pgs.233.1626768344023; 
 Tue, 20 Jul 2021 01:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <1625800352-17846-1-git-send-email-vincent.chen@sifive.com>
In-Reply-To: <1625800352-17846-1-git-send-email-vincent.chen@sifive.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 20 Jul 2021 16:05:33 +0800
Message-ID: <CABvJ_xg7piPyt_wy0dU97Vt1y5PN0Ets0fq09k05yZeoWdN7Hw@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Kconfig: do not select PCI_MSI if CONIFG_PCI
 is enabled
To: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_010546_109677_F397B9DF 
X-CRM114-Status: GOOD (  35.52  )
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

Just a gentle ping.
Does anyone have any comments on this RFC patch? If not, I will remove
the "note" part from the git description and resend it as a formal
patch. Thank you.

On Fri, Jul 9, 2021 at 11:12 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> The CONFIG_PCI_MSI is used to allow device drivers to enable MSI. The MSI
> enables a device to generate an interrupt using an inbound Memory Write
> on its PCI bus instead of asserting a device IRQ pin. The whole mechanism
> needs support from the PCI controller or generic interrupt controller and
> the corresponding software driver.
>
> The RISC-V Kconfig file actively selects the PCI_MSI  if users enable
> CONFIG_PCI. However, the RISC-V specification does not require every RISC-V
> platform shall have MSI support. In other words, Kconfig enables CONFIG_PCI
> to allow PCI devices to use MSI, but due to lack of MSI support, the kernel
> may not have any function to deal with the MSI from PCI devices. When this
> case happens, it leads to the following warning message displayed in
> booting a v5.10~v5.12 kernel.
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at include/linux/msi.h:219 __pci_enable_msix_range+0x4b6/0x50e
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.34 #76
> epc: ffffffe0004fa1e0 ra : ffffffe0004fa02e sp : ffffffe07fea7920
>  gp : ffffffe0010e25c0 tp : ffffffe07fea8000 t0 : ffffffe0808c3180
>  t1 : ffffffd000239000 t2 : 0000000000000400 s0 : ffffffe07fea79e0
>  s1 : ffffffe080803000 a0 : 0000000000000000 a1 : ffffffe080803210
>  a2 : ffffffe0808c30c0 a3 : 0000000000000101 a4 : ffffffe0808c30c0
>  a5 : 0000000000000010 a6 : ffffffe0004dcf98 a7 : ffffffe07fe0f010
>  s2 : 0000000000000002 s3 : 0000000000000014 s4 : 0000000000000000
>  s5 : ffffffe080803210 s6 : 0000000000000000 s7 : ffffffe0808c3120
>  s8 : ffffffe0808c30c0 s9 : 0000000000000000 s10: 0000000000000002
>  s11: ffffffe0808030b0 t3 : 0000000000001000 t4 : 0000000000001000
>  t5 : ffffffd040239000 t6 : ffffffe07ff8b2c0
> status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
>
> A simple reproduce way is to use defconfig to configure the 64-bit riscv
> v5.10 ~ v5.12 kernel but disable CONFIG_PCIE_XILINX, and then booting this
> kernel on the QEMU virt platform with virtio-mouse-pci.
>
> ARM's implementation may be a good sample for this case. Its Kconfig file
> does not select CONFIG_PCI_MSI. Instead, It makes the selection of
> CONFIG_PCI_MSI depends on the capability of the interrupt controller. This
> way seems to be more straightforward. Therefore, this patch follows the
> same way to remove the dependency between CONFIG_PCI and CONFIG_PCI_MSI
> from Kconfig, which allows users to enable or disable CONFIG_PCI_MSI
> according to the capabilities of the platform.
>
> (note) Why does this warning message only happen in the v5.10 to v5.12 kernel?
> When the kernel wants to register the MSI ID of the first PCI device, if
> the PCI device does not belong to any MSI domain and there is no valid
> arch_setup_msi_irqs() defined by architecture or PCI controller, the
> generic arch_setup_msi_irqs() will be called to display this warning
> message. However, before v5.10, this flow is different. A valid and weak
> arch_setup_msi_irqs() is defined in driver/pci/msi.c. The kernel can use
> this arch_setup_msi_irqs() to set up the MSI. Therefore, it will not
> encounter any problems even if the architecture and PCI controller does
> not define it. After v5.13, the kernel uses the MSI domain to deal with
> all the setup of MSI issues. Only some old PCI controller still uses
> arch_setup_msi_irqs(). Through the hierarchy of the MSI domain, the kernel
> can know the bus used by the PCI device has MSI support or not before
> doing the MSI setup. In this condition, the kernel will return early before
> calling the generic arch_setup_msi_irqs(), which will trigger the warning
> message.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 469a70bd8da6..563d550cb682 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -97,7 +97,6 @@ config RISCV
>         select OF_EARLY_FLATTREE
>         select OF_IRQ
>         select PCI_DOMAINS_GENERIC if PCI
> -       select PCI_MSI if PCI
>         select RISCV_INTC
>         select RISCV_TIMER if RISCV_SBI
>         select SPARSE_IRQ
> --
> 2.7.4
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
