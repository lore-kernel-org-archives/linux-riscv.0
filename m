Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A59C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZUX0vMQA5EvoQUCf7rkj5agU+3I6rRyx0AMNpIR+uw=; b=DoH2eSUpn50bTr
	2hXopFznB8B4AEi8Q1/4iuRxH6z52kCQ0qb6rcd9vuF67XVNOvqZxB6GHv3rE03VatGY6XQWnhc0V
	wUNZN5SmhlyXQIycL+6JCy/GkQhPvo0fQbNYZp7Uqai+kQkOrFA4bhQ9JBIPmPh/PUt0i5Ybv1EYx
	ebbucQNgQOv8uSVYYrTbqDJpAb1OIBdUNdRlYmLdx+nywCXie3yaMfLTEvhYoRrvfoDKqGOHPLQ/p
	Aqp5dFGYhZl1IK7rtgIrSds632x7nn5id0zCiXUkZYX/gavHPXBL1La+DvFzLbtLgPhur3ogYIvUA
	p2rl3qK9e0TvLO3P8zsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX4q-00GCdG-D6; Fri, 25 Nov 2022 11:41:04 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX3z-00GCT7-QO
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:40:13 +0000
Received: by mail-ej1-x633.google.com with SMTP id n20so9838717ejh.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlV2yWnaNP4MP0ekNYYC2os9eM9R4hyLBeccW6i6bno=;
        b=fkLWc+YRPJk3iKGbaEGZYb89IB4DAUYA3eyFbOmo8EAQ/yzppHdLtkYXOOIn9e/sdD
         YTSwkoW/fdIdAMEy4NOs4n/JfHKLOT+iEPoiC2r4QfJntPXGgn1x6fIEJMJDkVB0KIgh
         t1USMkY0vjtHVdzl5rzjO/DdWelFyt0AGEocxq+ZQVZ+PhZsu1vkEflBvOMsLd+9wKNn
         WpFDJRWez7G0dXvmuUi/oyuQ4QPZo4BPZXdgJY98jhcxy+FPvep+CtEL1NRnJF5YZgfa
         3ioK5LW+iWOTCTYGRqDTwx/fj5MR3iwXe5bbUZa8kN8piKbi1GYl6YIEW6U3sAdeItfp
         4fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlV2yWnaNP4MP0ekNYYC2os9eM9R4hyLBeccW6i6bno=;
        b=wQENR5ycA3ytZ6dGHl0jTrKTpKlBwh8dbmnSxbvPjVkkeqJ82Je6MiyOoqyKPHwAlr
         Sgc0bQ+HZB6H8U0zHisGBJsW1juNMTETvzUg6/CUhZRcJAl9uoMBawvEixfme1E3+Vrj
         wTHmSkiwNmqDz8BSdDG+BWqM29x+FXN4FD7NOCx+e01bC9mRfvqE/mEgGq0AYZpCzyzw
         wxfazhyvLDe6SlUolQUhs9MVhfYX1scm9F/VKCyI1Xi90zgSJRQirkG4SZRvVW6jRJSx
         oqDIVn/ZDDWX+oXPRarfXZ+haBPMmkC8d7j0ruudk3GlNQJvXigKRWPBoEQA5aW7ei7l
         tzkw==
X-Gm-Message-State: ANoB5pkVls/gl01uLVSS/C0BelkOwP6UhC4ri/1jLR4uR3Q2AzZdAfWo
	RFnck4hemYs8HoLDgXHd/QSJhPwPjo9psA==
X-Google-Smtp-Source: AA0mqf4u9x38az4/itHsBDGfjn5ujSIyqp3JenluIT+ALz2e7EnpKB9L680JeD4MAppZo8RcAbn70w==
X-Received: by 2002:a17:906:a08e:b0:7ad:79c0:5479 with SMTP id q14-20020a170906a08e00b007ad79c05479mr23630101ejy.392.1669376407286;
        Fri, 25 Nov 2022 03:40:07 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r2-20020a17090609c200b00783f32d7eaesm1446172eje.164.2022.11.25.03.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:40:06 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH 4/4] riscv: Don't duplicate _ALTERNATIVE_CFG* macros
Date: Fri, 25 Nov 2022 12:39:59 +0100
Message-Id: <20221125113959.35328-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125113959.35328-1-ajones@ventanamicro.com>
References: <20221125113959.35328-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_034011_872010_7A087B87 
X-CRM114-Status: UNSURE (   9.37  )
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

Reduce clutter by only defining the _ALTERNATIVE_CFG* macros once,
rather than once for assembly and once for C. To do that, we need to
add __ALTERNATIVE_CFG* macros to the assembly side, but those are
one-liners. Also take the opportunity to do a bit of reformatting,
taking full advantage of the fact checkpatch gives us 100 char lines.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/alternative-macros.h | 53 +++++++--------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 68dc349b0876..a6c4f8ed41d3 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -44,23 +44,14 @@
 	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
 .endm
 
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
-	ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
-
 .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
 				new_c_2, vendor_id_2, errata_id_2, enable_2
 	ALTERNATIVE_CFG old_c, new_c_1, vendor_id_1, errata_id_1, enable_1
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
-#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-					CONFIG_k_1,			\
-				  new_c_2, vendor_id_2, errata_id_2,	\
-					CONFIG_k_2)			\
-	ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,	\
-					IS_ENABLED(CONFIG_k_1),		\
-				 new_c_2, vendor_id_2, errata_id_2,	\
-					IS_ENABLED(CONFIG_k_2)
+#define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
+#define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
 
 #else /* !__ASSEMBLY__ */
 
@@ -102,27 +93,21 @@
 	"887 :\n"							\
 	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
 
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
-	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
-
-#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-					enable_1,			\
-				   new_c_2, vendor_id_2, errata_id_2,	\
-					enable_2)			\
-	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1) \
+#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
+	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
 
-#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-					CONFIG_k_1,			\
-				  new_c_2, vendor_id_2, errata_id_2,	\
-					CONFIG_k_2)			\
-	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-					IS_ENABLED(CONFIG_k_1),		\
-				   new_c_2, vendor_id_2, errata_id_2,	\
-					IS_ENABLED(CONFIG_k_2))
-
 #endif /* __ASSEMBLY__ */
 
+#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
+	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
+
+#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
+
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLY__
 
@@ -173,13 +158,9 @@
  * on the following sample code and then replace ALTERNATIVE() with
  * ALTERNATIVE_2() to append its customized content.
  */
-#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1,		\
-					errata_id_1, CONFIG_k_1,	\
-				   new_content_2, vendor_id_2,		\
-					errata_id_2, CONFIG_k_2)	\
-	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1,	\
-					    errata_id_1, CONFIG_k_1,	\
-					new_content_2, vendor_id_2,	\
-					    errata_id_2, CONFIG_k_2)
+#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
+	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
 
 #endif
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
