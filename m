Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC75C4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6Nd6am6Do4O8BtSu4DsF9Pft9qtsiXt4/9OcsskEgw=; b=05RUSCZSprh3r8
	ieDetS9ww1iTVHCd5oFyY82xflKde8VJ3H6zrp/8xgSH0UTL44oZdsh3EnxlIEdRPeZvP3PMKeQmT
	nDsOzJw790BRtwOiD3euG/TcL8AwXPH+ceYhObS2ae6nqi7shAigWkeRuJA2zegwtvX4/ZTa/D901
	zPCA46fgkxDw2tKudfiE8Wra9KcAOdbKB2XXqcZ2T9bfzS6YGccpZwVmmgUczrP61hsjtowxsmQ/M
	29Z0nU5YCmRGfIH0ab1fXQpeYJQq+5sVtrHRjraa3menGoCc2lpY7G47YEZHVF2IULpyfAqOChTVG
	J4YQ1JSgCjqlNrlRje+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyae2-009si2-2d;
	Thu, 02 Nov 2023 16:34:10 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyadt-009sW7-0G;
	Thu, 02 Nov 2023 16:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698942841; x=1730478841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Nbhi+Lxa9AGjvct6KXRPu7ZYORV4sX+cH5+O4Ji6OnI=;
  b=nPyb0/7IY0yPCHTMsTdQ5vqfBCeHcw/W9eWMXKboHYI2ETWPLdAxq/WH
   u95vRS1nP9lYqZp6A8FeKCng8PI5+Iw2gpa2xbRVG+zmOoiD74yrXLA7G
   TiurBtDAmS07uDOvHfdUbtVKHCe+0sa8TYBe6sg1h+bHrCZ7/rjYMol6V
   ecISQvi4tyl3Z2UpSWxlNKv40AGyRZ1RmD6OHeIF3bpwLpQhYLvzOcsyO
   RgrY82tjKHVAl9dtCQEeBhJbKAlQdhmaFCU1XHwhAOA20dlSaXnziLI8Z
   oU9S7Qs8KYMR0OQTObPPbkkbX9cNeUIh2aVVGXsr7dhmAAtarsIF+8sRi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388571127"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="388571127"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9448555"
Received: from arthur-vostro-3668.sh.intel.com ([10.239.159.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 09:33:42 -0700
From: Zeng Guang <guang.zeng@intel.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Zeng Guang <guang.zeng@intel.com>
Subject: [RFC PATCH v1 8/8] KVM: selftests: x86: Add KVM forced emulation prefix capability
Date: Thu,  2 Nov 2023 23:51:11 +0800
Message-Id: <20231102155111.28821-9-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_093401_130369_86780CA3 
X-CRM114-Status: UNSURE (   7.69  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce KVM selftest exception fixup using forced emulation prefix to
emulate instruction unconditionally when kvm.force_emulation_prefix is
enabled.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/x86_64/processor.h  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 2534bdf8aa71..a1645508affc 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -1110,6 +1110,10 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu);
 void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 			void (*handler)(struct ex_regs *));
 
+/* Forced emulation prefix for KVM emulating instruction unconditionally */
+#define KVM_FEP "ud2; .byte 'k', 'v', 'm';"
+#define KVM_FEP_LENGTH 5
+
 /* If a toddler were to say "abracadabra". */
 #define KVM_EXCEPTION_MAGIC 0xabacadabaULL
 
@@ -1149,6 +1153,22 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 	"mov  %%r9b, %[vector]\n\t"				\
 	"mov  %%r10, %[error_code]\n\t"
 
+/*
+ * KVM selftest exception fixup using forced emulation prefix enforces KVM
+ * on emulating instruction unconditionally when kvm.force_emulation_prefix
+ * is enabled.
+ */
+#define KVM_FEP_ASM_SAFE(insn)					\
+	"mov $" __stringify(KVM_EXCEPTION_MAGIC) ", %%r9\n\t"	\
+	"lea 1f(%%rip), %%r10\n\t"				\
+	"lea 2f(%%rip), %%r11\n\t"				\
+	KVM_FEP							\
+	"1: " insn "\n\t"					\
+	"xor %%r9, %%r9\n\t"					\
+	"2:\n\t"						\
+	"mov  %%r9b, %[vector]\n\t"				\
+	"mov  %%r10, %[error_code]\n\t"
+
 #define KVM_ASM_SAFE_OUTPUTS(v, ec)	[vector] "=qm"(v), [error_code] "=rm"(ec)
 #define KVM_ASM_SAFE_CLOBBERS	"r9", "r10", "r11"
 
-- 
2.21.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
