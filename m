Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4C6EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5sAWB1Ci1KXQeksKdh4pTwouHpuJOaAC0dRd0yIOeY=; b=bK6TVketdC38RA
	DDwOYtmQofo2WBfbaJJXTjheeKUb7k1+A32lGSu4veVhqlnoGnuHPuh3LGVUD1JTyycxseHcUBqI/
	c6wG+Sltnf4yNtn5bhkLBrvrYWmLdFD4/7aNhiXhXGSNnf/0/TxwxTebiZMz0C6BJNUBANUkSiWVD
	j31t07jFaK5yHvd+FXdNmZOetGQbEtIRc6sJlLg1SwgUPZQH+iq4caRf8ahPi5N1WDs+bQ3UukeV7
	s5b7pSree55eIor+qDufKddtOlI7YzxHJIl5s95IzbwEARJfr9mlFBV8udamZcQWhiYmrDiBRhC2N
	3TZ0Ecn8Fzb6iVk26IUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCe8a-003HyP-0V;
	Fri, 23 Jun 2023 10:35:32 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCe8V-003HtA-2D;
	Fri, 23 Jun 2023 10:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687516527; x=1719052527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6K9gSvU7bcUbXrx95jbbHrZ95LKmm3Z9olehgFYx8q4=;
  b=TfyIJfZy5mp56Ki4RJkQ6Ia+joOV0GUz9+HpVgLHLM+oZ6bvCyTostMA
   Mr5oJEyO4xUZ/ptDdEFFHOgIJxi1lsDneeR1Ltr86cqDxmOKetWgSPxX6
   Ie7HqxUkGW5SZoSYExWso/aXpigRz+nq+1KoJvKtOWl6PCnTtQEF2yRGa
   IuMB/DUTxWVY2qGH1hWjbyrvKcKXUtRrMAALrCGAr+Sk8psorKz5Lm7xR
   tBek2ueWwh/VMBFmNdx3cKyCpZ3UB0+Fk73e6pfCoSQzIJW4bnwkmPt9i
   krMeMSuqv24ihcVzoOPnweWEG3qxECD9DIKCEcTDwRm30mYR7HH4bMxT/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447112435"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="447112435"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="715275951"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="715275951"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:35:19 -0700
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
	David Matlack <dmatlack@google.com>,
	Ben Gardon <bgardon@google.com>,
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
Subject: [PATCH v4 04/12] KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
Date: Fri, 23 Jun 2023 18:40:06 +0800
Message-Id: <b3965189cf09d4d476e83e2388cb92c28903a36d.1687515463.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687515463.git.haibo1.xu@intel.com>
References: <cover.1687515463.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_033527_742066_F2499CCB 
X-CRM114-Status: GOOD (  17.13  )
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

Rename vcpu_config to vcpu_reg_list to be more specific and add
it to kvm_util.h. While it may not get used outside get-reg-list
tests, exporting it doesn't hurt, as long as it has a unique enough
name. This is a step in the direction of sharing most of the get-
reg-list test code between architectures.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 .../selftests/kvm/aarch64/get-reg-list.c      | 60 +++++++------------
 .../selftests/kvm/include/kvm_util_base.h     | 16 +++++
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index 424285d39965..aae2056379f7 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -37,23 +37,7 @@
 static struct kvm_reg_list *reg_list;
 static __u64 *blessed_reg, blessed_n;
 
-struct reg_sublist {
-	const char *name;
-	long capability;
-	int feature;
-	bool finalize;
-	__u64 *regs;
-	__u64 regs_n;
-	__u64 *rejects_set;
-	__u64 rejects_set_n;
-};
-
-struct vcpu_config {
-	char *name;
-	struct reg_sublist sublists[];
-};
-
-static struct vcpu_config *vcpu_configs[];
+static struct vcpu_reg_list *vcpu_configs[];
 static int vcpu_configs_n;
 
 #define for_each_sublist(c, s)							\
@@ -74,9 +58,9 @@ static int vcpu_configs_n;
 	for_each_reg_filtered(i)						\
 		if (!find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
 
-static const char *config_name(struct vcpu_config *c)
+static const char *config_name(struct vcpu_reg_list *c)
 {
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 	int len = 0;
 
 	if (c->name)
@@ -342,18 +326,18 @@ static void core_reg_fixup(void)
 	reg_list = tmp;
 }
 
-static void prepare_vcpu_init(struct vcpu_config *c, struct kvm_vcpu_init *init)
+static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
 {
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 
 	for_each_sublist(c, s)
 		if (s->capability)
 			init->features[s->feature / 32] |= 1 << (s->feature % 32);
 }
 
-static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_config *c)
+static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 	int feature;
 
 	for_each_sublist(c, s) {
@@ -364,9 +348,9 @@ static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_config *c)
 	}
 }
 
