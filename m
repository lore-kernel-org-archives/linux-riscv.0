Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A115C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+P++EtrfaGg44e6hoxoLYFR82mcGpdSbmxSSr6WGwu4=; b=TBEgFe7UlKqfPT
	277guEFcQqwSw6TJBT/6yfnS2V4IrlQbkMqY9f0NAZOB1yB17TlntBQbl6Njinzn3xcPJA+0+DiRY
	RA6eR9SDznD5FSmXaAchdNPFSJY1gg7NzAPAERoV0eHsTOVIbAFaEQxyxDZdxs74jwo8YakW/rTq5
	6XQPmHmPxrbl5BtC0HN9R28IoQKiDGd1Jey6/bQyVCVAolgo9Zq2C2Z4cVTkzGprnlPa9bTq2CHA2
	vgyniWI7V4yK5ljRDE4/UDO6cW4RudJfbQJ7CSvtFNnoOIOWBN3/nD2ZzBHfzvfYuC1VQAMzg9f5A
	Ws/rguZkNte7XuO3AHrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026d-009X8W-TX; Tue, 29 Nov 2022 15:01:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026V-009X2z-Aq
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 15:01:00 +0000
Received: by mail-ej1-x630.google.com with SMTP id bj12so34386012ejb.13
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 07:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EL3ewKGGOYEX7gankM6sLKs4mUnW0KcTaKnwv/aTCIo=;
        b=cbkXP+pGWqgh5toOnnGNwdaW0C1f5FzplYSv5q5J2gyUefBoKX2g+Ll3dddbP/2Ltw
         lWppI/l7GWAJ2mjw3dePr0Gl6tgzKKo7xHInhvBwLLZS0GpwaVnWkZXed7bKoJzFk3+O
         LM/wNuVroPusKXFPyTr8B0Y657DexUToiJ4tYEWdMiCn+pRYupQDpGk0yQncJNWHQ/t7
         gCUbx8aILn7k3ocW6bqozef23N89WYKZFuiAWHMdbaB3UjBLDMAbn0uLmgcsX3PoRJp6
         T1nGSa2NZfGqzauOePozPQLgw7ZPQVvom93QmcwuA3qzrsDF8RzbRRTZ+Lfqb6HG5Z4C
         3U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EL3ewKGGOYEX7gankM6sLKs4mUnW0KcTaKnwv/aTCIo=;
        b=OCHDx2nG6ovVqQzcTPUhhLq5ahZqozTK7naXsNFGMfEJBdnB5dNgAY7J6oPEz/G9Ty
         IoGnSpa7ivue+fqCFVFeN3c3/4rMwl45Y53/hmwRZ9XU33muZ/MMTDwVHHTmJJH8DWYq
         2P/dPvk62babA8XG211r3jiXeemXPbBpMMSMrm1h6hsunvYKjHJo3Np8IeI6med7DwHn
         Ws5h1+FNrZ8A6PzVC8qZ7DXDMqaDRc2Q6uLpoXvgjFSbb2JfNddVm3IlZdFP7cTpa/Ru
         FKZ1T9fVMtrUbwm+P8ZtZ38wlpuQgejjcs8kDm+Ftr67M8YyGJmQxfqMPyEIqrcZi2m+
         4U3Q==
X-Gm-Message-State: ANoB5pm1fUWBfDITwfmm/HfHZfPPHbQe8UMPui5Ccq2ZHK5Kk84jgJtu
	t1+wJdfXRm+dYz2u7YgQbD/iX/OwsZ9ZzQ==
X-Google-Smtp-Source: AA0mqf6PdCCQbueIZr+wim3x+/dUgiQPLaznjnuyAY2++UtM9831xfJGQ9DpZtEWJCieLiY/0D9WUg==
X-Received: by 2002:a17:906:4c98:b0:7ad:b9f3:a66a with SMTP id q24-20020a1709064c9800b007adb9f3a66amr33145894eju.282.1669734055616;
        Tue, 29 Nov 2022 07:00:55 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id k26-20020a50ce5a000000b004585eba4baesm6417964edj.80.2022.11.29.07.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:00:55 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH v2 0/4] riscv: alternative-macros.h cleanups
Date: Tue, 29 Nov 2022 16:00:49 +0100
Message-Id: <20221129150053.50464-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_070059_396805_433A1423 
X-CRM114-Status: GOOD (  11.63  )
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

This series is a collection of cleanups for alternative-macros.h with
the main motivation being that adding new ALTERNATIVE_3, ALTERNATIVE_4,
... will be possible without lots of bloat. For example, adding
ALTERNATIVE_3 should look something like the diff below and
ALTERNATIVE_4 the same. This has really only been compile tested, as
not all alternatives are used when quickly booting over QEMU, which
I also did.

Thanks,
drew

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 7226e2462584..be9a09313499 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -50,8 +50,17 @@
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
+.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,		\
+				new_c_2, vendor_id_2, errata_id_2, enable_2,		\
+				new_c_3, vendor_id_3, errata_id_3, enable_3
+	ALTERNATIVE_CFG_2 \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1,	\
+				  \new_c_2, \vendor_id_2, \errata_id_2, \enable_2
+	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
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
+				   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
+	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
+
 #endif /* __ASSEMBLY__ */
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
@@ -108,6 +124,13 @@
 	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
 				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
 
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1,	errata_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				  new_c_3, vendor_id_3,	errata_id_3, CONFIG_k_3)		\
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
 
@@ -163,4 +192,11 @@
 	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
 					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
 
+#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				   new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
+	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,	\
+					new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
+
 #endif

Andrew Jones (4):
  riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
  riscv: alternatives: Don't name unused macro parameters
  riscv: alternatives: Drop the underscores from the assembly macro
    names
  riscv: Don't duplicate _ALTERNATIVE_CFG* macros

 arch/riscv/include/asm/alternative-macros.h | 99 +++++++--------------
 1 file changed, 30 insertions(+), 69 deletions(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
