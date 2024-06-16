Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2CBC27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1NFzNHZKCG5azNjADE1uM8UfVQBS6t1sqhEVnT169ng=; b=gEA7qRH/7i+A4M
	lmDpx5XgCBr+iumvRHCe8V2gu03SByh64w3HdI662rlCMdLJvZ4RISELPpZe4bGip+7gdeq8SNCaS
	P882eMdOTzbQP0Ucdlmq0Mvz01T3LEwdsPbwNpoDWWIu0Q6PMvGgrIfUCnuM1PnYRF4NigGQj0GaQ
	xqRuFdPPnsYdggH/GosKIRuaj92yTVUHkLds9hl7yBqwKwWQeyn0vG/MXUebdjlAxmbA8PZ04ryYk
	SQGjmfqr5y0EkfoNL7CavbQch9VLXB7w6k9JlQygvS60bUCA++hLfDQsmMInXjDLCkNBMZ5uTDZey
	HPqe0paHFhUChtP1lxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXw-00000007xJz-1GcU;
	Sun, 16 Jun 2024 17:20:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXo-00000007xEV-3aPT
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:19:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D84860E93;
	Sun, 16 Jun 2024 17:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5881C2BBFC;
	Sun, 16 Jun 2024 17:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718558396;
	bh=JTbryNQs3nlw2UfEZXAy4glezWuH4wHardbP1B5eZro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e99AMxUM9kqsk1t0nkcvTWNSEsgH6QZvI3eAUpWIeocexioI8utlOu/CtuwLtruR7
	 tBp4cKdcU1Qg342P8QdqXloB6M9c72CcfxnTnmSs9YlpVgrAyGrDzof6koi/JShE/w
	 qLDsLQcAiRUiALnFGnHMvbmClqfRsfFIEYWKhiKx25TtBMrUJEhnJkna7+RwS0IUKz
	 ZgC6NMvelvB4vc0zRy5fPm1HNpjuVMRSkZea8CSrm51cyxFejc24SuBBx9fI+7XqfW
	 PM+KdOqalP85orqXsTvsdGQXylQca65rqllQUOFAY8YPC28ucr3gLIAE1LhlAvEIsD
	 or0dwW7jW6BFQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] riscv: errata: sifive: remove NOMMU handling
Date: Mon, 17 Jun 2024 01:05:52 +0800
Message-ID: <20240616170553.2832-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616170553.2832-1-jszhang@kernel.org>
References: <20240616170553.2832-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_101956_961180_5F563CFF 
X-CRM114-Status: UNSURE (   6.40  )
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

Since NOMMU is now properly handling in generic do_traps() which will
call do_trap_unknown() for instruciton page fault for NOMMU.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/errata/sifive/errata_cip_453.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata_cip_453.S b/arch/riscv/errata/sifive/errata_cip_453.S
index f1b9623fe1de..b8ca2ebc2652 100644
--- a/arch/riscv/errata/sifive/errata_cip_453.S
+++ b/arch/riscv/errata/sifive/errata_cip_453.S
@@ -23,11 +23,7 @@
 
 ENTRY(sifive_cip_453_page_fault_trp)
 	ADD_SIGN_EXT a0, t0, t1
-#ifdef CONFIG_MMU
 	la t0, do_page_fault
-#else
-	la t0, do_trap_unknown
-#endif
 	jr t0
 END(sifive_cip_453_page_fault_trp)
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
