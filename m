Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368FFCAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aqSqLo5zOfitjfG2BMuNHkl/5eS5MxY/nA9er7v6Eg=; b=mQvHl8NXBp9ocZ
	0XVF3bGROnofeTIUlcZWEF1NAA3q98a3o1BkTfNAdm/FhQ7C/+mXrjzaSbA7jxTxgIlsfe5Dsqhdn
	n258c37Ju4j9tvbbHWGJijy3/ido3vCiJeLkfX3zzT+TPLkVPkMY10ah2AHT/3gPigwTDZDsXJskz
	Je7Xykfp0qy9WcyMr0Byd2LTAy+RpKW5xcZU67B+m/MNCfE3fXZYzymVzizJ7dTsr4zdFWOs4Pdzv
	OFciE0ynjf0w9SGczVVuCGeLXsKXQQiVMd0mJjFtNT1vT7RhnSA5cQQ40kij1z/9ScXJUixw+qtvU
	WAQ5rO8RPk4ZlsfrNzKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149A-0000000Dp2A-1T13;
	Tue, 23 Sep 2025 14:37:36 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1498-0000000Dp0M-1tW9
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 14:37:35 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-63606491e66so296278d50.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758638253; x=1759243053; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=utNQQqbrP26idrrirG5tFnz3mQu8N8BuujOARL7p3YA=;
        b=A5FvtlhrSn0FZpdHdCbSQ1Hy8K8BMuDTSzqMbu3UbGPYPKEs7UunTtcJkRAoWNd/mN
         j57rujlCOrDo7zcMXdfuF6Zovs3yszMxz4hZCDzS0u86EKL4D4uEKShh52t5atAG9xj9
         9eQAcsvxF2BUC5lO0UuENTy0wGDcKhwfKPZQVduaxgVrTrlWlCYn4x319msBsKZeKhQ2
         iI7uLJ9JoA7q2LG2gYYo/ZP0lpbp1VSOfxoClBH++1zyPBn7aiSAsLJEjvzNhk3A+ZjC
         MKZjWUSEGjUk4HrwfnjHUd1Ej8yJlr07hTadnDgEU2jEOK8yyfGEP57WZ53d1ShhbG3c
         DSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638253; x=1759243053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utNQQqbrP26idrrirG5tFnz3mQu8N8BuujOARL7p3YA=;
        b=FbRsMt5VX9j5kRIphsalfrEZxEoDw60DKRxF5idc40ktsMR2GW5+PervSJALpF+hz2
         47QUFOEhtlOYeU441v8NrdTRL/+U0/7Lie7ZWUsHvcTwwH7NAf64zh5ch7KU2guYb15b
         rrNpi8REOqM7Gxyl13fH1aYKPlEoVfC9e+7ZYzR0lkdxJhJhkmdD2WAsA6gf4Hq/lmBd
         XOjQk/z7xBTK2QmYWNhiXTY3cPvVCNZi/OK70wf5KrHq1Xk61ysHVjc3E6fmlX41wtAC
         AThNoqPKrphp5TTCfYukGCYsYbqok3F04ojwWrvvGvw9atzqp7y3I7XwVy3/taGtOQX2
         snBg==
X-Forwarded-Encrypted: i=1; AJvYcCUoiekQObOvcMuRQU33xIieG9VGmnn3KTWc4Cmm5ZEAPdl8F9Qm+6OS29r3uJpcLOY9Qlct5YG3W0v0lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyksluOyKx2lOTG6e4Kh2OTW6KKqwzq2aBR1LWJjSUBDL2AXJzt
	CJI19nNX/QVI6913edmm5cqKEYTWu6fPdYZQIRqCCKOb0sXypIvQI0e8t94PSwKSeEQ=
