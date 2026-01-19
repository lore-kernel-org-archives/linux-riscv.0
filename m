Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D37EC9830C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 00:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkNgfJ12BFDsGqHnIPGrALLocG8wN44PbivlV1ZD+Bo=; b=Fx05+X+OPT0b/D
	UhmSJ3WAkEPGPuieu2U6TRLt4qg7LsbSMh8kU3RkQlzPhltTqk1allsg3jv3MqCnyXTau6vrS59A9
	p0DP2mFOG5kJ+mAHICfw41MK+zv0DKtGhykKiRY89HutXpmqncqK0XXdwoAjSaUkJXtjuoal9ngfX
	tNuAetnolWAnie3VwstaVZn4gJVjtMyokMdGZz3piJWSGB+fRqHbLrbipNhvz2qHxawSreYcvHYBU
	tcAfd0tEQLXS5/0QuxrbPO5c2aGEUDviYB75yUSb9yt++TG6YQBn3X7YNQZJXHfrePbgg9jYGhiI7
	wDMVE3OwxO/Z/5a7ccsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhd5v-00000001CkI-0uuQ;
	Mon, 19 Jan 2026 00:26:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhd5t-00000001Cjm-3jFM
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 00:26:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CC5560010;
	Mon, 19 Jan 2026 00:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4673AC116D0;
	Mon, 19 Jan 2026 00:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768782366;
	bh=8ID4Q1m9qDGUGkPnIEeNb6bpYLy7uACThcXTaJcvmZo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eGylsrO8QvkEEPTH62wzoPKIpC//F0nRVSFLv5eCd7qiBTJbVy2KiVQQcvB527Db/
	 9w4PNZoNu6ZxWfaEjipRd35NuOrL2GtmChUL3nEcfvO1r2WO7mgaPmdgW1iOKAhzwR
	 evrZfvIx094YqzhOArjjuMpm54M/YQRv2yrCkrp4rsDR7jDohmRJWH6cA3L7TR5orf
	 11AhkJU8Iyy998rGYiDnh1g4YFucXNC4vwyT7m+iZemG8NOREV0PYXi9qw4mQdolQe
	 TRP4pnVJNGhNyIlJu3QZCie0w5D+vaP9muNXhWoWL87ue2Y2Z1gzO19E7r3kPxxMS3
	 bYZnMX5vTpi3w==
Date: Sun, 18 Jan 2026 17:26:03 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
cc: Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1
In-Reply-To: <tfte4r4yucp2fmphlag3odxbxv2yg6h7nvx6oasra2kczv2rkp@h6r6s5gquxsn>
Message-ID: <7e525f25-7106-8a3b-0792-4002e354f6c4@kernel.org>
References: <127dab2c-a77b-c1ae-7c36-2144e9203cc3@kernel.org> <tfte4r4yucp2fmphlag3odxbxv2yg6h7nvx6oasra2kczv2rkp@h6r6s5gquxsn>
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

On Fri, 16 Jan 2026, Andrew Jones wrote:

> On Thu, Nov 27, 2025 at 01:23:35AM -0700, Paul Walmsley wrote:
> > We've run out of bits to describe RISC-V ISA extensions in our initial
> > hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0.  So, let's add
> > RISCV_HWPROBE_KEY_IMA_EXT_1, along with the framework to set the
> > appropriate hwprobe tuple, and add testing for it.
> > 
> > Signed-off-by: Paul Walmsley <pjw@kernel.org>
> 
> Can we also change the documentation for RISCV_HWPROBE_KEY_IMA_EXT_0
> to remove the word 'the' before extensions, i.e. just '...containing
> extensions...' rather than '...containing the extensions...'?

Thanks for the suggestion and the Reviewed-by:.  I updated the patch 
accordingly (see below).


- Paul

From: Paul Walmsley <pjw@kernel.org>
Date: Wed, 26 Nov 2025 21:35:25 -0700
Subject: [PATCH] riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1

We've run out of bits to describe RISC-V ISA extensions in our initial
hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0.  So, let's add
RISCV_HWPROBE_KEY_IMA_EXT_1, along with the framework to set the
appropriate hwprobe tuple, and add testing for it.

