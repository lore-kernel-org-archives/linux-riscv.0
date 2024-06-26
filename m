Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A26C30659
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFFj7mXgAXKlMXQPxX7PagnBg8KDRV4St7YY60jbbBE=; b=QH4QrJqsK14Ap+
	lZYgZpihgic0jY47onb+FE79zd1fm8+SK9KMVf0a+dWsqRf6sb6Ykr7ik8C+7yFm2fWcQrlqhjfln
	hQLXZNDqn1pdeZzjCoRXoDauHKOPQP/VIHSF+koGST+slULimieGCsTuRHO+ZLiMRj/b3tMfl7num
	mhIA2XaKiOGBw6eZho1MtAtJ33CM3XEY2IayKZ1TwYiij2EKgX1aQzx0ppq12zlTOJo2w0kcxMPJt
	AVKOWf9Pmf8vvRsv2OsgjXF750YInvjCJ3mliM5XY/diEXJcrlHI/FF5IXsh8dAUzP7I/DPIFfViS
	0gsZAwVB33F5K5msa2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSO9-00000006sYU-14Qc;
	Wed, 26 Jun 2024 13:08:41 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSMT-00000006rcx-2eh5
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:07:00 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ec408c6d94so75541231fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407215; x=1720012015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr0+ChkIZxO95Fw/MskGbHkedxBPmtMPKffgsaSfjcQ=;
        b=PrVrn+t9+YnQXDlWKpxyAHQSa/6a1CM4eoF8UZaqRuSGF8IgsRUSDrWv+Z6ZU1oP+/
         Rr/kFbJHy+6ymPTgHS9gGWOzj/ZpddLXfRhLn8D7NbJlNs7Ju4UaKH6hYj5kkvmi1+tH
         UZajJ1OJ9U6ipzQh3O0SznKOU2F2CletsEd48r8EsLQ7eFZOrMLSJSTAGIDbwTZtcHWa
         PUlBHHfIQTO7JXcQA2QPIikmiPRuwC8XFj9Z1jX0p3vHcSyjLcM6ZHILgdKGBgEjEMfn
         hm4QAWtwz5DKLKOspVoX8dhPZ1Yq1ZTjsLC8XRXzoe5JOPtVQ1/icKvkTjUfgpgd4EiP
         DlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407215; x=1720012015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tr0+ChkIZxO95Fw/MskGbHkedxBPmtMPKffgsaSfjcQ=;
        b=Lpr9DuLPoi6gHTCCEDKqoQDtJZpEnUYnswuSGZAMTcEWgJD/E5r595EbIOS1+eejmP
         /IQPtqNj0RdexxR41ovwgbuwea0jl0T1cITAFqhH6dRMAsNIpBRRycuMSt6de1c0OJAj
         VhCzDLPVj3+tf+d+0kl6XqsffHoNYHLMCwlAQz2t5CuqyQWTxf1L5IwCdw/GXOCPOxOm
         AD2WXdRNAWDc9MgYGuntPSTrrkA2/0DSzW33bosJYjGBHj7MG74huXBmP7ZAMFbQt05p
         Oi63iZf0UXkCkqEjD4oV29YEuYZ/+R7WUXn229aI01CaMFvrV+bxwI9oUHPCoJQwOfIl
         9iIw==
X-Forwarded-Encrypted: i=1; AJvYcCU8SshbJ7ufhSTC+jaZP8RuJ8WVFLIf8ttcGHh+hDI+EZjZLphPyFuDyBS4SIEQVBG52JQjMYcf6dN7NxsymedaDddq8xBzJmAhXDjisIoA
X-Gm-Message-State: AOJu0YybnIm9C+54mcl2jw/09H6IW7tBFypR01r6OjwXb9VHCLopNiIx
	8oU9UZxL7GhwTKq4OGh/JikKDR1GIqj8VsieFLbG8Z2Gahl9Sm3F0bMoIUTkfJE=
X-Google-Smtp-Source: AGHT+IFc4UBrVIS7Rn9fDb0+V6vAa1vZLUOTYZ8/Eg+bWg3KUQ8/IYiEJJBiokMuSCcEt25man3iiw==
X-Received: by 2002:a2e:9b4d:0:b0:2ec:543f:6013 with SMTP id 38308e7fff4ca-2ec5931d86amr78335911fa.13.1719407215370;
        Wed, 26 Jun 2024 06:06:55 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c846a7e7sm25696035e9.45.2024.06.26.06.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:06:55 -0700 (PDT)
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
Subject: [PATCH v2 03/10] riscv: Implement cmpxchg8/16() using Zabha
Date: Wed, 26 Jun 2024 15:03:40 +0200
Message-Id: <20240626130347.520750-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626130347.520750-1-alexghiti@rivosinc.com>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_060657_952889_86A5292E 
X-CRM114-Status: GOOD (  13.06  )
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

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig               | 17 ++++++++++++++++
 arch/riscv/Makefile              |  3 +++
 arch/riscv/include/asm/cmpxchg.h | 34 ++++++++++++++++++++++++++++++--
 3 files changed, 52 insertions(+), 2 deletions(-)

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
index a58a2141c6d3..b9a3fdcec919 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -105,8 +105,20 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
 ({									\
+	__label__ no_zacas, zabha, end;					\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
+		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
+				     RISCV_ISA_EXT_ZACAS, 1)		\
+			 : : : : no_zacas);				\
+		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
+				     RISCV_ISA_EXT_ZABHA, 1)		\
+			 : : : : zabha);				\
+	}								\
+									\
+no_zacas:;								\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -133,6 +145,19 @@
 		: "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+	goto end;							\
+									\
+zabha:									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
+		__asm__ __volatile__ (					\
+			prepend						\
+			"	amocas" cas_sfx " %0, %z2, %1\n"	\
+			append						\
+			: "+&r" (r), "+A" (*(p))			\
+			: "rJ" (n)					\
+			: "memory");					\
+	}								\
+end:;									\
 })
 
 #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
@@ -181,8 +206,13 @@ end:;									\
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
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
