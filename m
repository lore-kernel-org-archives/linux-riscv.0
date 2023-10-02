Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2D4E784B5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyVQqtL0qqrCzYkv+UCPqNib6rU26lXtH1bDz4JTBtQ=; b=V6sPakfW1wB+Br
	3zSm29rEIrRWSLPDCbePqUhRr/GjNDTRO7sx4XTtFeEwwGT0OJtywIoQSrrtwuu7f3vRjHBN2NqTN
	uvdva4wsB9LX75M7wpPKwo0wEzO1uUcWPX99JZG4QpMBec37ustrVcdyRDjNoehVFkxkYvRQqfQiQ
	xEa+yWTfggypoVWsTAq70NwDRQh6Uvh97s6Lyx+7lJBMSfMWO2W/ctz/gSW6jk08OUO406uTcGVIA
	DPQkjc5PIY/1vX6v56mfpUlrVJH7jZG3Nq86WFelQsaM683YZWC4FFiKONW2TR2K8HG72tDB69ocA
	oQRYlSy8Ke2n7yp45WgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnH7I-00CXWk-17;
	Mon, 02 Oct 2023 11:29:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnH72-00CXGj-1s;
	Mon, 02 Oct 2023 11:29:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EAE5AB80DE3;
	Mon,  2 Oct 2023 11:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D57E1C433C9;
	Mon,  2 Oct 2023 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696246156;
	bh=Rr8B+dxWn4Fc2in3F0SkUC70LhBVUMz18UV7OrElsJI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IGXvrk12vUZSw19V62sYBIn8A4S3w/NcCqB89ZJb8B4eawxwd+PO727HC01vWxouU
	 nLNgxiJ0Ygbebj9bftt7uwWvKdt7cc57/f9pnG6VqOTHCQu3c3hZvCJgZ+wDSCo7uO
	 wqGPykikVyEcjm4eQ+kz3ZcsuisLjquHkSpYJKdvlbm+78r9+tvZqAGC+JlNgqvdT5
	 Q2xw8LvYYEmOVx7DPIacQ/X/qC9cO3RPpQZgJn9xXBwhrhWuDhDzjmuCA7vLy0avfv
	 7I2vPrmnLvokewtVAa0HD4dN/u0SyQqIExZfgHFBpbYDQWmPP/5WVH5t0dSIjWr3gR
	 Qud+zhxz9dPZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7369E784AF;
	Mon,  2 Oct 2023 11:29:16 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 13:30:37 +0200
Subject: [PATCH v3 2/7] arm: Remove now superfluous sentinel elem from
 ctl_table arrays
MIME-Version: 1.0
Message-Id: <20231002-jag-sysctl_remove_empty_elem_arch-v3-2-606da2840a7a@samsung.com>
References: <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
In-Reply-To: <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=4081;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=noJ2f5toULSK3D+m+WiinBKzEVnC7kJRWHJwSjStNEU=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGqoT2tQ00qLwlU0pF99AimxPT3NSvuEoU5o3r
 ErsN0KqCAaJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqqEwAKCRC6l81St5ZB
 TwztC/9795Kms0ahyuiZifUnGcF0XI4xsRGqRrXa27VtzuDrwO0ukaBXvlYD7ODDx/fRUTYHGAA
 3GTPbzTyN+niCpjPUwczSr5F6gJ1OW7UknG7REfzapRZidaaIjjAM1vSsgQlPuDWqfmVlhSSXA+
 0OMIA7+QnwwfjsdpMY+fqo7Z7HYkVolipDKJAI0AYULOB08BiUB7bjgSV24/oMHotxxfMiBkTB0
 IsuUT2JiLXfi/9dq3A2vUaiOTqMs6vB1AnDjPhrvLTEwvpvBJhzK3dvF/wrrYVcN4kRjiGd835w
 +MwVvDhWSmMqxAP/JJt88xKwjLhev0BgndjIoJvmKvSzVvu2x+nvDoitf0QHM/atrtrR+YPw30n
 ozpOdedQmam04sMQpTKEghZma3Ty/ILWzOVrZCzcBQCdzh5x6t28tJ2KdsUuCYZRWqi4rEv5B+U
 MbfO9gyd7CqJEzWl8wTveCs3D+8J3YmMBkqXiEiS+86ETGhrYYufmVDCWO16fsyU9TPcQ=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_042920_897403_1B2C8B4A 
