Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4F3CCD185
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyKn+UgX/ccqDNKZE1URUIG8nQlp3DzhWaqG2tsxGhU=; b=K0LK92dXLfKn+S
	KU1kaaNZX+Z8bWKZkyMGivWueBTlWslUFMyD0gmECfevoRiGPCpHwBa1vCdJbBjXN+b7Eum6zIQTg
	ksurRZzZEsCFUEb1w/8ZS50wOlOvGCLa703vvFpLH/lkCgwGXWIHRnJGjJsAIsIwF86/wJ1av0imP
	g+BjxFFFMAUoIAqtJ1m1HXOtnWsIA6CoiHCh1KFT1rtxnIil8QOJEB2W4FhfTWKLF5K++zj1bfvbv
	s+mBP9+wdaY0P3uI/vLlzXHz3wneXlsaRrP3ofJS67w/hHyQJ3eUwHKqZrHa2QTKPRNfj3OeBgtaC
	y4Y3TPjs0EUgdLZBcxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvp-00000004zLt-1fuB;
	Thu, 09 Oct 2025 01:59:01 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvl-00000004zHX-3pHp
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:59 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b55517e74e3so438998a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975137; x=1760579937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhRrU7vktZrNl/RvMhvzrzBaAz+rEcTgEU1eyRQaB6M=;
        b=YrTatKOJsRbmkua7ZwtaceH1jxdTzAy1+eNmlpWO+vH6zQAzaP8KAtL3aqqeTK+ulu
         Umh3lv+iYxAI4D7R8SGgYPNlEUxLLDk7bJK0STZWbe8+XjtKDKmtH3jRXf1fyAGnXirs
         mCuDnI8gbd4rr9JOPgSHYoku1lpP/b0k6qTiTEUDCJonpWQxdsbkOJCDH8B7VDlG/BHG
         ag2qkcGLhmL/8XltbRBG1CbTyucUUwKQWWGi36pDQ46YDLJYBieSX63j6OkgOqs6JZLJ
         TJKKYwKQoaO+VaTno4GkagwQJ8yLu/IU7zAfwbwl8UJY9O/0eK+Qld1L5vBw15CrQZ/1
         Ys1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975137; x=1760579937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhRrU7vktZrNl/RvMhvzrzBaAz+rEcTgEU1eyRQaB6M=;
        b=K566wOp7l1ti8r5GmZyt0+Rr8QaDB6Y4mlWsTMOdIBymw4VJmdBABHtMj9oI1h4dgT
         WAlHx4uaP+6YhbXTuLRIEqJRzkVrMDyLAu8JTsoJb53ibMXiIC77/nRMzi5bk6MbVARl
         vgfhUh+ER7zyLK9bslZjwSyYuJVYcBA0PJ8sLOikk86FEFWpymVoxXdca95eGg9hCleN
         ysAflWSqu6T+n5zjvMmeXUP00XKKed6OuRxh34Ki++QRrbS6RYNmKoodoE4J4KNXus0u
         yUJh3b709ryYl6IxyN1i5X0Cwzd4cNbYsTXtqfMe649WZ7JqT+/kd9mrPDAK8Rr55b0T
         5PNA==
X-Forwarded-Encrypted: i=1; AJvYcCVMHzua2HIwCEUo9fG0/RWxF1GSY3A5THJ6IzEZPPcL8BExGBEkzJqtjkunaJg/yozSgadFoNDkl8hYFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YynghPS33dns2buBk75v12FXEshFCN1f3hLsr5ZGderglNyh8Dm
	fPT30vHaLUl6lUdffT+uWRyKeGnm8F9IRL3UjdppYOILC10NklGOcnRuuoHAt3ykyb0=
X-Gm-Gg: ASbGncvd1mvBxtixHqnxqaxPP/OSIm8mji51cfTJwUFtqbMqGwN2hSZjQ8+MD88i4mc
	SgZrTgEZDu6OWDvcJqBgDjtAtXUWh3MPK22Gp5lyuUMno3PQizMA4B0PPoNxx8zN2skeH3SD+3G
	QyRPG+j3lvHNMMgn5LEzE3eWA6UPmcvRZwT952zPbmGUV9UP7nw3SB1N0Ym++BPDApkmWQxKStO
	TiSgSmpKHKRWlSTTGQV2NlxeUEgiUamA7dRH4oviSYQ7MDvYSdYkfr7wQkgD5lpwzQAjSTPGBvZ
	SDn0ZZT+tXluCFpj16Y26qya28oQx5MWfOAF2dfWwziZr8tkk6EeVLSvFBkjuTNRr6ueMFKeJqI
	GI1A56lqeSaQ/8gtJ514lVYT1nXtumTW1mDOCJ4TzJ2LV9XU4cBAjVgMZMbMFydVILujKLQ7zo+
	rkVSk=