X-Gm-Gg: ASbGnctuAMaAvu6w4Amy5Y+cGlUf0w5PtUcUK77QK2oXDApLEVTF+v5sUNlUcMMYDWz
	f0tifc4RRfMGg+2hflHXxNIx55D5etKdZahMTW3EgayLPLAC+r1NMawC3cqSShtxCWcoDi1qFVd
	JnivGKK8kEwlVw9dvJlH866Io4aUL0axGmBU+juFDICEjPDauB12xnzb2eGwykOwwz0daNK1IAM
	bKYU6vQlpIClBF2rB6mv54UT3S8BTBfymJGupsQjV4tfpyShmJkmc71OPU6qmlFA+tJTH2zeFei
	JIaSAQ8DkwPVFNp6Bwe6dcLmDF0niaodj8OI0nYBDv1sIOx8zKXQIYef6nh+X3HEhDHTtYhzIYo
	47iMA1SMUy9CKslRCSsduZpCX
X-Google-Smtp-Source: AGHT+IHeqNbXj2cbwtsFZh/rWKxPR18F6VpXKZlRUUIrCTojwS6cSA2iuN5fMmUzLR1S4qkiXUoGiQ==
X-Received: by 2002:a05:690e:2512:20b0:605:f6ea:1261 with SMTP id 956f58d0204a3-636046fe14cmr2120960d50.23.1758638252833;
        Tue, 23 Sep 2025 07:37:32 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7438ac593ebsm28158097b3.55.2025.09.23.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:32 -0700 (PDT)
Date: Tue, 23 Sep 2025 09:37:31 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC
 access
Message-ID: <20250923-de370be816db3ec12b3ae5d4@orel>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
 <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com>
 <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com>
 <87ecrx4guz.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ecrx4guz.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_073734_520272_A8196EC3 
X-CRM114-Status: GOOD (  46.07  )
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

On Tue, Sep 23, 2025 at 12:12:52PM +0200, Thomas Gleixner wrote:
> On Mon, Sep 22 2025 at 20:56, Jason Gunthorpe wrote:
> > On Mon, Sep 22, 2025 at 04:20:43PM -0500, Andrew Jones wrote:
> >> > It has to do with each PCI BDF having a unique set of
> >> > validation/mapping tables for MSIs that are granular to the interrupt
> >> > number.
> >> 
> >> Interrupt numbers (MSI data) aren't used by the RISC-V IOMMU in any way.
> >
> > Interrupt number is a Linux concept, HW decodes the addr/data pair and
> > delivers it to some Linux interrupt. Linux doesn't care how the HW
> > treats the addr/data pair, it can ignore data if it wants.
> 
> Let me explain this a bit deeper.
> 
> As you said, the interrupt number is a pure kernel software construct,
> which is mapped to a hardware interrupt source.
> 
> The interrupt domain, which is associated to a hardware interrupt
> source, creates the mapping and supplies the resulting configuration to
> the hardware, so that the hardware is able to raise an interrupt in the
> CPU.
> 
> In case of MSI, this configuration is the MSI message (address,
> data). That's composed by the domain according to the requirements of
> the underlying CPU hardware resource. This underlying hardware resource
> can be the CPUs interrupt controller itself or some intermediary
> hardware entity.
> 
> The kernel reflects this in the interrupt domain hierarchy. The simplest
> case for MSI is:
> 
>      [ CPU domain ] --- [ MSI domain ] -- device
> 
> The flow is as follows:
> 
>    device driver allocates an MSI interrupt in the MSI domain
> 
>    MSI domain allocates an interrupt in the CPU domain
> 
>    CPU domain allocates an interrupt vector and composes the
>    address/data pair. If @data is written to @address, the interrupt is
>    raised in the CPU
> 
>    MSI domain converts the address/data pair into device format and
>    writes it into the device.
> 
>    When the device fires an interrupt it writes @data to @address, which
>    raises the interrupt in the CPU at the allocated CPU vector.  That
>    vector is then translated to the Linux interrupt number in the
>    interrupt handling entry code by looking it up in the CPU domain.
> 
> With a remapping domain intermediary this looks like this:
> 
>      [ CPU domain ] --- [ Remap domain] --- [ MSI domain ] -- device
>  
>    device driver allocates an MSI interrupt in the MSI domain
> 
>    MSI domain allocates an interrupt in the Remap domain
> 
>    Remap domain allocates a resource in the remap space, e.g. an entry
>    in the remap translation table and then allocates an interrupt in the
>    CPU domain.
> 
>    CPU domain allocates an interrupt vector and composes the
>    address/data pair. If @data is written to @address, the interrupt is
>    raised in the CPU
> 
>    Remap domain converts the CPU address/data pair to remap table format
>    and writes it to the alloacted entry in that table. It then composes
>    a new address/data pair, which points at the remap table entry.
> 
>    MSI domain converts the remap address/data pair into device format
>    and writes it into the device.
> 
>    So when the device fires an interrupt it writes @data to @address,
>    which triggers the remap unit. The remap unit validates that the
>    address/data pair is valid for the device and if so it writes the CPU
>    address/data pair, which raises the interrupt in the CPU at the
>    allocated vector. That vector is then translated to the Linux
>    interrupt number in the interrupt handling entry code by looking it
>    up in the CPU domain.
> 
> So from a kernel POV, the address/data pairs are just opaque
> configuration values, which are written into the remap table and the
> device. Whether the content of @data is relevant or not, is a hardware
> implementation detail. That implementation detail is only relevant for
> the interrupt domain code, which handle a specific part of the
> hierarchy.
> 
> The MSI domain does not need to know anything about the content and the
> meaning of @address and @data. It just cares about converting that into
> the device specific storage format.
> 
> The Remap domain does not need to know anything about the content and
> the meaning of the CPU domain provided @address and @data. It just cares
> about converting that into the remap table specific format.
> 
> The hardware entities do not know about the Linux interrupt number at
> all. That relationship is purely software managed as a mapping from the
> allocated CPU vector to the Linux interrupt number.
> 
> Hope that helps.
>

