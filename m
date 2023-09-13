Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77972CA5529
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/5EpAqtZEc21vma0sZhgS3VYnmDOjt75HddJqVNrgE=; b=l3rrgU8w/NpZ94
	RiMz/edR61C0fs6TLiuE/ltnp9srsTp8IASsCAV5CxsDYSYSagGaA9ITOoRVhBgKqjQ9aTST+DwpC
	c3/LqK849504tnyeC6/8MOihZ+Ncayjq6McB57c2+1qyQwFgH7f4M1dhrAjV6BzaxZqDsq0cau5Xg
	Rn2BfV8J5Zjd9TDq+mMtJo+y0sgpMm2Ts/1Z9M+h7e54PJvM3Ra1RZzQiqM7O6yyguFoeE1PVJMKe
	6N14lg8u9SMhzRX+ZxFpuMr1WV/H3ya+HkfXivXLagHN04RQPNhI3cmbAte8oeraoGlekiCq7eEMi
	lAtlZa4UzTkgbJ69ezqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuW-005Fkh-09;
	Wed, 13 Sep 2023 09:11:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuJ-005FbJ-0e;
	Wed, 13 Sep 2023 09:11:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 574BEB8221D;
	Wed, 13 Sep 2023 09:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7F5CC433C9;
	Wed, 13 Sep 2023 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694596290;
	bh=RYZNaXtlIa7hFmLe1v1Iecc90ldF4+Vzdd/jItVAmHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MX60uVJEK0ZlxhBukvzEPLwatMogEKaPCcEZPDsbwsz6aLwzoh3TeWA8uI+iaxZic
	 qlbfrtMkCEJb11N7pZdwufyUAeqR3Snluezahd4JdKaAoeR0ZoEhPc7ngCOBZQcDwD
	 STVlB9y8uum3A5/mGSTEfCVBtUT9uESs4t2sCZaZfyJftNnnay4bLbgN6svZbjpMpT
	 X/pbzOuIGAp4Ebqc6fUNgQViJIv8a6tTcfl/Q7agERtxj3BzBdz6cC7Bj90DjpPJED
	 Y4RCdw5b9Jmk3UFcXOwl/o4dDJYYEPh6ofI258vBGwa2ev/MW1PEhT4qZBWy7LkQKs
	 RdbYlx7nJJ4dQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D4ACA5519;
	Wed, 13 Sep 2023 09:11:30 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 13 Sep 2023 11:10:56 +0200
Subject: [PATCH v2 2/8] arm: Remove now superfluous sentinel elem from
 ctl_table arrays
MIME-Version: 1.0
Message-Id: <20230913-jag-sysctl_remove_empty_elem_arch-v2-2-d1bd13a29bae@samsung.com>
References: <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
In-Reply-To: <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4243;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=64898c6xfvqMOxj4T+CdNSnHrQ4q+7TxClQm7InVuBs=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlAXy+hgP/+Vq+rvxYYnHaKm9ntgVWSaqsVpQNM
 1U0rWrkWAOJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZQF8vgAKCRC6l81St5ZB
 T1ssDACaDjoQq0OODo/tbLHm4Q0RXUnz1pumBI3MEx+EaPQjukZXE3UVvzcHwUCjaetkltt7/1P
 Vyoi9qfIv3T55axFnQKe7EQaqcfa23L58LhEVgti4gUWByNmjexHZAbhuRkuDdMX1yctfOATTAU
 C8QDUpWNR/n9S4RB1gPA5og+0Hqz3DBYVVzs9ZezQXt88RADogY7EH3QrPOaIoxgjNwlmmZcytr
 MQa/6CyqKpBKjOP9GWG++RLky/pfWzE0AfxrjL6JRbFq8fTjqZFg2FllQqrAlnNFY2GP1HwQ254
 uIAL2r8ofVhVoMztqtlFUKy62uZVSEmORVNFHGiHz0d0XpY/eFfJgenAjI2s76Snhxf/3USlTQR
 woOIAfB0g4L81AAQasS/YMxxw5uHDJzJr5FjSmaj6rHFhjmwhAXIxNvHhLenTadAayaFLHjNcX/
 JyMOcUiTkK0xZR9hWoMwJCcQ8pD+p8ctLq90JzghP2ddZC1WE4cm5Q2z2o62gjy60hJ6E=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_021135_586247_6DF05E19 
X-CRM114-Status: GOOD (  21.61  )
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
 arch/arm64/kernel/fpsimd.c           | 6 ++----
 arch/arm64/kernel/process.c          | 3 +--
 drivers/perf/arm_pmuv3.c             | 3 +--
 5 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/arm/kernel/isa.c b/arch/arm/kernel/isa.c
index 20218876bef2..0b9c28077092 100644
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
+	}
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
index 91e44ac7150f..db3ad1ba8272 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -588,8 +588,7 @@ static struct ctl_table sve_default_vl_table[] = {
 		.mode		= 0644,
 		.proc_handler	= vec_proc_do_default_vl,
 		.extra1		= &vl_info[ARM64_VEC_SVE],
-	},
-	{ }
+	}
 };
 
 static int __init sve_sysctl_init(void)
@@ -612,8 +611,7 @@ static struct ctl_table sme_default_vl_table[] = {
 		.mode		= 0644,
 		.proc_handler	= vec_proc_do_default_vl,
 		.extra1		= &vl_info[ARM64_VEC_SME],
-	},
-	{ }
+	}
 };
 
 static int __init sme_sysctl_init(void)
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 0fcc4eb1a7ab..48861cdc3aae 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -723,8 +723,7 @@ static struct ctl_table tagged_addr_sysctl_table[] = {
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
-	},
-	{ }
+	}
 };
 
 static int __init tagged_addr_init(void)
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index e5a2ac4155f6..c4aa6a8d1b05 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1172,8 +1172,7 @@ static struct ctl_table armv8_pmu_sysctl_table[] = {
 		.proc_handler	= armv8pmu_proc_user_access_handler,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
-	},
-	{ }
+	}
 };
 
 static void armv8_pmu_register_sysctl_table(void)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
