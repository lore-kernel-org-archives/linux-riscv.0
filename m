Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82B2C001DB
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 12:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erM3Z+aZ0mCQF6mfIjswusVnC1HVNh5jBV0udf+rQVs=; b=Oj98a2/de5lYUt
	uHgST6TuN+r0FfLmdOuWJSlX5ECM/jButX5FQPqpW2/lendWVmuLwlSgldIW36nV9zbiU93yicFt2
	rUtvHT3TFxMmYiIaJxEwpF0vQ3fHL2orVUhGDmFc3O3NnMVri69yPoBsyy975WO/mYD6FC/fxvNlt
	gbLrMseY9bV2LW5r3hSLpR9r0s7PKqIIF6E7qyb00Fd0PtR6EcY0TSlg6/g3XTNEr4JLrHWF9IWy6
	5QNyaIp/a4Uy5QeVsO070FLVUoAhgy4EXZizymFDmAu/N6LPnj11Pv9TKVIsCudCVZduEzdOd6OP+
	TlFeXr1jbdPPB69XssZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcQ8N-001Rz9-0w;
	Sat, 02 Sep 2023 12:53:51 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcQ8J-001RxU-1w;
	Sat, 02 Sep 2023 12:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693659227; x=1725195227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1wLtdrMyvQhGd5esVTekctGGS1exxnCKxDGiyUI+Auw=;
  b=HJxs2ZFjVAjfp+PlFUyRyf0fLVSVyr4ziHqFEoTVuvcZ3s27mGK0fKnT
   sTItVasvGZEOHrdIrXm319UVwpGmT4Fyln9PwF4s+tkt5M/zIiEAqdPiL
   vq0vt6iHI9ij5Q6xImjvn6iBKh0bG55DwRQu8lwPqfvvQ4cNPvJ+W8Qk/
   g8LjePekn37+AEBEQ2r+yrONBexEg/32lWqAkzOD+dpRmsr5d4wZQf2rb
   7kgQW1XTq8IyIbUg015VzDHV4W1LgRTF1hkDNWCQmBCvr/ffmvkzOMOA+
   WvCW/9/iNioehaS3U3ZpYPCb4yb6OUkMuQ8e01rNk46yjTEAS09Ao5r0f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="366599380"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="366599380"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 05:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="855022207"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="855022207"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 05:53:38 -0700
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
	Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Sean Christopherson <seanjc@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	David Matlack <dmatlack@google.com>,
	Mingwei Zhang <mizhang@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Lei Wang <lei4.wang@intel.com>,
	Vipin Sharma <vipinsh@google.com>,
	Like Xu <likexu@tencent.com>,
	Peter Gonda <pgonda@google.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Michal Luczaj <mhal@rbox.co>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 6/8] KVM: riscv: selftests: Add guest helper to get vcpu id
Date: Sat,  2 Sep 2023 20:59:28 +0800
Message-Id: <23d13f60b5a2fd31b87ae78458507f46442fac3a.1693659382.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693659382.git.haibo1.xu@intel.com>
References: <cover.1693659382.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_055347_680362_BC41F918 
X-CRM114-Status: GOOD (  12.36  )
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
