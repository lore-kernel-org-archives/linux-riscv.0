Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD91ECA5FCE
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 22:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDNTpxfiLuTg7vDXsLaGf9eX9Oo7sqZMeV2ep95JFRk=; b=Axqp034fBPaukt
	XeIgc2xHg+gPyMljYC3Xho1slL+itS2bnrp7z4D150zrExinBJHNXGMCqiJ/j2UajH1o/tDqy89vp
	Xj+YINeoXajWJY1EjmNV23t5AHrFDzbyaR9BmkkU8ySM4BBCUdXEJmTss2aIH/dOy6ouuLC3U1P23
	DrmB9k4qEljx9y7439DJSaZlF9g3Qutp3xzmepQVvcMTvYwPTpWREOcmeINElzghYyKWp9S0SUy7i
	Xu751JomumswsV6xGuQoQS73kF27pRaCjbFewaKuyNwc637zzWVWKU/rt/V0jEtVsIaDlfKCixmR0
	qVTD3icEW//z0pyRTuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDV47-0000000FRq0-3S1o;
	Sun, 04 Oct 2026 22:52:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDV45-0000000FRph-45WF
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 22:52:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48130414F1;
	Sun,  4 Oct 2026 22:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80A71F000FF;
	Sun,  4 Oct 2026 22:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791154336;
	bh=0g2Vd/WGDWx11Z5eDEYlSIfjJcLTcCv15IHzPL8eEL8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=lwgN3X7IEPZrn04fjF+jM8fK5uE4aKHBKxjxKoexZ17Zug641RRd8T0s+2+Hq0fxT
	 nhSzRlir695dbO4XRQ2NXQsG9vPMLy3cbt6QEfbvmLzyunDdwwqamlky1L271Kdo9R
	 HIz5cBFDWwX+0SssHEAaBeq9fmdMylzrV2GLogS3PVfDF2dCqdzTKg7JXEXuHW2fCJ
	 teOx/VyZCfPmU6kExhAloJQ7GUfCL4u8NysKbnAjUZ0UWLOTQA5pqsoxwOvWyeSvFe
	 A8WJSrC86sT6PkrH8yhbd1F8VpKEL4/uqYDTBHFtPVFFHiIUzTNdoyd22ncTCiyk4i
	 JeouYLX8Hkjjw==
Date: Sun, 4 Oct 2026 16:52:12 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Wei-Jie Hung <imbigking12@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Mike Rapoport <rppt@kernel.org>, Xiaofeng Yuan <xiaofengmian@163.com>, 
    Klara Modin <klara@kasm.eu>, linux-riscv@lists.infradead.org, 
    bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: patch: fix handling of bpf-jit execmem
 addresses
In-Reply-To: <20260914115607.350097-1-imbigking12@gmail.com>
Message-ID: <19ff2b67-55e9-92f2-5bee-57d36a9074c4@kernel.org>
References: <20260914115607.350097-1-imbigking12@gmail.com>
MIME-Version: 1.0
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

On Mon, 14 Sep 2026, Wei-Jie Hung wrote:

> Commit 8718e5a3090b ("riscv: patch: skip fixmap mapping when kernel text
> is already writable") gated the core_kernel_text() branch of patch_map()
> on CONFIG_STRICT_KERNEL_RWX, and explicitly left the vmalloc branch
> unchanged. That branch has a separate problem.
> 
> That branch only creates a temporary writable fixmap alias when
> CONFIG_STRICT_MODULE_RWX is enabled, and otherwise assumes the target is
> directly writable and returns the address unchanged. That assumption no
> longer holds: bpf_prog_pack_alloc calls set_memory_rox() on every pack
> unconditionally in alloc_new_pack(), independently of any
> CONFIG_STRICT_*_RWX option, so BPF text in the vmalloc area is read-only
> regardless of what CONFIG_STRICT_MODULE_RWX says.
> 
> With CONFIG_STRICT_MODULE_RWX=n, patch_map() returns the read-only
> address directly, the subsequent copy_to_kernel_nofault() takes a
> page fault and returns -EFAULT. bpf_arch_text_copy() turns that into
> -EINVAL, which propagates through bpf_jit_binary_pack_finalize() to the
> WARN_ON() in bpf_int_jit_compile() and leaves the program un-JITed.
> 
> Note that BPF cannot be fixed the way kprobes was in
> commit bdc46e507b59 ("riscv: mm: make EXECMEM_KPROBES writable without
> CONFIG_STRICT_MODULE_RWX"). EXECMEM_BPF is already PAGE_KERNEL, i.e.
> writable at allocation time; the read-only mapping is established
> afterwards by generic code in alloc_new_pack(), which arch code cannot
> influence. The only place this can be handled is patch_map().
> 
> This is the same problem that was fixed on arm64 by commit b1480ed230ac
> ("arm64: patching: fix handling of execmem addresses"), and the fix is
> the same: CONFIG_EXECMEM is what actually tracks whether the vmalloc
> area can hold executable memory that needs a temporary alias to be
> written. CONFIG_BPF_JIT, CONFIG_KPROBES and CONFIG_MODULES all select
> it.
> 
> Note that this is not limited to CONFIG_MODULES=n. Unlike arm64, riscv
> selects CONFIG_ARCH_OPTIONAL_KERNEL_RWX, so CONFIG_STRICT_MODULE_RWX can
> be disabled with CONFIG_MODULES=y as well, and the bug is reachable in
> that configuration too.
> 
> The !CONFIG_MMU build is unaffected: it has its own __patch_insn_set()
> and __patch_insn_write() implementations and never calls patch_map().

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
