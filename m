Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B360BECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8MjzpF9FzH/BJHV3szsTKHOKMmbzr03ihlSzA3jdiw=; b=ntWcCB1SWSyr8H
	816ogxXOixLUF7BjDtbpgSq5EhwLMgxeBj+xp/UMdK3GbvM2tMsXj09VWSFkqhtXiAbvlyqj4m+Ji
	K/iUEvTnY1zB35kDVIiSJuuzffb4bx6ihX4NYZzp2H+br/XDxUFFIisUgH1KthDZs0qVWZYdZv84L
	BepQObosU56/Sffh86fchSQqpo3kVwM4NQDnOxrrylDD1VhRTldBMvLBYns8/H8aGY7SiCipOw7Ob
	62YTnfl3mUg9lvN0Akl9d257Yt/z7JGHs/gB3kBSCVBHDF/fH54rfYQTbgXiwEfLnDL9ySZlbSXY1
	hA1oMnqq0kLnotGDIKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCrV-004FHo-JU; Mon, 05 Sep 2022 14:14:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA09-000vN7-4L
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 11:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Hp3Baa9Vp2/Pzt8nqZvYRN7h70NaY8AiwJ4z8CV0iww=; b=Srkjap7EVD1QYftRji3Xf4X+mL
	n2uCJ1N90GvVM7/8W9m0aoWhEErOX/BCc+iBaSjHna0bFLu6bXJv8LmdReyl3tSAio2tV11tVYVl7
	TjBP8qL898CQEIGOa1qsc1URNua4Dgb4fe9e3w2bk4enAAXRZlDp403FyMLZzsGroaU7fEZsraC/w
	o3t+ImmiHPMd3n3cofskVHXD159Pmsv28Qy6ycwBHhbY+Kc5InAIYTYg7BGppTxichjkOc0yrxzJL
	E517ChAXeuz5UERO+v3JZOsWwqh5C84ypNqT4XlsOR9nsQY58z3n43pXSmTZkEj0Jp0ZJMSgK0I8p
	epsq5FDQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA07-009QFP-46
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 11:10:49 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oV9zw-0005hc-TA; Mon, 05 Sep 2022 13:10:36 +0200
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
Subject: [PATCH v2 1/5] riscv: cleanup svpbmt cpufeature probing
Date: Mon,  5 Sep 2022 13:10:23 +0200
Message-Id: <20220905111027.2463297-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905111027.2463297-1-heiko@sntech.de>
References: <20220905111027.2463297-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_121047_244644_AA5EB275 
X-CRM114-Status: UNSURE (   9.38  )
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

For better readability (and compile time coverage) use IS_ENABLED
instead of ifdef and drop the new unneeded switch statement.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 553d755483ed..764ea220161f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -253,16 +253,13 @@ void __init riscv_fill_hwcap(void)
 #ifdef CONFIG_RISCV_ALTERNATIVE
 static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
 {
-#ifdef CONFIG_RISCV_ISA_SVPBMT
-	switch (stage) {
-	case RISCV_ALTERNATIVES_EARLY_BOOT:
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_SVPBMT))
 		return false;
-	default:
-		return riscv_isa_extension_available(NULL, SVPBMT);
-	}
-#endif
 
-	return false;
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return false;
+
+	return riscv_isa_extension_available(NULL, SVPBMT);
 }
 
 static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
