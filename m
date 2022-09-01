Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCDDECAAD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 22:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=27EPwngQ1y534XxMXOAhoJISKrQmEgUmo8scj9D6qWE=; b=XNPoovwZeH0+UT
	z9Jv7X4ISf464mi5zLRjkpd0+Tki0rOlhUTtuuhaKmf1g28C9di6KAmZljOt3zZJOVzKOVAbNeGKK
	LZGAAfmSLp397PdVJ99ZSSErWOBqaiAE+uc0b0iOfQe58ypcWn/zdURQ1myebh5M6lKNIEnROxiGt
	R+Vj+VqPTBPcJ3eeQpdwEqPb7nmbv8+eOrawLoGebsy05buPG4kEhuq4YNfkBts115yUl5hdwNK80
	HQlKbB7ySMiFqJcegjDkfcnc8GXms41W7vPz3gbldms+TF7l9EKrD03d5uFd3ymH6uv4Oe29RfSLy
	Td5PK7EZ7Bv83UQwomfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTspu-00FRmO-GD; Thu, 01 Sep 2022 22:38:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsfh-00FLJy-G2
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 22:28:26 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oTsfV-0007wk-PN; Fri, 02 Sep 2022 00:28:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: conor.dooley@microchip.com,
	guoren@kernel.org,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/4] riscv: cleanup svpbmt cpufeature probing
Date: Fri,  2 Sep 2022 00:27:41 +0200
Message-Id: <20220901222744.2210215-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_152825_577743_87C6EEC5 
X-CRM114-Status: GOOD (  10.61  )
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

This can also do without the ifdef and use IS_ENABLED instead and
for better readability, getting rid of that switch also seems
waranted.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
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
