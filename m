Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E814CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sx8Dfz8iBfLPnFW580e+QH1mty10mGYFHSp1XWAcQHI=; b=dHjeN5UNrDe4t9
	CIOaZshL8cpkVRUzE2sbYIXCMASW3f25lataz8elV9lvKzc16M44s7kkmgv40HNj1hTqjIXLtlG7h
	+WdyHtAdlQQTAeTx1lfKCz2OdhWXIlj8Yatp5ULbyRVFrm1PepVnBL6WO7T9sdaWWTV7Vjij537bN
	DgtwyBR9d2O4kyCpsKZtvET/izzOSI0fpwPwd7zPewB3BQEDQNjL4/Lo+QqZuVDy8wBixjXyE3rWR
	I5lj+ZuegUtPM2ZE31XFc/kiwDIEcBpuB++FEHOc1CgCTvQvn8ExHs1EKjad1uzQE1Qwyqj0/FA8P
	DcqybT2q3Sxc300yCpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nxp-0000000BYKg-1N2m;
	Mon, 22 Sep 2025 21:20:49 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nxm-0000000BYJJ-3AKX
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 21:20:48 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-73b4e3d0756so38250587b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758576045; x=1759180845; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=onj4yFqllMzEveOUk9DfiKAf4L6zZPOcmFKF8e4Prmo=;
        b=nQ9ZXxX+m7iwWblj5R2iI64fN/b6iPF1jsLQPcEP6TifL3BXKfqDkVrX4aTSFJb1ey
         47yDP9sNIRJcO5W6JsJY+Zuyf5NBtGXl8SPt1F3K9FtBqyDkMRYkJs/2U0wX4jd08JeE
         CIn2eznjfNFJFCpPvNzEnB5FdMcZMgzM9826ATaNvNYHiEYmTtnLHDtvrXMb9UZ6mvAH
         aMnFQ3Tj5QyC+9/4A3VO6HTx2MUFl3Mfit0wBmtfoIXAhXZRL6aCmJVT7RtXBuQAGv4b
         S0p83HjbNZfRvpwzMw7a9AlQ89Pvw1Okt5sdOLg43wrs8t2+b3qRhXpPia+yD0on3IYz
         b47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758576045; x=1759180845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onj4yFqllMzEveOUk9DfiKAf4L6zZPOcmFKF8e4Prmo=;
        b=F7ZYkgB3Clk4fbwukrPqAYLuzr4pSXrJtEPrBnwMzs+bwA6guj5hHF/+HdNVAd0Rpr
         d3vI8tAjA06tj0N+a2hnXToOHX8QPPnoAIgm68v3574EjC+3UrIjONK7K2h0ShRGmyB+
         UXI+Od2G3HR8nawyHi7nCPgcC6nbNQgWiF67BsOlIGD5n6PB7zjNV3k11BE2pQYcv0QH
         7bnEtqFQ3XugykRDa3nBHktTbpFwICH3geB3+iIn65KviKSAlXQ/TZaDC4SV2sLyEctB
         y7bZsQBJ7pqZXKWZP/S1Tt65nKb56TMdDsOxELZLT0rgKWXlG98tQIG9eofdJ8UiGGge
         8d5w==
X-Forwarded-Encrypted: i=1; AJvYcCXTAQNuFUMvAgXpBwEump1b/kr47BJzoNH6io0wlE3im4pS2d/PROEUrwScfaqDxnB43yUVrsbHN0s62Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJUteuzh3qXYlkd5PCaNQVfYbNXhQ7OwxProb63GOq6Hypoarz
	hm0pti+23NfR5dgzrYJBwqtyVPzkWd7jMfkwlL69ZV1HqaF5fLeFO9ZHekLMHN+FAS8=
