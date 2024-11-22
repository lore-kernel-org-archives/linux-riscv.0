Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C2FE6916B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hR0Y569TXRwwSvxCSdZ8ALltrxuKgYK3V7WJ78m25l0=; b=ecb/MiYW036iBx
	bVCNkMK8ep+vJbCiaiLtjIffsv7YBYNmjkZysrh8nFRkweHZB/6bMBTZisvKYFpSr8OGjweH9NS5e
	KeB/1vv+XTEwH+RikANDLTlOv1wSJhjtuY1da4oec2w35xzBA858EX+8lLnQ8KQb4PjXs+66CjJia
	ky8It4Rqyh+lDDNEmm7cD/Y2P7fWrbL9mJ5936xk0SRCSU7YJR5e5Nup03+gxLs3fGUxJmggxAyju
	3+cmUDSJd3FeUYBapdLkkldOZytrUkM+11HJQg3q0cb6orHKcQRHFJgg62xXwCSapjZD/H0161DCg
	GOd7/sertrb55fabfH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEVJu-00000002hZB-3wB9;
	Fri, 22 Nov 2024 15:11:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEVJs-00000002hXv-0w0j
	for linux-riscv@lists.infradead.org;
	Fri, 22 Nov 2024 15:11:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38241435528so1501606f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Nov 2024 07:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732288298; x=1732893098; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2+yAcNB3wPLv50EszBtHoaBKj8Z5/OU1c68F3vdA3XI=;
        b=abKJ4FKvvwVHJ/ALeiYfMmqchMK5Ok00yCn1ojuwmk21mlPHPWfxw8N8J6OUIN5Wpc
         xTKYcnukx6K/aeA6xdH3H+r2skWrSEpJdH8Tnl9uVG+S69Hhq0CanflKu3ADUDe4ZCS5
         YT6lAGR7Aesh15DQO8wzbsTZ4VIlNbXf30AcUzQg/OiPP1vTDl16fTbJahIaTlMyll6C
         vFjDlCHZN7gq39BDONTwYzEe+7iowDEXDi0Hss7gkkjGjOWZlFB8ZVFfjCmTWCnW07N1
         5Zm2PqyvP5k9iQIv4wBuHUJXX21Y1CPoolxUZg0MWPfT3OHl3ERbvcYE1TMxWN0TiYvp
         b0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732288298; x=1732893098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+yAcNB3wPLv50EszBtHoaBKj8Z5/OU1c68F3vdA3XI=;
        b=JUte9foPHAWKig4HzJry/1CWReOxotZAOuxJsm3XF85/q4f5neiT2Ya+JgHr3QfKuT
         I69lbqXrsfA7Thwo9ZkdJd1RBchJWvp9LbQ8YnwdAqo35GofpRXg3Hvv/zN4cX/Y1G4/
         obytXC2+0/wht/MPf1I7Wg1+eRLs9wwwWvFJvXhSt35k9a170YjfSFkEYQI++c8g9ySq
         ur/VOTlDeCrh5wpRzA07h1nk8SYgC1X4KxiQfNn/6S7O6KzLuCUsXfK7YbcOvNSCogsx
         wCkqUNvi4wFFw668uLKv8D51Nm4lxjDxSDwnRkoX/67XCYuTwliWYos+fcOhYaV+8sgK
         WusQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRyGkMj3ff0iJn3ndRbdaCs0qcsLLaCxCmzq5OdnV3K0/YDQ2ELKMicUdWS/ezg7f2yvfTO5aQrIG+zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrCYMf+Kg/bY58zW1tDg919H0s80j9EuuS+IurEWQ2G2IMzOXe
	T491euYpsfu6CeoZTG3RSIjEryDSv4Pbs9La6gnbI/EfFCaGL+8+4y6QwwzLM38=
X-Gm-Gg: ASbGncvuZN8eObkc+CCJcmYJzVOIxkdX1Dl2bcEj+ngVHu8GgfkmGdjScLCp5F9wd8p
	C/L+IF0L0sHaYTvD6tuHNOaufBtLsKhfcov98A5f6D/EgNB01NM6raay2zQI9Q1RPG/aKN8T5NL
	SbjrpEAGXjJAt9chemAF81IJAJ3siYTJB5e98NUJSe/E2lxEp4SoNiKw0MKB2gcYdrLjGVs8AlX
	MPGuRDJVmi0mz5HHG/JsLHWgguZqi0M3gjXNRs9A10/bnpxrXCtPgY+EGpa99hvWy6r8EnkjbKT
	dB1ogGA1/JwXstlAOC/p/CieHwD59MILfqo=
X-Google-Smtp-Source: AGHT+IHb9Bmd0b73+vONmIkjjrmjPdTvZeeinULGXC1DO8MOvrqHzr0CJRYp4UVboJ7X3gZYYU2K6w==
X-Received: by 2002:a05:6000:144c:b0:382:4f4e:1cd4 with SMTP id ffacd0b85a97d-38260bcf97dmr2659883f8f.42.1732288297448;
        Fri, 22 Nov 2024 07:11:37 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad60b8sm2624448f8f.17.2024.11.22.07.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 07:11:36 -0800 (PST)
Date: Fri, 22 Nov 2024 16:11:36 +0100
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
Message-ID: <20241121-4e637c492d554280dec3b077@orel>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
 <20241119-62ff49fc1eedba051838dba2@orel>
 <20241119140047.GC559636@ziepe.ca>
 <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
 <20241119153622.GD559636@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241119153622.GD559636@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_071140_265192_10502502 
X-CRM114-Status: GOOD (  56.85  )
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

