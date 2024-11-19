Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE81D44173
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+tXSqds+bRnEp1jVc9c7GSNkCOJW5a8ylKvGHhcfrY=; b=TVIvP89Ju63l5X
	1z616Umz6+2vTGeUuLkB89wnKqJQpUlO8qkhQxSgDAS1pHyFJ+IpCBzQ6Y/d/mzMIkN0PRku9yK1Q
	t3Z/H2OLO0dYJRwkf85Y0iVqLGs/DpFmX8hiHHoDgvRUt6AGGdfIhnDUzRdFoleOajv9qUeKNbhKY
	NY2wkfERWdEKYtcJRREni8q+FTMI3nnLUaGKwLyei6MuU3rm00Q/zjOfxsN0JBV5CYeg+SSJ2DBpM
	1+nuD0b0OAC2LPWpvzp6ZCa9Wmb39SYXj7cn+u73f++7mU2U6JGIvOVCgNDtorr+NKMr2gUXyyLYC
	qJGVIHWGyrBlesxa6v3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQHE-0000000CsOT-0Cn9;
	Tue, 19 Nov 2024 15:36:28 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQHB-0000000CsLs-0a54
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 15:36:27 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7b14443a71eso293396285a.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Nov 2024 07:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1732030583; x=1732635383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mHQxzFmFKlA+b0zYZcHoo+aU2zGMKGJLF0Y2reUtOA=;
        b=S/5LR5+C+lJL4GV5Y0XweXiU6lUdkCOi64lfAIAoikIgWTcb/1S5QeV3fpRJEhcqPJ
         Vv7AsqrrqlIzXE90xcv3FLE2wBfnJQFvIFhmK4iF7AYJWqQ9Py/37Ne5vvLt/ojDunDh
         y/Rya2qldadWYgcQHg9qYpICNn+Iu98/l8kjddzZZQzjpnKlW8GhixJzlAUOJ9xamwVy
         dWuh4I36qxz4hc0Ds1tz3X/FZc+GEWNR285GV89OsT6QrFgpe+QKT2ZNdk3pg/H1uEgl
         yIZkR0e8K+aOuDleodnBhMzXMBHGCoY566s6WaUKm2UvUU7gei7HlDUWMHday7tlZZH1
         9y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732030583; x=1732635383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mHQxzFmFKlA+b0zYZcHoo+aU2zGMKGJLF0Y2reUtOA=;
        b=IhpRLXj15Ch/lST7bxg+RD4PzFAS/kt3wvzjg0+nMGuq6S7w+fv3ias/dDPXQ+2jUC
         N0mqWb5EaI1rtGihmIdqoUSjsXOa89zNlVzahpl/vzNDZhbhd+BHkf9HwvNSSrIBr3i0
         Ees2NEMCPTxxn7yOmnyMSiF0bPpKwy5cF+rYBQhVY/7kHJbYmSkCkv44u0Wee2A8ymjJ
         +atJ8+ubEwK7zrcwbZ6ZnAw2hZq4IaJX/G1HCZ0gOfup32yZ/t9fRYo1A1B+MzW1mHb3
         XWQA4mHyh7UJkt0WYL/0j1gp+ChCkwxARM1U9EZu0gNuVwOMMBjHHk7+zZ5Az5nqXTwi
         EtZg==
X-Forwarded-Encrypted: i=1; AJvYcCV7eiinl9h/Fp9xgsS0RweBgL8DziUmkwgKkuL9XSUVS0EtV+UkP8zUiqGXFWtOaoXlcfW+rLnN12UlDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJuVG5xVe0QOZuj8CZm/GhRwfyFthTDmdXBCvng4zW5YbHPHdU
	R61GL5apshC0s0665EW0F1t54BVRs3P8wXE6aXdFwDVff6ghnO2yq6RdhqJ0as8=
X-Google-Smtp-Source: AGHT+IH4/mgl4haITeaqcVAP0uJ0PicTb/W5vrOpJN7LD+UFoRrLptgSOiQTXdZYlGY+OxnTFThNlg==
X-Received: by 2002:a05:620a:28d1:b0:7ac:b04e:34c6 with SMTP id af79cd13be357-7b362363c62mr1842987085a.50.1732030583616;
        Tue, 19 Nov 2024 07:36:23 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b37a89fc13sm102554185a.109.2024.11.19.07.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 07:36:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tDQH8-00000003ErC-0NkI;
	Tue, 19 Nov 2024 11:36:22 -0400