Thanks, Thomas! I always appreciate these types of detailed design
descriptions which certainly help pull all the pieces together.

So, I think I got this right, as Patch4 adds the Remap domain, creating
this hierarchy

name:   IR-PCI-MSIX-0000:00:01.0-12
 size:   0
 mapped: 3
 flags:  0x00000213
            IRQ_DOMAIN_FLAG_HIERARCHY
            IRQ_DOMAIN_NAME_ALLOCATED
            IRQ_DOMAIN_FLAG_MSI
            IRQ_DOMAIN_FLAG_MSI_DEVICE
 parent: IOMMU-IR-0000:00:01.0-17
    name:   IOMMU-IR-0000:00:01.0-17
     size:   0
     mapped: 3
     flags:  0x00000123
                IRQ_DOMAIN_FLAG_HIERARCHY
                IRQ_DOMAIN_NAME_ALLOCATED
                IRQ_DOMAIN_FLAG_ISOLATED_MSI
                IRQ_DOMAIN_FLAG_MSI_PARENT
     parent: :soc:interrupt-controller@28000000-5
        name:   :soc:interrupt-controller@28000000-5
         size:   0
         mapped: 16
         flags:  0x00000103
                    IRQ_DOMAIN_FLAG_HIERARCHY
                    IRQ_DOMAIN_NAME_ALLOCATED
                    IRQ_DOMAIN_FLAG_MSI_PARENT


But, Patch4 only introduces the irqdomain, the functionality is added with
Patch8. Patch8 introduces riscv_iommu_ir_get_msipte_idx_from_target()
which "converts the CPU address/data pair to remap table format". For the
RISC-V IOMMU, the data part of the pair is not used and the address
undergoes a specified translation into an index of the MSI table. For the
non-virt use case we skip the "composes a new address/data pair, which
points at the remap table entry" step since we just forward the original
with an identity mapping. For the virt case we do write a new addr,data
pair (Patch15) since we need to map guest addresses to host addresses (but
data is still just forwarded since the RISC-V IOMMU doesn't support data
remapping). The lack of data remapping is unfortunate, since the part of
the design where "The remap unit validates that the address/data pair is
valid for the device and if so it writes the CPU address/data pair" is
only half true for riscv (since the remap unit always forwards data so we
can't change it in order to implement validation of it). If we can't set
IRQ_DOMAIN_FLAG_ISOLATED_MSI without data validation, then we'll need to
try to fast-track an IOMMU extension for it before we can use VFIO without
having to set allow_unsafe_interrupts.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
