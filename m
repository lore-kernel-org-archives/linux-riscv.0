Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18967C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 23:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+JDl+K7bg/ZFTRjtJdMjRvzen6f+N3mz1Y2Zhm9nVo8=; b=cVl+wi1vgbKRVL
	HlP9SwL/R3A8dkSMxSSRPibpOfWC8r52FePV9ORX4k0xjugxp3PWRZPYThp9EtERBOJCuGVbqO8FL
	1/nudRDLBGogS3OcEekuaMgOvcJVvz8ygkLT9LJ+o5TwIPf3zPvb916NvekAmHqN9dF+tUBKfkHVi
	opoKmr/r68RgZQKa3OxSR6fKIzDQzv8+srbdMay6zTKrIvFiQCiB9HAJIOYH/IsDBcT3sKy0inAzF
	WKNrrREhM2NXXgG0PODD1VQ1mUdVXj562+g1OJ1jxwhW7VeTgOweow6MNSYE9TpI3wsbD4qhr7AlW
	w53Va7iO4gGbfKui1jZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZT9-00G2Rf-02; Thu, 05 Jan 2023 23:16:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVsY-00E6VM-0e
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 19:26:20 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pDVsS-00023l-2J; Thu, 05 Jan 2023 20:26:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2] RISC-V: fix compile error from deduplicated __ALTERNATIVE_CFG_2
Date: Thu,  5 Jan 2023 20:26:10 +0100
Message-Id: <20230105192610.1940841-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_112618_099826_2D2C8479 
X-CRM114-Status: GOOD (  11.49  )
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
brings more restrictions on usage it seems and the optimization done by
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

Wrapping the variables containing assembler code in quotes solves this issue,
compilation and the code in question still works and objdump also shows sane
decompiled results of the affected code.

Fixes: 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2")
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
changes in v2:
- don't revert the affected cleanup but use quotes around the parts

Tested on qemu + Allwinner D1 + specially created test-cases using
ALTERNATIVE_2 in full assembler .S files

 arch/riscv/include/asm/alternative-macros.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 7226e2462584..2c0f4c887289 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -46,7 +46,7 @@
 
 .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
 				new_c_2, vendor_id_2, errata_id_2, enable_2
-	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
+	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
