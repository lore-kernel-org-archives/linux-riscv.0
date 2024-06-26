Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898FEC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMAXP8hyeYzicbev34/xXIrxkH/esWdbEfOkE5rmvKA=; b=u+4w9G1y03Hxoo
	Lrx65rVLhSR37GnGVYTWCFaZxHGDXEm0R1nWKdMf4rhP727lWIyFbQF8VEzLK/NCrUbCpAmA8ik8/
	WPEwOGllrif9Mki3zaBQUpGLebDIDnzrS2Z7e7GfcQwoRGycq1+UuFDtk6biESHjC+oxHoQZTszie
	eKiMz5EbNEtTxJQRXnLiQ/pOlzt9gpUo0OFvvu4EdUkr55lNDrcEqydZxmEPKdOr0//gbZA4oTMb9
	aDDrmc2Z6rU0UPnTipX1j+kMwmSnpopDNAcEipCDYSfZhshWYe/g7SqQWBf8YfTtdIJgfvjY9mPct
	Udeu75InWxb/ARX2WooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSPf-00000006tHR-3wEB;
	Wed, 26 Jun 2024 13:10:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSPQ-00000006tBi-3NDs
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:10:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42561715d41so1611675e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407399; x=1720012199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWrbp7YnSuSg4cTyCRLd07oshRok5ClJY3Zre9Kj0ww=;
        b=KCBzNdLJwrPZDLWKM6xMj9wE5nWZiySKkpKpcMrbEIDJr0pTvnkt+qbfnDQqavZSNY
         7dH6Bz3lVpJEVTSvu6BhtNgIQxwUJquKdCzeprXLybI5VkzJIn0P1g2hhPLkBRg5fvw+
         /Vi9R9vI5xEnb4k4eh/dHlRW2X7dLXTei2OjM4EJWPCzAqcdTFJwDdc1SbyL7on1RTV8
         TN1Z8mtYdxlYq35O3lI1zraGrFf1pu9YpxxFqs0oiuym9k04LKeXkXFvAWGr7dgKCOXG
         5kGv/0RQfADjnEeO1R7scdVCZUC6ephKOxsv/S4pGzei1Gu1akeDdyZR46lh8lV8oAuX
         F4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407399; x=1720012199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWrbp7YnSuSg4cTyCRLd07oshRok5ClJY3Zre9Kj0ww=;
        b=GqX7FJ3bfAA63cx6XGkzVo+uMafDiZugOWgNPt/87LnRYn0xE0cG3SCyDU5pEOwANE
         +QJ114GH34yUnsOW62B5uU0YC84kOA1+WECzzfBsv/dSaqFtP/OrJa0meqAtdsEDA8HN
         az9bMmGh9BdFnf1xZsfJiMc+e4imFhwD+/iUnswUOvw8rD4AdGnCKcv56VsKg9Un3cUL
         rdCRFCdG9UWlHBu5h2WXeoKVFFZrpsoHAIZVfbxxjY8KhI4ofuQDIuviEn0TpG+R/F6z
         xPBrUmJf5t7yrGLb/s/vxnHxjMQF03atkMNZnsPkU7/uZh5KEcnHVNYAB75rt6akKFVd
         QSow==
X-Forwarded-Encrypted: i=1; AJvYcCXXScutj0U9BDyiCSDMQJiggtVMhNXn5m182CQ4yK8FccQmfp568MewsUzAYh9pt60vsqsrwQsRoAg5oemaAEPuP9R8RMz0+0H6V8JCF81c
X-Gm-Message-State: AOJu0Yx+6PkGRHv+8Mib2fidclB+dod3Pon/abRKZNabhlxzdnwfCe5U
	Fc9x5uffI9zE63c4qI+uDSExacYnF/K51e3Xt1tDzmk967NrMZkMCJKs3bIKcIc=
X-Google-Smtp-Source: AGHT+IF1O9RqB95BpuZCH8OUjPkY7BW4xVu+M+7CZDEbvz5gp1RkR9X5IwXEN5r4vgMt231tIFpnRA==
X-Received: by 2002:a05:6000:1c4:b0:367:3404:1c06 with SMTP id ffacd0b85a97d-36734041cecmr473355f8f.20.1719407398822;
        Wed, 26 Jun 2024 06:09:58 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663ada0bdesm15712197f8f.113.2024.06.26.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:09:58 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 06/10] riscv: Implement xchg8/16() using Zabha
Date: Wed, 26 Jun 2024 15:03:43 +0200
Message-Id: <20240626130347.520750-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626130347.520750-1-alexghiti@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_061000_923104_CC4DAA11 
X-CRM114-Status: GOOD (  12.06  )
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

This adds runtime support for Zabha in xchg8/16() operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 33 +++++++++++++++++++++++++++++---
 arch/riscv/include/asm/hwcap.h   |  1 +
 arch/riscv/kernel/cpufeature.c   |  1 +
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index da42f32ea53d..eb35e2d30a97 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,8 +11,17 @@
 #include <asm/fence.h>
 #include <asm/alternative.h>
 
-#define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
+#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,	\
+			   swap_append, r, p, n)			\
 ({									\
+	__label__ zabha, end;						\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
+		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
+				     RISCV_ISA_EXT_ZABHA, 1)		\
+			 : : : : zabha);				\
+	}								\
+									\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -28,12 +37,25 @@
 	       "	or   %1, %1, %z3\n"				\
 	       "	sc.w" sc_sfx " %1, %1, %2\n"			\
 	       "	bnez %1, 0b\n"					\
-	       append							\
+	       sc_append							\
 	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 	       : "rJ" (__newx), "rJ" (~__mask)				\
 	       : "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+	goto end;							\
+									\
+zabha:									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amoswap" swap_sfx " %0, %z2, %1\n"	\
+			swap_append						\
+			: "=&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+	}								\
+end:;									\
 })
 
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
@@ -56,8 +78,13 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
+		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
+				   prepend, sc_append, swap_append,	\
+				   __ret, __ptr, __new);		\
+		break;							\
 	case 2:								\
-		__arch_xchg_masked(sc_sfx, prepend, sc_append,		\
+		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
+				   prepend, sc_append, swap_append,	\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..f71ddd2ca163 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_ZABHA		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5ef48cb20ee1..c125d82c894b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
