Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272D7EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtmSD9KMkZmL0Ia808Evdj8NTY6DjYQvDmv7FMnU5vA=; b=o7MD/RgttZ/bcC
	bSHhu5vOsWRZPA8FU8KsevwY1WcXeMyMWj0VaEaoLHf18LqAQn9ls6pGzAIplUu7bW8I5iPLbkvVW
	2x6p10jThshfUmb8nWWHOEuOWr25dLvuP5A4G9xTDBQ5KljmS2bHlN+1udOLOZRqdrxOBlAka7w+y
	IFGI/EjJamFYYrwVmbGm6uCLLLX01xp2yB/+MhMOko5u9R14LCHDnFPHwHBuHotd92xsbk0yLHmKi
	o08qXhqhkgDnj7mtADYS8+nVImX2iETwy3CZ/BrFw30bbqv6QbkudvpkxZvWJeDpqoxHT+1WDMFeN
	JZa88vMmDc88+WRxkbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCe9K-003Iiu-2x;
	Fri, 23 Jun 2023 10:36:18 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCe9F-003IdG-07;
	Fri, 23 Jun 2023 10:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687516572; x=1719052572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EXZQIePHrnC+4oyrdo52RNlpn5u8QhJ9eHGJ6BBZ17s=;
  b=HLd5/BS+VbXTlxtvwlI0s+LnW1doeukLCio8yOlqHfaXr6JxDsnSUbjv
   yEFf3P7dFGlPrQwih6qz/Cy/TRZSk+YYGoHI3L8uE5Fu3pykymQIy/TW5
   GfpC4iQrNkwa4x+5EEKxnDd8qO9oAYG+f4EbdCFwNz+ZwjeWXNmbs1MGN
   GFERhl4UQ+yHSNy/w1OhhYjDQYtzV772FwDsx7EMshQF6SkcIsVbWMaVn
   nStigDtJA5kFDiSFTo6aplNHIf0WxXy49qtJT1tiWwhw9uu/Otcfj5XC0
   JQybXoSxIBotxp8q4xPHIVc9raPC496rucPWNbIsKqh2bnmltfMA5zBrl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447112581"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="447112581"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="715276101"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; 
   d="scan'208";a="715276101"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 03:36:04 -0700
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
Subject: [PATCH v4 07/12] KVM: arm64: selftests: Finish generalizing get-reg-list
Date: Fri, 23 Jun 2023 18:40:09 +0800
Message-Id: <0d81728cf8b4fd931b495ac4c86d6a74e55a5230.1687515463.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687515463.git.haibo1.xu@intel.com>
References: <cover.1687515463.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_033613_190603_6E6AD446 
X-CRM114-Status: GOOD (  12.50  )
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

Add some unfortunate #ifdeffery to ensure the common get-reg-list.c
can be compiled and run with other architectures. The next
architecture to support get-reg-list should now only need to provide
$(ARCH_DIR)/get-reg-list.c where arch-specific print_reg() and
vcpu_configs[] get defined.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 tools/testing/selftests/kvm/get-reg-list.c | 26 +++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index 69bb91087081..f6ad7991a812 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -98,6 +98,7 @@ void __weak print_reg(const char *prefix, __u64 id)
 	printf("\t0x%llx,\n", id);
 }
 
+#ifdef __aarch64__
 static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
 {
 	struct vcpu_reg_sublist *s;
@@ -120,6 +121,25 @@ static void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 	}
 }
 
+static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
+{
+	struct kvm_vcpu_init init = { .target = -1, };
+	struct kvm_vcpu *vcpu;
+
+	prepare_vcpu_init(c, &init);
+	vcpu = __vm_vcpu_add(vm, 0);
+	aarch64_vcpu_setup(vcpu, &init);
+	finalize_vcpu(vcpu, c);
+
+	return vcpu;
+}
+#else
+static struct kvm_vcpu *vcpu_config_get_vcpu(struct vcpu_reg_list *c, struct kvm_vm *vm)
+{
+	return __vm_vcpu_add(vm, 0);
+}
+#endif
+
 static void check_supported(struct vcpu_reg_list *c)
 {
 	struct vcpu_reg_sublist *s;
@@ -139,7 +159,6 @@ static bool print_filtered;
 
 static void run_test(struct vcpu_reg_list *c)
 {
-	struct kvm_vcpu_init init = { .target = -1, };
 	int new_regs = 0, missing_regs = 0, i, n;
 	int failed_get = 0, failed_set = 0, failed_reject = 0;
 	struct kvm_vcpu *vcpu;
@@ -149,10 +168,7 @@ static void run_test(struct vcpu_reg_list *c)
 	check_supported(c);
 
 	vm = vm_create_barebones();
-	prepare_vcpu_init(c, &init);
-	vcpu = __vm_vcpu_add(vm, 0);
-	aarch64_vcpu_setup(vcpu, &init);
-	finalize_vcpu(vcpu, c);
+	vcpu = vcpu_config_get_vcpu(c, vm);
 
 	reg_list = vcpu_get_reg_list(vcpu);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
