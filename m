Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E7DC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8LY7goC1COuKrz5TRr7ERv67T5rGsq+z8cV7YoEPRo=; b=hRqGPCsSewPd2w
	4h7N3Nf/GfQJO+JQXDgYOqNpvks/0vOUtc4FzmSqOGb08WzE9+3uR8QYkJRiyYvAqIvtoNPOodMi/
	6Lf7LnGKcRVVcWO9L1tUjl2hrUbYz28bevBJbSqEwyM7IER0RuQyvJ5UAgBF+P5IACbt2lk2Eh7Ai
	8avIf2zFzjQboaJvdQBCIEt7IFJLVxQswELPgsqhIb+mIKMWbtcAz0hTiomcRj9Gqb8p+Z3efobuj
	PN46pbw7NJ8TGt6tiwthfhSm96t4pda+4XfI/3HM6TN/vIEM7CO2hqg0UQip8be9SRxIq6FuKRvBC
	m2Llxu+gV4lHQmJG1O2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSKa-00000006qcO-0LmJ;
	Wed, 26 Jun 2024 13:05:00 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSKV-00000006qaV-03n4
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:04:57 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso38253821fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407093; x=1720011893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhXCNVmR8P99l/LeuRhjy5KBZNQ4/EvtQCsDBcea+Tc=;
        b=e/1Vlx6rDHU1uKr3PDNUgAdLqkV5dtLkTfQ7AXc6XDAa/BIEPRrxGGG5yaE6J01x0F
         Pjck6l8FgxcRy4MocjAGBx+udaipGnK2xYGc7gecYxWtDLoTD3DneWxKfCPvJkNljC2b
         lS0GsCOZA2WuBd68D7WhA47Vmeq33j/EC1KmIyyXuYuqGaVv5aPq375DkhjA4q4tv54u
         zAjUwIeQd451fj3Z34JX/f2usEF+uBsGguMjGn2khrrv+UM+xaXae2ph5BMrlhbD11uB
         8Aq5RWTm71kyLIIWFENsffe/OLtQWAghDvcvxmrQKwcDcNoNDw9d5CzjNjQpWx0U4A8P
         qqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407093; x=1720011893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhXCNVmR8P99l/LeuRhjy5KBZNQ4/EvtQCsDBcea+Tc=;
        b=RzBQVUexpBDMCZa44MSdigy7+f6ZMx96mOX0RaGvk5Qua+oD0kSPXZeyqPE1Jx+34H
         5W27mFgnsbiJCsRixDkolp08UUVb+/jUVZAA91qDWhJxiobUPVnt7QrSq5cpcaShJQ3X
         BxASFxJP2Sn5M1Q5JJA/STYIEKrFCXpqQKAT8wGIPlvDOxrseErdaBIE1meEpoWuLLtS
         IGM8LrshvwKZmZrMYR2+0pCahCKEXOI9ivUw/J9NvFcXWk69Jm31gh+PHjxBHu3COSZK
         IhJ7Lu6Br6Uw8RHGNEXP3uP1hae/47kcK7QkjeEWudihvMQvD0csW/jN5Wo7TtOqRL/2
         cihQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5EzQwWjoGAZcibb718V24OHXeSH5vKl7YF9WV6eB6by/fmVq0v0gvloul23r/HgyojEheyv2Q9Ul6J6BH3f+HRUYq6c3x7/mukTusaXcL
X-Gm-Message-State: AOJu0YzkjcXRsR6dsX3t6eN8PWe8C0JtWPTckoNmALBp0FvSU9n0/6tB
	4toWbXyeNJSun8HrVwmNg1sILyg9dSz3UxWwXN9tlFW3vGAt4QPUCfNztlGulHU=
X-Google-Smtp-Source: AGHT+IGXVzg0cT42nAZtoqYsiJZ5s31h9gkqhz8eo+Ns1Bzdpb6n1iQQeyrD5Jr8Y6qR9urf80as6w==
X-Received: by 2002:ac2:596e:0:b0:52c:db7b:b463 with SMTP id 2adb3069b0e04-52ce186459cmr6385178e87.61.1719407093047;
        Wed, 26 Jun 2024 06:04:53 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c842468dsm25643865e9.36.2024.06.26.06.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:04:52 -0700 (PDT)
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
Subject: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
Date: Wed, 26 Jun 2024 15:03:38 +0200
Message-Id: <20240626130347.520750-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626130347.520750-1-alexghiti@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_060455_068511_D76E86F1 
X-CRM114-Status: GOOD (  13.27  )
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
 arch/riscv/include/asm/cmpxchg.h | 27 ++++++++++++++++++++++++---
 3 files changed, 44 insertions(+), 3 deletions(-)

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
index 808b4c78462e..a58a2141c6d3 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 
 #include <asm/fence.h>
+#include <asm/alternative.h>
 
 #define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
 ({									\
@@ -134,21 +135,41 @@
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
 ({									\
+	__label__ zacas, end;						\
 	register unsigned int __rc;					\
 									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
+		asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,		\
+				     RISCV_ISA_EXT_ZACAS, 1)		\
+			 : : : : zacas);				\
+	}								\
+									\
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
+	goto end;							\
+									\
+zacas:									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
+			append						\
+			: "+&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+	}								\
+end:;									\
 })
 
 #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
@@ -156,7 +177,7 @@
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
