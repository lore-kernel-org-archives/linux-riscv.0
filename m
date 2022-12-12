Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29453C04FDE
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmfZ5Ezg4MEiRNDRjRpg4n8tPzIFsspUMtkharND5A0=; b=ks47Lin4vdndDJ
	XcmdeF0tgZUHfLNBUsiLbmY0Nl9sLqceGf3SNGnMth9f04pMH17WqGO11rRJZOE47MN+Ce5rhGnmT
	OffSoVEYnihLnA+0NaR8naCl4LAZLUoUm1yCO1TfJ2xO86POI7Be8EGz9UQ/0f+flzcaGieVv6qLl
	hpgdE9C9jGoRT1U79QDB9QflWU0s63TaxJAbejqGAH6lVVMf2Df8/EZNdqPMgwUz7TUy6Yfw0XVSK
	+QDynDGAnLytgs3+NYLbSLVtupvjtKK/NlHFuAdC73Mc6l87LWMNP1/qo64F/ejHvgS0WYN/aR6zj
	rl8oQlwoif9LKRpFCV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPF-00ExK0-VD; Mon, 12 Dec 2022 11:55:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPB-00ExBT-Gx
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 11:55:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso4915833wmo.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 03:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpXOFyKc/JZvQOWHQWc0AJS8A/69Ui8DKNz8njSVnfU=;
        b=BJ0Dsjc/SFk5h+zyozkC2I4LnZ37r72za6ZXGBwb7D1To2ZeM1nYZW2wsXUMBJYio0
         9homQsaxjhwiwUhxzP8KE2uzxGw5O9e4OEaHc23dKcqN3QDZ3b1RypX523NtbTssg/YI
         aY6ZHSZNKbzbs58UdBwvr5TMENriTjcjLTor/MD/otq+Goe63ci4c71cQUjZpqWbvjUC
         mZLEmw/tuooCxGDmrDL7p32eX7U4DeY+pIW9sk+GT7x8V2yZCH41vUX8zqds1aseOAaf
         UbCC22tz3LtgBwzlaiw/x78gfnk8JnGI4ALNgAGhpjJEuyxrYNFvRpV6R9QuVjJR5zPG
         Lh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpXOFyKc/JZvQOWHQWc0AJS8A/69Ui8DKNz8njSVnfU=;
        b=mGBoqYSzpBOu70nDodiztIapuQxWJHunsAGSBnM/tOSjPZ+kTT0tPbe9p+hvzhvZgh
         FieJ/8zif81DZg0c/7S7e69bOAQTYreDkdxXdS7UVN8opCfb6/qhb9eS2dUSYPbA1iGf
         j/KWQ8R+MULliXgMVDvqy2UcHm0np933gRU3peQbwibcJWwG/ypTibT3iA8d5an5q436
         r8QJBqSnFWIx/zM/kGwe6pQ7eBxsEt2PfldEKYoPhDldIVBFaaDAH4BMKSSoNq7gI+Co
         +G3qftKNEMiLVqEhDZN+2Ww68WqR9sSow3STjYARz/X2hb0gffgVle9Qnm33jsjdlO5P
         QAag==
X-Gm-Message-State: ANoB5pl4/49IafmUtoUdLfnFhKj2aVn0PRZCzQEBOLpAH5iBhwlE1InW
	mMtPGrVuGeUeH0/ZCTRQj3A=
X-Google-Smtp-Source: AA0mqf7qYn9J61IyJLyX4K5SxOQpe03ZYZQLW5WHgLCT7YNjAC0PhK9oniKbi712c+6s3Y3Nju7v1Q==
X-Received: by 2002:a1c:cc1a:0:b0:3cf:5583:8b3f with SMTP id h26-20020a1ccc1a000000b003cf55838b3fmr12615303wmb.20.1670846130885;
        Mon, 12 Dec 2022 03:55:30 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:1484:ef11:b25c:4612])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b4cba4ef71sm9793820wmq.41.2022.12.12.03.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:55:30 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/6] riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
Date: Mon, 12 Dec 2022 11:55:00 +0000
Message-Id: <20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_035533_586140_C8A061E7 
X-CRM114-Status: GOOD (  12.13  )
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
---
v4->v5
* Rebased the patch on top of Andrew's series (now in Palmers for next-branch)
* Updated comment for ALTERNATIVE_x() as suggested by Heiko

RFC v3 -> v4
* New patch
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
