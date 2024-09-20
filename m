Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B59C7883E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 13:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOhLshGmHZD1ZaRVPJyxc5bHL90yNJa/DVhdu8TlsRQ=; b=aLc7KdHk3yU7nW
	iqaStGZPCpGBpd8GwpuCm5HCagyk/z8UzS0sMJgnWqm7w+E3CIwC07WQMXOivaVgiJNkR+za66unJ
	Ab6CB14yfpk9WQ5EAE3cNbn39o+g1jYiKtiyADq/Z2US2ZvKAm4ApkknGNPF7xFxCGoF9ZWhEGAOW
	tPMSCCedGWLYhDr2VLDkCg8kdhSCVCzfJYgtBc05we8SuKmuFsR1UKsydH3JcaVCderpp9mnnuyLS
	N5919LXw7q8pErgKN1ZbmvZCCyv36RT3hgF1F5/XYfZ676AntHDQ1OCzSQdt3YjFpoA2zuqxlXjMd
	2nJ0giO8Cd3SvCZkJh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srdWl-0000000CFBo-43MT;
	Fri, 20 Sep 2024 13:18:27 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srdWi-0000000CFBA-1h9j
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 13:18:26 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so23060021fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1726838302; x=1727443102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCr+b1uaUv6DBDhbwInFIiICgPG/Kycc9x8fjXZbOhA=;
        b=GjxsSdK8AskX/y13VLd0nZtEkZOvTkykhPuVWKbHT4R3pRIvrGulN0T4n8dapYWAJn
         +Yu6nCK9m4ao6EzVDpfoCDA7aFsUzDVHip8/u0X9OFk/xMSZ7ZzCCEjBImrpc6ndJzzw
         KRBZwuhoqmxCtCsOS4DlSKbhqc9/1KkqyPh/Kr1o2Nkuh1AHDDlt5QAkDfblBOVczx3j
         RPlhlL9x4qcN0TdwFJwcu2YQeDMPuT43ffM4muGz6qy9masMs9mB0EUTk72q0oPeQk6Z
         d1RfidC+zVvMsI9XQ4kILV2HXYoSkgEdy0oQJa8O1trP8jOwAw1JNjUOaBactY/Rx/HI
         YAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726838302; x=1727443102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCr+b1uaUv6DBDhbwInFIiICgPG/Kycc9x8fjXZbOhA=;
        b=eLrIfyHFyuBMLmEapkGSUo2qDoasud3SLuerAUgtfDQXf4znWShmHuPErREib00mDb
         S69uJK24RaDABQgUtnq4yZ8UAEwlAFAI7eQiVR+oD6kKtsYP3ACpVsbI7kmZj0J2RTf1
         prSOjbvoYFgsAwqhRPmj3q8q9ggmw3ukhsVwwmZffrtWG4P8V2iC+5bmEYZTJuZlAEaI
         +W1MdXoZhxP9ofqr9uWq1a1rIPofhT6jyo9ccsMF/mL+etjFcD0ywIIPT+sqKxTJScy5
         j5Pf3Y8K8+2JO2XZXcazcP9eLYgpgyqNMPme8qDG9wU3A/ddHhrV2upYB63Uds8RIiAM
         J3TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFdPPUjpZutPaACrPc3TFN+Yg6swKo+ocMTcDfvpD8bpKQCBleFCYPEo3/4euYTAJWMOd10qIEKTDp0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAYs6pgZGjFWgOggr7pbXARln/VzfMMsSal2YyIMgb8uJOz6TE
	0nP/1BynU+5xsPU/CE6YY35gwEqsT3sm/JYKSCB23u5ri+dCEkr2PpiLIZ0lX5g=
X-Google-Smtp-Source: AGHT+IEKGMpSHb5f0yI5u05QvgiUAxmRxE826tRbypV2GPNIMdsmv1gm2pe/f5PYbylfyOE4f+EASQ==
X-Received: by 2002:a05:651c:220d:b0:2f6:5921:f35b with SMTP id 38308e7fff4ca-2f7cb30cabfmr19027321fa.27.1726838301434;
        Fri, 20 Sep 2024 06:18:21 -0700 (PDT)
Received: from x1 ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb5ee43sm7111622a12.50.2024.09.20.06.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:18:21 -0700 (PDT)
Date: Fri, 20 Sep 2024 15:18:19 +0200
From: Drew Fustini <drew@pdp7.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: dfustini@tenstorrent.com, Conor Dooley <conor@kernel.org>,
	vladimir.kondratiev@mobileye.com,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	akpm@linux-foundation.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] riscv: make ZONE_DMA32 optional
Message-ID: <Zu12G+Px2E+d26aD@x1>
References: <Zs5c3KJR41AUVyEv@x1>
 <mhng-ff7311d0-a1e2-4487-af68-130a7efb6040@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-ff7311d0-a1e2-4487-af68-130a7efb6040@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_061824_735178_B90AA02E 
X-CRM114-Status: GOOD (  30.77  )
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

