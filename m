Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB93C4708E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 21:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=If431Krg7czFXFer1X2jnkgR3MvsDJXl3k6U5eZauFY=; b=XZis/Htr0RDabf
	ZIvXAjVgWb/whUK85hWnWx66GTsz87w0O1LEohrfxUk9EfCqJD6bKkoY3xYKxRU7OeuAicv3bk0xj
	WlCtcAqLQAgH62gXelsM7s7SEUzIAEkdOzh+zHi6Wezm2ncAI5ZLW7irarrz9lfl8XWOl0/36S4M8
	uU7cw3rEGCsOZ7+0zxmuYhG/q42P0CfyqW/9jATHg41thPn5d4sp7kFiYaxiK6nV9pvOc1wvwBXLq
	/MVcTb2SarfPfXsEcNPm1n5gzPyc6ba/WRBo6XqSSh0zF1rMFSDVHMO5OiXjjTbmR0k00zqCj1FO9
	RraGCuibdRaN8jyrn9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCp4X-005Gl1-DK; Tue, 03 Jan 2023 21:43:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCp3M-005FrX-Fl
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 21:42:38 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pCp3I-0001oQ-6R; Tue, 03 Jan 2023 22:42:32 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH] RISC-V: fix compile error from decuplicated __ALTERNATIVE_CFG_2
Date: Tue,  3 Jan 2023 22:42:28 +0100
Message-Id: <20230103214228.841297-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_134236_589208_1D4A9265 
X-CRM114-Status: GOOD (  12.63  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

On the non-assembler-side wrapping alternative-macros inside other macros
to prevent duplication of code works, as the end result will just be a
string that gets fed to the asm instruction.

In real assembler code, wrapping .macro blocks inside other .macro blocks
brings more restrictions on usage and the optimization done by
commit 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2")
results in a compile error like:

../arch/riscv/lib/strcmp.S: Assembler messages:
../arch/riscv/lib/strcmp.S:15: Error: too many positional arguments
../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "887:"
../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "887:"
../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
../arch/riscv/lib/strcmp.S:15: Error: attempt to move .org backwards

Going back to the original code for the non-assembler-part makes that
code work again. So this reverts the #ifdef ASSEMBLY part of that commit
to the previous variant with duplicated base.

Fixes: 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2")
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
I was of two minds about either to revert the full patch, or doing just
this partial one for the ASSEMBLY part. I did go with this variant, as I
still like the idea of deduplicating as much as possible :-)

 arch/riscv/include/asm/alternative-macros.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 7226e2462584..e7bdb2a510a4 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -44,9 +44,20 @@
 	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
 .endm
 
+/*
+ * Using ALTERNATIVE_CFG inside ALTERNATIVE_CFG_2 results in compile errors.
+ * So the common code needs to stay duplicated.
+ */
 .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
 				new_c_2, vendor_id_2, errata_id_2, enable_2
-	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
+886 :
+	.option push
+	.option norvc
+	.option norelax
+	\old_c
+	.option pop
+887 :
+	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
