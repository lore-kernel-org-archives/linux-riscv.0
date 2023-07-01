Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E435DEB64DD
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Cv2yi+7c/CmL0C+WDoWlHpk2d53NRoVBq88zp+yxeo=; b=bhqYBT5jqOyrSE
	dKh/Zr2g+CdFtqe7H+n0t+iLTn5IibJ3PHa7M5AMCUvN7tUZDAM915iPddO3wJ4AxGkQ7Eh5t+72I
	wA3vRD3cSm4OgOZxtVM86DSSqDGv55wk8QtbFWlH3gZVo1Bl0thwcPj7xsAVPuaPLRiZCvByudB4B
	tcXoGiU3pD1BykAtJ4w+SbGtpGqX6ugeQkHYg5NHG2pYVK4B5flkqfgpf3Fb+fhMBG4vhTBbxP2Bc
	SiK+5maTo4gQVvxA+9ZLUVWpuBAhoyY/XtSLhysbEUWMMixwfonKU6WX/GErK0bIjyO1SE7PqHviJ
	IgWhpzvgguuFdSm0Tg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFaon-0064to-1N;
	Sat, 01 Jul 2023 13:39:17 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFaoj-0064rL-1t;
	Sat, 01 Jul 2023 13:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688218753; x=1719754753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p+pM/1SW3Dz1j5w3JJ6iST8Otp6SsrAaa6Aco4Iz16w=;
  b=WGFTvQ/X8ZjK2sdRZOqXeFLAlED05TJ/iUlL2LfiL1Lv3GtRw5tGNnjQ
   T/2GYM3SQ6iiWOdh/QUS8Q9rk1gyYy3jpmKAQey5n3VYR6FhAMRy5MNIq
   txxM1UiK331IOm2nknEYqATc5Uv2pNKTxzk6LSQntR1OOlJcHWC/9o2Sg
   HRxmFDz4LgaTYD+NY73UmNmsDh7fJZ3omKBU+K2P2iKDcNjPIQ4hidmGH
   g7zS8CMZLE1pm2fYG5rt/jvjfdBmJ6jhRArP1ryVbcgIg1Zc3Nposn0be
   4TFwsgTvwgyf71DGPtXyBDpLsu9Yco+FiABkQhNTJTvQZVpYTWYhbVcxF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="342926263"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="342926263"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 06:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="747694133"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="747694133"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 06:39:06 -0700
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
	Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	David Matlack <dmatlack@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v5 09/13] KVM: arm64: selftests: Move finalize_vcpu back to run_test
Date: Sat,  1 Jul 2023 21:42:57 +0800
Message-Id: <a2a8fd67a11c9f640c9d1ee438984d84bac156ed.1688010022.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688010022.git.haibo1.xu@intel.com>
References: <cover.1688010022.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_063913_661229_00DFA17A 
X-CRM114-Status: GOOD (  11.98  )
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

No functional changes. Just move the finalize_vcpu call back to
run_test and do weak function trick to prepare for the opration
in riscv.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/aarch64/get-reg-list.c      | 13 +++++++++++
 tools/testing/selftests/kvm/get-reg-list.c    | 22 +++++--------------
 .../selftests/kvm/include/kvm_util_base.h     |  3 +++
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index 4aa58f1aebe3..6a7f9de21640 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -32,6 +32,19 @@ bool check_reject_set(int err)
 	return err == EPERM;
 }
 
+void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
+{
+	struct vcpu_reg_sublist *s;
+	int feature;
+
+	for_each_sublist(c, s) {
+		if (s->finalize) {
+			feature = s->feature;
+			vcpu_ioctl(vcpu, KVM_ARM_VCPU_FINALIZE, &feature);
+		}
+	}
+}
+
 #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_COPROC_MASK)
 
 #define CORE_REGS_XX_NR_WORDS	2
diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index 79e198968860..c61090806007 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -34,9 +34,6 @@ static __u64 *blessed_reg, blessed_n;
 extern struct vcpu_reg_list *vcpu_configs[];
 extern int vcpu_configs_n;
 
-#define for_each_sublist(c, s)							\
-	for ((s) = &(c)->sublists[0]; (s)->regs; ++(s))
-
 #define for_each_reg(i)								\
 	for ((i) = 0; (i) < reg_list->n; ++(i))
 
@@ -103,6 +100,10 @@ bool __weak check_reject_set(int err)
 	return true;
 }
 
+void __weak finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
+{
+}
+
 #ifdef __aarch64__
 static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
 {
@@ -113,19 +114,6 @@ static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *ini
 			init->features[s->feature / 32] |= 1 << (s->feature % 32);
 }
 
-static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
-{
-	struct vcpu_reg_sublist *s;
-	int feature;
-
-	for_each_sublist(c, s) {
-		if (s->finalize) {
-			feature = s->feature;
-			vcpu_ioctl(vcpu, KVM_ARM_VCPU_FINALIZE, &feature);
-		}
-	}
-}
-
 static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
 {
 	struct kvm_vcpu_init init = { .target = -1, };
@@ -134,7 +122,6 @@ static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm
 	prepare_vcpu_init(c, &init);
 	vcpu = __vm_vcpu_add(vm, 0);
 	aarch64_vcpu_setup(vcpu, &init);
-	finalize_vcpu(vcpu, c);
 
 	return vcpu;
 }
@@ -174,6 +161,7 @@ static void run_test(struct vcpu_reg_list *c)
 
 	vm = vm_create_barebones();
 	vcpu = vcpu_config_get_vcpu(c, vm);
+	finalize_vcpu(vcpu, c);
 
 	reg_list = vcpu_get_reg_list(vcpu);
 
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index ac4aaa21deee..e4480049000d 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -141,6 +141,9 @@ struct vcpu_reg_list {
 	struct vcpu_reg_sublist sublists[];
 };
 
+#define for_each_sublist(c, s)		\
+	for ((s) = &(c)->sublists[0]; (s)->regs; ++(s))
+
 #define kvm_for_each_vcpu(vm, i, vcpu)			\
 	for ((i) = 0; (i) <= (vm)->last_vcpu_id; (i)++)	\
 		if (!((vcpu) = vm->vcpus[i]))		\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