Date: Tue, 19 Nov 2024 11:36:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, tjeznach@rivosinc.com,
	zong.li@sifive.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, anup@brainfault.org, atishp@atishpatra.org,
	tglx@linutronix.de, alex.williamson@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 08/15] iommu/riscv: Add IRQ domain for interrupt
 remapping
Message-ID: <20241119153622.GD559636@ziepe.ca>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-25-ajones@ventanamicro.com>
 <20241118184336.GB559636@ziepe.ca>
 <20241119-62ff49fc1eedba051838dba2@orel>
 <20241119140047.GC559636@ziepe.ca>
 <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DE13E1DF-7C68-461D-ADCD-8141B1ACEA5E@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_073625_203699_53D0375A 
X-CRM114-Status: GOOD (  40.96  )
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

On Tue, Nov 19, 2024 at 04:03:05PM +0100, Andrew Jones wrote:

> >This is the wrong thinking entirely. There is no such thing as a "VFIO
> >domain".
> >
> >Default VFIO created domains should act excatly the same as a DMA API
> >domain.
> >
> >If you want your system to have irq remapping, then it should be on by
> >default and DMA API gets remapping too. There would need to be a very
> >strong reason not to do that in order to make something special for
> >riscv. If so you'd need to add some kind of flag to select it.
> >
> >Until you reach nested translation there is no "need" for VFIO to use
> >any particular stage. The design is that default VFIO uses the same
> >stage as the DMA API because it is doing the same basic default
> >translation function.
> 
> The RISC-V IOMMU needs to use g-stage for device assignment, if we
> also want to enable irqbypass, because the IOMMU is specified to
> only look at the MSI table when g-stage is in use. This is actually
> another reason the irq domain only makes sense for device
> assignment.

Most HW has enablable interrupt remapping and typically Linux just
turns it always on.

Is there a reason the DMA API shouldn't use this translation mode too?
That seems to be the main issue here, you are trying to avoid
interrupt remapping for DMA API and use it only for VFIO, and haven't
explained why we need such complexity. Just use it always?

> >Nested translation has a control to select the stage, and you can
> >then force the g-stage for VFIO users at that point.
> 
> We could force riscv device assignment to always be nested, and when
> not providing an iommu to the guest, it will still be single-stage,
> but g-stage, but I don't think that's currently possible with VFIO,
> is it?

That isn't what I mean, I mean you should not be forcing the kind of
domain being created until you get to special cases like nested.

Default VFIO should work the same as the DMA API.

> >> The IRQ domain will only be useful for device assignment, as that's when
> >> an MSI translation will be needed. I can't think of any problems that
> >> could arise from only creating the IRQ domain when probing assigned
> >> devices, but I could certainly be missing something. Do you have some
> >> potential problems in mind?
> >
> >I'm not an expert in the interrupt subsystem, but my understanding was
> >we expect the interrupt domains/etc to be static once a device driver
> >is probed. Changing things during iommu domain attach is after drivers
> >are probed. I don't really expect it to work correctly in all corner
> >cases.
> 
> With VFIO the iommu domain attach comes after an unbind/bind, so the
> new driver is probed.

That's the opposite of what I mean. The irq domain should be setup
*before* VFIO binds to the driver.

Changing the active irq_domain while VFIO is already probed to the
device is highly unlikely to work right in all cases.

> I think that's a safe time. However, if there
> could be cases where the attach does not follow an unbind/bind, then
> I agree that wouldn't be safe.

These cases exist.

> I'll consider always creating an IRQ
> domain, even if it won't provide any additional functionality unless
> the device is assigned.

That isn't ideal, the translation under the IRQs shouldn't really be
changing as the translation under the IOMMU changes.

Further, VFIO assumes iommu_group_has_isolated_msi(), ie
IRQ_DOMAIN_FLAG_ISOLATED_MSI, is fixed while it is is bound. Will that
be true if the iommu is flapping all about? What will you do when VFIO
has it attached to a blocked domain?

It just doesn't make sense to change something so fundamental as the
interrupt path on an iommu domain attachement. :\

> >VFIO is allowed to change the translation as it operates and we expect
> >that interrupts are not disturbed.
> 
> The IRQ domain stays the same during operation, the only changes are
> the mappings from what the guest believes are its s-mode interrupt
> files to the hypervisor selected guest interrupt files, and these
> changes are made possible by the IRQ domain's vcpu-affinity support.

That is only the case when talking about kvm, this all still has to
work fully for non-kvm VFIO uses cases too.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