X-Gm-Gg: ASbGncvRR3VgjsAbKuX/t1eHXgZocNoi4G6qJVgYRq7VR8OVyldOIRed+9OxR8lyKbl
	bsWZF1Xu2snt7YkyUVR74q6NRen6lAjODN0AEzR5Zi7bA1r+WAvRzNRwXI6CX3c634j2bskbJDl
	lx4InL2NeT296DOhENYxQ3zXoR4En7+G3xxsbjtukF4t/ZNrzzwmIITnbE3q0UuF0IFfjV4NU7d
	CUnwfNWzuYNpPvqp1kVVTh1gp5NPL4ImIArI9p/w/xUEJ0wDERDsP2hgKpgYaSrvGezXvwlSbUl
	cFcRGFKC2OZ4+00Us/JSeIEFRFpL3rsyXIM/sqsIWkg+22UGh42naYDcHkzN53W7fkilzg2wekc
	S2f9/yN0dbWBrvuCYfGj/Uw7P
X-Google-Smtp-Source: AGHT+IEkvQZ5SylVDHV/m2S+NTAyd5wvsiLsp5Pptg5UwT2UN0VbvwmLcskjGP4MQTxbjIrmiAtKRQ==
X-Received: by 2002:a05:690c:4b03:b0:722:6f24:6293 with SMTP id 00721157ae682-758a2d07fd7mr1394647b3.32.1758576045119;
        Mon, 22 Sep 2025 14:20:45 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-633bcce7089sm4581523d50.5.2025.09.22.14.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 14:20:44 -0700 (PDT)
Date: Mon, 22 Sep 2025 16:20:43 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, tglx@linutronix.de, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <20250922-50372a07397db3155fec49c9@orel>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250922184336.GD1391379@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_142046_816032_6DFA4662 
X-CRM114-Status: GOOD (  47.98  )
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

On Mon, Sep 22, 2025 at 03:43:36PM -0300, Jason Gunthorpe wrote:
> On Sat, Sep 20, 2025 at 03:38:58PM -0500, Andrew Jones wrote:
> > When setting irq affinity extract the IMSIC address the device
> > needs to access and add it to the MSI table. If the device no
> > longer needs access to an IMSIC then remove it from the table
> > to prohibit access. This allows isolating device MSIs to a set
> > of harts so we can now add the IRQ_DOMAIN_FLAG_ISOLATED_MSI IRQ
> > domain flag.
> 
> IRQ_DOMAIN_FLAG_ISOLATED_MSI has nothing to do with HARTs.
> 
>  * Isolated MSI means that HW modeled by an irq_domain on the path from the
>  * initiating device to the CPU will validate that the MSI message specifies an
>  * interrupt number that the device is authorized to trigger. This must block
>  * devices from triggering interrupts they are not authorized to trigger.
>  * Currently authorization means the MSI vector is one assigned to the device.

Unfortunately the RISC-V IOMMU doesn't have support for this. I've raised
the lack of MSI data validation to the spec writers and I'll try to raise
it again, but I was hoping we could still get IRQ_DOMAIN_FLAG_ISOLATED_MSI
by simply ensuring the MSI addresses only include the affined harts (and
also with the NOTE comment I've put in this patch to point out the
deficiency).

> 
> It has to do with each PCI BDF having a unique set of
> validation/mapping tables for MSIs that are granular to the interrupt
> number.

Interrupt numbers (MSI data) aren't used by the RISC-V IOMMU in any way.

> 
> As I understand the spec this is is only possible with msiptp? As
> discussed previously this has to be a static property and the SW stack
> doesn't expect it to change. So if the IR driver sets
> IRQ_DOMAIN_FLAG_ISOLATED_MSI it has to always use misptp?

Yes, the patch only sets IRQ_DOMAIN_FLAG_ISOLATED_MSI when the IOMMU
has RISCV_IOMMU_CAPABILITIES_MSI_FLAT and it will remain set for the
lifetime of the irqdomain, no matter how the IOMMU is being applied.

