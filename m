Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4864EE0203
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpO233NgUpSuJTAKUr2Uao2cVf7jHMrzSdfnZ1WAG1Y=; b=zcvZd1TAqTvXNY
	ERr6pKOtEHVGoWBYrSyD5i/49p0iFA8zjEIKBDCqn5cGVNObMkztFSvr5gfxG0VuKtsrih3MxBpk1
	2+HhqErDTN4NH6BsQsajM7YWXi6FBvwxzGvKOObAGnzZHV+k/2qUx7YvyEmHU6VdKksDlbdXrIqgW
	G1amGcFymUNbxFnX/w3mqSXWztqaWxsR/+epVDi9mj3SUYNs1CcUWwJTyjPzfCuS8Y//BGxONfIAc
	gEx2BXfMR1vjq3I/3S7PrjuUs/T/lYyhG6dylJq7al1o45YBaBssAcxR/4MyiSgVYqFnvG9Hb46rc
	9Dae/sBiFzMyLsmmPnTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbAx-0070Nm-39;
	Thu, 14 Sep 2023 01:29:48 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbAq-0070Ii-1x;
	Thu, 14 Sep 2023 01:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694654980; x=1726190980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b/0N3bmHKPwLoIm1d3ucuRyECJSoSIj1ZqZKhOBkTUo=;
  b=WaX8l2PVp/PejBtCiBLjbUvG9hkW4AAz/DwTq5gzzX3Wo5CPxfNC5/9S
   FOsUn7FwH1F3JFQxTjsnDrqOMrsRfKYljIN459m3oZ+Y+vJO04Mzj3j1Q
   PsI2PGtdpskDHiz78/AuWRmQW227AK7/TAp2NRhwrX9dnctvCStBHLyw1
   oI8FTmFCASiWLZRCqT7aHyzkxUOJmbvhdqqNLA8tdBM8T3JGHmXanhvA+
   ATAtYJ9AlvSx1VlBYcWFGkHU2X114Afka1eonQosn7V3VRXCcNgk2BjSy
   N8GpJsbgDERdEF7F40cq0ADTiCwVcR5jhS0MEBNwGxECTtTSyHdwYFAr8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377734250"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="377734250"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="694049515"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="694049515"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:29:33 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	haibo1.xu@intel.com,
	ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sean Christopherson <seanjc@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Vipin Sharma <vipinsh@google.com>,
	David Matlack <dmatlack@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v3 7/9] KVM: riscv: selftests: Add guest helper to get vcpu id
Date: Thu, 14 Sep 2023 09:37:01 +0800
Message-Id: <17c19d6ec28bcde8f3a2d169501a700635c0c332.1694421911.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694421911.git.haibo1.xu@intel.com>
References: <cover.1694421911.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_182940_671445_1BD4A316 
X-CRM114-Status: GOOD (  10.74  )
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

Add guest_get_vcpuid() helper to simplify accessing to per-cpu
private data. The sscratch CSR was used to store the vcpu id.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/include/aarch64/processor.h | 4 ----
 tools/testing/selftests/kvm/include/kvm_util_base.h     | 2 ++
 tools/testing/selftests/kvm/lib/riscv/processor.c       | 8 ++++++++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/aarch64/processor.h b/tools/testing/selftests/kvm/include/aarch64/processor.h
index 69e7b08d3f99..f41fcd63624f 100644
--- a/tools/testing/selftests/kvm/include/aarch64/processor.h
+++ b/tools/testing/selftests/kvm/include/aarch64/processor.h
@@ -219,8 +219,4 @@ void smccc_smc(uint32_t function_id, uint64_t arg0, uint64_t arg1,
 	       uint64_t arg2, uint64_t arg3, uint64_t arg4, uint64_t arg5,
 	       uint64_t arg6, struct arm_smccc_res *res);
 
-
-
-uint32_t guest_get_vcpuid(void);
-
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 135ae2eb5249..666438113d22 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -939,4 +939,6 @@ struct ex_regs;
 typedef void(*exception_handler_fn)(struct ex_regs *);
 void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handler_fn handler);
 
+uint32_t guest_get_vcpuid(void);
+
 #endif /* SELFTEST_KVM_UTIL_BASE_H */
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index efd9ac4b0198..39a1e9902dec 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -316,6 +316,9 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.sp), stack_vaddr + stack_size);
 	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_code);
 
+	/* Setup sscratch for guest_get_vcpuid() */
+	vcpu_set_reg(vcpu, RISCV_CSR_REG(sscratch), vcpu_id);
+
 	/* Setup default exception vector of guest */
 	vcpu_set_reg(vcpu, RISCV_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
 
@@ -436,3 +439,8 @@ void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_fn handle
 
 	handlers->exception_handlers[1][0] = handler;
 }
+
+uint32_t guest_get_vcpuid(void)
+{
+	return csr_read(CSR_SSCRATCH);
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
