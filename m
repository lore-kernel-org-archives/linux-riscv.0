Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D6DC4345D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 23:24:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E1A208E4
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 23:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cpup4FQA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6uXejaX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07E1A208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AohT50f9DrfExgColNM7+CpBr2R2Rk/qgHc0Vj4NV6M=; b=cpup4FQA/ieJ5lnFnq+BaAa7Y
	c5QL+i5+JONPC8yk3V0aI3TTjyO9FBy2jF5oqccOisNmdeIUXyoSWWWQdW3Egvphd420GgoxDIxke
	BUwEj2ZZfCkyNYlocu6K5bIjW9XTVI6zvYkZ9ksnbknIyjfF+WjefDOaBbD8bEPXjdsnc0zJdmWGN
	m/M2cLRyO/a1XuZ7wLxKOvmAtZLi2J8kMIvkHVBDgH3h8JxuBT9+wmUycdrDQAuPiFaBx+fpts6Yx
	Va2vZSBo1y+eSF0lBm++jHwTdYbPU3YIAhnKgtAsI7kOTBgkrooz8O2SZb4FEo38pgrbAZMZa/RuR
	uDzFAnZEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0CTp-00084t-Le; Mon, 27 Jul 2020 23:24:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0CTk-00082I-3d
 for linux-riscv@lists.infradead.org; Mon, 27 Jul 2020 23:24:21 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D30C420A8B;
 Mon, 27 Jul 2020 23:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595892259;
 bh=khXc0PSnnR6Npc3HWD8WDMk3xlt4pTF7I/aNk6Z3DTc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X6uXejaXggZwECBMGK8JLzzRf3bGkRzqMETJCtryktaAenOpiLaw+Cly1e1AegqGI
 SF1WuVTD13DjWICBMcOzGFH5Fm+hCpEkfmE0vyaFceviM/5GlSp6igp5WQT5HVUBqT
 xkC6iewMiBKN9YuQubjzDkME9I4dtOTm68VuN+uU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 25/25] riscv: Parse all memory blocks to remove
 unusable memory
Date: Mon, 27 Jul 2020 19:23:45 -0400
Message-Id: <20200727232345.717432-25-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727232345.717432-1-sashal@kernel.org>
References: <20200727232345.717432-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_192420_236842_04C11832 
X-CRM114-Status: GOOD (  16.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Atish Patra <atish.patra@wdc.com>

[ Upstream commit fa5a198359053c8e21dcc2b39c0e13871059bc9f ]

Currently, maximum physical memory allowed is equal to -PAGE_OFFSET.
That's why we remove any memory blocks spanning beyond that size. However,
it is done only for memblock containing linux kernel which will not work
if there are multiple memblocks.

Process all memory blocks to figure out how much memory needs to be removed
and remove at the end instead of updating the memblock list in place.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/mm/init.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 753f2cdbeab8f..5e3dccf74ca92 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -125,26 +125,29 @@ void __init setup_bootmem(void)
 {
 	struct memblock_region *reg;
 	phys_addr_t mem_size = 0;
+	phys_addr_t total_mem = 0;
+	phys_addr_t mem_start, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
 
 	/* Find the memory region containing the kernel */
 	for_each_memblock(memory, reg) {
-		phys_addr_t end = reg->base + reg->size;
-
-		if (reg->base <= vmlinux_start && vmlinux_end <= end) {
-			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
-
-			/*
-			 * Remove memblock from the end of usable area to the
-			 * end of region
-			 */
-			if (reg->base + mem_size < end)
-				memblock_remove(reg->base + mem_size,
-						end - reg->base - mem_size);
-		}
+		end = reg->base + reg->size;
+		if (!total_mem)
+			mem_start = reg->base;
+		if (reg->base <= vmlinux_start && vmlinux_end <= end)
+			BUG_ON(reg->size == 0);
+		total_mem = total_mem + reg->size;
 	}
-	BUG_ON(mem_size == 0);
+
+	/*
+	 * Remove memblock from the end of usable area to the
+	 * end of region
+	 */
+	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
+	if (mem_start + mem_size < end)
+		memblock_remove(mem_start + mem_size,
+				end - mem_start - mem_size);
 
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
