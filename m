Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49EFCAC5A7
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3ttxQ6yWyPNSpEfTxoCyXDZbkubLBSaHBIHNWTa4fc=; b=rVuifS8uzXvht9
	lowlS6VdUciLcWBbW/pt188af+b/hKpcK99f3hdL0/Iq22BLbuJ2RdUVC46vFGsv527Nyk5zchIQI
	EtBMxdaJg3qRJkm4vdJbyiXyX+JxJPc8C7M6wjDPFUlZ4lUIGiFXLdhgqLCcZGFUwdPYQp2ey7WE7
	rQHKd5xRNBfrtGFoczvMTC/TqR36/dfoUXFSKt6ruu/dz0GLEEyUUDt6zOAvZRvUamlUEh7iTt0J6
	C/zzks3FZqN1+5smDDpMxPSJSe/J12z6o1YfFDZ2lMORC2PU1cvWuUeqkdueIzTBCaFN9WbtDyhc9
	GY7J84/hIWeBLcUyLSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14hE-0000000E0fG-4Bhh;
	Tue, 23 Sep 2025 15:12:49 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14hC-0000000E0e3-0Pe4
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 15:12:47 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-eab80c807faso3034407276.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758640365; x=1759245165; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcoDQc5Q5w0LSP8tWH7zt/4vlU+pjxCSOZ2lxuUdQv4=;
        b=OQSMYMm3izgu7+lMPWPLWCgwU19gVQ5j0yMT0QCf/PsR1L9PG+Lco+GY/O3QrJrgOy
         KPFCMZOkB3ne3+rfsxqMpRQgecy48pt9lOqrhhB5HYMCV2pZVIPTckKmY9JpdZhMYxtO
         tjvFspmUrBmH41/0oZa8yoDi10ggZVBU8K1/4HcOPlW9tOVIaDFjHyw0fRnqQKTybSOf
         FezCQDg4uNwPXAXa2dv+S4eD7+VMTnyPyTMKNkDPDFxhboWn1ekoJD4gupgM+I4DYwr3
         aw0BBlVVqsPpYdj3eI/gyR1mgW/JRCcDopt2ToQ+KZYqsbt/d+kugLhqgqyrL/ZteGgU
         LBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758640365; x=1759245165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcoDQc5Q5w0LSP8tWH7zt/4vlU+pjxCSOZ2lxuUdQv4=;
        b=XLUnmQFIL9jIPCjg1OuSTz8KasPlE2YpwGwFl4I3YPF6vLH5nUxrfoeblpN7X90Piy
         DlLXjpiVXFihr6K6og4m/mCI5WxujB8p5qf5Ph/jOSBEUw1DyDazCX2NSNdLy1lUiNXh
         QKpqpTAABc36AWVBuRe041U34jgmzw8PaM7DvUIgZTUtFeSlZVnK/BRBj1xIAqeHUUAb
         p0nwjk8xupjRowB6FMX+U8kC/OA9ucjwkEg9gJiVvjCvgl7EVoa9jlDS5PPJm2P2kZUJ
         da6OqufBy9TueYDntCa4UTixIhr/eyK+8RbXZRkVv9VFWug9vg6/8zkvVxxaXwVeEUcB
         lz2g==
X-Forwarded-Encrypted: i=1; AJvYcCV+Oxb3fnnQFN6GM8dXL3NfUdlhKr3uxL6q+LYuKrvzmiak1AXDMkUsLvjWYW12nW8oUg6JksCipxHmpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgJaJslNWXrifjN8gnCUFK5QilTMgIidy2H8N3jGsjptJfAdaH
	+fONjRLAiBE2H1aVK3L0OHPuRemD3ksUk1dm+uVEvYTYo8BlXBCfCceOHbJx5dJc0u4=
X-Gm-Gg: ASbGncsDAxEROyUwQpzGcPj9sodUe42et2ANwzMVY+YqJalzMdv6qlLHoQK18VkeUAm
	Ic4WxL6dbFVkxVfn8Qjdkdt4EwoWCy7YEUkJayddJW4iyH107sZikvW7olak7yYRTciuCMMgNKB
	KVevs4H46CUxK+iGT0/wk6AUZToaxZgORERiqMzYhAHEqKjZNV1yEgbeZFKdvkzcedqbvdfzUSm
	R6qEkwA0GFZWJlhkpb2s91PZt/l/DrIT/GmkH5h4gnH7NFTlsSFI+4iEWZCgBKED9E7iQAKKvyc
	bxPoC6SAO+bGPCSk2WMrdOgW2WjM+m9oWpYa2Fn7aBmv8dhQp66N57MYxr4MZV2jk42FsbKgU5O
	p9Lm07YtcWgP9qs3QkkvuUXM/aSERBtseCO4=
