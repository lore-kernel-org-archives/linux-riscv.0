Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D94ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQGj70uljsqhhy5FIYVXPklhZQFduszcHE0o/8b/wtU=; b=ql0sZ+FUGAYqwk
	B+7Ml0rTSr4t7hsdvE04LuE0n0+hr+AoRyN45aITmS1Cy5vwrF3XwkHopH2RYOxketISR987uviOQ
	MZHXdgGPKB10SAYLwPEAXiFvkDMCHlZlFAgsJ94cvfJDwrP56uRm0JS5ndpbQjXBujSHHEyyzNCIR
	Uu8R6W5KR8+a4pdjmaDGicTmVXYYxe9xz88Fhm4F9KVVJrtOQyuvwUkkETvRxaO5aBuqCGqyd9aHF
	gaEQ4auop4JYCQaRRJ5v9dklOZIEuXDjctc/fvMyrDzNFJaAYjOn424oWKK8lXextHPk6RlPJYzda
	tpeut89plmXa9m1nh+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCrM-004FBa-Ct; Mon, 05 Sep 2022 14:13:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA0A-000vLc-85
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 11:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=L9KKgEPy3SjGw20UQbOAO1tOG2Dn+WodzDbVIztHbzE=; b=mbKDrAms7cOknBWdSm9lEf7dWk
	asr8ryzJUFu5VB5Yn4D215XXPUAre1yaZ9BWvI3jLdJU4BFC/USh1QR0dwKi3ryTZJKASWY+MEvgq
	6Ue0i7Obb03VJRTj6gN/Y5/S7mLYJSLJIK6Bcbjr/TIf6NnARMG3bMz0OavzyP0zp4h8q/CvRv+BK
	mJDFjTDa1Z+ag2B9CKxo/4AVaGwslXKNZbAQPTg6SlCG+c/fnXHOl3mLpv0tMyerPAJZsuAuIggWw
	UgtKZwFUtSGA2iA0EafiA41fMetjs1qKxJbRRdw1mpiFz0YbDH1JFw4KI6b7/L7NgvVwtmh/q+F8C
	am4OrEbw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA04-009YuN-0b
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 11:10:46 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oV9zy-0005hc-Ea; Mon, 05 Sep 2022 13:10:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: guoren@kernel.org,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 5/5] riscv: check for kernel config option in t-head memory types errata
Date: Mon,  5 Sep 2022 13:10:27 +0200
Message-Id: <20220905111027.2463297-6-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905111027.2463297-1-heiko@sntech.de>
References: <20220905111027.2463297-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_121044_265058_DACF2562 
X-CRM114-Status: GOOD (  10.58  )
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

The t-head variant of page-based memory types should also check first
for the enabled kernel config option.

Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/errata/thead/errata.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index a6f4bd8ccf3f..902e12452821 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -17,6 +17,9 @@
 static bool errata_probe_pbmt(unsigned int stage,
 			      unsigned long arch_id, unsigned long impid)
 {
+	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PBMT))
+		return false;
+
 	if (arch_id != 0 || impid != 0)
 		return false;
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