On Tue, Nov 19, 2024 at 11:36:22AM -0400, Jason Gunthorpe wrote:
> On Tue, Nov 19, 2024 at 04:03:05PM +0100, Andrew Jones wrote:
> 
> > >This is the wrong thinking entirely. There is no such thing as a "VFIO
> > >domain".
> > >
> > >Default VFIO created domains should act excatly the same as a DMA API
> > >domain.
> > >
> > >If you want your system to have irq remapping, then it should be on by
> > >default and DMA API gets remapping too. There would need to be a very
> > >strong reason not to do that in order to make something special for
> > >riscv. If so you'd need to add some kind of flag to select it.
> > >
> > >Until you reach nested translation there is no "need" for VFIO to use
> > >any particular stage. The design is that default VFIO uses the same
> > >stage as the DMA API because it is doing the same basic default
> > >translation function.
> > 
> > The RISC-V IOMMU needs to use g-stage for device assignment, if we
> > also want to enable irqbypass, because the IOMMU is specified to
> > only look at the MSI table when g-stage is in use. This is actually
> > another reason the irq domain only makes sense for device
> > assignment.
> 
> Most HW has enablable interrupt remapping and typically Linux just
> turns it always on.
> 
> Is there a reason the DMA API shouldn't use this translation mode too?
> That seems to be the main issue here, you are trying to avoid
> interrupt remapping for DMA API and use it only for VFIO, and haven't
> explained why we need such complexity. Just use it always?

The reason is that the RISC-V IOMMU only checks the MSI table, i.e.
enables its support for MSI remapping, when the g-stage (second-stage)
page table is in use. However, the expected virtual memory scheme for an
OS to use for DMA would be to have s-stage (first-stage) in use and the
g-stage set to 'Bare' (not in use). OIOW, it doesn't appear the spec
authors expected MSI remapping to be enabled for the host DMA use case.
That does make some sense, since it's actually not necessary. For the
host DMA use case, providing mappings for each s-mode interrupt file
which the device is allowed to write to in the s-stage page table
sufficiently enables MSIs to be delivered.

> 
> > >Nested translation has a control to select the stage, and you can
> > >then force the g-stage for VFIO users at that point.
> > 
> > We could force riscv device assignment to always be nested, and when
> > not providing an iommu to the guest, it will still be single-stage,
> > but g-stage, but I don't think that's currently possible with VFIO,
> > is it?
> 
> That isn't what I mean, I mean you should not be forcing the kind of
> domain being created until you get to special cases like nested.
> 
> Default VFIO should work the same as the DMA API.

If "default VFIO" means VFIO without irqbypass, then it would work the
same as the DMA API, assuming all mappings for all necessary s-mode
interrupt files are created (something the DMA API needs as well).
However, VFIO would also need 'vfio_iommu_type1.allow_unsafe_interrupts=1'
to be set for this no-irqbypass configuration.

> 
> > >> The IRQ domain will only be useful for device assignment, as that's when
> > >> an MSI translation will be needed. I can't think of any problems that
> > >> could arise from only creating the IRQ domain when probing assigned
> > >> devices, but I could certainly be missing something. Do you have some
> > >> potential problems in mind?
> > >
> > >I'm not an expert in the interrupt subsystem, but my understanding was
> > >we expect the interrupt domains/etc to be static once a device driver
> > >is probed. Changing things during iommu domain attach is after drivers
> > >are probed. I don't really expect it to work correctly in all corner
> > >cases.
> > 
> > With VFIO the iommu domain attach comes after an unbind/bind, so the
> > new driver is probed.
> 
> That's the opposite of what I mean. The irq domain should be setup
> *before* VFIO binds to the driver.
> 
> Changing the active irq_domain while VFIO is already probed to the
> device is highly unlikely to work right in all cases.
> 
> > I think that's a safe time. However, if there
> > could be cases where the attach does not follow an unbind/bind, then
> > I agree that wouldn't be safe.
> 
> These cases exist.
> 
> > I'll consider always creating an IRQ
> > domain, even if it won't provide any additional functionality unless
> > the device is assigned.
> 
> That isn't ideal, the translation under the IRQs shouldn't really be
> changing as the translation under the IOMMU changes.

Unless the device is assigned to a guest, then the IRQ domain wouldn't
do anything at all (it'd just sit between the device and the device's
old MSI parent domain), but it also wouldn't come and go, risking issues
with anything sensitive to changes in the IRQ domain hierarchy.

> 
> Further, VFIO assumes iommu_group_has_isolated_msi(), ie
> IRQ_DOMAIN_FLAG_ISOLATED_MSI, is fixed while it is is bound. Will that
> be true if the iommu is flapping all about? What will you do when VFIO
> has it attached to a blocked domain?
> 
> It just doesn't make sense to change something so fundamental as the
> interrupt path on an iommu domain attachement. :\

Yes, it does appear I should be doing this at iommu device probe time
instead. It won't provide any additional functionality to use cases which
aren't assigning devices to guests, but it also won't hurt, and it should
avoid the risks you point out.

> 
> > >VFIO is allowed to change the translation as it operates and we expect
> > >that interrupts are not disturbed.
> > 
> > The IRQ domain stays the same during operation, the only changes are
> > the mappings from what the guest believes are its s-mode interrupt
> > files to the hypervisor selected guest interrupt files, and these
> > changes are made possible by the IRQ domain's vcpu-affinity support.
> 
> That is only the case when talking about kvm, this all still has to
> work fully for non-kvm VFIO uses cases too.
> 

I'll rework the irq domain creation to be at iommu device probe time for
the next version.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
