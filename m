Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BDCC35FFF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roOPFGt5/rnc5gUaDzDsZkyZdZwxWnkrkF7xGbNGA9A=; b=QYcYwAnYBOo+x8
	aw2/9OvGGggtGTeB4J9nUZI7OJUuUF6H2b8XRCqIokluCKRZSV3JBRekjJnlOk9kDTY7FZ/evK8uU
	4TRlJOvF9/ptwj5zM50GC9/inI5CLWhDwgdqGvH63dB/yojhmzb6W0uuqVY/ZHDGdnNSCrNGgdy9e
	cofFapwkiSaD/QfaOPFhiZLFSZ/JfMa8UGU8R6806B9fU7NYcb6LcK3HTqg7iWy/h6gBhfwdHpPCN
	/lWAcILjkQ6arel21GAX1F2Q0SC+lVkBllL2MKg1MNgC0XfqqhZdMnoXh7Jz6nbTOkjtBqCNf3pWe
	LfYUbmTGSQ1XYv3c3KHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIMC-0000000Cbvj-3dNX;
	Thu, 20 Mar 2025 16:02:56 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tvI1V-0000000CZ6M-01Db;
	Thu, 20 Mar 2025 15:41:33 +0000
Date: Thu, 20 Mar 2025 08:41:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, anshuman.khandual@arm.com, akpm@linux-foundation.org,
	mingo@kernel.org, catalin.marinas@arm.com, ryan.roberts@arm.com,
	kirill.shutemov@linux.intel.com, namcao@linutronix.de,
	bjorn@rivosinc.com, arnd@arndb.de, stuart.menefy@codasip.com,
	luxu.kernel@bytedance.com, vincenzo.frascino@arm.com,
	samuel.holland@sifive.com, christophe.leroy@csgroup.eu,
	dawei.li@shingroup.cn, rppt@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: introduce the ioremap_prot() function
Message-ID: <Z9w3LL8oZixBKM3t@infradead.org>
References: <20250320084428.51151-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250320084428.51151-1-cuiyunhui@bytedance.com>
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

> +{
> +	phys_addr_t addr = PFN_PHYS(pfn);
> +
> +	/* avoid false positives for bogus PFNs, see comment in pfn_valid() */
> +	if (PHYS_PFN(addr) != pfn)
> +		return 0;
> +
> +	return memblock_is_map_memory(addr);
> +}
> +EXPORT_SYMBOL(pfn_is_map_memory);

This should not be exported or even exposed.  Please just open code it
in the only caller.

> +void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
> +			   pgprot_t pgprot)
> +{
> +	/* Don't allow RAM to be mapped. */
> +	if (WARN_ON(pfn_is_map_memory(__phys_to_pfn(phys_addr))))
> +		return NULL;

Or just use pfn_valid as that's what we usually use for that check.
Or am I missing something specific here?

It would also be nice to just life this to common code.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