-static void check_supported(struct vcpu_config *c)
+static void check_supported(struct vcpu_reg_list *c)
 {
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 
 	for_each_sublist(c, s) {
 		if (!s->capability)
@@ -382,14 +366,14 @@ static bool print_list;
 static bool print_filtered;
 static bool fixup_core_regs;
 
-static void run_test(struct vcpu_config *c)
+static void run_test(struct vcpu_reg_list *c)
 {
 	struct kvm_vcpu_init init = { .target = -1, };
 	int new_regs = 0, missing_regs = 0, i, n;
 	int failed_get = 0, failed_set = 0, failed_reject = 0;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
-	struct reg_sublist *s;
+	struct vcpu_reg_sublist *s;
 
 	check_supported(c);
 
@@ -526,7 +510,7 @@ static void run_test(struct vcpu_config *c)
 
 static void help(void)
 {
-	struct vcpu_config *c;
+	struct vcpu_reg_list *c;
 	int i;
 
 	printf(
@@ -550,9 +534,9 @@ static void help(void)
 	);
 }
 
-static struct vcpu_config *parse_config(const char *config)
+static struct vcpu_reg_list *parse_config(const char *config)
 {
-	struct vcpu_config *c;
+	struct vcpu_reg_list *c;
 	int i;
 
 	if (config[8] != '=')
@@ -572,7 +556,7 @@ static struct vcpu_config *parse_config(const char *config)
 
 int main(int ac, char **av)
 {
-	struct vcpu_config *c, *sel = NULL;
+	struct vcpu_reg_list *c, *sel = NULL;
 	int i, ret = 0;
 	pid_t pid;
 
@@ -1053,14 +1037,14 @@ static __u64 pauth_generic_regs[] = {
 		.regs_n		= ARRAY_SIZE(pauth_generic_regs),	\
 	}
 
-static struct vcpu_config vregs_config = {
+static struct vcpu_reg_list vregs_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	VREGS_SUBLIST,
 	{0},
 	},
 };
-static struct vcpu_config vregs_pmu_config = {
+static struct vcpu_reg_list vregs_pmu_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	VREGS_SUBLIST,
@@ -1068,14 +1052,14 @@ static struct vcpu_config vregs_pmu_config = {
 	{0},
 	},
 };
-static struct vcpu_config sve_config = {
+static struct vcpu_reg_list sve_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	SVE_SUBLIST,
 	{0},
 	},
 };
-static struct vcpu_config sve_pmu_config = {
+static struct vcpu_reg_list sve_pmu_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	SVE_SUBLIST,
@@ -1083,7 +1067,7 @@ static struct vcpu_config sve_pmu_config = {
 	{0},
 	},
 };
-static struct vcpu_config pauth_config = {
+static struct vcpu_reg_list pauth_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	VREGS_SUBLIST,
@@ -1091,7 +1075,7 @@ static struct vcpu_config pauth_config = {
 	{0},
 	},
 };
-static struct vcpu_config pauth_pmu_config = {
+static struct vcpu_reg_list pauth_pmu_config = {
 	.sublists = {
 	BASE_SUBLIST,
 	VREGS_SUBLIST,
@@ -1101,7 +1085,7 @@ static struct vcpu_config pauth_pmu_config = {
 	},
 };
 
-static struct vcpu_config *vcpu_configs[] = {
+static struct vcpu_reg_list *vcpu_configs[] = {
 	&vregs_config,
 	&vregs_pmu_config,
 	&sve_config,
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index a089c356f354..ac4aaa21deee 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/kvm.h>
 #include "linux/rbtree.h"
+#include <linux/types.h>
 
 #include <asm/atomic.h>
 
@@ -124,6 +125,21 @@ struct kvm_vm {
 	uint32_t memslots[NR_MEM_REGIONS];
 };
 
+struct vcpu_reg_sublist {
+	const char *name;
+	long capability;
+	int feature;
+	bool finalize;
+	__u64 *regs;
+	__u64 regs_n;
+	__u64 *rejects_set;
+	__u64 rejects_set_n;
+};
+
+struct vcpu_reg_list {
+	char *name;
+	struct vcpu_reg_sublist sublists[];
+};
 
 #define kvm_for_each_vcpu(vm, i, vcpu)			\
 	for ((i) = 0; (i) <= (vm)->last_vcpu_id; (i)++)	\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
