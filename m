Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9D1C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVX5isduG3Zg4TjMCSbml25YyLOTjX87rIEC6gRok+k=; b=3NwmjH86qaOk3v
	khbJfGCQgHq3vGSuFoshea47GvXehpPXj8LdphrXDsMZQkLti9ZoNeXgF95R4Iy2RXLTRGmiVFa/V
	Kqaqv8h7xvNYkPg7BJDMOpdNwnBFGiTWh77dRuGjktp+kx7HI5FTGdCJe1IXsHnOBB1zWw1iGQBDL
	NvxCdNk5XiBVGwwSbg486p+R06DuWb9F1J4rE9shejLoDdUO3xTcLhdsQZiItysHHJw3IC3yikwlV
	lh4wtyCh7DFEHabsC5TPoEdmdvdjhIPB+nI9Uw/qO2XJV280EJZPSCDZNm6HcVcn3KDNV9U0zpaCY
	eOHARZIWV5rL9RkYlWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrMpg-00G9jF-BM; Sun, 28 Nov 2021 16:15:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrMpd-00G9fw-1l; Sun, 28 Nov 2021 16:15:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB851B80D29;
 Sun, 28 Nov 2021 16:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6C0C53FCB;
 Sun, 28 Nov 2021 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638116110;
 bh=vTJ+kJ0LGa5qNHZ7RxBihZ2BrKTUuELoQ0am/1I/pr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XUD1f05OrZVzW97bOm57rVyEfy9CMsa+dt4IKu9VjDT1F5196D0uL2tpWobOF6Xiu
 scu5CWliDRO9tBEROkm5Sg9vUW60EdSVH4iKBrobqW5++i43tGryjRAAMcv8zC1Q2C
 mzzMkylnpa17YCfNMO58pMzuq5hjhvB/teHsz/dl7xXNYsRTvAAHLSyKqrO4U8vFr0
 YwcWNwpPYJIb1Bo4hOUsFHFpIu6YerwShemGLGr+LTj3W9hV/1NMxVkXbhYc5pzH3Y
 r9G94g4E6jJKG8zuQdEFp1Wt5YNvtVTidVTnHKmpX2li0TLOsqRzeRJAigG4E/XtX7
 zzoMSbWIsOYDA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org
Subject: [PATCH 5/5] riscv: head: remove useless __PAGE_ALIGNED_BSS and .balign
Date: Mon, 29 Nov 2021 00:07:41 +0800
Message-Id: <20211128160741.2122-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_081513_257550_17B925DC 
X-CRM114-Status: UNSURE (   9.46  )
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

After commit 83e7b8769a08 ("RISC-V: move empty_zero_page definition to
C and export it"), the empty_zero_page has been moved outside head.S,
the __PAGE_ALIGNED_BSS and .balign LoCs are useless, clean up them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/head.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3ce95f8783bd..c128a32c2ed3 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -447,7 +447,3 @@ ENTRY(reset_regs)
 	ret
 END(reset_regs)
 #endif /* CONFIG_RISCV_M_MODE */
-
-__PAGE_ALIGNED_BSS
-	/* Empty zero page */
-	.balign PAGE_SIZE
-- 
2.34.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