> 
> Further, since the interrupt tables have to be per BDF they cannot be
> linked to an iommu_domain! Storing the msiptp in an iommu_domain is
> totally wrong?? It needs to somehow be stored in the interrupt layer
> per-struct device, check how AMD and Intel have stored their IR tables
> programmed into their versions of DC.

The RISC-V IOMMU MSI table is simply a flat address remapping table,
which also has support for MRIFs. The table indices come from an
address matching mechanism used to filter out invalid addresses and
to convert valid addresses into MSI table indices. IOW, the RISC-V
MSI table is a simple translation table, and even needs to be tied to
a particular DMA table in order to work. Here's some examples

1. stage1 not BARE
------------------

      stage1     MSI table
 IOVA ------> A  ---------> host-MSI-address

2. stage1 is BARE, for example if only stage2 is in use
-------------------------------------------------------

           MSI table
 IOVA == A ---------> host-MSI-address

When used by the host A == host-MSI-address, but at least we can block
the write when an IRQ has been affined to a set of harts that doesn't
include what it's targeting. When used for irqbypass A == guest-MSI-
address and the host-MSI-address will be that of a guest interrupt file.
This ensures a device assigned to a guest can only reach its own vcpus
when sending MSIs.

In the first example, where stage1 is not BARE, the stage1 page tables
must have some IOVA->A mapping, otherwise the MSI table will not get
a chance to do a translation, as the stage1 DMA will fault. This
series ensures stage1 gets an identity mapping for all possible MSI
targets and then leaves it be, using the MSI tables instead for the
isolation.

I don't think we can apply a lot of AMD's and Intel's model to RISC-V.

> 
> It looks like there is something in here to support HW that doesn't
> have msiptp? That's different, and also looks very confused.

The only support is to ensure all the host IMSICs are mapped, otherwise
we can't turn on IOMMU_DMA since all MSI writes will cause faults. We
don't set IRQ_DOMAIN_FLAG_ISOLATED_MSI in this case, though, since we
don't bother unmapping MSI addresses of harts that IRQs have be un-
affined from.

> The IR
> driver should never be touching the iommu domain or calling iommu_map!

As pointed out above, the RISC-V IR is quite a different beast than AMD
and Intel. Whether or not the IOMMU has MSI table support, the IMSICs
must be mapped in stage1, when stage1 is not BARE. So, in both cases we
roll that mapping into the IR code since there isn't really any better
place for it for the host case and it's necessary for the IR code to
manage it for the virt case. Since IR (or MSI delivery in general) is
dependent upon the stage1 page tables, then it's necessary to be tied to
the same IOMMU domain that those page tables are tied to. Patch4's changes
to riscv_iommu_attach_paging_domain() and riscv_iommu_iodir_update() show
how they're tied together.

> Instead it probably has to use the SW_MSI mechanism to request mapping
> the interrupt controller aperture. You don't get
> IRQ_DOMAIN_FLAG_ISOLATED_MSI with something like this though. Look at
> how ARM GIC works for this mechanism.

I'm not seeing how SW_MSI will help here, but so far I've just done some
quick grepping and code skimming.

> 
> Finally, please split this series up, if ther are two different ways
> to manage the MSI aperture then please split it into two series with a
> clear description how the HW actually works.
> 
> Maybe start with the simpler case of no msiptp??

The first five patches plus the "enable IOMMU_DMA" will allow paging
domains to be used by default, while paving the way for patches 6-8 to
allow host IRQs to be isolated to the best of our ability (only able to
access IMSICs to which they are affined). So we could have

series1: irqdomain + map all imsics + enable IOMMU_DMA
series2: actually apply irqdomain in order to implement map/unmap of MSI
         ptes based on IRQ affinity - set IRQ_DOMAIN_FLAG_ISOLATED_MSI,
         because that's the best we've got...
series3: the rest of the patches of this series which introduce irqbypass
         support for the virt use case

Would that be better? Or do you see some need for some patch splits as
well?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
