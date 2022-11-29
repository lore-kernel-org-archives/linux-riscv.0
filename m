Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24FDC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rrsZH0E/V0swvd4Vh7RanKgC0jPYyEcAWi4N1Ka8zA=; b=lE43qI43ftkqkH
	98LjZgH7hByTmXLSq31CMm/y4iwQK12uLAbm3RkIzUYH3nqg5K8iN3JgLjUmJpwNYnpfmtvaZVZVS
	B+Z7VUbhSRWs8yoezJrVaAoZf26Y0J7VUYt/Qc9djTXBXMB9uBuwCMzyW+Wa/NoiFr5xxBi9dFuYT
	YeZqGJEzsLe9OKwtNh41YG93ERKLyGuXzLI8QTRn7v79CO+CtOaVFoB+y9Av3vJHFYydjz0FzUUFi
	Bwb2pgjDRt3KnV8iptHUwwoox5y7v3Tw1T1jVfDR6uzt5wTk0Pd2TwEr9utcO7atDXmrnDWebPCWW
	1Z/R/cp3pdsiso5cWZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026q-009XFz-Ky; Tue, 29 Nov 2022 15:01:20 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026a-009X6L-S3
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 15:01:08 +0000
Received: by mail-ej1-x629.google.com with SMTP id b2so18161948eja.7
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhLl7r1HGVU7YRWytAeW1LwK6+bVBtwP1ln3M6k7lLA=;
        b=b/81PVYn2t7vHOYF0Vp2UZPuyzjg/ZaU/78otRm5yU7bvcoh7wCjc6l4JQy/NbohRS
         t8JvrVOnzqEAOzA/YVNHgP7yWVBIp77LdO1BLGNcWgsXpfFYZqC0z9aeL3+OIPhIW65N
         V/ABLlKGuzDWipRQ96gOKwziHqiN05uwFatKZemXbEC++hwvaTbuUfl2N1X6oJJTB3BY
         RCjUt9CFPbJ/pz8HUoeOiIhBP+GF82cYNoJdjwZo5wJEhW+8x4GJj13ubB9n7R6/jAfi
         TTqvA7pCAPfrhfzkZrsjFdHvi6iFvT0KSNdl95dgvCZnVXuxT8OAH1go9jJ/vr+/0hCs
         87oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhLl7r1HGVU7YRWytAeW1LwK6+bVBtwP1ln3M6k7lLA=;
        b=vuVqf1MHd6FB5QsOjLebiTPyX0NrQkQey7iy2m1TCQnctO/Sq2yWVUjq2adE4WgkH4
         gEp7S3x//ct7yfZkOt85h210ZigzzDUuBk8jhZHxZcc/UFhrc6qjsRVuLXdap9cSpzuf
         ORzD0vQ9fEKmh+K7s3h9BnHE4EMURDq4Eqr30jAzfKUKpFHe1yCFLxQcLLngU4DXV9P6
         sKJGLsDqFS4TjSOgKIE29O9woPVecbCA7z3xL04rfF+V+Qx6xUXvi3fD7QAGEBVdz9N0
         V36aT6XBq+qNX+wOvpQ3j1/AVT6N4FDEglROfeekboZWP5ov5gGxjC7LBw/qmybHnluF
         imNg==
X-Gm-Message-State: ANoB5pmgY4/PR6dfyWW9M9yvy8ND3GdJbsszu6OrtJAZAW5fRdD2HAaL
	ntFooBEpmog2k9pWH7HE46IPNnnfOpWnpQ==
X-Google-Smtp-Source: AA0mqf47AKOUr4JSVaF0zMfFekOXN+dfs2svk6G6FSL+8YruCbEKgOZ9hWC8pWb2WpkJkICfB1XHkA==
X-Received: by 2002:a17:906:65c4:b0:7ad:d250:b907 with SMTP id z4-20020a17090665c400b007add250b907mr47958486ejn.737.1669734061718;
        Tue, 29 Nov 2022 07:01:01 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id p35-20020a056402502300b00463b9d47e1fsm6301162eda.71.2022.11.29.07.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:01:01 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH v2 4/4] riscv: Don't duplicate _ALTERNATIVE_CFG* macros
Date: Tue, 29 Nov 2022 16:00:53 +0100
Message-Id: <20221129150053.50464-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129150053.50464-1-ajones@ventanamicro.com>
References: <20221129150053.50464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_070106_281664_06EEA4D2 
X-CRM114-Status: UNSURE (   9.91  )
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
index 9ea95331a280..7226e2462584 100644
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
 	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
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
