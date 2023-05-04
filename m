Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F04C7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0wMiGfAnjUSKGQeC9oXXNOtiR2UJp+dKUcYlqkn3kI=; b=ekc8Jw9BSdOyaF
	Vmd71fPTrVNr6jPI7+lN2LSe91pXBpJ4Uweq9DQf2qyJFYlqZ1x3h2Gqp8C2xgCsSr2F3Poue6CYs
	M+ITatUmAtOHmnQRtGC0V8fRtRtQcuLgwdDkC+JClq4D4ML1mMzPDYOHJKc0HqJTWPGZO0s91eLqe
	CNuxAU79Sj1F/PEPGczdFu8c03aYYfH01jEng4YbvTm9zqTa7g43p2mDr/3n0c/Wfp2P5hp52SFep
	ZunU/4Dkddvt3qeWBme5dIGaYXMi0GjcrlNJMhWRtkEX7LVUKPp88rGaw0fjlyz2QKl443jV2gizy
	cCAmZGC94MEc6RBYbRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUO-008VQ4-2X;
	Thu, 04 May 2023 18:15:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUM-008VPB-13
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 18:15:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 93C0263380;
	Thu,  4 May 2023 18:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F597C4339B;
	Thu,  4 May 2023 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683224133;
	bh=s6vTyiYcHYzz7eCz26zTtkB0PMls/rX17S3oalE7DgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D6M2M2MQc2wfy5KhLLnCy8pSQC3VU7bTcfmkzwDM2HnQoHPUZo5ndsf3qpRBJeBOG
	 wozUMtPZzrhCo4dapeMnJhn3GlA3+mjlE9SolHUJjpBYMZ3rtTmZvHDz6sDt5b1h7s
	 /OSnJWygaWCOTt29TdAcInhSWbEEkzcRRn9v+wHrAsF3zJYKSqa/by4Raim70Eb7bB
	 jPnhW1eaXuZJ3HhyNHvlmGwZnGYZnsXa7f2LTkS0xbPGRT1Wy1ZEcCSPIQD3qyLWlA
	 pLhVBlehmV23t0OZRiG97V9ARzFvOkeZfVczECsUSbHk6cQInENuCMi1AQpNiGsbkk
	 yKNSXd6DsHhsg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v1 1/7] RISC-V: simplify register width check in ISA string parsing
Date: Thu,  4 May 2023 19:14:20 +0100
Message-Id: <20230504-twirl-caution-3a2248aa24bb@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NaWhaFCAYxKjY8ZONY2tqP065oLV7bTeJ/oubaRmp7E=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnBX/9GXZe5kmpq95aRjefSn11XdwktLWY56mn4dVX1W 7bH9703dpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiVcYMf2WEDv8STHolk1fF ckhQV6Jhm8JchrQ++2maTA9CTlb6/mZkaGc4nBTxv3LvvnnTDs16FxGXlH613No0oWI3z4Zm4ef 2bAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_111534_403451_616EB8D0 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Saving off the `isa` pointer to a temp variable, followed by checking if
it has been incremented is a bit of an odd pattern. Perhaps it was done
to avoid a funky looking if statement mixed with the ifdeffery.

Now that we use IS_ENABLED() here just return from the parser as soon as
we detect a mismatch between the string and the currently running
kernel.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index cb32658180da..00df7a3a3931 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -115,7 +115,6 @@ void __init riscv_fill_hwcap(void)
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
-		const char *temp;
 
 		rc = riscv_of_processor_hartid(node, &hartid);
 		if (rc < 0)
@@ -126,14 +125,14 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
-		temp = isa;
-		if (IS_ENABLED(CONFIG_32BIT) && !strncasecmp(isa, "rv32", 4))
-			isa += 4;
-		else if (IS_ENABLED(CONFIG_64BIT) && !strncasecmp(isa, "rv64", 4))
-			isa += 4;
-		/* The riscv,isa DT property must start with rv64 or rv32 */
-		if (temp == isa)
+		if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32", 4))
 			continue;
+
+		if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64", 4))
+			continue;
+
+		isa += 4;
+
 		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
