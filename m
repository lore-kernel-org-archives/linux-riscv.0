Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F01C46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1X/p2VYXxhkTgSP6rCHVL6vgMkWScg84LWC72vARGpg=; b=3VWyThbEubQFsx
	46rNTIyg6ze8FO04HKD68gvMOtFsthYrxvdn3mDtM8V3yEqM71m5gTHvfuWuvTsxUvHpjw95fKlt/
	9rkJQpGwXJnaXF7qwpWGso5xvpjAPB2NVWfeciSwnVU8eEdOf8avqZfNlppS7BZDitt2A3qRKsXpn
	kcg/lTCIBx8Ta/qhkP8KVNwRZCBWaxNOkXD7EIF/GPaUCaYEeZQ/Yq2BaNhhRJF7Ayj1agPEYu8qD
	jxm3nEWk0ox2Eln18OaW8ov282fJrufd4Jf5FhYeVh5t+sXmSyFFPJyRnL1lm/dIpL6dop+oVvQsr
	BTlKZAyEaB025u2zYDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRO-00F71n-2O;
	Tue, 19 Dec 2023 18:03:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRL-00F6yR-1w
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 18:03:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E5A88B81A3A;
	Tue, 19 Dec 2023 18:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01013C433CC;
	Tue, 19 Dec 2023 18:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009013;
	bh=jOzh15UGY8/GeKyvzomEjUoOApjigEX2YDPvhINsBhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BvEJaO/t7fLRI9ME+g6Nf2uKvBFzhDxeGVkHtu0GNM/cuRLsGbH1Dn5794sKOGhX7
	 t2neLuWSxp8mcJ6f0iqpeVhqi4qYZ8ahPfVqN2Da62LUO4i/t7gL4bmvdBqH64Llyn
	 QkRpi8dmIk/b/s2jltgElLVpM3vEGAMoladx4fbNv3xbFj5qlDKciiWQ+lStLf8ju1
	 pub/Wz86s+HQWQ3Ve18yw7Zyy0EcvOkhR8zgpWpEnigIMCNNdI7HcIC4rkQ9U2GhTK
	 L7bquPxY+IC1hy+VduUcpRaujnplUMl8dZNy79gV5MHb1aIEYQXoOGfUkVwIpLYaME
	 gcTZZsxBtN4Pg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 4/4] riscv: enable HAVE_FAST_GUP if MMU
Date: Wed, 20 Dec 2023 01:50:46 +0800
Message-Id: <20231219175046.2496-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231219175046.2496-1-jszhang@kernel.org>
References: <20231219175046.2496-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_100335_803907_D1100541 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
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

Activate the fast gup for riscv mmu platforms. Here are some
GUP_FAST_BENCHMARK performance numbers:

Before the patch:
GUP_FAST_BENCHMARK: Time: get:53203 put:5085 us

After the patch:
GUP_FAST_BENCHMARK: Time: get:17711 put:5060 us

The get time is reduced by 66.7%! IOW, 3x get speed!

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig               | 1 +
 arch/riscv/include/asm/pgtable.h | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d3555173d9f4..04df9920282d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -119,6 +119,7 @@ config RISCV
 	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
 	select HAVE_EBPF_JIT if MMU
+	select HAVE_FAST_GUP if MMU
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ab00235b018f..c6eb214139e6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -673,6 +673,12 @@ static inline int pmd_write(pmd_t pmd)
 	return pte_write(pmd_pte(pmd));
 }
 
+#define pud_write pud_write
+static inline int pud_write(pud_t pud)
+{
+	return pte_write(pud_pte(pud));
+}
+
 static inline int pmd_dirty(pmd_t pmd)
 {
 	return pte_dirty(pmd_pte(pmd));
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
