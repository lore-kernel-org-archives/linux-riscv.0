Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D2CC3A59D
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFBpiIKCXGvOUnqqaCmAYeBlLLSDzznTvI2EPaFA8pQ=; b=HeMKx3cNDd1xax
	vaHeTPKi4EQBM2CunQI1NW+CH+TeCG8dgUmx4RneYIykerO6B9lDLUM+lu5Gs6aT2MDVu5y92zOYz
	cehq7IDYpumoGrhKvReaadcmuTH+pVDAYNb9OFP3mlzEJ0Nb20XE8gSZVx2hpaV3iGU4FDqs7K2IJ
	jD45KkgY/t497IDVTlP9P/K2PNLyCiOe2kR7/8XSBoKWcUAAPKISB5sxu/EO8TLKrnK94RePt5F5I
	qjkaQyUFMaxGSc8uv/zjprq5JE7n6/BKwJE7KadhBPmf1Zf1IByhzqSfvLWS9uuHNTAS0BBOwYqlv
	MvlXQeN3erHRgprRlRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omb70-00FM5I-3U; Sun, 23 Oct 2022 13:33:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omb6x-00FM4Y-LM
	for linux-riscv@lists.infradead.org; Sun, 23 Oct 2022 13:33:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CC6660E97;
	Sun, 23 Oct 2022 13:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DEDC433C1;
	Sun, 23 Oct 2022 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666532034;
	bh=HM2oYzakfdXfJJzbe5qVxXYIO2tAmfA0Z3AF7nO+COs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J+LaVmkYWNM8WRyG7XrRI2PdMKBhVkMak40G66C7VtwH/Kr0Zl+kaP9Lc4w9DZarR
	 aPv6uKX+1AHYRXKEgTublGNogmX+cYSNu2CZY40m6LRy36Er0uipUDC4eWo3HcNRfm
	 dXeTPt13+wyzYnotwEdF3XT72+LTd9DKpn7UJmF5w/Xl2mS+rphOSvB8Y6AG4HR/0m
	 mrP5NC1mukgGEXbdcRCv2TbiA05MdenMXkR+HiezGv+RexxXv41Dekska9vb8uqSlX
	 nlOcZ965NqKjt9iFjG8efAclxrCruGeiuxHP9I4ifNH0zHm9xf/OUDGAwCxOhKJPDl
	 TtQqLUtUwGzgg==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	heiko@sntech.de,
	arnd@arndb.de,
	songmuchun@bytedance.com,
	catalin.marinas@arm.com,
	chenhuacai@loongson.cn,
	Conor.Dooley@microchip.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH 1/2] riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
Date: Sun, 23 Oct 2022 09:32:04 -0400
Message-Id: <20221023133205.3493564-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221023133205.3493564-1-guoren@kernel.org>
References: <20221023133205.3493564-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_063355_825321_66B380AC 
X-CRM114-Status: GOOD (  11.64  )
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

From: Guo Ren <guoren@linux.alibaba.com>

RISC-V follows the arm64 flush_icache_pte mechanism and also includes
its bug. The patch ensures that instructions are observable in a new
mapping. For more details, see 588a513d3425 ("arm64: Fix race condition
on PG_dcache_clean in __sync_icache_dcache()").

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
---
 arch/riscv/mm/cacheflush.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..7c9f97fa3938 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -82,7 +82,9 @@ void flush_icache_pte(pte_t pte)
 {
 	struct page *page = pte_page(pte);
 
-	if (!test_and_set_bit(PG_dcache_clean, &page->flags))
+	if (!test_bit(PG_dcache_clean, &page->flags)) {
 		flush_icache_all();
+		set_bit(PG_dcache_clean, &page->flags);
+	}
 }
 #endif /* CONFIG_MMU */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
