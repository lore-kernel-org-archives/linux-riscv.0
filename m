Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A372BC04FF6
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KY7iQyJauSlodWvGagaXDho0Q2zClLV8FwHXe8iafM=; b=m1hvmv2hGVlmAr
	O8jmteYHef+lXZcymgnYYeEY6V66gOCUF3v98WS3cJNy19nNKIZaEk7NeIWq0s0ruXWLOEkbQz7bG
	lVzIYWY3ZvoP4KGVAPP6wwSBEP19qzZdb+O7uoBVqyXBwXhQyJA4I0R+Mi0MB+ArxGqfpQVZv/jPq
	4zqiDjsbLL0oReeihtpVNK1Hddzv2UFmdG9dvRyeAKsJQlkBTC6RGY4/O5m5MgZnXW/XoFNRaEJ6b
	kR7tvKXn6a86fikZVG2LrDTbkRU1hueb9Br8fLc78mONmeDo9+05MQOvM9l41PQsV5LFgqACvx45H
	0A2BP9m/My1K2i/0gQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruy4S-0000000DKjp-31Jr;
	Thu, 11 Apr 2024 17:18:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwwD-0000000CwAw-0mz3;
	Thu, 11 Apr 2024 16:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ahMY2UZCCmOY2lnt6y1hTYQ48CfCwc3PtNZ1yPGnAbU=; b=ndn+5D4g+EJM3B9ULeGJoyHk7o
	ZefaYOemtxIxgDoPTY+p+YN2cDiFhCDXxUMq+KsIp2PIww2Wz1U9nD1KdhNYsbk0mrVLJYMQtNy47
	d/WUUb0TQR0DbTBi77ecm30H+fgmOcUhhFiq4FEdPrAJQZQF4sTnhNVjp2mB3K+DM4GhOFEuZx3N4
	Z3ZuEk9RcUQ5RblFETvA0S9Lm9wJWSS20pbRGYNXJqL37K4NRUDLVSb+nXQMnG20/zeRRe87zL69c
	0Ws9ZD3rynpdRJGh8T6PfP0ZBTHJCNAh3oFTh3wFi9FSJoDBI3MTEErYaauf98EOUd/O9huceuhna
	mHeLoj1Q==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruww9-00000008hAf-1knI;
	Thu, 11 Apr 2024 16:06:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 19927CE17B0;
	Thu, 11 Apr 2024 16:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949B2C072AA;
	Thu, 11 Apr 2024 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851561;
	bh=iSP5sYQTC9lwrdkyTRCMZ/AI3wIT9Uf2038HZsTjvAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ovFpkGfxLq3VLtK3zTiOpRiMUuHSj2aiPSN6C/2SRNq664nlaPNpFsB86F1602l7u
	 7x9tXroJeTOj2P3kWXEbf0cNKeCKXlL5Z4Sc5pYnmQqjo7nYylppKAmPrsG84c3xFC
	 9NLRnLJz/65Ix26qDiSIpHtq5GstadUuAmNfpX4ftuviQzf7kPayNTFCmqVcxekiXu
	 tOnqW1WH/Bp8QN30gHTwPwqzQE4VIoI2pDvfSao52LnJ/WtUsvjtbqmKqzdjt5jtR4
	 PNYlFSwbj57Sxuy4SqIdHL9SF2Awen6ZrBqp2ySRFhA1gGw1GOyPWd71dNY53aHmAL
	 ytLAFgcoDjD+A==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [RFC PATCH 2/7] mm: vmalloc: don't account for number of nodes for HUGE_VMAP allocations
Date: Thu, 11 Apr 2024 19:05:21 +0300
Message-ID: <20240411160526.2093408-3-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160526.2093408-1-rppt@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_170606_196250_9775AEF0 
X-CRM114-Status: GOOD (  12.55  )
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

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

vmalloc allocations with VM_ALLOW_HUGE_VMAP that do not explictly
specify node ID will use huge pages only if size_per_node is larger than
PMD_SIZE.
Still the actual allocated memory is not distributed between nodes and
there is no advantage in such approach.
On the contrary, BPF allocates PMD_SIZE * num_possible_nodes() for each
new bpf_prog_pack, while it could do with PMD_SIZE'ed packs.

Don't account for number of nodes for VM_ALLOW_HUGE_VMAP with
NUMA_NO_NODE and use huge pages whenever the requested allocation size
is larger than PMD_SIZE.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 mm/vmalloc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 22aa63f4ef63..5fc8b514e457 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3737,8 +3737,6 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 	}
 
 	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
-		unsigned long size_per_node;
-
 		/*
 		 * Try huge pages. Only try for PAGE_KERNEL allocations,
 		 * others like modules don't yet expect huge pages in
@@ -3746,13 +3744,10 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 		 * supporting them.
 		 */
 
-		size_per_node = size;
-		if (node == NUMA_NO_NODE)
-			size_per_node /= num_online_nodes();
-		if (arch_vmap_pmd_supported(prot) && size_per_node >= PMD_SIZE)
+		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
 			shift = PMD_SHIFT;
 		else
-			shift = arch_vmap_pte_supported_shift(size_per_node);
+			shift = arch_vmap_pte_supported_shift(size);
 
 		align = max(real_align, 1UL << shift);
 		size = ALIGN(real_size, 1UL << shift);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