On Fri, Sep 20, 2024 at 01:58:23AM -0700, Palmer Dabbelt wrote:
> On Tue, 27 Aug 2024 16:10:20 PDT (-0700), dfustini@tenstorrent.com wrote:
> > On Tue, Aug 27, 2024 at 02:36:11PM +0300, Vladimir Kondratiev wrote:
> > > It is not necessary any RISCV platform has ZONE_DMA32.
> > > 
> > > Example - if platform has no DRAM in [0..4G] region,
> > > it will report failure like below each boot.
> > > 
> > > [    0.088709] swapper/0: page allocation failure: order:7, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/
> > > [    0.088832] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc5 #30
> > > [    0.088864] Call Trace:
> > > [    0.088869] [<ffffffff800059f2>] dump_backtrace+0x1c/0x24
> > > [    0.088910] [<ffffffff805f328c>] show_stack+0x2c/0x38
> > > [    0.088957] [<ffffffff805fd800>] dump_stack_lvl+0x52/0x74
> > > [    0.088987] [<ffffffff805fd836>] dump_stack+0x14/0x1c
> > > [    0.089010] [<ffffffff801a23a8>] warn_alloc+0xf4/0x176
> > > [    0.089041] [<ffffffff801a3052>] __alloc_pages_noprof+0xc28/0xcb4
> > > [    0.089067] [<ffffffff80086eda>] atomic_pool_expand+0x62/0x1f8
> > > [    0.089090] [<ffffffff8080d674>] __dma_atomic_pool_init+0x46/0x9e
> > > [    0.089115] [<ffffffff8080d762>] dma_atomic_pool_init+0x96/0x11c
> > > [    0.089139] [<ffffffff80002146>] do_one_initcall+0x5c/0x1b2
> > > [    0.089158] [<ffffffff8080127c>] kernel_init_freeable+0x214/0x274
> > > [    0.089190] [<ffffffff805fefd8>] kernel_init+0x1e/0x10a
> > > [    0.089209] [<ffffffff8060748a>] ret_from_fork+0xe/0x1c
> > > 
> > > Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> > > ---
> > >  arch/riscv/Kconfig | 2 +-
> > >  mm/Kconfig         | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 0f3cd7c3a436..94a573112625 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -50,6 +50,7 @@ config RISCV
> > >  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
> > >  	select ARCH_HAS_UBSAN
> > >  	select ARCH_HAS_VDSO_DATA
> > > +	select ARCH_HAS_ZONE_DMA_SET if 64BIT
> > >  	select ARCH_KEEP_MEMBLOCK if ACPI
> > >  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
> > >  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
> > > @@ -200,7 +201,6 @@ config RISCV
> > >  	select THREAD_INFO_IN_TASK
> > >  	select TRACE_IRQFLAGS_SUPPORT
> > >  	select UACCESS_MEMCPY if !MMU
> > > -	select ZONE_DMA32 if 64BIT
> > > 
> > >  config CLANG_SUPPORTS_DYNAMIC_FTRACE
> > >  	def_bool CC_IS_CLANG
> > > diff --git a/mm/Kconfig b/mm/Kconfig
> > > index b72e7d040f78..97c85da98e89 100644
> > > --- a/mm/Kconfig
> > > +++ b/mm/Kconfig
> > > @@ -1032,7 +1032,7 @@ config ZONE_DMA
> > >  config ZONE_DMA32
> > >  	bool "Support DMA32 zone" if ARCH_HAS_ZONE_DMA_SET
> > >  	depends on !X86_32
> > > -	default y if ARM64
> > > +	default y if ARM64 || (RISCV && 64BIT)
> > > 
> > >  config ZONE_DEVICE
> > >  	bool "Device memory (pmem, HMM, etc...) hotplug support"
> > > --
> > > 2.37.3
> > > 
> > 
> > Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
> > 
> > Thanks for sending this patch as I've also encountered that annoying
> > error on systems with DRAM above 4GB.
> > 
> > I tested this patch by changing the qemu virt machine to have DRAM
> > starting at 2^32:
> > 
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index cef41c150aaf..3033a2560edb 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -87,7 +87,7 @@ static const MemMapEntry virt_memmap[] = {
> >      [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
> >      [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
> >      [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
> > -    [VIRT_DRAM] =         { 0x80000000,           0x0 },
> > +    [VIRT_DRAM] =        { 0x100000000,           0x0 },
> >  };
> > 
> >  /* PCIe high mmio is fixed for RV32 */
> 
> IIRC the ZONE_DMA32 stuff existed for some of the early SiFive systems,
> where the expansion daughterboard's PCIe controller (via a Xilinx FPGA)
> could only handle 32-bit DMA addreses.  I think there's a similar quirk in
> the Microsemi PCIe controller on the PolarFire boards, but Conor would know
> for sure.

I don't think this patch would affect those systems that need ZONE_DMA2.
I believe it just makes it possible to disable it in the kernel config.
The platform I'm working on has no memory below 4GB and all the PCIe
devices that I care about are not 32-bit constrained. Therefore I just
want to be able to turn it off in my .config.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
