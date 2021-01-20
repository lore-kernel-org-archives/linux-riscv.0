Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A17C433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:27:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27A27233EB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27A27233EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KlkVWU7ahIkDMDqqh/fD7T1YZPVp/pWGnyJea0Xzo4A=; b=AhjaaQCMmR6sRMSXnBijhFxoa
	1VgWVlpWTQxXABxZnRr5ZBfDWJcfU/MsBh9mlMDE9vb6jFLSj18fRfZ2vsUFf0Cioo+6ISENjQL4W
	4z5PD8XB1nbJEIhoXHs1VhNzlyPX83YKxyLnRHFZAUSjF354+rj3OyvabdvcE9d7kBW4mc3krYqvh
	aiXngVKyYmPbwA1GUaZXO4CHT6c7yilZHKA1XtzC+x/CWlEiR3ybKJsInslerTXQeHyjLhLnEiQvM
	vFBl/R46rv809dfJ3RkW5Y06W5AG/wEckrFUnG345YISoPC+4owsOCvlBDxDZlMvaPRhq6pWVGW2F
	Xelz6cRUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22HZ-0003Nh-2t; Wed, 20 Jan 2021 01:27:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22H0-00030f-Bo
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 01:27:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AC6D2311C;
 Wed, 20 Jan 2021 01:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106021;
 bh=SyhzL3wKjvVs6HHrpK4LfBtmC+2xOrb/9aBifmqgYOk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gySbF9SxHMTVguUIhx8cjOqh6hfzutykQSuSb+shHhWy378vLPOjCR1BdStHKE33+
 84N0mIIn3qE7zQUlNltwQpn/KY3VCdFF7e7EpMHVVXIEBOWUzkRl/g3JYxQTXMuKKh
 ehx4d0VgPh+EzEh2tISRaWAuG0KqDed6dR5QchGvk1GnleJgAUtKuq5AUXGeKzFnwi
 JGyfYBXqSzJxFGP56SWsK0Fyul8wt618iUoERPZV7IB7H3bSDL6JZxh5WWO5aPQA4O
 xfZk35stJp7nIQLazfbJ5S4tgnH2TmMtkzHmD+ehuK0TlRTOUf/W5uaItsv5iQCMT9
 XdxuxobOAq4FQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 44/45] RISC-V: Set current memblock limit
Date: Tue, 19 Jan 2021 20:26:01 -0500
Message-Id: <20210120012602.769683-44-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202702_511955_BE2A34AB 
X-CRM114-Status: GOOD (  14.17  )
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
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Atish Patra <atish.patra@wdc.com>

[ Upstream commit abb8e86b269604e906a6a4af7a09f04b72dbb862 ]

Currently, linux kernel can not use last 4k bytes of addressable space
because IS_ERR_VALUE macro treats those as an error. This will be an issue
for RV32 as any memblock allocator potentially allocate chunk of memory
from the end of DRAM (2GB) leading bad address error even though the
address was technically valid.

Fix this issue by limiting the memblock if available memory spans the
entire address space.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/mm/init.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e4133c20744ce..608082fb9a6c6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -155,9 +155,10 @@ static void __init setup_initrd(void)
 void __init setup_bootmem(void)
 {
 	phys_addr_t mem_start = 0;
-	phys_addr_t start, end = 0;
+	phys_addr_t start, dram_end, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
+	phys_addr_t max_mapped_addr = __pa(~(ulong)0);
 	u64 i;
 
 	/* Find the memory region containing the kernel */
@@ -179,7 +180,18 @@ void __init setup_bootmem(void)
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
+	dram_end = memblock_end_of_DRAM();
+
+	/*
+	 * memblock allocator is not aware of the fact that last 4K bytes of
+	 * the addressable memory can not be mapped because of IS_ERR_VALUE
+	 * macro. Make sure that last 4k bytes are not usable by memblock
+	 * if end of dram is equal to maximum addressable memory.
+	 */
+	if (max_mapped_addr == (dram_end - 1))
+		memblock_set_current_limit(max_mapped_addr - 4096);
+
+	max_pfn = PFN_DOWN(dram_end);
 	max_low_pfn = max_pfn;
 	set_max_mapnr(max_low_pfn);
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
