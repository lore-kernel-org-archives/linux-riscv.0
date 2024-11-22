Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFD7E69185
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xl48Ysr8mTPEtNmua7sDlcWjsK98suL/HkXPU1qF4eI=; b=t/RtDLuEWJPgtM
	NFMbva+0EO4+ObFFgIapPC0hnxwS2523TZFNjj8drOnZQY+iRKLN/E+TsnLarVZ4U6fTV1Z+hHFHV
	t94OYIim6m/+PKCGfFvlbmGdIiNKRoEaG3FKiUmHwyOpeQLH0qqnX6I5iFc64IbYMKmVWJH3Vgp7z
	fzWNhUbNBJq4op/Xu4S8g6dyT9ACW9ENkuBtHrO+HxwA1lEdC4YWm6DE8daKGplQusUYP18qodxCt
	FMZxWHz6Sfh2PdiSyfRgJCR1wO8e88d8Ukk5lzkpzcOXorpMUgOPlNfpUyk4c5PTVPTRohrH/Wnn4
	1+XPeodAvuHCwCF+LgQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEX8w-00000002vOv-3YDX;
	Fri, 22 Nov 2024 17:08:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEX8Y-00000002vJc-17SX
	for linux-riscv@lists.infradead.org;
	Fri, 22 Nov 2024 17:08:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5cfaeed515bso2998308a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Nov 2024 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732295284; x=1732900084; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0DOX93bw5phi/WY0MT30BO5hYdUtb3juzdM+PG5dKU=;
        b=briwyGR2x6+5YfO32Qt2VitvCoDBmUC4YylRE9F+Jr/bXHjPHDhD4SBugOeFSfEezB
         6TgpkHPVQZlXcZfItWk3ug+KRB0ms+QH8uBqBwDZxS5BmW668mTyH84/3j9LYRxJHcjE
         zdKFA8OhSRjTc5Sdkuz/tO2IT9IN1VZx36TJkSpTGUoney86jYNiM35MYGYYHgRzmWlq
         HETRF/9BnYHf9LrP2Oxd160w5zGWSn6JA25cTwE2fFV5jtUXmZa/vAnuDmPHYkU4lEKn
         Si2Q+o0fHVbxHiaGj0yyt6uN4pLFFeKIr3N5FCEPFYfAaa9//yimB/15cDS0sz+/vQK1
         4PzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295284; x=1732900084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0DOX93bw5phi/WY0MT30BO5hYdUtb3juzdM+PG5dKU=;
        b=XfYw0q5tcdMBOnq4x/ckYTaw//ZMzoIPvE0Vq1SlRku7LYz/agNcIGLWMrfs+DmSDV
         mM9PyqyjHlGunbZnl0ozaVZAP1UfVgYhfyhseGaxmv25IarTr6HXk5VA0w3+YHWAQNg7
         R8Z4jCE1ucBFaKt63BCbZk2tmg3MTUa1x8F+EPArZ4KKhaGP6HuKXBbIqXz6GJgLmF8D
         Q5UMEeol1+fzotTxAXbekbsxffJp4fDbiQbbvU0/d9kP+bJFNo0dfKdtlFL17r9oicdW
         ua51RVpaLtwP6ev8VZI3Z0fH7a8S+4eQLqOWIxkoszMBIcfJygKUQ5IX/3xb3MGJl1P/
         0QRA==
X-Forwarded-Encrypted: i=1; AJvYcCXdVwFxSLVtWB2p20aAkNjb3IXEj6MKyv6F7oD9mbMJLmRisEb1ELYCvBNaL5svBxP/qcXoFL5mRv475A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu+A7bU5COkZLa16ZN63lKVGnYioIAAr13AgVB76sGotiqbiKi
	XMCa1xYiDaMS8F3huiOSWls+CnAA5k21H2kmMtNvWPIcAuO5beCJFGOMspmVcZo=
X-Gm-Gg: ASbGncsl4kFCnSiOBl9TJ/jz5UVCIfCtbLgsYpOMytWg7lrotXZxqlVuFcnl7pN8Qed
	XEG748eGwUv4OvEYyBY8tRW6Oq8FVclL4i3oakKXs/TFgBZdtFmlgLRQ2edkAmrgE6pIGxa8d+q
	TmQwsnKFE41/HgGR3koJtGHvUXqmh/PfujvRvdXZpVE/MuBGiOkRSmAE7b24eNqp7wo3SZMtvlo
	2+t21+GL4sVq1kFL4YdKorDtS4pb+2JZUfxsVJ7C2nJpEsEPhvwhgiAj4J0QValseVlgxWvTCJD
	xIr/B/vJ+78Ze/UkAH0K/uWKDV3GwFtJVtY=
