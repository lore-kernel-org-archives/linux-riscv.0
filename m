Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7B6E63C85
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 05:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lxg97eXUEv991lu6vptQJRbDiKAk4+jWHPpkHZW/yns=; b=A310cpqnv1+q0I
	nqdjw7d/n+ki9JN3TlD1hqrrYt67PHXiv7gxmE7NOoQHFcZ1Q1Eb+eojEgfTrt1n8puNZwzmVg6hv
	uf5S8eJLqaXKFLLWkVDJmZ4CcdovC18b+yL+OkNvLwaESAVXPTsclnHR73LmLWF9K6cDc0yy8XlWt
	0dKjMarnhbJteeJOUoGnDgC2dknbGc6jLm9yOFFOFz9z+cVFhl3BX+ZHbkUfFIAcr5S5Mgj40NwGA
	KTPccZExwRBal6Tb1LeM3Wrffb2CnyVXWBwKxSZC8pxnsX2m+8+MIsH7mAztzVNmLCofzyWNGaWdR
	w4qaOxHCYAJukVB6786A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjsun-0000000Asf2-2CJB;
	Sun, 25 Jan 2026 05:44:01 +0000
Received: from relay4.mymailcheap.com ([137.74.80.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjsui-0000000Asef-2ymj
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 05:43:58 +0000
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 2614F2073A;
	Sun, 25 Jan 2026 05:43:51 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 1CBC540073;
	Sun, 25 Jan 2026 05:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1769319828; bh=Vm3XpbxQjg8eNNf05oSuTwoCh2D+UTbeYUaTvqCtz/0=;
	h=From:To:Cc:Subject:Date:From;
	b=BUZHRdSTk9aVp5GdKTYJNz5juygpyljFqCUvnAZAnFzJl/VmPjln88e3Nlw+N+FnC
	 kvrU1actQ4DJsx9Ea7YHCWSLtLS0cVvdvcDNkTfJrLAXbL0J6EzcJQkOdyFyYPdESd
	 NmnufOu/yHhemlfXPlOC9k5lh7/Iwqei8snTjCJg=
Received: from liushuyu-p15 (unknown [117.151.124.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id BDBE24097F;
	Sun, 25 Jan 2026 05:43:35 +0000 (UTC)
From: Zixing Liu <liushuyu@aosc.io>
To: WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	Zixing Liu <liushuyu@aosc.io>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/1] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
Date: Sun, 25 Jan 2026 13:43:22 +0800
Message-ID: <20260125054322.1237687-1-liushuyu@aosc.io>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 1CBC540073
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.90 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[aosc.io,redhat.com,lwn.net,loongson.cn,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SURBL_MULTI_FAIL(0.00)[mail20.mymailcheap.com:server fail];
	URIBL_BLOCKED(0.00)[aosc.io:mid,aosc.io:from_mime,aosc.io:from_smtp,aosc.io:email,mail20.mymailcheap.com:helo,mail20.mymailcheap.com:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_214356_920799_21C9A270 
X-CRM114-Status: GOOD (  17.32  )
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

This ioctl can be used by userspace applications to determine which
(special) registers are get/set-able.

This can be very useful for cross-platform VMMs so that they do not have
to hardcode register indices for each supported architectures.

Signed-off-by: Zixing Liu <liushuyu@aosc.io>
---

For example, this ioctl could be used by rust-vmm/rust-kvm or maybe
VirtualBox-kvm in the future.

 Documentation/virt/kvm/api.rst |  2 +-
 arch/loongarch/kvm/vcpu.c      | 69 ++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 01a3abef8abb..f46dd8be282f 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3603,7 +3603,7 @@ VCPU matching underlying host.
 ---------------------
 
 :Capability: basic
-:Architectures: arm64, mips, riscv, x86 (if KVM_CAP_ONE_REG)
+:Architectures: arm64, loongarch, mips, riscv, x86 (if KVM_CAP_ONE_REG)
 :Type: vcpu ioctl
 :Parameters: struct kvm_reg_list (in/out)
 :Returns: 0 on success; -1 on error
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 656b954c1134..b884eb9c76aa 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1186,6 +1186,57 @@ static int kvm_loongarch_vcpu_set_attr(struct kvm_vcpu *vcpu,
 	return ret;
 }
 
+static unsigned long kvm_loongarch_num_lbt_regs(void)
+{
+	/* +1 for the LBT_FTOP flag (inside arch.fpu) */
+	return sizeof(struct loongarch_lbt) / sizeof(unsigned long) + 1;
+}
+
+static unsigned long kvm_loongarch_num_regs(struct kvm_vcpu *vcpu)
+{
+	/* +1 for the KVM_REG_LOONGARCH_COUNTER register */
+	unsigned long res = CSR_MAX_NUMS + KVM_MAX_CPUCFG_REGS + 1;
+
+	if (kvm_guest_has_lbt(&vcpu->arch))
+		res += kvm_loongarch_num_lbt_regs();
+
+	return res;
+}
+
+static int kvm_loongarch_copy_reg_indices(struct kvm_vcpu *vcpu,
+					  u64 __user *uindices)
+{
+	u64 reg;
+	unsigned int i;
+
+	for (i = 0; i < CSR_MAX_NUMS; i++) {
+		reg = KVM_IOC_CSRID(i);
+		if (put_user(reg, uindices++))
+			return -EFAULT;
+	}
+
+	for (i = 0; i < KVM_MAX_CPUCFG_REGS; i++) {
+		reg = KVM_IOC_CPUCFG(i);
+		if (put_user(reg, uindices++))
+			return -EFAULT;
+	}
+
+	reg = KVM_REG_LOONGARCH_COUNTER;
+	if (put_user(reg, uindices++))
+		return -EFAULT;
+
+	if (!kvm_guest_has_lbt(&vcpu->arch))
+		return 0;
+
+	for (i = 1; i <= kvm_loongarch_num_lbt_regs(); i++) {
+		reg = (KVM_REG_LOONGARCH_LBT | KVM_REG_SIZE_U64 | i);
+		if (put_user(reg, uindices++))
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg)
 {
@@ -1251,6 +1302,24 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 		r = kvm_loongarch_vcpu_set_attr(vcpu, &attr);
 		break;
 	}
+	case KVM_GET_REG_LIST: {
+		struct kvm_reg_list __user *user_list = argp;
+		struct kvm_reg_list reg_list;
+		unsigned n;
+
+		r = -EFAULT;
+		if (copy_from_user(&reg_list, user_list, sizeof(reg_list)))
+			break;
+		n = reg_list.n;
+		reg_list.n = kvm_loongarch_num_regs(vcpu);
+		if (copy_to_user(user_list, &reg_list, sizeof(reg_list)))
+			break;
+		r = -E2BIG;
+		if (n < reg_list.n)
+			break;
+		r = kvm_loongarch_copy_reg_indices(vcpu, user_list->reg);
+		break;
+	}
 	default:
 		r = -ENOIOCTLCMD;
 		break;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
