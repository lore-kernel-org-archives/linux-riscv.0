Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B367C25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OR2F9bLLoNCgOQjGpC0kyjHw15qaxZjH1M8r9h1yYg=; b=AWTY4X3jtfn+dB
	3nki2sUiLmfT5HBp6BgcaRkB4Pi61ir1McEDXQ1lDSSIYo+TKi+wbK/WTqUe5jxu9OHeexav+T00A
	9LfuRDRe0C3CfDP01rh6GOaAw4Bunj9H5tl37lsqEHQZJccBf7gMiZGvV+MwZ1NQqZmE/d2WjQgc4
	fS9cjA/iy53VxS+sz71eRI3bwrjFe3Wi6c0kHxxPOx9KBg/JOU1KGash4a7NGloCi/i0o7XAltc5f
	0WH398s9BSco70WsG5PuHFu5+Zx9rl7FMu+jTm/sMy3UvPPqvh69b+ZNpD3i08iaJcGIpNcAcZ5Vy
	dJ2CeOyT7ctK+GkYum9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByVh-00000001Atp-2cCl;
	Tue, 28 May 2024 15:13:09 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByVe-00000001AqD-027E
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 15:13:07 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2e73441edf7so9554301fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716909177; x=1717513977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVgeqawgxJKFwBkPgG+fq6QiuKdnJgEdRIwxDEWsZ4Q=;
        b=JhKX+BePkeZexBP8gVTWonFL8gqo0xCip7v7KUZKGDoCEUsqYG39c+oIDRMWARVM7P
         zTsccKGNa37Om8P8yR/JZqiVF9YdcGztB6cXWoPxmtaLryamM9jP4DumbVSCZKk+++IY
         ZJy+yUyXUDQ8c45dV4OhOJAziGOK3nvo4oq9Fu67kwMjkLnwfM/Zre6UNTVVuoj4PFIO
         +xzwOSmkAqYFS0M3D8XxddMqaUwY6c4rrgJkqdK97UWQqEwEkr5GxAOgRCaaLw8JyvJA
         6lRvBZXAEWNIxwgn03J+fFTmk58Yl73IqibhoTTobdny1EJ8vx3Gf3TrhCNJZj5mBIo9
         LSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909177; x=1717513977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVgeqawgxJKFwBkPgG+fq6QiuKdnJgEdRIwxDEWsZ4Q=;
        b=KShKnJX1z6QM81U3gSBXfV570zzcqFlJr2iVqJKzyz58cRKIzLdczn0Ap7Ad629xA3
         uQkEWBDW+tGcWa1/QED5Chw1+qBEvyT+HrSMTZYpjyaebxtidXntjOUoutUBhrP7s93B
         OtulZ3jIlKxhG3qYaZbLvq3l6r+b8rq7XeMu2dIN5v+Yly2HXO7sq3zYgnPiMmXUH/6H
         cVEW0ogkJ6hcnQsvlNE+5M+q2CgQSWBumLV37H0SUZ5NSwQ0loLBpA4ikQBguGp0aVgd
         eCkqKZr+5nQRJb8r18Ul4iXc5mqgiISwTCiyXZvrxBu3dWXgGLWDEcbN6kNQxcC3lDu1
         gAuw==
X-Forwarded-Encrypted: i=1; AJvYcCVKLr/26PsuT9zLGABmjGudPsaO82R0gdbOpK3Dt5P5aRK7VqQKNGR8ZgAl9plGUqVM9JYrm9Hfv/6XPpXw8+V1ql5f9zChZIiF3Q5CCstO
X-Gm-Message-State: AOJu0YyFGIK9PoLLr/agKEeqesrn0aYNjv6aiXGSqLo8CO+llhFbLTYM
	VzeZwqzYGmF6MySllYAI7hEEO17UYSKtSPIxbRmCqOFfnKYVmjk6EbWANDh6kaQ=
X-Google-Smtp-Source: AGHT+IG/weMgFc40n3U80f7qsiGYCL5GCfV3H84Qfrnd5vO+VgM5LRY1gz81bmewik/+pxslmkrhfw==
X-Received: by 2002:a2e:9953:0:b0:2e9:843d:63e5 with SMTP id 38308e7fff4ca-2e9843d643bmr22338201fa.0.1716909176965;
        Tue, 28 May 2024 08:12:56 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210897c6bbsm146607535e9.27.2024.05.28.08.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:12:56 -0700 (PDT)
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
Subject: [PATCH 2/7] riscv: Implement cmpxchg8/16() using Zabha
Date: Tue, 28 May 2024 17:10:47 +0200
Message-Id: <20240528151052.313031-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528151052.313031-1-alexghiti@rivosinc.com>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_081306_078902_5DF03C1F 
X-CRM114-Status: GOOD (  12.77  )
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

This adds runtime support for Zabha in cmpxchg8/16 operations.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig               | 16 ++++++++++++++++
 arch/riscv/Makefile              | 10 ++++++++++
 arch/riscv/include/asm/cmpxchg.h | 26 ++++++++++++++++++++++++--
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b443def70139..05597719bb1c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -579,6 +579,22 @@ config RISCV_ISA_V_PREEMPTIVE
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
+	bool "Zabha extension support for atomic byte/half-word operations"
+	depends on TOOLCHAIN_HAS_ZABHA
+	default y
+	help
+	  Adds support to use atomic byte/half-word operations in the kernel.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZACAS
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index d5b60b87998c..f58ac921dece 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -89,6 +89,16 @@ else
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
 endif
 
+# Check if the toolchain supports Zabha
+ifdef CONFIG_AS_IS_LLVM
+# Support for experimental Zabha was merged in LLVM 19.
+KBUILD_CFLAGS += -menable-experimental-extensions
+KBUILD_AFLAGS += -menable-experimental-extensions
+riscv-march-y := $(riscv-march-y)_zabha1p0
+else
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZABHA) := $(riscv-march-y)_zabha
+endif
+
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 1c50b4821ac8..65de9771078e 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -103,8 +103,14 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
+#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
 ({									\
+	__label__ zabha, end;						\
+									\
+	asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,			\
+			     RISCV_ISA_EXT_ZABHA, 1)			\
+			: : : : zabha);					\
+									\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -131,6 +137,17 @@
 		: "memory");						\
 									\
 	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+	goto end;							\
+									\
+zabha:									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amocas" cas_sfx " %0, %z2, %1\n"		\
+		append							\
+		: "+&r" (r), "+A" (*(p))				\
+		: "rJ" (n)						\
+		: "memory");						\
+end:									\
 })
 
 #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
@@ -175,8 +192,13 @@ end:									\
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
