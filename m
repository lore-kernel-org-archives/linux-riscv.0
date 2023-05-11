Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24417C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFIXQWhN4GzkqznrHB6A3PgDYDM/ZlothkJ6xGo4Op0=; b=W6Hi2BOEulKRs7
	QlGynoB+Q4hQGyHy3ZR39hiQJdyTOBV5POJgcn5KqlsxaGTxSoT1cE5mZKH5/wU+DaURYuFqGGDL+
	7F8ToB724FTqF9nWpiGNv3zGgaVNYY5PHUM4lLk6Voe9hyCfsW946v19G+z7rAUxz3uaJ7931iI+p
	E45ncwpEjYoE8Pix0oZqIcTbiyzUI71lcm13v7o3rd1UAi9kimECfnoDduGNVBEZ592JbNxC2XNur
	t6ye2gryBVZqQTgg/3DI5HUA97OqKPDubXUfD6n4I7EhrUo9ZMxK0eMWeGZyGusng8uxpkhbtbpLl
	VOY/DULBQtZuCQWfihtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2Pq-008K18-1r;
	Thu, 11 May 2023 09:16:50 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2Pn-008JwJ-28;
	Thu, 11 May 2023 09:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683796607; x=1715332607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5/irY8PqeYlkemzScFOBAOhIUeAt5ttD7GkSHcrQJ/A=;
  b=iX2NY8FepnWJ5O4OXFRVuH1XwSECyt/yFs8oZip1bVzXwIhO/x8QBntz
   WR7Q/8VMBgwsq9db4av4WRKnuhjE6Ge/unHMVUJRFanGIPnKVPMq4HkGc
   LrSfo63KKtON81s30v0ID1sPsQHEORk/6zoTAZUiZoic754p1kipqRcFA
   RjxPFHnlGgs0gXOjntA5/R6Q37YyHC7hvIKlUe0J4Rd6Q2Wsmq1M+V7Tn
   6HSNOdr2XXa4xpVNTou0SSa43/FBMKXWadzkfbfhmAnuMCfutdrfiIuxd
   KJS3HFZKnlCOCvb9HABGJ9wVeQP3MVuNnXJa6+WpupgazslYkrk1OZyOh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="416040348"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="416040348"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 02:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789316887"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="789316887"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 02:16:43 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] riscv: kvm: Add KVM_GET_REG_LIST API support
Date: Thu, 11 May 2023 17:22:48 +0800
Message-Id: <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683791148.git.haibo1.xu@intel.com>
References: <cover.1683791148.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_021647_785259_7A6E8C60 
X-CRM114-Status: GOOD (  19.44  )
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

KVM_GET_REG_LIST API will return all registers that are available to
KVM_GET/SET_ONE_REG APIs. It's very useful to identify some platform
regression issue during VM migration.

Since this API was already supported on arm64, it'd be straightforward
to enable it on riscv with similar code structure.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 Documentation/virt/kvm/api.rst |   2 +-
 arch/riscv/kvm/vcpu.c          | 346 +++++++++++++++++++++++++++++++++
 2 files changed, 347 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index add067793b90..280e89abd004 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3499,7 +3499,7 @@ VCPU matching underlying host.
 ---------------------
 
 :Capability: basic
