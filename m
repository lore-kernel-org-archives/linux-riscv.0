Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E81C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 03:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jwbQ35yWNCDx0z2g1LEaFV5MUDx/1wCk+SorJRu6XZ4=; b=IBP++/Xxf9NXSH
	Wa+xscAQC01myc4fJ+EYFzy6E/tpg4AO8RQ3XIQaewQEdQPT2zDQVPAPZrHPoD2q+TOlS5eSEFcJI
	9wkVaGi1r784vJCqvSnYcgc0/CnDPFdTScn7hmtAMoTtWikHw2waTEhvgQ4SKSJ6hzTMRBUSAc2k+
	DLRbPHF32BdeH0JcU7yWm1p77xrZKvvtv1ETB8s90wpVHBYWDFLsxMlDNb5OfPWcs/gpVaNO9kKYR
	pWmV78HVuvIobY1NEaePQgO23INBhXAF1ZSMv4pbzrgiMTG+Nd3VWMyw/ORHhUBOg66yEQo5Xl2Xz
	GgaV56PaxFmJx6kcjzSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLFoB-00DDO7-7z; Fri, 27 Jan 2023 03:53:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLFo5-00DDN4-1V
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 03:53:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9DB13B80B19;
	Fri, 27 Jan 2023 03:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A7BC433EF;
	Fri, 27 Jan 2023 03:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674791616;
	bh=QiRQ0Fl6+onHpSDTLUrFMpUAIIfVHseS/iKmIXAYaWc=;
	h=From:To:Cc:Subject:Date:From;
	b=OzyjQCSOa1wVfANYW40qX3EScWWACX6fBwykJNrXTF2hDppVqv8V3BkTjJiH/eXQY
	 rhe7qgjnq8pCOqvYRBxX5C3gg1JWPluGlnbV2/cohPk+ibiC5Il4sqSQF38cACs4lH
	 S/hS0gG1MCioogE0Psv0YFrcrlacf86vBgEZ+gwLwzkgs/R4vJXppqxYRLNa09ypq7
	 PwqSEKrEl7k8Tn98U2JIAw+37ojxZ7D4gYF40hJNHO0+uG6FH1OSsddXYQen8KO3hq
	 V9Wg9IvpS2BhPTyjOm//TSDz1+eUOYHuOlxHE2HEdlMmFCufTmBO1w2CcU5V7HcxrI
	 rjYgYYSBgstbw==
From: guoren@kernel.org
To: arnd@arndb.de,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	guoren@kernel.org,
	tongtiangen@huawei.com,
	ajones@ventanamicro.com,
	andrew@sifive.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2] riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
Date: Thu, 26 Jan 2023 22:53:06 -0500
Message-Id: <20230127035306.1819561-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_195344_885284_B4ED4E06 
X-CRM114-Status: GOOD (  12.44  )
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

In commit 588a513d3425 ("arm64: Fix race condition on PG_dcache_clean
in __sync_icache_dcache()"), we found RISC-V has the same issue as the
previous arm64. The previous implementation didn't guarantee the correct
sequence of operations, which means flush_icache_all() hasn't been
called when the PG_dcache_clean was set. That would cause a risk of page
synchronization.

Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
Changelog:
V2:
 - Optimize commit log
 - Rebase on riscv for-next (20230127)

V1:
https://lore.kernel.org/linux-riscv/20221023133205.3493564-2-guoren@kernel.org/
---
 arch/riscv/mm/cacheflush.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 3cc07ed45aeb..fcd6145fbead 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -90,8 +90,10 @@ void flush_icache_pte(pte_t pte)
 	if (PageHuge(page))
 		page = compound_head(page);
 
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
