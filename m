Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F31C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEnTsYUISvRTjIGWDLSSYp8Nhh1CbrO9Hzh6z4zVE+g=; b=yklTvWFy03Y/vQ
	jpTiBr/X1whiuR+qJOE0T/u3tS2D4j2Dq7RDZaBh54vxDHPVQ4rlDTbhavdWJqURfw6XSB+rR7uwP
	gWKpeNZkYCCGRYSgVy9+vhd3QADyK97VWWMxSDTBcfxg11ybXL32x5ZtRudT72v11MJe5tXIpyaUh
	nzVzMhYmpdBBpUl2PW/UnnEfvTq6+X2ZaebecK3FHKMHtDGbaOk0CQsEaLxsD4LyqacwY+CI58tKd
	3TORzSQK81yqxuYYydArvJQFZkveV+jE6gk4WJuHBsFvBYBv8Na1vHKsX7or4CO0bPvzYORJNg09i
	v4IYlpZZaE1ZtR+qvWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy2E-0000000Cnns-3NE1;
	Wed, 17 Jul 2024 06:21:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy2A-0000000CnmV-3IyP
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:21:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso47640385e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197261; x=1721802061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObJKiPOVe5UThPd0qvfEFz5Dv3ABd72erfyOiynPtd0=;
        b=FbwPaMFQxklAkyxdzRoD1+XbT7su+CwnBjFLNNJtWIjZT99wpGNXve6SCipCf9MJxu
         heD5BD/o/MZb7/5oSaCPbsoXt4jWBG2eI4QiKtZE2k+iNwuDJ00HUYOXsCOzgsOK/8IP
         JLfsHBc4Dh8TyQtRch2ksmLU7zmFkitDMutHim1xawN+zOfsAXUrOuoNOGnmrULaMj99
         eAhI+vYt6+LiA0scFGZy8oOcVQU0oABt9jAVDr2LpokbwMo5jl0yQfsNsB26T/tHXuza
         TwilgYgBNAe0PMqwXssRLDUL6ZtvNqwAFEr7ZCTqFVQrCGnO1T8qFBpnCSaScFb7/UGR
         rBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197261; x=1721802061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObJKiPOVe5UThPd0qvfEFz5Dv3ABd72erfyOiynPtd0=;
        b=suKePcVqCUzPHN8zoe1xMUDaWUBDfx8LhYAma/Z/VrWTxaQUzkX695+Tmo40NDwvJx
         Tk78ID5HmnoXA+CxVxL1G9g0xy4Ee87ZH4nlAwN3bMyyFh7dhFdsGrC8/+pcgIf8Ru9a
         OG4A0XsS5ScsHf5AEPlSUNZIqP19M/kju8m3K3nvo3DqwBlmVL/LX5JCROJ8JjawGnvi
         UTVRIQp8l2fbCX6+bFh3FYCRPLTaR0KJ5QeX2Qfus8UdoApWXaSKAldlYsxaTw0YQjmX
         HJ3SIdvu7lrJhb4lTljv5sGtETBLGfXkYaVc0OUzoDtKbYqqzGDeXspVpLkepXFX2Z0z
         QooA==
X-Forwarded-Encrypted: i=1; AJvYcCWzzRBYmKLRBde26M2ZgL57jJv8w7iwbko/uJREtvYLWV1O4riZ79CH+yRoyB4rc+kYD2u2pO/IFTIhdILBzO1UB7d7oL3zgXGkmtTIHE8e
X-Gm-Message-State: AOJu0Yyfc6I04yzEI4ySDI93VWg8mBGMN3oPsOFNy5hc0W9y53MUQzph
	mMnaeliUbyt46QEqPSx870bMtQpBtNtCN9usXtZPS3oUGyeGa0YVcRIrRm5VDGs=
X-Google-Smtp-Source: AGHT+IEiqDUUVGHtWHIaIo4kIBhavsk6wpSjfOY4FyjkQmBFXrWWxjPRklD8XBy60kYG9vsl83pQBA==
X-Received: by 2002:a5d:6a8c:0:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-36837ac4476mr188365f8f.31.1721197261060;
        Tue, 16 Jul 2024 23:21:01 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3cd1sm10867433f8f.22.2024.07.16.23.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:21:00 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v3 01/11] riscv: Implement cmpxchg32/64() using Zacas
Date: Wed, 17 Jul 2024 08:19:47 +0200
Message-Id: <20240717061957.140712-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_232102_838877_F7F2814C 
X-CRM114-Status: GOOD (  12.49  )
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

This adds runtime support for Zacas in cmpxchg operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig               | 17 +++++++++++++++++
 arch/riscv/Makefile              |  3 +++
 arch/riscv/include/asm/cmpxchg.h | 26 +++++++++++++++++++++++---
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 05ccba8ca33a..1caaedec88c7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
 	  preemption. Enabling this config will result in higher memory
 	  consumption due to the allocation of per-task's kernel Vector context.
 
+config TOOLCHAIN_HAS_ZACAS
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZACAS
+	bool "Zacas extension support for atomic CAS"
+	depends on TOOLCHAIN_HAS_ZACAS
+	default y
+	help
+	  Enable the use of the Zacas ISA-extension to implement kernel atomic
+	  cmpxchg operations when it is detected at boot.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 06de9d365088..9fd13d7a9cc6 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -85,6 +85,9 @@ endif
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
+# Check if the toolchain supports Zacas
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 808b4c78462e..5d38153e2f13 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 
 #include <asm/fence.h>
+#include <asm/alternative.h>
 
 #define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
 ({									\
@@ -134,21 +135,40 @@
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
 ({									\
+	__label__ no_zacas, end;					\
 	register unsigned int __rc;					\
 									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
+		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
+				     RISCV_ISA_EXT_ZACAS, 1)		\
+			 : : : : no_zacas);				\
+									\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
+			append						\
+			: "+&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+		goto end;						\
+	}								\
+									\
+no_zacas:								\
 	__asm__ __volatile__ (						\
 		prepend							\
 		"0:	lr" lr_sfx " %0, %2\n"				\
 		"	bne  %0, %z3, 1f\n"				\
-		"	sc" sc_sfx " %1, %z4, %2\n"			\
+		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
 		"	bnez %1, 0b\n"					\
 		append							\
 		"1:\n"							\
 		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
 		: "rJ" (co o), "rJ" (n)					\
 		: "memory");						\
+									\
+end:;									\
 })
 
 #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
@@ -156,7 +176,7 @@
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
 	__typeof__(*(__ptr)) __new = (new);				\
-	__typeof__(*(__ptr)) __ret;					\
+	__typeof__(*(__ptr)) __ret = (old);				\
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