-:Architectures: arm64, mips
+:Architectures: arm64, mips, riscv
 :Type: vcpu ioctl
 :Parameters: struct kvm_reg_list (in/out)
 :Returns: 0 on success; -1 on error
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8bd9f2a8a0b9..fb8834e4fa15 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -657,6 +657,334 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline unsigned long num_config_regs(void)
+{
+	return sizeof(struct kvm_riscv_config) / sizeof(unsigned long);
+}
+
+static int copy_config_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_config_regs();
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CONFIG | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return n;
+}
+
+static inline unsigned long num_core_regs(void)
+{
+	return sizeof(struct kvm_riscv_core) / sizeof(unsigned long);
+}
+
+static int copy_core_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_core_regs();
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CORE | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return n;
+}
+
+static inline unsigned long num_csr_regs(void)
+{
+	unsigned long n = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
+
+	if (kvm_riscv_aia_available())
+		n += sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
+
+	return n;
+}
+
+static int copy_csr_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n1 = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
+	int n2 = 0;
+
+	/* copy general csr regs */
+	for (i = 0; i < n1; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR |
+				  KVM_REG_RISCV_CSR_GENERAL | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	/* copy AIA csr regs */
+	if (kvm_riscv_aia_available()) {
+		n2 = sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
+
+		for (i = 0; i < n2; i++) {
+			u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_CSR |
+					  KVM_REG_RISCV_CSR_AIA | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
+		}
+	}
+
+	return n1 + n2;
+}
+
+static inline unsigned long num_timer_regs(void)
+{
+	return sizeof(struct kvm_riscv_timer) / sizeof(unsigned long);
+}
+
+static int copy_timer_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_timer_regs();
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return n;
+}
+
+static inline unsigned long num_fp_f_regs(const struct kvm_vcpu *vcpu)
+{
+	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	if (riscv_isa_extension_available(vcpu->arch.isa, f))
+		return sizeof(cntx->fp.f) / sizeof(u32);
+	else
+		return 0;
+}
+
+static int copy_fp_f_reg_indices(const struct kvm_vcpu *vcpu,
+					u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_fp_f_regs(vcpu);
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return n;
+}
+
+static inline unsigned long num_fp_d_regs(const struct kvm_vcpu *vcpu)
+{
+	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	if (riscv_isa_extension_available(vcpu->arch.isa, d))
+		return sizeof(cntx->fp.d.f) / sizeof(u64) + 1;
+	else
+		return 0;
+}
+
+static int copy_fp_d_reg_indices(const struct kvm_vcpu *vcpu,
+					u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_fp_d_regs(vcpu);
+	u64 reg;
+
+	/* copy fp.d.f indeices */
+	for (i = 0; i < n-1; i++) {
+		reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_FP_D | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	/* copy fp.d.fcsr indeices */
+	reg = KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_D | i;
+	if (uindices) {
+		if (put_user(reg, uindices))
+			return -EFAULT;
+	}
+
+	return n;
+}
+
+static inline unsigned long num_isa_ext_regs(void)
+{
+	return KVM_RISCV_ISA_EXT_MAX;
+}
+
+static int copy_isa_ext_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n = num_isa_ext_regs();
+
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_ISA_EXT | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return n;
+}
+
+static inline unsigned long num_sbi_ext_regs(void)
+{
+	/* number of KVM_REG_RISCV_SBI_SINGLE +
+	 *  2x(number of KVM_REG_RISCV_SBI_MULTI)
+	 */
+	return KVM_RISCV_SBI_EXT_MAX + 2*(KVM_REG_RISCV_SBI_MULTI_REG_LAST+1);
+}
+
+static int copy_sbi_ext_reg_indices(u64 __user *uindices)
+{
+	unsigned int i;
+	int n;
+
+	/* copy KVM_REG_RISCV_SBI_SINGLE */
+	n = KVM_RISCV_SBI_EXT_MAX;
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_SBI_EXT |
+				  KVM_REG_RISCV_SBI_SINGLE | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	/* copy KVM_REG_RISCV_SBI_MULTI */
+	n = KVM_REG_RISCV_SBI_MULTI_REG_LAST + 1;
+	for (i = 0; i < n; i++) {
+		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_SBI_EXT |
+				  KVM_REG_RISCV_SBI_MULTI_EN | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+
+		reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_SBI_EXT |
+			  KVM_REG_RISCV_SBI_MULTI_DIS | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return num_sbi_ext_regs();
+}
+
+/**
+ * kvm_riscv_vcpu_num_regs - how many registers do we present via KVM_GET/SET_ONE_REG
+ *
+ * This is for all registers.
+ */
+static unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
+{
+	unsigned long res = 0;
+
+	res += num_config_regs();
+	res += num_core_regs();
+	res += num_csr_regs();
+	res += num_timer_regs();
+	res += num_fp_f_regs(vcpu);
+	res += num_fp_d_regs(vcpu);
+	res += num_isa_ext_regs();
+	res += num_sbi_ext_regs();
+
+	return res;
+}
+
+/**
+ * kvm_riscv_vcpu_copy_reg_indices - get indices of all registers.
+ */
+static int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
+				u64 __user *uindices)
+{
+	int ret;
+
+	ret = copy_config_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_core_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_csr_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_timer_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_fp_f_reg_indices(vcpu, uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_fp_d_reg_indices(vcpu, uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_isa_ext_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
+	ret = copy_sbi_ext_reg_indices(uindices);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
@@ -758,6 +1086,24 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 			r = kvm_riscv_vcpu_get_reg(vcpu, &reg);
 		break;
 	}
+	case KVM_GET_REG_LIST: {
+		struct kvm_reg_list __user *user_list = argp;
+		struct kvm_reg_list reg_list;
+		unsigned int n;
+
+		r = -EFAULT;
+		if (copy_from_user(&reg_list, user_list, sizeof(reg_list)))
+			break;
+		n = reg_list.n;
+		reg_list.n = kvm_riscv_vcpu_num_regs(vcpu);
+		if (copy_to_user(user_list, &reg_list, sizeof(reg_list)))
+			break;
+		r = -E2BIG;
+		if (n < reg_list.n)
+			break;
+		r = kvm_riscv_vcpu_copy_reg_indices(vcpu, user_list->reg);
+		break;
+	}
 	default:
 		break;
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
