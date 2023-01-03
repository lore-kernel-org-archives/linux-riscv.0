Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542B7C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 21:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuoXWaQ38WEqMrNUVKAc72g4w7r8xV9Sc4LhUE9frtk=; b=IxrDWvpWrfLF3X
	Mbj/22aO7/dMg8ZeToVczJ2cM3D7OZ4ZgG+iDUrfnT7vWpRx35nOUk9dJ70SZl2GtZxPtrUlrYCZC
	RwmzdxYA5hEvRwGr2ttiYNv5Qq3yf5ubXyBYV5SHc5v+NDB5B7R8k+xyFYUnfP6S2d1GUQY1JSZ9j
	pII7Qa7dVozZjIXMhQydjl/txVGwUFyn6tX4tTEanEq/q78C/UqGfkx90hY4nVcv612J9m1BSKp+Q
	vS3ixxQguRVWudOInIghIp2SX9BWnDjcT4taHtuxvQ+X0Ndd3Gyxw3+kcBPXeo6DVbkvc8r7dQM3j
	rxJnX7aT4BL0q/4UltyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCoTJ-004y3F-GS; Tue, 03 Jan 2023 21:05:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCoSQ-004xYc-Ab
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 21:04:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 90A6CB81103;
	Tue,  3 Jan 2023 21:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFADC4339B;
	Tue,  3 Jan 2023 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672779863;
	bh=ppRajYsT/OkWemwsA6MQ9TF4kq9Xu8/VtdPDy+LZ+1E=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=btqUvpWk0jN8E0FQWXtS5yhvcKWEsbBwbme7+8TaK/EZQznLECO2SRcJ2qLmQMUql
	 8dnwoLUx+n+XtT8gEFx9M8b8dcfjEvTwiieT9shrOWLeq33qmunnD7ohDyjGIwq9R5
	 Xdq8dgoWUY2PX0ox0mwLi9x1CF0+OkobOL2XWQkMdL5lHGQTTVYvfliv/V6g5Zqf5y
	 JoCbGNJp+YlwvYqwguEnRBNoPyRPW5ea+tQWftx+h+miukQJbeZaWjLtJGgGusxwiR
	 oZuIfcrzneC+gt3WCPNFZV0eWB/dgo1YcZ7540J3MRtAuRHxSglnD4EPJ6mTx2NpoY
	 DBK5mcbJrrOMw==
From: Conor Dooley <conor@kernel.org>
To: conor@kernel.org,
	arnd@arndb.de,
	palmer@dabbelt.com,
	prabhakar.csengg@gmail.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	geert@linux-m68k.org,
	guoren@kernel.org,
	hch@infradead.org,
	heiko@sntech.de,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	magnus.damm@gmail.com,
	nathan@kernel.org,
	paul.walmsley@sifive.com,
	philipp.tomsich@vrull.eu,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	soc@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [RFC v5.1 1/9] riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
Date: Tue,  3 Jan 2023 21:03:53 +0000
Message-Id: <20230103210400.3500626-2-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <Y62nOqzyuUKqYDpq@spud>
References: <Y62nOqzyuUKqYDpq@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5020; i=conor.dooley@microchip.com; h=from:subject; bh=JKUr3UqrXzYF8otetDw2MSRIpTRoFJbXZCf7mQF+Ggc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlbZlhc5+auLbi4Ucsj+8QDsSemPfERCYF/TsY4B71m7N7h mPOvo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNx+cbIsNz3o8+h1283Gxcttn575X fFy/fsf4Uq7hVO25gYYZ/CLMXwh7/4BrdH0ZdLS+U6rCZGNHtmz2Ji3TJF7nU362mub78qmAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_130426_757199_B3A9FF34 
X-CRM114-Status: GOOD (  12.45  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce ALTERNATIVE_3() macro.

A vendor wants to replace an old_content, but another vendor has used
ALTERNATIVE_2() to patch its customized content at the same location.
In this case, this vendor can use macro ALTERNATIVE_3() and then replace
ALTERNATIVE_2() with ALTERNATIVE_3() to append its customized content.

While at it update comment above ALTERNATIVE_2() macro and make it generic
so that the comment holds good for any new addition of ALTERNATIVE_X()
macros.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/alternative-macros.h | 46 ++++++++++++++++++---
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 7226e2462584..a5b4691520da 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -50,8 +50,17 @@
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
+.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				new_c_2, vendor_id_2, errata_id_2, enable_2,	\
+				new_c_3, vendor_id_3, errata_id_3, enable_3
+       ALTERNATIVE_CFG_2 \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1,	\
+                                 \new_c_2, \vendor_id_2, \errata_id_2, \enable_2
+       ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
+.endm
+
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
 #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
+#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
 
 #else /* !__ASSEMBLY__ */
 
@@ -98,6 +107,13 @@
 	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
 
+#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, errata_id_2, enable_2,	\
+				   new_c_3, vendor_id_3, errata_id_3, enable_3)	\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+                                   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
+	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
+
 #endif /* __ASSEMBLY__ */
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
@@ -108,6 +124,13 @@
 	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
 				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
 
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				  new_c_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
+	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),	\
+				   new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
+
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLY__
 
@@ -152,15 +175,28 @@
 	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
 
 /*
- * A vendor wants to replace an old_content, but another vendor has used
- * ALTERNATIVE() to patch its customized content at the same location. In
- * this case, this vendor can create a new macro ALTERNATIVE_2() based
- * on the following sample code and then replace ALTERNATIVE() with
- * ALTERNATIVE_2() to append its customized content.
+ * ALTERNATIVE_x macros allow providing multiple replacement options
+ * for an ALTERNATIVE code section. This is helpful if multiple
+ * implementation variants for the same functionality exist for
+ * different cpu cores.
+ *
+ * Usage:
+ *   ALTERNATIVE_x(old_content,
+ *      new_content1, vendor_id1, errata_id1, CONFIG_k1,
+ *      new_content2, vendor_id2, errata_id2, CONFIG_k2,
+ *      ...
+ *      new_contentx, vendor_idx, errata_idx, CONFIG_kx)
  */
 #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
 				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
 	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
 					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
 
+#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				   new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
+       _ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
+                                       new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,	\
+                                       new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
+
 #endif
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