X-Google-Smtp-Source: AGHT+IGtSa/c759tcXKL36hfS9NeLmo4AZHZNWZDIockuCHHkNSeQM+NVau/IABnZYXKpy1e8IALBA==
X-Received: by 2002:a05:6402:510c:b0:5cf:9a8:2bca with SMTP id 4fb4d7f45d1cf-5d0207b9aedmr2507880a12.31.1732295282728;
        Fri, 22 Nov 2024 09:08:02 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3b032esm1100517a12.19.2024.11.22.09.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:08:01 -0800 (PST)
Date: Fri, 22 Nov 2024 18:07:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, anup@brainfault.org, atishp@atishpatra.org, tglx@linutronix.de, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
Message-ID: <20241122-8c00551e2383787346c5249f@orel>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
 <20241119-62ff49fc1eedba051838dba2@orel>
 <20241119140047.GC559636@ziepe.ca>
 <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
 <20241119153622.GD559636@ziepe.ca>
 <20241121-4e637c492d554280dec3b077@orel>
 <20241122153340.GC773835@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241122153340.GC773835@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_090806_306326_6E58A82A 
X-CRM114-Status: GOOD (  39.87  )
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

On Fri, Nov 22, 2024 at 11:33:40AM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 22, 2024 at 04:11:36PM +0100, Andrew Jones wrote:
> 
> > The reason is that the RISC-V IOMMU only checks the MSI table, i.e.
> > enables its support for MSI remapping, when the g-stage (second-stage)
> > page table is in use. However, the expected virtual memory scheme for an
> > OS to use for DMA would be to have s-stage (first-stage) in use and the
> > g-stage set to 'Bare' (not in use). 
> 
> That isn't really a technical reason.
> 
> > OIOW, it doesn't appear the spec authors expected MSI remapping to
> > be enabled for the host DMA use case.  That does make some sense,
> > since it's actually not necessary. For the host DMA use case,
> > providing mappings for each s-mode interrupt file which the device
> > is allowed to write to in the s-stage page table sufficiently
> > enables MSIs to be delivered.
> 
> Well, that seems to be the main problem here. You are grappling with a
> spec design that doesn't match the SW expecations. Since it has
> deviated from what everyone else has done you now have extra
> challenges to resolve in some way.
> 
> Just always using interrupt remapping if the HW is capable of
> interrupt remapping and ignoring the spec "expectation" is a nice a
> simple way to make things work with existing Linux.
> 
> > If "default VFIO" means VFIO without irqbypass, then it would work the
> > same as the DMA API, assuming all mappings for all necessary s-mode
> > interrupt files are created (something the DMA API needs as well).
> > However, VFIO would also need 'vfio_iommu_type1.allow_unsafe_interrupts=1'
> > to be set for this no-irqbypass configuration.
> 
> Which isn't what anyone wants, you need to make the DMA API domain be
> fully functional so that VFIO works.
> 
> > > That isn't ideal, the translation under the IRQs shouldn't really be
> > > changing as the translation under the IOMMU changes.
> > 
> > Unless the device is assigned to a guest, then the IRQ domain wouldn't
> > do anything at all (it'd just sit between the device and the device's
> > old MSI parent domain), but it also wouldn't come and go, risking issues
> > with anything sensitive to changes in the IRQ domain hierarchy.
> 
> VFIO isn't restricted to such a simple use model. You have to support
> all the generality, which includes fully supporting changing the iommu
> translation on the fly.
> 
> > > Further, VFIO assumes iommu_group_has_isolated_msi(), ie
> > > IRQ_DOMAIN_FLAG_ISOLATED_MSI, is fixed while it is is bound. Will that
> > > be true if the iommu is flapping all about? What will you do when VFIO
> > > has it attached to a blocked domain?
> > > 
> > > It just doesn't make sense to change something so fundamental as the
> > > interrupt path on an iommu domain attachement. :\
> > 
> > Yes, it does appear I should be doing this at iommu device probe time
> > instead. It won't provide any additional functionality to use cases which
> > aren't assigning devices to guests, but it also won't hurt, and it should
> > avoid the risks you point out.
> 
> Even if you statically create the domain you can't change the value of
> IRQ_DOMAIN_FLAG_ISOLATED_MSI depending on what is currently attached
> to the IOMMU.
> 
> What you are trying to do is not supported by the software stack right
> now. You need to make much bigger, more intrusive changes, if you
> really want to make interrupt remapping dynamic.
>

Let the fun begin. I'll look into this more. It also looks like I need to
collect some test cases to ensure I can support all use cases with
whatever I propose next. Pointers for those would be welcome.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
