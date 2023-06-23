Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB46CEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1THYQHQFH3LuDrr2BJn2zzz9lWGdCuwFBiQGPzzOLgs=; b=H/skvWVwqJjSe4
	e91LaWJfOPi3Zpp9eQ4/nf4oOWHm+7BcDy/tW3fmtTLvAOLo4LGQbNRnOe80nzL5J9xaGXFPMQL64
	wb+iSnh/LV44K4OtmzP8FuQtxENf8lbgBJ+MMYKpFPbYQqL2Y3CgcbBvJIF/OH+Srlzry6/q2/8rq
	o5QcPz5oNUr8HMVyL/xNtvuPj9PzscLaPci2J59Rn/HnEk0iqEQijefwFcD/3rDwhnRpBEksSUC0D
	2pO3nE3qllSRTI+TtVK8cMJAHNa9Rlv5DaeNtApDne/ZnTafJK7WSSaXqy2ssd/OdnGL2ojHsIFgj
	bmTviNEnXMSXPppaG6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCe8p-003ID5-0C;
	Fri, 23 Jun 2023 10:35:47 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCe8k-003I80-1h;
	Fri, 23 Jun 2023 10:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687516542; x=1719052542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rBFu+kBGGrTvYe0HgskYar8sc+5gymxxNHT6tyryTg0=;
  b=eoO/kZspNCgV1DuX9ab6hA+AXr56HWp/SyubgVC26irM6f7vXkE0GOpX
   1LhmsnpMG8cN/IGohTyTknz2Y6R8wj7o6QNQ24K1/UT/94KIUKfPaVa+N
   bDedpB+y2ff5flQSoZDp9B3RmpRNSeGCO2IpKtJccIF78QAh+zNMmkNfK
   HqfJ/2I8+zzWBjf4C6Meun1OaygRoy9rc9ekWA2zYY538svSNEiHHHNIS
   3Arli4tXhAewEzZymbxs1L0ND1DQE9daTpPafRkRZ2i06OaZmC8UOj7sO
   QEv3TF8+m3aeS8Ma5rNx6G9/Tz64SQ+U5Y5rnzbcKkvYZ/VFae098ziU4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447112477"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="447112477"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="715275987"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="715275987"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:35:34 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	haibo1.xu@intel.com,
	ajones@ventanamicro.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	seanjc@google.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Gardon <bgardon@google.com>,
	David Matlack <dmatlack@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v4 05/12] KVM: arm64: selftests: Delete core_reg_fixup
Date: Fri, 23 Jun 2023 18:40:07 +0800
Message-Id: <b0b923ef5b9e439587b782911b22b2d12dbff4cf.1687515463.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687515463.git.haibo1.xu@intel.com>
References: <cover.1687515463.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_033542_585516_4B5E3D65 
X-CRM114-Status: GOOD (  23.20  )
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

From: Andrew Jones <ajones@ventanamicro.com>

core_reg_fixup() complicates sharing the get-reg-list test with
other architectures. Rather than work at keeping it, with plenty
of #ifdeffery, just delete it, as it's unlikely to test a kernel
based on anything older than v5.2 with the get-reg-list test,
which is a test meant to check for regressions in new kernels.
(And, an older version of the test can still be used for older
kernels if necessary.)

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 .../selftests/kvm/aarch64/get-reg-list.c      | 83 +++----------------
 1 file changed, 10 insertions(+), 73 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index aae2056379f7..c8b44389d2ee 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -17,12 +17,10 @@
  * by running the test with the --list command line argument.
  *
  * Note, the blessed list should be created from the oldest possible
- * kernel. We can't go older than v4.15, though, because that's the first
- * release to expose the ID system registers in KVM_GET_REG_LIST, see
- * commit 93390c0a1b20 ("arm64: KVM: Hide unsupported AArch64 CPU features
- * from guests"). Also, one must use the --core-reg-fixup command line
- * option when running on an older kernel that doesn't include df205b5c6328
- * ("KVM: arm64: Filter out invalid core register IDs in KVM_GET_REG_LIST")
+ * kernel. We can't go older than v5.2, though, because that's the first
+ * release which includes df205b5c6328 ("KVM: arm64: Filter out invalid
+ * core register IDs in KVM_GET_REG_LIST"). Without that commit the core
+ * registers won't match expectations.
  */
 #include <stdio.h>
 #include <stdlib.h>
@@ -269,63 +267,6 @@ static void print_reg(const char *prefix, __u64 id)
 	}
 }
 
