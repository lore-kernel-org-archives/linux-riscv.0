Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6A3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 05:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpWqBRutIGHQmF+G/pFhBmKjX+u/cPx/rzqOu4305Js=; b=fzb7d8aqcJsES1
	nlKeWzBPVBGM4vG9YopXxeNCuoMn0WhnbYqTVKKVuxntFK1GgPhjE5mj3I2yIadKT8rBSBF9rK/f4
	OT5S8OgItQH4AE+YlPW8LnowGan58vzpC8wdP7J+n7g6yuy7IslmxLL477r3o5miSE++jKumwEt0D
	y5IWMteDI/S+3QK1WnQ53L9uiCMNLOLEJ1vbHj/HDfOAOXAsohXZ5MkVBDcLBIozNRkxhmDCWit67
	Cj1DbSaVpp9TyPycnSwgRRPAmuo3iGcg8HX6vgragpUBc+e4WN4IHOfYr6zPYDaPj+ud2LbuAolMx
	inHNp3MirK0a+x35J8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKCUi-005YIJ-ER; Wed, 16 Feb 2022 05:04:48 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKCUf-005YFC-1d
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 05:04:46 +0000
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Authentication-Results: mail-sender-0.a4lg.com;
 dkim=permerror (bad message/signature format)
To: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>
Subject: [PATCH 1/2] RISC-V: Better 'S' workaround
Date: Wed, 16 Feb 2022 14:04:26 +0900
Message-Id: <3742d1f8962538661bfe5f9f74128d6375d45884.1644987761.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1644987761.git.research_trasio@irq.a4lg.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
 <cover.1644987761.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_210445_262320_EB91E58B 
X-CRM114-Status: UNSURE (   7.34  )
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

This commit moves 'S' workaround and skips 'S' and 'U' "extensions"
(invalid as single-letter extensions) from riscv_isa (base ISA
extensions).

This commit is intended to be squashed into Atish's isa_framework_v4
PATCH 3/6.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpufeature.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c3ef55203117..b00ce81627a4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -113,15 +113,19 @@ void __init riscv_fill_hwcap(void)
 
 			switch (*ext) {
 			case 's':
-			case 'x':
-			case 'z':
 				/**
 				 * Workaround for invalid single-letter 's' (QEMU).
 				 * It works until multi-letter extension starting
 				 * with "Su" appears.
 				 */
-				if (*ext == 's' && ext[-1] != '_' && ext[1] == 'u')
+				if (ext[-1] != '_' && ext[1] == 'u') {
+					++isa;
+					ext_err = true;
 					break;
+				}
+				fallthrough;
+			case 'x':
+			case 'z':
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
