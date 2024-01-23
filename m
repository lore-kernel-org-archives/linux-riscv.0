Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B52C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eagmfMdG1XkjQM1Ey+PQjqGOIu42pe1Xv7kfng+/s5g=; b=hv0rwC2ySzZY0o
	zH/dXnrJeOSERcHDF3HLU1yXMC1tkZTPsMH5m2CYrHpDMWqhbJl4qMoVH8Y4hfWRJ0HLIpaynrj5q
	xrU9so225Uur6Exc12BWXVNX5RMkn2jnP5K4U8fmLNJ3skwO0y5rJSppL50XQDBPZLbcuqjgnXt72
	tgHTEtgoRyMptCt5xNbR0HCen4dmFnzWfy+tqm4FemdzULO1pk3BexjFflfg/c/+M1/Skvk1+SyOf
	5URJBUQWZAhoNqnwqIwQIDLZ/yQnhZouqWNPk9J4be6p/J00zqcHRu7cacXYvZQeT3xUQw5y8K8B/
	esMr2cGuUQDq/R4OOGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSMFV-000FAk-1o;
	Tue, 23 Jan 2024 19:15:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSMFQ-000F8s-34;
	Tue, 23 Jan 2024 19:15:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7948C1FB;
	Tue, 23 Jan 2024 11:16:29 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 787ED3F73F;
	Tue, 23 Jan 2024 11:15:40 -0800 (PST)
Message-ID: <56bee384-461e-4167-b7e9-4dd60666dd66@arm.com>
Date: Tue, 23 Jan 2024 19:15:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240122194200.381241-1-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_111549_082203_67BF1401 
X-CRM114-Status: GOOD (  19.02  )
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

On 22/01/2024 19:41, David Hildenbrand wrote:
> Now that the rmap overhaul[1] is upstream that provides a clean interface
> for rmap batching, let's implement PTE batching during fork when processing
> PTE-mapped THPs.
> 
> This series is partially based on Ryan's previous work[2] to implement
> cont-pte support on arm64, but its a complete rewrite based on [1] to
> optimize all architectures independent of any such PTE bits, and to
> use the new rmap batching functions that simplify the code and prepare
> for further rmap accounting changes.
> 
> We collect consecutive PTEs that map consecutive pages of the same large
> folio, making sure that the other PTE bits are compatible, and (a) adjust
> the refcount only once per batch, (b) call rmap handling functions only
> once per batch and (c) perform batch PTE setting/updates.
> 
> While this series should be beneficial for adding cont-pte support on
> ARM64[2], it's one of the requirements for maintaining a total mapcount[3]
> for large folios with minimal added overhead and further changes[4] that
> build up on top of the total mapcount.

I'm currently rebasing my contpte work onto this series, and have hit a problem.
I need to expose the "size" of a pte (pte_size()) and skip forward to the start
of the next (cont)pte every time through the folio_pte_batch() loop. But
pte_next_pfn() only allows advancing by 1 pfn; I need to advance by nr pfns:


static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
		pte_t *start_ptep, pte_t pte, int max_nr, bool *any_writable)
{
	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
	const pte_t *end_ptep = start_ptep + max_nr;
	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
-	pte_t *ptep = start_ptep + 1;
+	pte_t *ptep = start_ptep;
+	int vfn, nr, i;
	bool writable;

	if (any_writable)
		*any_writable = false;

	VM_WARN_ON_FOLIO(!pte_present(pte), folio);

+	vfn = addr >> PAGE_SIZE;
+	nr = pte_size(pte);
+	nr = ALIGN_DOWN(vfn + nr, nr) - vfn;
+	ptep += nr;
+
	while (ptep != end_ptep) {
+		pte = ptep_get(ptep);
		nr = pte_size(pte);
		if (any_writable)
			writable = !!pte_write(pte);
		pte = __pte_batch_clear_ignored(pte);

		if (!pte_same(pte, expected_pte))
			break;

		/*
		 * Stop immediately once we reached the end of the folio. In
		 * corner cases the next PFN might fall into a different
		 * folio.
		 */
-		if (pte_pfn(pte) == folio_end_pfn)
+		if (pte_pfn(pte) >= folio_end_pfn)
			break;

		if (any_writable)
			*any_writable |= writable;

-		expected_pte = pte_next_pfn(expected_pte);
-		ptep++;
+		for (i = 0; i < nr; i++)
+			expected_pte = pte_next_pfn(expected_pte);
+		ptep += nr;
	}

	return ptep - start_ptep;
}


So I'm wondering if instead of enabling pte_next_pfn() for all the arches,
perhaps its actually better to expose pte_pgprot() for all the arches. Then we
can be much more flexible about generating ptes with pfn_pte(pfn, pgprot).

What do you think?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
