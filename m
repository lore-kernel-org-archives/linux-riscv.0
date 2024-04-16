Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1ADC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 22:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvKBt0hNts9wH2DXWrr6SFdBFfoJ5WfSTrtGgQcIh1k=; b=TRmKKkOsh3lteq
	brZKldCMP0vx5QbZomG78Lm5dDdtC1S3oWaPJ/ahu47ZQDDFC5ToHGrMPfre8U00XfFXzQEKs2jAb
	uGPJF6t+4VnhP3lCYI49aynFO6/rzAiqXPMwLn/43nhQ/z/0wQmP/od+Bvuj249Pt50QC8EYQN2On
	tL+G65AecHSdFJMHK6H3+lMqij+J2hQjKJEXl8Q9XB7AOEeHEHzkiWu3oCtqMefGfyVSyKl14F3Vt
	7heCKMELewGEzAIeSew6poydihUuja8G6OSoBTxT7hqXUWvQpVkZ8ch9Nxr9o2ufAT712Cn/6r4/r
	/1M+/vU7FCI9cn0nfFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwrQ2-0000000E4Nt-1Mwm;
	Tue, 16 Apr 2024 22:36:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwrPw-0000000E4Mc-3qL9
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 22:36:48 +0000
Date: Wed, 17 Apr 2024 00:36:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713307001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvuIWFJvCJMoa+9u4CC8L6s+esR9l0aMrumFrkL3xew=;
	b=Te4SEjdiIAtRl+sEaU2CE61/pWstSBJTyTvMhF0hRKt8Wb0II71K0I5eG60ljuA0kMImWq
	KKyacGeI2WuzzTMdaJJ8MZe8SHKLLYhuzudTyxKuF+BtfxH1/2Ro1FT/EGVLWPxSVJpPCN
	gQaCZC2X1aCeyUjRILimEQQmdYe93+dFDoADfCE8OCkq1a9uc0HeRrLvDYd/NVTT7Us+cX
	xcWl6fRlolFTM+jNzsJ21OrVltzZcx073fs5K8/brt9q27dRRLN7LkLMS0xKSY77/+owMi
	fGTD1V45mheTt9xeiXzrhDhQ9QLaLJDn1bIdJAnkUAL5eAnnRHSiuKQh1ZPKgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713307001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZvuIWFJvCJMoa+9u4CC8L6s+esR9l0aMrumFrkL3xew=;
	b=1JReEmpzYenEyEPAqS7pF0uHMdoMdU/dE8wUr66hmDgCzsuooa4j1F8ymBqQjiWzrxxjf+
	eXAqVLKEyOsjtuDA==
From: Nam Cao <namcao@linutronix.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Christian Brauner <brauner@kernel.org>, Andreas Dilger
 <adilger@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel
 <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>, Ext4
 Developers List <linux-ext4@vger.kernel.org>, Conor Dooley
 <conor@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Alexandre
 Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240417003639.13bfd801@namcao>
In-Reply-To: <Zh7Ey507KXIak8NW@kernel.org>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
	<8734rlo9j7.fsf@all.your.base.are.belong.to.us>
	<Zh6KNglOu8mpTPHE@kernel.org>
	<20240416171713.7d76fe7d@namcao>
	<20240416173030.257f0807@namcao>
	<87v84h2tee.fsf@all.your.base.are.belong.to.us>
	<20240416181944.23af44ee@namcao>
	<Zh6n-nvnQbL-0xss@kernel.org>
	<Zh6urRin2-wVxNeq@casper.infradead.org>
	<Zh7Ey507KXIak8NW@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_153645_137270_7413C7DC 
X-CRM114-Status: GOOD (  18.78  )
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

On 2024-04-16 Mike Rapoport wrote:
> On Tue, Apr 16, 2024 at 06:00:29PM +0100, Matthew Wilcox wrote:
> > On Tue, Apr 16, 2024 at 07:31:54PM +0300, Mike Rapoport wrote:
> > > > -	if (!IS_ENABLED(CONFIG_64BIT)) {
> > > > -		max_mapped_addr = __pa(~(ulong)0);
> > > > -		if (max_mapped_addr == (phys_ram_end - 1))
> > > > -			memblock_set_current_limit(max_mapped_addr - 4096);
> > > > -	}
> > > > +	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE);
> > > 
> > > Ack.
> > 
> > Can this go to generic code instead of letting architecture maintainers
> > fall over it?
> 
> Yes, it's just have to happen before setup_arch() where most architectures
> enable memblock allocations.

This also works, the reported problem disappears.

However, I am confused about one thing: doesn't this make one page of
physical memory inaccessible?

Is it better to solve this by setting max_low_pfn instead? Then at
least the page is still accessible as high memory.

Best regards,
Nam

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fa34cf55037b..6e3130cae675 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -197,7 +197,6 @@ early_param("mem", early_mem);
 static void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
-	phys_addr_t max_mapped_addr;
 	phys_addr_t phys_ram_end, vmlinux_start;
 
 	if (IS_ENABLED(CONFIG_XIP_KERNEL))
@@ -235,23 +234,9 @@ static void __init setup_bootmem(void)
 	if (IS_ENABLED(CONFIG_64BIT))
 		kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
 
-	/*
-	 * memblock allocator is not aware of the fact that last 4K bytes of
-	 * the addressable memory can not be mapped because of IS_ERR_VALUE
-	 * macro. Make sure that last 4k bytes are not usable by memblock
-	 * if end of dram is equal to maximum addressable memory.  For 64-bit
-	 * kernel, this problem can't happen here as the end of the virtual
-	 * address space is occupied by the kernel mapping then this check must
-	 * be done as soon as the kernel mapping base address is determined.
-	 */
-	if (!IS_ENABLED(CONFIG_64BIT)) {
-		max_mapped_addr = __pa(~(ulong)0);
-		if (max_mapped_addr == (phys_ram_end - 1))
-			memblock_set_current_limit(max_mapped_addr - 4096);
-	}
-
 	min_low_pfn = PFN_UP(phys_ram_base);
-	max_low_pfn = max_pfn = PFN_DOWN(phys_ram_end);
+	max_pfn = PFN_DOWN(phys_ram_end);
+	max_low_pfn = min(max_pfn, PFN_DOWN(__pa(-PAGE_SIZE)));
 	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
 
 	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
