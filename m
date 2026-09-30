Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B99CA5FC7
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27VxDysyyDjt3IyCARmB1UrkUfVJSqz0WrqQK7Vuh54=; b=QOxTCPDc+3ADxl
	iptFaBQHUT36mp5/fbkcYGs6zBssf8s3GreS4VLkscoiB/K1JQYdz3ODMqFlHOYS2tVJCK/MJfxC4
	6w+02BsVcca/fagR8JSneiEKbJ63hlFJ7U2COgl3S12YKhRmZYi9/T168O2jYJ3yjho4EnQZxSb1d
	AXUBFlRQNSZNyLJ/mbQ4qeDl36/mhXAdaj0d8hHZty+uUdkFkaDaD1WJn5R4jbyAfvKPWCptvHO+7
	vs5Hg8fnJqBWKPEizpCGwSepnGNK68P1c6T0qy2FcX60iA1S9CYCNtxCLPYndsli3fP0m+MITQE1J
	ojHcXCiiDGnOYdJLT+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBunm-00000006CGs-3HZ2;
	Wed, 30 Sep 2026 13:56:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBunZ-00000006C98-1P8o
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 13:56:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA010406F9;
	Wed, 30 Sep 2026 13:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB0E1F000FF;
	Wed, 30 Sep 2026 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776600;
	bh=yd5cGIy40zPgbtjkYKjJ3IZAtCHr/KBUDHeznccL4Gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ni/FR3cBMDJ5Q0RPnb1Wtsl1pxklTYbWHdAcmoVZLUL0R2L7x7g45bAX+Qh3B6Odx
	 g7BBw4SfQ0eTj4IBIhtCagmLXyYJLLxmv/B1bAaHV/qVL+ZWrKr58+1pf5b2CXkpyo
	 eKWfHudElxHPQ44GjQmN5JDFQz/6+esbTY2cKinUwzVCb4XLOx1FVjhUe5YH0Z8Bnc
	 bMAEGWeNydd5GW+CZ9lyqbIrm3iHbIJxwOGXoi5QtQfMAvsANe0yH+6EXr5N5hnYGl
	 MtEZ1CPcxL8T1WSk+Bl9vjEuYXTCdPdeIIFN0cH9Gkw30dSaj9j9AdEU10+4S0LVlS
	 Cs3JSY4ilpwPQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 4/5] riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57
Date: Wed, 30 Sep 2026 21:36:27 +0800
Message-ID: <20260930133628.22093-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930133628.22093-1-jszhang@kernel.org>
References: <20260930133628.22093-1-jszhang@kernel.org>
MIME-Version: 1.0
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

In last commit, we have optimized the pgtable_l4|l5_enabled with isa
extension alternative mechanism, thus a typical access_ok(addr, 1);
is compiled as:

ffffffff8001dd30:	1141                	addi	sp,sp,-16
ffffffff8001dd32:	e022                	sd	s0,0(sp)
ffffffff8001dd34:	e406                	sd	ra,8(sp)
ffffffff8001dd36:	0800                	addi	s0,sp,16
ffffffff8001dd38:	00000013          	nop
ffffffff8001dd3c:	02a0006f          	j	ffffffff8001dd66 <foo+0x3e>
ffffffff8001dd40:	60a2                	ld	ra,8(sp)
ffffffff8001dd42:	6402                	ld	s0,0(sp)
ffffffff8001dd44:	57fd                	li	a5,-1
ffffffff8001dd46:	83a1                	srli	a5,a5,0x8
ffffffff8001dd48:	00a7b533          	sltu	a0,a5,a0
ffffffff8001dd4c:	00154513          	xori	a0,a0,1
ffffffff8001dd50:	0141                	addi	sp,sp,16
ffffffff8001dd52:	8082                	ret
...
ffffffff8001dd64:	bfe1                	j	ffffffff8001dd3c <foo+0x14>
ffffffff8001dd66:	0180006f          	j	ffffffff8001dd7e <foo+0x56>
ffffffff8001dd6a:	60a2                	ld	ra,8(sp)
ffffffff8001dd6c:	6402                	ld	s0,0(sp)
ffffffff8001dd6e:	57fd                	li	a5,-1
ffffffff8001dd70:	83c5                	srli	a5,a5,0x11
ffffffff8001dd72:	00a7b533          	sltu	a0,a5,a0
ffffffff8001dd76:	00154513          	xori	a0,a0,1
ffffffff8001dd7a:	0141                	addi	sp,sp,16
ffffffff8001dd7c:	8082                	ret
ffffffff8001dd7e:	60a2                	ld	ra,8(sp)
ffffffff8001dd80:	6402                	ld	s0,0(sp)
ffffffff8001dd82:	57fd                	li	a5,-1
ffffffff8001dd84:	83e9                	srli	a5,a5,0x1a
ffffffff8001dd86:	00a7b533          	sltu	a0,a5,a0
ffffffff8001dd8a:	00154513          	xori	a0,a0,1
ffffffff8001dd8e:	0141                	addi	sp,sp,16
ffffffff8001dd90:	8082                	ret

