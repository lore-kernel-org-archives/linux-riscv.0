Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CE4C3DA60
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wu+emxUvN/CLXUOaxwKsNRvNWNpi6A5jAApcRgUjc4=; b=EMRUnQMmA6lg3i
	E78zoLBMShh0CMq+1QIyho+Vl8i6lABgSncgekrvCTV8z7pDpFX4273ufzeyjn1uvEH8BrF7pdH7R
	0QpeXkeucCu5zUWOkvIVYyZlPXaKmQmFMDnXQkF7Pj6kJ7esBERs1v7ZmaMtC/NbFnJ4eplqRSj24
	cUOYm978QgTMhPkCCw6dkzoQQq9sV9Z4p7bm8TIWvygqTDgqKtk9m02vo1Jykiv0/NCuJvvpNzGxH
	PbBMblGkEPzjjeuEQ8sNLcJYqsiNvLjoZfVCtLVrV+qNvb73KAMvOrbhRyDXNrKj7LcaovLjdIlsA
	mgYy78JI5Z9preJ6Nrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy4C-0000000CoP8-0Ywb;
	Wed, 17 Jul 2024 06:23:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy49-0000000CoNR-140R
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:23:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-426526d30aaso45401695e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197384; x=1721802184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QjpPjoLwI+58peQzByots6FWlw3e8eiNriVwaJAk3o=;
        b=mOrGhL/uPYUD7YNwrPqX2Ze5sbZH/+JdOM1YsWzEmMPm6cCXwrOa56v0GE1TxQ9hGf
         bDxeGT9Ji00O7py//MWMBRI8ys3sBXPOAoHWT1IUz/5CYm2mt1S4SUaETsmBkoYiBkoJ
         ftST/soXmSPZdyZJKmy0ZgwUEQn2WP2pd3s9kc2FLmRTPsijTDeV74KysrsEJoalbZmS
         cPnf45FY3/S8bVwgvEF3oJm26aoigF6uqUcQmV6852x+H5lp2Hb+HLMKfZFnzZpPomzs
         CyVHYMJTUha0QrSR26U650QZayUeSMKTn5az+an8r0iAsy0ICURzobc/UjjCf2RA+fBj
         1E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197384; x=1721802184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QjpPjoLwI+58peQzByots6FWlw3e8eiNriVwaJAk3o=;
        b=rg0SVlaCBCMOwvq6kuAgwOenkoFtxQS2g5Q0MM/uhj0Ph9f8JWn7VzF3tGdoH8PCNp
         G/OXbAIMqaR9J7CADDD8QrcfEV2m2hDJ/aAuwKT3umHZknjmeBsMhqNcnr4U/OMsyv5E
         IPNGoQinrF3ii4K1K3v83xJQfp9HTk8rjB3U1mHU2XVz/+MDdrMW2wxDnTdKw3mQHw9U
         /K+aSgRYRyjW3/kC5K4PrpkM280DDvMP3VfEKaNodSPKCbvOMWM7+z4l2oo6TqVhe0x6
         q6RljI9QpZd/j5mHFs1fxiopj3ix+cTjr3LQ9TF3UqrGZDziLFd3tIKlSIYeMTPofYsL
         n8cA==
X-Forwarded-Encrypted: i=1; AJvYcCWfiN80HSpV6jNcsQ6cyPT57e1ULhlIYnhOLjisAge72j/s3l7plF4gBmAeIvf4rZ4MO6P56ZFEn9Iw42ZsxpXKFXsMoDK/+ENdgmCgTqt+
X-Gm-Message-State: AOJu0Yy8OMsrGwKkUDnYLe28odIPsaMm2Ca6wPGDr0+woM1QEPHQbWGr
	GwcQQkzB5WYiNmfrKICdqamX8r3M3FKCB8iuscCsf6mlz9QWV3iMg6fRX2wCYQk=
X-Google-Smtp-Source: AGHT+IFPLb6pDwn4ZT2PDYb1qbrSJD7FUpoL0IeRpIU13kaHx3oluVLPGx9Y3b3221ag/XCVCbja3g==
X-Received: by 2002:a05:600c:3592:b0:426:5dca:50a with SMTP id 5b1f17b1804b1-427c2ce6539mr4895335e9.21.1721197383614;
        Tue, 16 Jul 2024 23:23:03 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db03e41sm10773043f8f.98.2024.07.16.23.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:23:03 -0700 (PDT)
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
Subject: [PATCH v3 03/11] riscv: Implement cmpxchg8/16() using Zabha
Date: Wed, 17 Jul 2024 08:19:49 +0200
Message-Id: <20240717061957.140712-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_232305_321187_9C4AAE21 
X-CRM114-Status: GOOD (  15.49  )
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

This adds runtime support for Zabha in cmpxchg8/16() operations.

Note that in the absence of Zacas support in the toolchain, CAS
instructions from Zabha won't be used.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig               | 17 ++++++++++++++++
 arch/riscv/Makefile              |  3 +++
 arch/riscv/include/asm/cmpxchg.h | 33 ++++++++++++++++++++++++++++++--
 arch/riscv/include/asm/hwcap.h   |  1 +
 arch/riscv/kernel/cpufeature.c   |  1 +
 5 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1caaedec88c7..d3b0f92f92da 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
 	  preemption. Enabling this config will result in higher memory
 	  consumption due to the allocation of per-task's kernel Vector context.
 
+config TOOLCHAIN_HAS_ZABHA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZABHA
+	bool "Zabha extension support for atomic byte/halfword operations"
+	depends on TOOLCHAIN_HAS_ZABHA
+	default y
+	help
+	  Enable the use of the Zabha ISA-extension to implement kernel
+	  byte/halfword atomic memory operations when it is detected at boot.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZACAS
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 9fd13d7a9cc6..78dcaaeebf4e 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -88,6 +88,9 @@ riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 # Check if the toolchain supports Zacas
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
 
+# Check if the toolchain supports Zabha
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 5d38153e2f13..c86722a101d0 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -105,8 +105,30 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
 ({									\
+	__label__ no_zabha_zacas, end;					\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
+	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
+		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
+				     RISCV_ISA_EXT_ZABHA, 1)		\
+			 : : : : no_zabha_zacas);			\
+		asm goto(ALTERNATIVE("j %[no_zabha_zacas]", "nop", 0,	\
+				     RISCV_ISA_EXT_ZACAS, 1)		\
+			 : : : : no_zabha_zacas);			\
+									\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amocas" cas_sfx " %0, %z2, %1\n"	\
+			append						\
+			: "+&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+		goto end;						\
+	}								\
+									\
+no_zabha_zacas:;							\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -133,6 +155,8 @@
 		: "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+									\
+end:;									\
 })
 
 #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
@@ -180,8 +204,13 @@ end:;									\
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
+		__arch_cmpxchg_masked(sc_sfx, ".b" sc_sfx,		\
+					prepend, append,		\
+					__ret, __ptr, __old, __new);    \
+		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, prepend, append,		\
+		__arch_cmpxchg_masked(sc_sfx, ".h" sc_sfx,		\
+					prepend, append,		\
 					__ret, __ptr, __old, __new);	\
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
