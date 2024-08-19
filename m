Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E221C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 21:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjj9LyPTd3OL3crxNflbPWDmFlu+PnxUnB/xrZWgpeg=; b=R23/58aPret2rr
	y4oTlQFwdfZnPbFK7a/zN59QlKNpjkfE/jfPIZlk7P5fnsipAM1pbguDB10xd0imKvkr4nDwEyBJq
	pyZp3mftRTcBWkJEZY8XD/o98vmOyL20flvs8MMOH1Gm1yr6PTNfqqoZxaP7RO8HswBj0dio8MIQh
	RjVdZcIh9swuzqZ6ZO2hUgHnjHlthlsmta7wq9CFg1biL89ru71jajWFhaqq+IqNfJJAJb0FlaWRR
	HnRSTw2ReGDm8IfU6cpMOLQnkk+/ZWH7roXScwgMdxG1SgdCUmn8p6u6DRHMsVMCdjAvNHE2YTmN3
	DQwctZT/+acAKB95Yy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg9tU-00000002yry-2KWq;
	Mon, 19 Aug 2024 21:26:28 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg9tR-00000002yqZ-44lM
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 21:26:27 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3dc16d00ba6so2916227b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 14:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724102784; x=1724707584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UcyC2KzgUuAPbEMyY4Gh9cCZwpRTc2lPZw0dHSPf2s=;
        b=yXA7b5crq6mglhwDnJivlpabAJZm1cDbspyuboQoWaw4Ghn++DxBNoc90ANesDW61m
         MYe+HEZ+1EyUhh6lEra0Uk65zcGanUo+BLdM7ZGEeCjCbZblvDj64ZwTH1QZfwQKLTtX
         B9UuAJ8foeiTqzymaBwnO5uZeeFVYdFesX7uuPIV+flbLnl4eSW2upumuq96/V9emfhO
         iOogxr4ZPK+PjZI8GJWzrapcvjR5keK6sGNmwsAxF8TU4HIqTM6rNlAgtXSOlBJVzRfr
         syxyvm7XjDJRt8ZZ52d54F2CSKicjyHjgejPzxcWzxiWTw0nPHISOGLeX/U7lt0I7Xcq
         snvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724102784; x=1724707584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UcyC2KzgUuAPbEMyY4Gh9cCZwpRTc2lPZw0dHSPf2s=;
        b=ZQdHSBfIgvw9fdiFUK/3p7vrh6h8E7yBt62ZTj8NuSvUZrn992zJ3U/J1XzVLMBkkW
         s0DGBk/CtdbCe1vxiyvgJHb0PfafUy/Txoxry7C5wQBnBODr1TfVY7w6D+vKGyBEsz5k
         4JcAE81wJ2xQDzjqJfKN0xrW87SwaIbvHoCr7JPFPcKrjabPQrhzi9KcPWhvdpvc42Ka
         oV185qgrHE+zC2xvxkxDIO19sA6OqaPYQdnEwhLqe0Ays2F9akvsYTi8FuOiE9InJ+Hv
         HIPwTuCQgmWty3tPgsJTeDq4h8w5sT9JTY5AlQm5PS9LL9YVWgdbU7jW0XTZUWJ1cpYM
         w4lA==
X-Gm-Message-State: AOJu0YyEPHkeA1e4cTOZP2pd+pefthoZau6jkYFlCmXuClPeqT8bGpeb
	mSYj/WRKh7cqq0WqljxX2Xm4zPutiO+7c9uio0cJtVsFMu8LUZ9K/fpOPZfc8ySjxcMpGi0tFdM
	t
X-Google-Smtp-Source: AGHT+IHIgcEsiy8Ch+EqdrZZobOJVRRKWVWIl2/Rix/gPJ3aa1O92NM9XG1o3nNsPb+Mw6ZC2nMd2Q==
X-Received: by 2002:a05:6808:179a:b0:3d9:2751:a207 with SMTP id 5614622812f47-3dd3ae1a4ecmr14774539b6e.44.1724102784159;
        Mon, 19 Aug 2024 14:26:24 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61e7bd1sm7004694a12.53.2024.08.19.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:26:23 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 3/6] RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