X-Google-Smtp-Source: AGHT+IF4/p9h31NSUo1ZrLpsC4/HMuMrEtQruEgKyI7OaJlvUq2z/r/6N19/PUGAwAUvJ1fjHTYvrw==
X-Received: by 2002:a17:903:a8b:b0:265:89c:251b with SMTP id d9443c01a7336-290273ef081mr70781625ad.29.1759975137149;
        Wed, 08 Oct 2025 18:58:57 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:56 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 13/18] riscv: alternative: Add an ALTERNATIVE_3 macro
Date: Wed,  8 Oct 2025 18:57:49 -0700
Message-ID: <20251009015839.3460231-14-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185857_980488_237361DF 
X-CRM114-Status: GOOD (  13.61  )
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

ALT_FIXUP_MT() is already using ALTERNATIVE_2(), but it needs to be
extended to handle a fourth case. Add ALTERNATIVE_3(), which extends
ALTERNATIVE_2() with another block of new content.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Fix erroneously-escaped newline in assembly ALTERNATIVE_CFG_3 macro

 arch/riscv/include/asm/alternative-macros.h | 45 ++++++++++++++++++---
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 231d777d936c2..2d79abecf9a87 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -50,8 +50,17 @@
 	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, "\new_c_2"
 .endm
 
+.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
+				new_c_2, vendor_id_2, patch_id_2, enable_2,	\
+				new_c_3, vendor_id_3, patch_id_3, enable_3
+	ALTERNATIVE_CFG_2 "\old_c", "\new_c_1", \vendor_id_1, \patch_id_1, \enable_1 \
+				    "\new_c_2", \vendor_id_2, \patch_id_2, \enable_2
+	ALT_NEW_CONTENT \vendor_id_3, \patch_id_3, \enable_3, "\new_c_3"
+.endm
+
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
 #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
+#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
 
 #else /* !__ASSEMBLY__ */
 
@@ -98,6 +107,13 @@
 	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
 
+#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, patch_id_2, enable_2,	\
+				   new_c_3, vendor_id_3, patch_id_3, enable_3)	\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, patch_id_2, enable_2)	\
+	ALT_NEW_CONTENT(vendor_id_3, patch_id_3, enable_3, new_c_3)
+
 #endif /* __ASSEMBLY__ */
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, CONFIG_k)	\
@@ -108,6 +124,13 @@
 	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),	\
 				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2))
 
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, patch_id_2, CONFIG_k_2,		\
+				  new_c_3, vendor_id_3, patch_id_3, CONFIG_k_3)		\
+	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2),	\
+				   new_c_3, vendor_id_3, patch_id_3, IS_ENABLED(CONFIG_k_3))
+
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLY__
 
@@ -118,11 +141,17 @@
 #define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
 #define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	ALTERNATIVE_CFG old_c
+
 #else /* !__ASSEMBLY__ */
 
 #define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
 #define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	__ALTERNATIVE_CFG(old_c)
+
 #endif /* __ASSEMBLY__ */
 
 #define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
@@ -147,15 +176,21 @@
 	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, patch_id, CONFIG_k)
 
 /*
- * A vendor wants to replace an old_content, but another vendor has used
- * ALTERNATIVE() to patch its customized content at the same location. In
- * this case, this vendor can create a new macro ALTERNATIVE_2() based
- * on the following sample code and then replace ALTERNATIVE() with
- * ALTERNATIVE_2() to append its customized content.
+ * Variant of ALTERNATIVE() that supports two sets of replacement content.
  */
 #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
 				   new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)		\
 	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,	\
 					new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)
 
+/*
+ * Variant of ALTERNATIVE() that supports three sets of replacement content.
+ */
+#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2,		\
+				   new_content_3, vendor_id_3, patch_id_3, CONFIG_k_3)		\
+	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2,	\
+					new_content_3, vendor_id_3, patch_id_3, CONFIG_k_3)
+
 #endif
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
