Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830D3C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 04:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2Z0s5RvAdsox1GEORuW245rUewscsI/A5MN0g0eMd0=; b=i0MR5GRdSFwmzl
	xpxuUaZa4HXyODm8E5mpcgE+hr3ezKKNZQ2z72ytPJ1FlDXL+y870B5l1AHGcfwlC8+O6wnd1KEmH
	ejIKQ1DtZp7x1Pl0bg1RjdQq6KxMYxyE8kxznkEFKz1KdbNCjatdDIy5DmNEiTwUs6vQAsHdV30e2
	Qxtss/72Q2pm+h+pnOg/Ew2mdq7pl8Zm/7PKKQbog5fGwzYvaaWsJ0Lx0AtZTrlyfzCcKYkw6DVET
	WoU5VCdqmM+g/B1RuLUWe44O64oUm58HM+/7yXAR59J8IYmeQFWPSQW7Laq59xElNnSvdTieUMAY9
	LBP081KIJ7Hp6doGAGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQZI-00000009gSK-3dCb;
	Thu, 13 Feb 2025 04:11:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQXv-00000009g2a-3wNy
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 04:09:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF8DA1762;
	Wed, 12 Feb 2025 20:10:11 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5AA833F58B;
	Wed, 12 Feb 2025 20:09:48 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: steven.price@arm.com,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] mm: Make GENERIC_PTDUMP dependent on MMU
Date: Thu, 13 Feb 2025 09:39:33 +0530
Message-Id: <20250213040934.3245750-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213040934.3245750-1-anshuman.khandual@arm.com>
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_200952_021122_7631C0C4 
X-CRM114-Status: UNSURE (   9.76  )
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

There is no page table dump without a MMU. Make this dependency at generic
level and drop the same from riscv platform instead.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/riscv/Kconfig | 2 +-
 mm/Kconfig.debug   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..c4cdba6460b8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -112,7 +112,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
-	select GENERIC_PTDUMP if MMU
+	select GENERIC_PTDUMP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index a51a1149909a..c08406760d29 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -214,6 +214,7 @@ config DEBUG_WX
 	  If in doubt, say "Y".
 
 config GENERIC_PTDUMP
+	depends on MMU
 	bool
 
 config PTDUMP_CORE
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