Date: Mon, 19 Aug 2024 17:26:02 -0400
Message-ID: <20240819212605.1837175-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819212605.1837175-1-jesse@rivosinc.com>
References: <20240819212605.1837175-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_142626_039096_361F391B 
X-CRM114-Status: GOOD (  15.80  )
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

Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED to allow
for the addition of RISCV_VECTOR_MISALIGNED in a later patch.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
V2 -> V3:
 - New patch
V3 -> V4:
 - No changes
V4 -> V5:
 - No changes
V5 -> V6:
 - fix accidental moving of check_unaligned_access_emulated_all_cpus out of the #ifdef
V6 -> V7:
 - No changes
V7 -> V8:
 - Rebase onto fixes
---
 arch/riscv/Kconfig                    | 6 +++---
 arch/riscv/include/asm/cpufeature.h   | 2 +-
 arch/riscv/include/asm/entry-common.h | 2 +-
 arch/riscv/kernel/Makefile            | 4 ++--
 arch/riscv/kernel/fpu.S               | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..e9295a56b3a5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -765,7 +765,7 @@ config THREAD_SIZE_ORDER
 	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
 	  affects irq stack size, which is equal to thread stack size.
 
-config RISCV_MISALIGNED
+config RISCV_SCALAR_MISALIGNED
 	bool
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	help
@@ -782,7 +782,7 @@ choice
 
 config RISCV_PROBE_UNALIGNED_ACCESS
 	bool "Probe for hardware unaligned access support"
-	select RISCV_MISALIGNED
+	select RISCV_SCALAR_MISALIGNED
 	help
 	  During boot, the kernel will run a series of tests to determine the
 	  speed of unaligned accesses. This probing will dynamically determine
@@ -793,7 +793,7 @@ config RISCV_PROBE_UNALIGNED_ACCESS
 
 config RISCV_EMULATED_UNALIGNED_ACCESS
 	bool "Emulate unaligned access where system support is missing"
-	select RISCV_MISALIGNED
+	select RISCV_SCALAR_MISALIGNED
 	help
 	  If unaligned memory accesses trap into the kernel as they are not
 	  supported by the system, the kernel will emulate the unaligned
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index dfa5cdddd367..ccc6cf141c20 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -59,7 +59,7 @@ void riscv_user_isa_enable(void);
 #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _validate) \
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
 
-#if defined(CONFIG_RISCV_MISALIGNED)
+#if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
 void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 2293e535f865..0a4e3544c877 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -25,7 +25,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 void handle_page_fault(struct pt_regs *regs);
 void handle_break(struct pt_regs *regs);
 
-#ifdef CONFIG_RISCV_MISALIGNED
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 int handle_misaligned_load(struct pt_regs *regs);
 int handle_misaligned_store(struct pt_regs *regs);
 #else
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 06d407f1b30b..71442b22efc8 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -64,8 +64,8 @@ obj-y	+= probes/
 obj-y	+= tests/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
-obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
-obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
+obj-$(CONFIG_RISCV_SCALAR_MISALIGNED)	+= traps_misaligned.o
+obj-$(CONFIG_RISCV_SCALAR_MISALIGNED)	+= unaligned_access_speed.o
 obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)	+= copy-unaligned.o
 
 obj-$(CONFIG_FPU)		+= fpu.o
diff --git a/arch/riscv/kernel/fpu.S b/arch/riscv/kernel/fpu.S
index 327cf527dd7e..f74f6b60e347 100644
--- a/arch/riscv/kernel/fpu.S
+++ b/arch/riscv/kernel/fpu.S
@@ -170,7 +170,7 @@ SYM_FUNC_END(__fstate_restore)
 	__access_func(f31)
 
 
-#ifdef CONFIG_RISCV_MISALIGNED
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 
 /*
  * Disable compressed instructions set to keep a constant offset between FP
@@ -224,4 +224,4 @@ SYM_FUNC_START(get_f64_reg)
 	fp_access_epilogue
 SYM_FUNC_END(get_f64_reg)
 
-#endif /* CONFIG_RISCV_MISALIGNED */
+#endif /* CONFIG_RISCV_SCALAR_MISALIGNED */
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