X-Google-Smtp-Source: AGHT+IEMS7urR+MAiaqL/uLW9oLtRDN0Kx2AZwEqvz53/Dorjr00baJwfX+lZDlIYthJJ5jr4bmaAw==
X-Received: by 2002:a05:6902:c0f:b0:ea4:302:9a8a with SMTP id 3f1490d57ef6-eb32e058783mr1870670276.6.1758640364669;
        Tue, 23 Sep 2025 08:12:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea5ce974ac3sm5081124276.24.2025.09.23.08.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 08:12:44 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:12:42 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <20250923-b85e3309c54eaff1cdfddcf9@orel>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com>
 <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com>
 <87ecrx4guz.ffs@tglx>
 <20250923140646.GM1391379@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923140646.GM1391379@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_081246_148060_9ABF2ED4 
X-CRM114-Status: GOOD (  34.62  )
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

On Tue, Sep 23, 2025 at 11:06:46AM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 23, 2025 at 12:12:52PM +0200, Thomas Gleixner wrote:
> > With a remapping domain intermediary this looks like this:
> > 
> >      [ CPU domain ] --- [ Remap domain] --- [ MSI domain ] -- device
> >  
> >    device driver allocates an MSI interrupt in the MSI domain
> > 
> >    MSI domain allocates an interrupt in the Remap domain
> > 
> >    Remap domain allocates a resource in the remap space, e.g. an entry
> >    in the remap translation table and then allocates an interrupt in the
> >    CPU domain.
> 
> Thanks!
> 
> And to be very crystal clear here, the meaning of
> IRQ_DOMAIN_FLAG_ISOLATED_MSI is that the remap domain has a security
> feature such that the device can only trigger CPU domain interrupts
> that have been explicitly allocated in the remap domain for that
> device. The device can never go through the remap domain and trigger
> some other device's interrupt.
> 
> This is usally done by having the remap domain's HW take in the
> Addr/Data pair, do a per-BDF table lookup and then completely replace
> the Addr/Data pair with the "remapped" version. By fully replacing the
> remap domain prevents the device from generating a disallowed
> addr/data pair toward the CPU domain.
> 
> It fundamentally must be done by having the HW do a per-RID/BDF table
> lookup based on the incoming MSI addr/data and fully sanitize the
> resulting output.
> 
> There is some legacy history here. When MSI was first invented the
> goal was to make interrupts scalable by removing any state from the
> CPU side. The device would be told what Addr/Data to send to the CPU
> and the CPU would just take some encoded information in that pair as a
> delivery instruction. No state on the CPU side per interrupt.
> 
> In the world of virtualization it was realized this is not secure, so
> the archs undid the core principal of MSI and the CPU HW has some kind
> of state/table entry for every single device interrupt source.
> 
> x86/AMD did this by having per-device remapping tables in their IOMMU
> device context that are selected by incomming RID and effectively
> completely rewrite the addr/data pair before it reaches the APIC. The
> remap table alone now basically specifies where the interrupt is
> delivered.
> 
> ARM doesn't do remapping, instead the interrupt controller itself has
> a table that converts (BDF,Data) into a delivery instruction. It is
> inherently secure.

Thanks, Jason. All the above information is very much appreciated,
particularly the history.

> 
> That flag has nothing to do with affinity.
>

So the reason I keep bringing affinity into the context of isolation is
that, for MSI-capable RISC-V, each CPU has its own MSI controller (IMSIC).
As riscv is missing data validation its closer to the legacy, insecure
description above, but the "The device would be told what Addr/Data to
send to the CPU and the CPU would just take some encoded information in
that pair as a delivery instruction" part becomes "Addr is used to select
a CPU and then the CPU would take some encoded information in Data as the
delivery instruction". Since setting irq affinity is a way to set Addr
to one of a particular set of CPUs, then a device cannot raise interrupts
on CPUs outside that set. And, only interrupts that the allowed set of
CPUs are aware of may be raised. As a device's irqs move around from
irqbalance or a user's selection we can ensure only the CPU an irq should
be able to reach be reachable by managing the IOMMU MSI table. This gives
us some level of isolation, but there is still the possibility a device
may raise an interrupt it should not be able to when its irqs are affined
to the same CPU as another device's and the malicious/broken device uses
the wrong MSI data. For the non-virt case it's fair to say that's no where
near isolated enough. However, for the virt case, Addr is set to guest
interrupt files (something like virtual IMSICs) which means there will be
no other host device or other guest device irqs sharing those Addrs.
Interrupts for devices assigned to guests are truly isolated (not within
the guest, but we need nested support to fully isolate within the guest
anyway).

In v1, I tried to only turn IRQ_DOMAIN_FLAG_ISOLATED_MSI on for the virt
case, but, as you pointed out, that wasn't a good idea. For v2, I was
hoping the comment above the flag was enough, but thinking about it some
more, I agree it's not. I'm not sure what we can do for this other than
an IOMMU spec change at this point.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