As can be seen, different branches for SV39/SV48/SV57 are still there,
since access_ok() sits at hot code path, why not reduce the code size
to optimize to make the instruction cache happy?

Introduce RISCV_ISA_SV48 and RISCV_ISA_SV57, so that the embedded
platforms can choose the best option themselves, while still keep the
feature of one unified kernel Image for all SV39, SV48 and SV57.

Before the patch, vmlinux built with pure RISCV64 defconfig
   text    data     bss     dec     hex filename
13439437   6790446  483221 20713104 13c0e90 /tmp/old/vmlinux

After the patch, vmlinux built with pure RISCV64 defconfig:
   text    data     bss     dec     hex filename
13314445   6787934  466837 20569216 139dc80 /tmp/new/vmlinux

.text section is reduced by 122KB!

And after the patch, typical access_ok(addr, 1) is compiled as:
ffffffff8001809a:	1141                	addi	sp,sp,-16
ffffffff8001809c:	e022                	sd	s0,0(sp)
ffffffff8001809e:	e406                	sd	ra,8(sp)
ffffffff800180a0:	0800                	addi	s0,sp,16
ffffffff800180a2:	00000013          	nop
ffffffff800180a6:	60a2                	ld	ra,8(sp)
ffffffff800180a8:	6402                	ld	s0,0(sp)
ffffffff800180aa:	4785                	li	a5,1
ffffffff800180ac:	179a                	slli	a5,a5,0x26
ffffffff800180ae:	00f53533          	sltu	a0,a0,a5
ffffffff800180b2:	0141                	addi	sp,sp,16
ffffffff800180b4:	8082                	ret

only 12 instruction!! For refernece, before the patch, the access(addr,
1) needs 32 instructions.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig                  | 24 ++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable-64.h | 12 ++++++++++++
 arch/riscv/mm/init.c                |  8 ++++++++
 3 files changed, 44 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e9476b8cbeb0..1f4bbebfa2af 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -602,6 +602,30 @@ config RISCV_ISA_SSQOSID
 	  cache partitioning scheme and use the MCID to track how much
 	  cache a process, or a group of processes, is using.
 
+config RISCV_ISA_SV48
+	bool "Page-Based 48-bit Virtual-Memory System"
+	depends on 64BIT
+	default y
+	help
+	  Add support for the Page-Based 48-bit Virtual-Memory System.
+
+	  Enable this option for systems for which a 39-bit virtual address
+	  space is insufficient. But if 39-bit is enough, disabling this
+	  option will result in smaller kernel size and slighly better
+	  performance.
+
+config RISCV_ISA_SV57
+	bool "Page-Based 57-bit Virtual-Memory System"
+	depends on 64BIT
+	default y
+	help
+	  Add support for the Page-Based 57-bit Virtual-Memory System.
+
+	  Enable this option for systems for which a 48-bit virtual address
+	  space is insufficient. But if 48-bit is enough, disabling this
+	  option will result in smaller kernel size and slighly better
+	  performance.
+
 config RISCV_ISA_SVPBMT
 	bool "Svpbmt extension support for supervisor mode page-based memory types"
 	depends on 64BIT && MMU
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 7407e36fbf7d..caf8458b344c 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -16,21 +16,33 @@ extern bool _pgtable_l5_enabled;
 #ifdef USE_EARLY_PGTABLE_LEVELS
 static __always_inline bool pgtable_l5_enabled(void)
 {
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_SV57))
+		return false;
+
 	return _pgtable_l5_enabled;
 }
 
 static __always_inline bool pgtable_l4_enabled(void)
 {
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_SV48))
+		return false;
+
 	return _pgtable_l4_enabled;
 }
 #else
 static __always_inline bool pgtable_l5_enabled(void)
 {
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_SV57))
+		return false;
+
 	return riscv_has_extension_likely(RISCV_ISA_EXT_SV57);
 }
 
 static __always_inline bool pgtable_l4_enabled(void)
 {
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_SV48))
+		return false;
+
 	return riscv_has_extension_likely(RISCV_ISA_EXT_SV48);
 }
 #endif
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2a2402d79bc4..6f51f265fb85 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -844,6 +844,14 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 
 	kernel_map.page_offset = PAGE_OFFSET_L5;
 
+	/* Fall back to SV48 if RISCV_ISA_SV57 isn't enabled */
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_SV57) && satp_mode_limit == 0)
+		satp_mode_limit = SATP_MODE_48;
+
+	/* Fall back to SV39 if RISCV_ISA_SV48 isn't enabled */
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_SV48) && satp_mode_limit == SATP_MODE_48)
+		satp_mode_limit = SATP_MODE_39;
+
 	if (satp_mode_limit == SATP_MODE_48) {
 		disable_pgtable_l5();
 	} else if (satp_mode_limit == SATP_MODE_39) {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