X-CRM114-Status: GOOD (  21.28  )
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
Reply-To: j.granados@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Removed the sentinel as well as the explicit size from ctl_isa_vars. The
size is redundant as the initialization sets it. Changed
insn_emulation->sysctl from a 2 element array of struct ctl_table to a
simple struct. This has no consequence for the sysctl registration as it
is forwarded as a pointer. Removed sentinel from sve_defatul_vl_table,
sme_default_vl_table, tagged_addr_sysctl_table and
armv8_pmu_sysctl_table.

This removal is safe because register_sysctl_sz and register_sysctl use
the array size in addition to checking for the sentinel.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/arm/kernel/isa.c                | 4 ++--
 arch/arm64/kernel/armv8_deprecated.c | 8 +++-----
 arch/arm64/kernel/fpsimd.c           | 2 --
 arch/arm64/kernel/process.c          | 1 -
 drivers/perf/arm_pmuv3.c             | 1 -
 5 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/arm/kernel/isa.c b/arch/arm/kernel/isa.c
index 20218876bef2..905b1b191546 100644
--- a/arch/arm/kernel/isa.c
+++ b/arch/arm/kernel/isa.c
@@ -16,7 +16,7 @@
 
 static unsigned int isa_membase, isa_portbase, isa_portshift;
 
-static struct ctl_table ctl_isa_vars[4] = {
+static struct ctl_table ctl_isa_vars[] = {
 	{
 		.procname	= "membase",
 		.data		= &isa_membase, 
@@ -35,7 +35,7 @@ static struct ctl_table ctl_isa_vars[4] = {
 		.maxlen		= sizeof(isa_portshift),
 		.mode		= 0444,
 		.proc_handler	= proc_dointvec,
-	}, {}
+	},
 };
 
 static struct ctl_table_header *isa_sysctl_header;
diff --git a/arch/arm64/kernel/armv8_deprecated.c b/arch/arm64/kernel/armv8_deprecated.c
index e459cfd33711..dd6ce86d4332 100644
--- a/arch/arm64/kernel/armv8_deprecated.c
+++ b/arch/arm64/kernel/armv8_deprecated.c
@@ -52,10 +52,8 @@ struct insn_emulation {
 	int min;
 	int max;
 
-	/*
-	 * sysctl for this emulation + a sentinal entry.
-	 */
-	struct ctl_table sysctl[2];
+	/* sysctl for this emulation */
+	struct ctl_table sysctl;
 };
 
 #define ARM_OPCODE_CONDTEST_FAIL   0
@@ -558,7 +556,7 @@ static void __init register_insn_emulation(struct insn_emulation *insn)
 	update_insn_emulation_mode(insn, INSN_UNDEF);
 
 	if (insn->status != INSN_UNAVAILABLE) {
-		sysctl = &insn->sysctl[0];
+		sysctl = &insn->sysctl;
 
 		sysctl->mode = 0644;
 		sysctl->maxlen = sizeof(int);
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 91e44ac7150f..9afd0eb0cf88 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -589,7 +589,6 @@ static struct ctl_table sve_default_vl_table[] = {
 		.proc_handler	= vec_proc_do_default_vl,
 		.extra1		= &vl_info[ARM64_VEC_SVE],
 	},
-	{ }
 };
 
 static int __init sve_sysctl_init(void)
@@ -613,7 +612,6 @@ static struct ctl_table sme_default_vl_table[] = {
 		.proc_handler	= vec_proc_do_default_vl,
 		.extra1		= &vl_info[ARM64_VEC_SME],
 	},
-	{ }
 };
 
 static int __init sme_sysctl_init(void)
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 0fcc4eb1a7ab..610e13c3d41b 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -724,7 +724,6 @@ static struct ctl_table tagged_addr_sysctl_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
-	{ }
 };
 
 static int __init tagged_addr_init(void)
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8fcaa26f0f8a..c0307b9181c3 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1175,7 +1175,6 @@ static struct ctl_table armv8_pmu_sysctl_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
 	},
-	{ }
 };
 
 static void armv8_pmu_register_sysctl_table(void)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
