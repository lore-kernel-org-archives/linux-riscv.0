Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4EBC77B71
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFmUcYl0BiPr6s5Kx8+XM0H6p3xzbQUbQ0q8J6rx8T4=; b=MvcHy/T9q3A4Qq
	RKYruLQzK2rdBCig7s3Ti19W/BaIBQlfLH8eMv3DEXJAcBzUqUX8a/SmmxzltqzUAGFJKpsthikg1
	H4HATosA2YhTe+FJlz3tBRiEqrq8lgGlOqgpxC7FVDtINMJfJOKGybOZK5UAfwg8xccpuOdwGw42Z
	QSzh5UXKue0IWq5FFaUcXADQCljErW+2IOTimDkfGvMkVlqBsZuwWff0eBABpJH72ZTYMVFd32JJl
	GILF/jDAu3mVe40jUlbXf1WC4qcvfIljpX6bnnt2Tum8Ae4c/BLihYWGHSZdzS7gaXRaNH4Owk7hB
	oW0yG4GJyaBwVNLVAWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYLx-002kQg-08;
	Wed, 12 Apr 2023 11:09:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYLu-002kPf-2i
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 11:09:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id s12so2008180wrb.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681297765; x=1683889765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGO+LaGVOk29cf36FklMYJChk9NGcDDsM7QD9QuVRBA=;
        b=MeP2q3zHTymS32ugCSJabv9lQy4/FYzsnn7cm2pA1JzNgNltj1ed3r0YHawXaMZDT1
         Orgij9HV213j7YDORZ9TfG65iZK7PyLpVFO5W3YbtyEGDaLbzyzprSrTMGS6Ns4TV0l9
         t0Lcf9fOhKoOOLKlW+YNtDxCVfa1n3HYAXyuaFqzC8mdaKVlf7ajnSM+sPw34RGGTAU0
         uCJ8ZXkcXKpKxIf3IQQGpu9yDpXxMzeDrx77XeXn3H0rUJPs/VXcegQhuV9vHbwVz0Bl
         cjvnBZCEqxSiaGNWXjW6z4alV4ec7eZTTp+9XLlxbAclyO9GS89KNilAzTG5UdFbaB49
         yqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681297765; x=1683889765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGO+LaGVOk29cf36FklMYJChk9NGcDDsM7QD9QuVRBA=;
        b=m8NVudD7UHNBpo1wEeLs1H+1y65SfMoXJqYvjRMhHEThOKFDlA5oIDyWertV72w/ap
         rMBKNaMAyTr7GGYLMMVi+bygwy5bSn14lvV5z2AMGKwddQYPd+WzZMwi/ivCWsKmhCO/
         oPK8vyqrrD9uWHlb1NPVo0jz/BNclMUe+SKyB70kqJAYNe0mEBpMGPFJH9fvfXknXwbk
         EjK8J1/eyyZtzajRt+NzGI68TiuKSTcMgNtWEbkpWCimBt1GT47TtCNyJQMJbRPohRSt
         A6eBuBqsXsOE6v9vYGy62f5fohTB61+36kAxAXndxiJcHgCriA7CoDqu6I3+AwEmv1o9
         1bBw==
X-Gm-Message-State: AAQBX9ePz/f+IP/cUJHAu55ySJ8YS03t3OeHTd4cT2sPSUnHdd8nrU/b
	TLRiAnfIxPRXi2mI+mp0oBI=
X-Google-Smtp-Source: AKy350YBc0s02ZGC8rTSixIk/cyfKzaWZdfTr03S7OWoBzyHDkdxxMY6jqIT3ULF3eRXDFBdmjSjkA==
X-Received: by 2002:a5d:65cd:0:b0:2f0:2cf9:fed0 with SMTP id e13-20020a5d65cd000000b002f02cf9fed0mr6792924wrw.49.1681297764779;
        Wed, 12 Apr 2023 04:09:24 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:783d:9280:20c4:db22])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm16863582wru.116.2023.04.12.04.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 04:09:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v8 1/7] riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
Date: Wed, 12 Apr 2023 12:08:54 +0100
Message-Id: <20230412110900.69738-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_040926_886721_DA2BCC83 
X-CRM114-Status: GOOD (  14.26  )
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
---
v5->v8
* Added RB tags from Conor and Heiko
* Fixed review comments pointed by Geert and Conor

v4->v5
* Rebased the patch on top of Andrew's series (now in Palmers for next-branch)
* Updated comment for ALTERNATIVE_x() as suggested by Heiko

RFC v3 -> v4
* New patch
---
 arch/riscv/include/asm/alternative-macros.h | 51 +++++++++++++++++++--
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index b8c55fb3ab2c..fd5f99714f29 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -50,8 +50,17 @@
 	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, "\new_c_2"
 .endm
 
+.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,		\
+				new_c_2, vendor_id_2, errata_id_2, enable_2,		\
+				new_c_3, vendor_id_3, errata_id_3, enable_3
+	ALTERNATIVE_CFG_2 "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1,	\
+				    "\new_c_2", \vendor_id_2, \errata_id_2, \enable_2
+	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, "\new_c_3"
+.endm
+
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
 #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
+#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
 
 #else /* !__ASSEMBLY__ */
 
@@ -98,6 +107,13 @@
 	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
 
+#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, errata_id_2, enable_2,	\
+				   new_c_3, vendor_id_3, errata_id_3, enable_3)	\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
+	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
+
 #endif /* __ASSEMBLY__ */
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, CONFIG_k)	\
@@ -108,6 +124,13 @@
 	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),	\
 				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2))
 
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				  new_c_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
+	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),	\
+				   new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
+
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLY__
 
@@ -121,6 +144,9 @@
 #define _ALTERNATIVE_CFG_2(old_c, ...)	\
 	ALTERNATIVE_CFG old_c
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	ALTERNATIVE_CFG old_c
+
 #else /* !__ASSEMBLY__ */
 
 #define __ALTERNATIVE_CFG(old_c)	\
@@ -132,6 +158,9 @@
 #define _ALTERNATIVE_CFG_2(old_c, ...)	\
 	__ALTERNATIVE_CFG(old_c)
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	__ALTERNATIVE_CFG(old_c)
+
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
 
@@ -152,15 +181,27 @@
 	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, patch_id, CONFIG_k)
 
 /*
- * A vendor wants to replace an old_content, but another vendor has used
- * ALTERNATIVE() to patch its customized content at the same location. In
- * this case, this vendor can create a new macro ALTERNATIVE_2() based
- * on the following sample code and then replace ALTERNATIVE() with
- * ALTERNATIVE_2() to append its customized content.
+ * ALTERNATIVE_x macros allow providing multiple replacement options
+ * for an ALTERNATIVE code section. This is helpful if multiple
+ * implementation variants for the same functionality.
+ *
+ * Usage:
+ *   ALTERNATIVE_x(old_content,
+ *      new_content1, vendor_id1, errata_id1, CONFIG_k1,
+ *      new_content2, vendor_id2, errata_id2, CONFIG_k2,
+ *      ...
+ *      new_contentx, vendor_idx, errata_idx, CONFIG_kx)
  */
 #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
 				   new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)		\
 	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,	\
 					new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)
 
+#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				   new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
+	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,	\
+					new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
+
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
