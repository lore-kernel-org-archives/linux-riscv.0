Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E42C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dEPDv5rUWYe1ROf8zrdVaVv2ofK57U1vbUCzOW8hJfI=; b=EN6LNep7HGNro5
	rvWg7P0D2NYtcY3MKF3tGWE9m3VI6dkJknwVuCYDhiFbkHOgLhE/E9SaX0y5QCQLf2Tz9sV5YeUfK
	4Nk9gqiF+DEq5yVPyAZD9JlaIPzAysGm7dopuHEkE1THQtTSVEiguk5vbbthep82FrqaGEZVIit6H
	fm42Tg5WGTz7lj9OrRVlxFVWm8ElqnEg1LDV6jqtgWd7L8whyr7Z9PM8CzWBex1Uv0YkJ6U1bz+VH
	VjPsjN0KmRX4hBNpizrIIYXz9Jim7RFseBl3kQH1BccrLC8qtnaA5Bf7jZyO4zBdQIYOaPjKPe+wq
	NQTDbWgNUCh19mFHBgAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4ir-00000000WHj-1Hsp;
	Tue, 09 Apr 2024 06:12:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iW-00000000Vwb-1E6G
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:30 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso2538633b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643139; x=1713247939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uNeXG8cnKNkHDs5z+HyiJ2ZiLa62BNigh2TpBUq9FE=;
        b=nNxBv2RnIMsjyoFNRRJ7eOzTZWqUKYO1bSVkkWLPP3/6aDtLvVzebU8I0vH5fKyO2C
         pFf5h+HEPTMiY+hbhsEel+7nUfqj3MmtzvAXQwz/xn6jFpA96ZK5/CfTycg99mccUT70
         xVowJwr1Qii7tX6gpQ5G5DbMeXXATXqXbrKDCQCMKKPPg/UYuHz3zRojUaCTeUJG/OPp
         X9tlbO8ZMd1ud9zdxHc3q2RdzUFBTWqmBCa9qjuUUercndKf+92r23zrHXGTNEEPHiNx
         UVsyEFg55kmyXiOWkEhyUejGJ+6/bRs6KoN3LJxnoxT2ITN12clfV7EtgWtuDWeUNhBn
         c1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643139; x=1713247939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uNeXG8cnKNkHDs5z+HyiJ2ZiLa62BNigh2TpBUq9FE=;
        b=csVIlVCMayoTM/3Hvihrnoz+7fOvQ40FW491ElAlxl9VG3PWwit/So4+OE6lWhHwpd
         0MRDZvbi+XUWK7Y1HZfXTWodvpMRYkULq8VBocbqbun4p1P6nbW4FfCTHjrWzlx+Foue
         ANQpaPS93oNtGYOht8mwVJioRTA+k5MoMRohizRSw3xgJFWkBQjS7JmVT4W2IwzSLcBA
         OLQ1L0GxcNAFDVAIb6Nf9a2NY91i3WbAZz0xVJbYVAddc0vwGwngkq0YQ9FhwLTpFjxk
         iGXegLcPiHLyZ8Nd0JojapsSws8GczfTcTsl/zRuTlSgaAoBuT+04c08IeQIJYPxV+nv
         /8IQ==
X-Gm-Message-State: AOJu0YyGdxkbidq7PHIMurBuQAtIw7q71whWpgKQxqiRMiIAutpy06fY
	pCfIzA4DsmUMKnYd8LdDWWP7dl2jZcl8H0Ymje4CdrHkHHuHblxYRVy7DgXQUDuLzpQ+CI0PJJx
	i
X-Google-Smtp-Source: AGHT+IGfw5gGVpfgehYAjws0Ix22Cm1DN/qW9eRm+J9+S7AHD87B900xvYwa0hBVxmABGwIoWI7SCg==
X-Received: by 2002:a05:6a20:2d28:b0:1a3:57b4:ed1c with SMTP id g40-20020a056a202d2800b001a357b4ed1cmr12934235pzl.25.1712643139603;
        Mon, 08 Apr 2024 23:12:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 11/12] riscv: Kconfig & Makefile for riscv kernel control flow integrity
Date: Mon,  8 Apr 2024 23:10:42 -0700
Message-Id: <20240409061043.3269676-12-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231225_096875_DA43D2D8 
X-CRM114-Status: GOOD (  10.87  )
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

Defines `CONFIG_RISCV_KERNEL_CFI` and selects SHADOW_CALL_STACK
and DYNAMIC_SCS both so that zicfiss can be wired up.

Makefile checks if CONFIG_RISCV_KERNEL_CFI is enabled, then light
up zicfiss and zicfilp compiler flags.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig  | 36 +++++++++++++++++++++++++++++++++++-
 arch/riscv/Makefile |  6 ++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..5276598bb773 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -193,7 +193,7 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
 	depends on $(cc-option,-fpatchable-function-entry=8)
 
 config HAVE_SHADOW_CALL_STACK
-	def_bool $(cc-option,-fsanitize=shadow-call-stack)
+	def_bool $(cc-option,-fsanitize=shadow-call-stack) || $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
 	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
 	depends on $(ld-option,--no-relax-gp)
 
@@ -211,6 +211,30 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_KERNEL_CFI
+	def_bool n
+	bool "hw assisted riscv kernel control flow integrity (kcfi)"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp_zicfiss)
+	select ARCH_SUPPORTS_SHADOW_CALL_STACK
+	select SHADOW_CALL_STACK
+	select DYNAMIC_SCS
+	help
+	  Provides CPU assisted control flow integrity to for riscv kernel.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge. Shadow
+	  stack protection is a hardware feature that detects function return
+	  address corruption. This helps mitigate ROP attacks. RISCV_KERNEL_CFI
+	  selects CONFIG_SHADOW_CALL_STACK which uses software based shadow
+	  stack but is unprotected against stray writes. Selecting RISCV_KERNEL_CFI
+	  will select CONFIG_DYNAMIC_SCS and will enable hardware assisted shadow
+	  stack protection against stray writes.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This enables forward
+	  control flow (call/jmp) protection in kernel and restricts all indirect
+	  call or jump in kernel to a landing pad instruction which mostly likely
+	  will be start of the function.
+	  default n
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
@@ -639,6 +663,16 @@ config RISCV_ISA_ZICBOZ
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZICFILP
+	bool
+	default y
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfilp)
+
+config TOOLCHAIN_HAS_ZICFISS
+	bool
+	default y
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+
 config TOOLCHAIN_HAS_ZIHINTPAUSE
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 5b3115a19852..ae156e37e886 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -58,8 +58,10 @@ else ifeq ($(CONFIG_LTO_CLANG),y)
 endif
 
 ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
+ifndef CONFIG_DYNAMIC_SCS
 	KBUILD_LDFLAGS += --no-relax-gp
 endif
+endif
 
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
@@ -78,6 +80,10 @@ endif
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
+ifeq ($(CONFIG_RISCV_KERNEL_CFI),y)
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFILP) := $(riscv-march-y)_zicfilp
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICFISS) := $(riscv-march-y)_zicfiss
+endif
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
 KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
