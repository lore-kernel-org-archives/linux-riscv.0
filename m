Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35180EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 10:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epdCHOr1ABuIoVu6+lcwEBDfKm2pdOFX1qjtHxOip6g=; b=ipvp1z4VbLpcKl
	b7wikjC/tcddhoongCkHy8b5L1T2b/J+/wzr5WMgrx4ShoMehSQEyA/vOlqcL8P81JYXBesxFf5b9
	jEHfVM0P7idZ7nWHcG22chBZ7+qkLxS6mh2y+Q+Vpbllgew4G4mlkn4UKS0yqcfR+nMtpwq1wlywu
	gyMf5Q1OIWPqrfBChVUF6FuTu7zunIiCtvn/CBKYBKjGNFVzO0tNaXduviw+jNb9QAwFgD0jPW9y9
	qE0iWoHyYOZPItPDFV5wchgfZ7K2AKA//xiKroeC8UETREOi6SWg7Vs7UtFKwXriDKm/00J0BTLs+
	tv/ejwqh/wSzFYOKDETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCeAf-003K3r-0H;
	Fri, 23 Jun 2023 10:37:41 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCeAb-003JzV-0h;
	Fri, 23 Jun 2023 10:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687516657; x=1719052657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c7KoCv9Vo1qMt0K6xHBzZVraLcs3QK09dtvX+ljFZWQ=;
  b=e7jB0xKHiTs0GMSoF9UkprROlUilV4K4ArhxVAklpg5q787p41ADLviF
   d3yBCNWqCmzQJrhryZf5wHYVOwh4d/n4pGdBcEUruzkqUR5OI9Qkp5dwx
   oHsO7XHTGJOGoXA2J1UZ4yopSvM2V2PLUj42Yu1ZkpTsAu17nRsyuFbQD
   JkB8kajTFTtrBysmsfO9qGX5Mq+EUK+niyeLeAC9lvSCyLX4llT5oz9Q/
   o19e5xv1mlEN0rCnWrJ9IMr7kqK0mRkVMIlqnMy0V+8pk6EfXDScVxtb3
   54MBnq0+HXHMYN2Cm9aZWdY+YJLbnVcr8gw+6ShspcxUCNytCCYlmAWxS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447113005"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="447113005"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:37:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="715276262"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="715276262"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:37:06 -0700
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
Subject: [PATCH v4 11/12] KVM: riscv: selftests: Add finalize_vcpu check in run_test
Date: Fri, 23 Jun 2023 18:40:13 +0800
Message-Id: <fa6b80b578553e561ccacaeb24091e0716975593.1687515463.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687515463.git.haibo1.xu@intel.com>
References: <cover.1687515463.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_033737_281316_0831B3C9 
X-CRM114-Status: GOOD (  15.04  )
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

Disable all vcpu extensions which were enabled by default
if they were available in the risc-v host, and only enable
the desired one for a vcpu_config.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 tools/testing/selftests/kvm/get-reg-list.c | 42 +++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index 3beb6b62de0a..612dabc61137 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -138,11 +138,50 @@ static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm
 	prepare_vcpu_init(c, &init);
 	vcpu = __vm_vcpu_add(vm, 0);
 	aarch64_vcpu_setup(vcpu, &init);
-	finalize_vcpu(vcpu, c);
 
 	return vcpu;
 }
 #else
+static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
+{
+	int ret;
+	unsigned long value;
+
+	ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
+	if (ret) {
+		printf("Failed to get ext %d", ext);
+		return false;
+	}
+
+	return !!value;
+}
+
+static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
+{
+	struct vcpu_reg_sublist *s;
+
+	/*
+	 * Disable all extensions which were enabled by default
+	 * if they were available in the risc-v host.
+	 */
+	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
+		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
+	}
+
+	for_each_sublist(c, s) {
+		if (!s->feature)
+			continue;
+
+		/* Try to enable the desired extension */
+		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(s->feature), 1);
+
+		/* Double check whether the desired extension was enabled */
+		__TEST_REQUIRE(vcpu_has_ext(vcpu, s->feature),
+			       "%s: %s not available, skipping tests\n",
+			       config_name(c), s->name);
+	}
+}
+
 static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
 {
 	return __vm_vcpu_add(vm, 0);
@@ -178,6 +217,7 @@ static void run_test(struct vcpu_reg_list *c)
 
 	vm = vm_create_barebones();
 	vcpu = vcpu_config_get_vcpu(c, vm);
+	finalize_vcpu(vcpu, c);
 
 	reg_list = vcpu_get_reg_list(vcpu);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