-/*
- * Older kernels listed each 32-bit word of CORE registers separately.
- * For 64 and 128-bit registers we need to ignore the extra words. We
- * also need to fixup the sizes, because the older kernels stated all
- * registers were 64-bit, even when they weren't.
- */
-static void core_reg_fixup(void)
-{
-	struct kvm_reg_list *tmp;
-	__u64 id, core_off;
-	int i;
-
-	tmp = calloc(1, sizeof(*tmp) + reg_list->n * sizeof(__u64));
-
-	for (i = 0; i < reg_list->n; ++i) {
-		id = reg_list->reg[i];
-
-		if ((id & KVM_REG_ARM_COPROC_MASK) != KVM_REG_ARM_CORE) {
-			tmp->reg[tmp->n++] = id;
-			continue;
-		}
-
-		core_off = id & ~REG_MASK;
-
-		switch (core_off) {
-		case 0x52: case 0xd2: case 0xd6:
-			/*
-			 * These offsets are pointing at padding.
-			 * We need to ignore them too.
-			 */
-			continue;
-		case KVM_REG_ARM_CORE_REG(fp_regs.vregs[0]) ...
-		     KVM_REG_ARM_CORE_REG(fp_regs.vregs[31]):
-			if (core_off & 3)
-				continue;
-			id &= ~KVM_REG_SIZE_MASK;
-			id |= KVM_REG_SIZE_U128;
-			tmp->reg[tmp->n++] = id;
-			continue;
-		case KVM_REG_ARM_CORE_REG(fp_regs.fpsr):
-		case KVM_REG_ARM_CORE_REG(fp_regs.fpcr):
-			id &= ~KVM_REG_SIZE_MASK;
-			id |= KVM_REG_SIZE_U32;
-			tmp->reg[tmp->n++] = id;
-			continue;
-		default:
-			if (core_off & 1)
-				continue;
-			tmp->reg[tmp->n++] = id;
-			break;
-		}
-	}
-
-	free(reg_list);
-	reg_list = tmp;
-}
-
 static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
 {
 	struct vcpu_reg_sublist *s;
@@ -364,7 +305,6 @@ static void check_supported(struct vcpu_reg_list *c)
 
 static bool print_list;
 static bool print_filtered;
-static bool fixup_core_regs;
 
 static void run_test(struct vcpu_reg_list *c)
 {
@@ -385,9 +325,6 @@ static void run_test(struct vcpu_reg_list *c)
 
 	reg_list = vcpu_get_reg_list(vcpu);
 
-	if (fixup_core_regs)
-		core_reg_fixup();
-
 	if (print_list || print_filtered) {
 		putchar('\n');
 		for_each_reg(i) {
@@ -515,7 +452,7 @@ static void help(void)
 
 	printf(
 	"\n"
-	"usage: get-reg-list [--config=<selection>] [--list] [--list-filtered] [--core-reg-fixup]\n\n"
+	"usage: get-reg-list [--config=<selection>] [--list] [--list-filtered]\n\n"
 	" --config=<selection>        Used to select a specific vcpu configuration for the test/listing\n"
 	"                             '<selection>' may be\n");
 
@@ -529,7 +466,6 @@ static void help(void)
 	"\n"
 	" --list                      Print the register list rather than test it (requires --config)\n"
 	" --list-filtered             Print registers that would normally be filtered out (requires --config)\n"
-	" --core-reg-fixup            Needed when running on old kernels with broken core reg listings\n"
 	"\n"
 	);
 }
@@ -561,9 +497,7 @@ int main(int ac, char **av)
 	pid_t pid;
 
 	for (i = 1; i < ac; ++i) {
-		if (strcmp(av[i], "--core-reg-fixup") == 0)
-			fixup_core_regs = true;
-		else if (strncmp(av[i], "--config", 8) == 0)
+		if (strncmp(av[i], "--config", 8) == 0)
 			sel = parse_config(av[i]);
 		else if (strcmp(av[i], "--list") == 0)
 			print_list = true;
@@ -606,8 +540,11 @@ int main(int ac, char **av)
 }
 
 /*
- * The current blessed list was primed with the output of kernel version
+ * The original blessed list was primed with the output of kernel version
  * v4.15 with --core-reg-fixup and then later updated with new registers.
+ * (The --core-reg-fixup option and it's fixup function have been removed
+ * from the test, as it's unlikely to use this type of test on a kernel
+ * older than v5.2.)
  *
  * The blessed list is up to date with kernel version v6.4 (or so we hope)
  */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
