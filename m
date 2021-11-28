Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85AFC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmE0Ji2tGA9Or/iJ2AHEE1hojSR24Y6HF8Nh7gnANYA=; b=ILVrFGb12eaq4e
	jbAglH6m/MZoQiZFuxYxyHo9hSWdbu60nlj4E9nUdc0RsYT5WU1Ih+9+96rtCCZnlQ+FBYPD7NA1S
	GG/Ei3CZFtg6sT9wWnShd2IevPBUmATea9Q2DX/RXy6t1bRqGYzkMBTiKjJ6S1CMygFwfrgRQYjlm
	UwLWghG3Qrfxhc0s9YrKSnxe4FSRJOh9m2usEcvp4XarEWzeGLQsTA+ErnvgwpYmz1kRrz5JXeyNm
	wkAXNOtNaZJWhV1pC+573UUocM5ExoH37Lz7R+Fnk9bi6TDeibRxsZo6oEO6BEwGSNrJeBEpNMBss
	+2VIl99+wiE4xgLFJ76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrMpV-00G9bA-0T; Sun, 28 Nov 2021 16:15:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrMpS-00G9Zn-Vc; Sun, 28 Nov 2021 16:15:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0887B80D10;
 Sun, 28 Nov 2021 16:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB508C004E1;
 Sun, 28 Nov 2021 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638116100;
 bh=TkeGvT+T+N/UbFTgouihV6/Po7pgj+jD5L9aMgcATg0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iSR9fRcuC9YGICfR8TRlzvzfboaEGTVg8vMXWO8rBsG9zf5qf03Qw0gxl/9oAqDCJ
 pxC1OZCGmW7Mt69MxcTY+javIYrnP7uuKv5aTQYV0qD+0SNQLSyBUwHFo77zl5GRtC
 sBDyN2piMZsoo/QyARnRcIkC8Znu0aXi9hV8WjUcUAMaeTb2lwWlryjnXNEl/9GVKo
 yENOdwbsIlyWdYzBG+vPXPyXxoWqCK2Aufso2kWCgXP+jJAwxulwLpPBobDKqRyJmP
 VRl5gaBdAjGorQFV5A2AHgYBbTV58MQ4jONtNM7kauRfiveRb0FQ4ftuqwsQDkxATV
 /BzPDtPKHMw0w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org
Subject: [PATCH 2/5] riscv: head: make secondary_start_common() static
Date: Mon, 29 Nov 2021 00:07:38 +0800
Message-Id: <20211128160741.2122-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_081503_206496_439174AF 
X-CRM114-Status: UNSURE (   9.03  )
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

There are no users outside head.S so make secondary_start_common()
static.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/head.S | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f52f01ecbeea..3ce95f8783bd 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -177,8 +177,7 @@ secondary_start_sbi:
 	REG_L sp, (a4)
 	REG_L tp, (a5)
 
-	.global secondary_start_common
-secondary_start_common:
+.Lsecondary_start_common:
 
 #ifdef CONFIG_MMU
 	/* Enable virtual memory and relocate to virtual address */
@@ -365,7 +364,7 @@ clear_bss_done:
 	beqz tp, .Lwait_for_cpu_up
 	fence
 
-	tail secondary_start_common
+	tail .Lsecondary_start_common
 #endif
 
 END(_start_kernel)
-- 
2.34.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
