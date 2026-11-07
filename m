Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2E2606A32D
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vm1lEXIX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=labc08BM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N1gawCy/SIJpkDaDTKQRPHnbfVzvCnkSCfgxwxr8b0U=; b=vm1lEXIXzA+NY/UJM1Y2GG+SgT
	RJhhA5TkGPLcj7YsaULhPhOkv9Ibz7nsOcpUeo+vz3t4sHW89GmDOGmcc9gZxqUN3HoP6S+okaXQS
	8xyCbyvZfPw6UYsxoLUkKGvBdHIBdRRl0tRup5+Zb29RBDsBwzhCDBTR7IxqtR1T5mFwacWT/cNMg
	svEe15FdEqtkM+KXeBBHYwzvwpGI8koS4r7JoUhWTO1sw0BWnm+7t/teKdFRkucOpdwpjD1jjbqKu
	0gVyk+PsXRM8ULMaxLMnYxC/osx68AvJCtgNvcQdg1krNsxaJBXascM+K2XtUT9qW65IszpVrUis5
	aoE/MP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgFD-0000000Ei8e-1odn;
	Sat, 07 Nov 2026 13:14:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgFB-0000000Ei8Y-2Idl
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 13:14:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18D93407AF;
	Sat,  7 Nov 2026 13:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0101F1F0089F;
	Sat,  7 Nov 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794057245;
	bh=GBkNZH//i6CeZMrvSzH07WqQhujzIjHxnO0azVdEsyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=labc08BM53tokoAGYlMVbW1U5bXWmGlLgJN87YN/JaYhxmKe9Nh3ubt94mUM+dghz
	 plfCFZ0dx2+L727ju4sxgcJHcMHhU0mXRgxPe9wekoyG2tRzWI4I4+0sjDtNeNP/B5
	 lZ8lwZkSxkN0lOPdUC+FiRXV2L+LS+Xq91xlJkXi5w8rPcoYUXzcUIApMSiXfCe+Uc
	 NB/Q509tXUHNz4AXBaK+wOiosVcC/V1WLKGr+L82gq1D2t8ZB2ZJ/ngNSOa/Vza0lS
	 VbBh2vsEeyI1HZTwa1QROtdRzrsWyhCNqMwcKT1MlJ8noeo8hvcGvBFBN1An2+dZyN
	 VS92gtAQ7bEcA==
Date: Sat, 7 Nov 2026 06:13:58 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Muchun Song <muchun.song@linux.dev>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: mm: Define PAGE_KERNEL_RO
In-Reply-To: <20261018023649.798595-1-nickolai@csail.mit.edu>
Message-ID: <0ee49e9a-4c42-6cd6-afca-838c20966248@kernel.org>
References: <20261018023649.798595-1-nickolai@csail.mit.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 17 Oct 2026, Nickolai Zeldovich wrote:

> Kernel mappings that generic code creates read-only are writable on
> riscv. With HugeTLB vmemmap optimization (selected by riscv and on by
> default with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON), the tail
> vmemmap pages of every optimized huge page are remapped to one shared
> page with PAGE_KERNEL_RO so that a stray write to a tail struct page
> faults. On riscv that remap keeps _PAGE_WRITE, so such a write silently
> changes the struct pages of every optimized huge page instead.
> early_memremap_ro() (EFI system and configuration tables), the
> firmware loader's vmap() of the loaded image, and acpi_os_ioremap() for
> EFI runtime code and NOMAP regions, which asks for a read-only mapping
> precisely to avoid a writable mapping of executable code, are affected
> the same way.
> 
> riscv defines PAGE_KERNEL_READ but not PAGE_KERNEL_RO, so
> include/linux/pgtable.h falls back to "#define PAGE_KERNEL_RO
> PAGE_KERNEL". Define PAGE_KERNEL_RO as PAGE_KERNEL_READ. FIXMAP_PAGE_RO
> then follows from asm-generic/fixmap.h: early_memremap_ro() now passes
> 0xe3 instead of 0xe7 to __early_ioremap().
> 
> Tested on QEMU virt (riscv64, defconfig with
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON and CONFIG_PTDUMP_DEBUGFS,
> booted with hugepages=8): before, every vmemmap entry in
> /sys/kernel/debug/kernel_page_tables has W set; after, the 28K of tail
> vmemmap of each huge page is mapped R without W.

Thanks, queued for v7.4-rc.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
