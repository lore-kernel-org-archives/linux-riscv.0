Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5154CC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNcSEE7q7kjklGmEYEBF4YCy7OmCHhHHNjv6psVcm80=; b=faskazU6uIOoc/
	SUqJ/b1sCSgXwlE94oCUoJbwsqvcZ/l8z3GuT86eWq61TmU3D7XX6YjH5OSMF1OikfmgVxYWKFVui
	qtnGxhd0A+2A3mnjXUBMDbpYvWg6LLeBF+zhjSYHE5Xa2IcaWAiS2aGREGT0LuDesD+7XolB83AN6
	TSmJLnBb37XLiuwpSl7YJdokY6jNshMzOwqBu8RnirJbiYe9/Uqh3ch26TKTiO7Z+KixJ+9pdKX2y
	CKrzv+5sZCZPsJn+C7nODgXs45tuh4Ewt2K15+BogdNoheEPmaNID0kfsiuWpQzeUnwH3pFJTp+I1
	JbOEHuYqgp60XzIV0qlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOvDN-00CRC4-0m;
	Thu, 27 Jul 2023 07:15:13 +0000
Received: from mga04.intel.com ([192.55.52.120] helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOvDJ-00CRB6-2d;
	Thu, 27 Jul 2023 07:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690442109; x=1721978109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NsStjbCQjlnQYvLgrTgV2SD7Xv4q7PhNaVzmvY/YSHs=;
  b=mPE/HpFDDfxb4iV0DXw9hhJGxIciqG8lj6BgRBXVI28V3wkkrcmdoc/Z
   M2Pap8/WCdoo9xxi5iL/mfhNIc5WvJhj0amlogfAo7r1k8yflg/G9eTxm
   y4ZGOvcGBf0VJpG+vS9EN7LFQlKpozkoMq/tTs1AEwA9vGL8vqORT3GWi
   rnttwBs+dCb1bHjoiNDlt3FQkw5FL3opbeeTcNYBEhYtpLE/ZGxqVZMTS
   xEPm0bsIlvxtsUvZIhnUsItpzy4h3sQ1Ffy5mFT+v9lCsa6XdPFtWxn/v
   qoGra42V/7Ogm4QIwnfOPKRsCN0H7R29bOElgXG5C6kh1/+m6LM43dhBE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367102390"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="367102390"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="720785833"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="720785833"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:14:42 -0700
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
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sean Christopherson <seanjc@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vipin Sharma <vipinsh@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH 3/4] KVM: riscv: selftests: Add guest helper to get vcpu id
Date: Thu, 27 Jul 2023 15:20:07 +0800
Message-Id: <36b5837e9e94465dd2b7d7a17bb84dea082f2ffa.1690364259.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690364259.git.haibo1.xu@intel.com>
References: <cover.1690364259.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_001509_896655_7D637610 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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
 tools/testing/selftests/kvm/include/riscv/processor.h | 2 ++
 tools/testing/selftests/kvm/lib/riscv/processor.c     | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 9ea6e7bedc61..ca53570ce6de 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -165,4 +165,6 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
+uint32_t guest_get_vcpuid(void);
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index f1b0be58a5dc..b8ad3e69a697 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -316,6 +316,9 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.sp), stack_vaddr + stack_size);
 	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_code);
 
+	/* Setup scratch regiter of guest */
+	vcpu_set_reg(vcpu, RISCV_CSR_REG(sscratch), vcpu_id);
+
 	/* Setup default exception vector of guest */
 	vcpu_set_reg(vcpu, RISCV_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
 
@@ -424,3 +427,8 @@ void vm_install_interrupt_handler(struct kvm_vm *vm, void (*handler)(struct ex_r
 
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