Based on a suggestion from Andrew Jones <andrew.jones@oss.qualcomm.com>,
also fix the documentation for RISCV_HWPROBE_KEY_IMA_EXT_0.

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 Documentation/arch/riscv/hwprobe.rst          |   6 +-
 arch/riscv/include/asm/hwprobe.h              |   3 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/kernel/sys_hwprobe.c               | 169 +++++++++++-------
 .../selftests/riscv/hwprobe/which-cpus.c      |  18 +-
 5 files changed, 121 insertions(+), 76 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 641ec4abb906..c420a8349bc6 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,7 +67,7 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
-* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the extensions
+* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
 
@@ -387,3 +387,7 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
+  extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 8c572a464719..8b9f5e1cf4cb 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 15
+#define RISCV_HWPROBE_MAX_KEY		16
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
@@ -20,6 +20,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	switch (key) {
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
+	case RISCV_HWPROBE_KEY_IMA_EXT_1:
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index cd3c126730c3..ed2621a5a47d 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -113,6 +113,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
+#define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index e6787ba7f2fc..53731ace7984 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -24,6 +24,14 @@
 #include <vdso/vsyscall.h>
 
 
+#define EXT_KEY(isa_arg, ext, pv, missing)					\
+	do {										\
+		if (__riscv_isa_extension_available(isa_arg, RISCV_ISA_EXT_##ext))	\
+			pv |= RISCV_HWPROBE_EXT_##ext;				\
+		else									\
+			missing |= RISCV_HWPROBE_EXT_##ext;				\
+	} while (false)
+
 static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 			    const struct cpumask *cpus)
 {
@@ -93,90 +101,109 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	for_each_cpu(cpu, cpus) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 
-#define EXT_KEY(ext)									\
-	do {										\
-		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_EXT_##ext))	\
-			pair->value |= RISCV_HWPROBE_EXT_##ext;				\
-		else									\
-			missing |= RISCV_HWPROBE_EXT_##ext;				\
-	} while (false)
-
 		/*
 		 * Only use EXT_KEY() for extensions which can be exposed to userspace,
 		 * regardless of the kernel's configuration, as no other checks, besides
 		 * presence in the hart_isa bitmap, are made.
 		 */
-		EXT_KEY(ZAAMO);
-		EXT_KEY(ZABHA);
-		EXT_KEY(ZACAS);
-		EXT_KEY(ZALASR);
-		EXT_KEY(ZALRSC);
-		EXT_KEY(ZAWRS);
-		EXT_KEY(ZBA);
-		EXT_KEY(ZBB);
-		EXT_KEY(ZBC);
-		EXT_KEY(ZBKB);
-		EXT_KEY(ZBKC);
-		EXT_KEY(ZBKX);
-		EXT_KEY(ZBS);
-		EXT_KEY(ZCA);
-		EXT_KEY(ZCB);
-		EXT_KEY(ZCLSD);
-		EXT_KEY(ZCMOP);
-		EXT_KEY(ZICBOM);
-		EXT_KEY(ZICBOP);
-		EXT_KEY(ZICBOZ);
-		EXT_KEY(ZICNTR);
-		EXT_KEY(ZICOND);
-		EXT_KEY(ZIHINTNTL);
-		EXT_KEY(ZIHINTPAUSE);
-		EXT_KEY(ZIHPM);
-		EXT_KEY(ZILSD);
-		EXT_KEY(ZIMOP);
-		EXT_KEY(ZKND);
-		EXT_KEY(ZKNE);
-		EXT_KEY(ZKNH);
-		EXT_KEY(ZKSED);
-		EXT_KEY(ZKSH);
-		EXT_KEY(ZKT);
-		EXT_KEY(ZTSO);
+		EXT_KEY(isainfo->isa, ZAAMO, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZABHA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZACAS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZALASR, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZALRSC, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZAWRS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBB, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBC, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBKB, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBKC, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBKX, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCB, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCLSD, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCMOP, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICBOM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICBOP, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICBOZ, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICNTR, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICOND, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIHINTNTL, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIHINTPAUSE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIHPM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZILSD, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIMOP, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKND, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKNE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKNH, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKSED, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKSH, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKT, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZTSO, pair->value, missing);
 
 		/*
 		 * All the following extensions must depend on the kernel
 		 * support of V.
 		 */
 		if (has_vector()) {
-			EXT_KEY(ZVBB);
-			EXT_KEY(ZVBC);
-			EXT_KEY(ZVE32F);
-			EXT_KEY(ZVE32X);
-			EXT_KEY(ZVE64D);
-			EXT_KEY(ZVE64F);
-			EXT_KEY(ZVE64X);
-			EXT_KEY(ZVFBFMIN);
-			EXT_KEY(ZVFBFWMA);
-			EXT_KEY(ZVFH);
-			EXT_KEY(ZVFHMIN);
-			EXT_KEY(ZVKB);
-			EXT_KEY(ZVKG);
-			EXT_KEY(ZVKNED);
-			EXT_KEY(ZVKNHA);
-			EXT_KEY(ZVKNHB);
-			EXT_KEY(ZVKSED);
-			EXT_KEY(ZVKSH);
-			EXT_KEY(ZVKT);
+			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE32X, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE64X, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKB, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKG, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKNED, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKNHA, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKNHB, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKSED, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKSH, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKT, pair->value, missing);
 		}
 
-		EXT_KEY(ZCD);
-		EXT_KEY(ZCF);
-		EXT_KEY(ZFA);
-		EXT_KEY(ZFBFMIN);
-		EXT_KEY(ZFH);
-		EXT_KEY(ZFHMIN);
+		EXT_KEY(isainfo->isa, ZCD, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCF, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZFA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZFBFMIN, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
 
 		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
-			EXT_KEY(SUPM);
-#undef EXT_KEY
+			EXT_KEY(isainfo->isa, SUPM, pair->value, missing);
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}
+
+static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
+			     const struct cpumask *cpus)
+{
+	int cpu;
+	u64 missing = 0;
+
+	pair->value = 0;
+
+	/*
+	 * Loop through and record extensions that 1) anyone has, and 2) anyone
+	 * doesn't have.
+	 */
+	for_each_cpu(cpu, cpus) {
+		/* struct riscv_isainfo *isainfo = &hart_isa[cpu]; */
+
+		/*
+		 * Only use EXT_KEY() for extensions which can be
+		 * exposed to userspace, regardless of the kernel's
+		 * configuration, as no other checks, besides presence
+		 * in the hart_isa bitmap, are made.
+		 */
+		/* Nothing here yet */
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
@@ -287,6 +314,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		hwprobe_isa_ext0(pair, cpus);
 		break;
 
+	case RISCV_HWPROBE_KEY_IMA_EXT_1:
+		hwprobe_isa_ext1(pair, cpus);
+		break;
+
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 	case RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF:
 		pair->value = hwprobe_misaligned(cpus);
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 3ab53067e8dd..587feb198c04 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -83,9 +83,9 @@ static void do_which_cpus(int argc, char **argv, cpu_set_t *cpus)
 
 int main(int argc, char **argv)
 {
-	struct riscv_hwprobe pairs[2];
+	struct riscv_hwprobe pairs[3];
 	cpu_set_t cpus_aff, cpus;
-	__u64 ext0_all;
+	__u64 ext0_all, ext1_all;
 	long rc;
 
 	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus_aff);
@@ -112,6 +112,11 @@ int main(int argc, char **argv)
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_IMA_EXT_0);
 	ext0_all = pairs[0].value;
 
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_1, };
+	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
+	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_IMA_EXT_1);
+	ext1_all = pairs[0].value;
+
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
 	CPU_ZERO(&cpus);
 	rc = riscv_hwprobe(pairs, 1, 0, (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
@@ -134,20 +139,23 @@ int main(int argc, char **argv)
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
 	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ext0_all, };
+	pairs[2] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_1, .value = ext1_all, };
 	CPU_ZERO(&cpus);
-	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	rc = riscv_hwprobe(pairs, 3, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
 	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == sysconf(_SC_NPROCESSORS_ONLN), "set all cpus\n");
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
 	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ext0_all, };
+	pairs[2] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_1, .value = ext1_all, };
 	memcpy(&cpus, &cpus_aff, sizeof(cpu_set_t));
-	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	rc = riscv_hwprobe(pairs, 3, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
 	ksft_test_result(rc == 0 && CPU_EQUAL(&cpus, &cpus_aff), "set all affinity cpus\n");
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
 	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ~ext0_all, };
+	pairs[2] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_1, .value = ~ext1_all, };
 	memcpy(&cpus, &cpus_aff, sizeof(cpu_set_t));
-	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	rc = riscv_hwprobe(pairs, 3, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
 	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == 0, "clear all cpus\n");
 
 	ksft_finished();
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
