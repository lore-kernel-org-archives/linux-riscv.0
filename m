Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F64CC25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 15:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWCxwB9XFyETAHK1HRiUp6H4pxyCWxzrTjnLxwLRIHg=; b=BFHwOjjbGWDj9A
	F/dTZzTFllGeFZAUzYpkbFEnGj5HO+Mta2AQnXw/p7xf28RNul30Is/JsrqwNkC7OZU96VJz9XWD2
	SdKuPYbyTV3t6Y6kAOUZIp63q6HWDnTrXLk5+kLQUinxrmzOK1yZqL8kwwrDkiCxZw2r5JeOE7hUv
	EyPVgKES4tbQCFbi1cycs9ABJ5NOQ4oFB9CRNzeK/cytoC9YvEZvM4DK+Xi8FRzZgCZ5c+24mGYpQ
	6EOOKrIIVpWsVPnE/FocnDSpfHmo+wRk2jAlh3eHhhw/7fhXSqT65TlZfg4e/9zLUzfoCNudH4J7f
	1DvZiv6kBxD4SdlZ9mvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByUc-00000001AU0-2PuM;
	Tue, 28 May 2024 15:12:03 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByUZ-00000001AR6-1iAm
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 15:12:00 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2e72224c395so9038151fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716909116; x=1717513916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqY2tac92Zgdj6EN5vhDUCiGPySLtAUcYkNNT11YFiQ=;
        b=rQZ2CN0zTFs03+7GeXU81kmTobO4YHh9HZrEAvDceZj2gUSktvfBy16ByKH33jN5nb
         H4grava4YEjkRMVpAerOtXBRe0bhXwKPm0znHVdDb0XNVYUtmddjqweimttFJKmptL/1
         vLSoxqV3IKNRL8XNVQvkYRIjz5+Rw1sDG93jGXOmG94hunfICSDotTz22+P/Ng5K2IvC
         xtwbGRSaQH9zP1vsR953DWzkzCX3AyFf7JowlAz3a5hyGdvv4C9D7U7ccp3hrdws3yoH
         U0lsBKvx8CJQrDHQh+7Rol7BjuR6Gm5gDRx18RGA5Dr20nCVaJa8Gas9TeydtE4u6e+f
         2yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909116; x=1717513916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqY2tac92Zgdj6EN5vhDUCiGPySLtAUcYkNNT11YFiQ=;
        b=ur02jDh1WO9KybRi0N5exPw2DY9Y19aQLdQRTWtBR48m1i9Yrb8dtrl5Ezlcq4/U81
         4z+ZgH8vAXZ7XTCKB5cGJNJMOXT8ezS6RS1D9qU7b7jR5Mo5Fo/Xp7v9e9ZQTHf0RqVp
         z6OK4WjiK40hznuebzsndb67BzdP/MhNMZ+sr5O1Xkptumj5AeFTC8gTdB9fjVI5xBD1
         APcAmFrnprWWuruVJDGid+L4ADfnjuYEDnj93cE/IEu2GuSwunBHm2GgqKTdYffDV9JI
         X5jMDxpDSCYeRe581w91bhdtv20YsS9Kc0wKTUdov/DyDiroHhDNzxX4n44/0p2rsbT5
         TXhg==
X-Forwarded-Encrypted: i=1; AJvYcCUj6584P+JSJIBBmWenGuFo7GylAE5EawdMCrH2c6ocZsWpJjgBnW5acQTBx+0Mie3GwLPFvC+oc8r6ZX8slSCHAf0HHHn4QakdXWraRAio
X-Gm-Message-State: AOJu0YzTdlRbenxnnD55WsIdNGlKBkiOJm4M6vMVEPfxIrNjNjA8fq4N
	r6xQ5vzUrCMzG+XxWbemBRdBCGhcSSpYqKnwrvZ60feOpO5W5b/Nee08IzG9OSQ=
X-Google-Smtp-Source: AGHT+IHCYhHKhCYiIOYwsJcUm7AY7hiBzh9j+j/t9IO5zqkvCwOqxf6clogJ5Pwo0VQvo1ymN8/SHQ==
X-Received: by 2002:a2e:b0ed:0:b0:2e7:28ea:3c9d with SMTP id 38308e7fff4ca-2e95b2792f6mr65981801fa.51.1716909115927;
        Tue, 28 May 2024 08:11:55 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ef1207sm176823805e9.10.2024.05.28.08.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:11:55 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: [PATCH 1/7] riscv: Implement cmpxchg32/64() using Zacas
Date: Tue, 28 May 2024 17:10:46 +0200
Message-Id: <20240528151052.313031-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528151052.313031-1-alexghiti@rivosinc.com>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_081159_497307_6B9BED57 
X-CRM114-Status: GOOD (  12.26  )
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
 arch/riscv/Makefile              | 11 +++++++++++
 arch/riscv/include/asm/cmpxchg.h | 23 ++++++++++++++++++++---
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8a0f403432e8..b443def70139 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -579,6 +579,23 @@ config RISCV_ISA_V_PREEMPTIVE
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
+	  Adds support to use atomic CAS instead of LR/SC to implement kernel
+	  atomic cmpxchg operation.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 5b3115a19852..d5b60b87998c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -78,6 +78,17 @@ endif
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
+# Check if the toolchain supports Zacas
+ifdef CONFIG_AS_IS_LLVM
+# Support for experimental Zacas was merged in LLVM 17, but the removal of
+# the "experimental" was merged in LLVM 19.
+KBUILD_CFLAGS += -menable-experimental-extensions
+KBUILD_AFLAGS += -menable-experimental-extensions
+riscv-march-y := $(riscv-march-y)_zacas1p0
+else
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
+endif
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 4d23f0c35b94..1c50b4821ac8 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 
 #include <asm/fence.h>
+#include <asm/alternative.h>
 
 #define __arch_xchg_masked(prepend, append, r, p, n)			\
 ({									\
@@ -132,21 +133,37 @@
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
+#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
 ({									\
+	__label__ zacas, end;						\
 	register unsigned int __rc;					\
 									\
+	asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,			\
+			     RISCV_ISA_EXT_ZACAS, 1)			\
+			: : : : zacas);					\
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
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amocas" sc_cas_sfx " %0, %z2, %1\n"		\
+		append							\
+		: "+&r" (r), "+A" (*(p))				\
+		: "rJ" (n)						\
+		: "memory");						\
+end:									\
 })
 
 #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
@@ -154,7 +171,7 @@
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
