Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2063AC67861
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/I0aWIUb8Y/t8WFWL2X9X3187Ce/9i+WQIj/bkr3CgM=; b=3hhJUMltBscjql
	u/INmp2rpmqa+iEH7FJqJ7G1gNNpU8VUYutyVqFxEB7FkSnhonQ0gd0B8zup8uT7rLJnYM2RluUDN
	9BN2ildiNYoHZS4bj3XkOzGDNcaEEwM3G5aOsBdAuE8+QnmNmhlx7GsQ/mzqH/gKvrCGLkMZ/0058
	s7EZbP37a86a4TfWcozbBRCUqa5A03KX/YofPbZKleud5EusvyqGXhObgDyjh6mFQwq0mOyFhvkpC
	jwmMEzKHXfRwvyCR4ZmQLhjDRaCyPxUcL9wjsGfsWtw5NjS9p6OWTPRxlKx2++nbdOhx+6np/jp/u
	MVQ5wdVvXCzA/4ealn2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4KT-0000000ADfD-3gNW;
	Sat, 06 Apr 2024 11:35:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4KR-0000000ADe5-1fRy
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 11:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1DD760B2C;
	Sat,  6 Apr 2024 11:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC128C433F1;
	Sat,  6 Apr 2024 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712403322;
	bh=pFynrsYJOJ+5eJpGClthQv/4eVfcqNbrm44H7lrcyi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O4CTEJzKCq0QwjZWEpBOFtuASv2SkLVYz3MRBuGvJ/ReH8U04k7rSV78aUSwyEF2T
	 EUk5pA29fS13562QJZU0NtHAGQ32uu7l+DdUSlHiC1D+AV2dDvxTqf/7g1KaIykefB
	 65cui7Iijh+o2G8aJgRr9JLhvMFEmpDebc5+nGBwGM5ERDP9THwjgohpHVKObDK1hM
	 SLtq9iGP9iLvceLdcxMPnFgQxvbpaLgTy6D1BadHVFetf+Fr8y178JZ0n1gvso++l5
	 RsW7Aiz79I7Bt0nyO44hKEruFP401sfXpPxcA7tzx0JVRznNJb1XiceDWr/DA/luOQ
	 nT1hhTtWK7M1Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] riscv: nommu: remove PAGE_OFFSET hardcoding
Date: Sat,  6 Apr 2024 19:21:57 +0800
Message-ID: <20240406112159.1634-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406112159.1634-1-jszhang@kernel.org>
References: <20240406112159.1634-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_043523_523294_7AA9BC60 
X-CRM114-Status: UNSURE (   9.19  )
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

Currently, PAGE_OFFSET is hardcoded as 0x8000_0000, it works fine since
there's only one nommu platform in the mainline. However, there are
many cases where the (S)DRAM base address isn't 0x8000_0000, so remove
the hardcoding value, and introduce DRAM_BASE which will be set by
users during configuring. DRAM_BASE is 0x8000_0000 by default.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7895c77545f1..b4af1df86352 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -247,10 +247,16 @@ config MMU
 	  Select if you want MMU-based virtualised addressing space
 	  support by paged memory management. If unsure, say 'Y'.
 
+if !MMU
+config DRAM_BASE
+	hex '(S)DRAM Base Address'
+	default 0x80000000
+endif
+
 config PAGE_OFFSET
 	hex
 	default 0xC0000000 if 32BIT && MMU
-	default 0x80000000 if !MMU
+	default DRAM_BASE if !MMU
 	default 0xff60000000000000 if 64BIT
 
 config KASAN_SHADOW_OFFSET
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
