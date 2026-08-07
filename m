Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C9C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 05:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZYMJyz/xU7TXpVFYuDZSYMMQkeWfb+fdlzj8O5YGVo=; b=e5Tqpv+AVTqCmS
	KJndvFOx1KZvjFwy3kmY0Jpwv7MtHk1J8uP/XyaHt3PofI233EE4h8H8ckuMNT5eej9erXprSmfZB
	jfbbjiXEQcyTqLoZ34Ott/QC/2NM2W0/U5K/CfhDa/ZVk7PDnuijsRJs58phEFLm9KgLWtu+SnOdc
	xhC+7W3iqGd53JIuqGjlKdGWALLbJRgjjNx438emCbeipVY5StOLqkdOQpsDTYT9HPPnRJITKlDEh
	ZtuGTSUCMGrlLBEtzUWk/N7M3k+XZctxE4dhCGrck1thFVs3TKZn6wRe8lHA0NBqD7CAKklSyXoYo
	QG+PwYPpgeKvB2A3dKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDCR-000000077Zo-440R;
	Fri, 07 Aug 2026 05:32:55 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDCO-000000077Y8-27yz
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 05:32:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84a2dcede83so4234395b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 22:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786080771; x=1786685571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4URKGYUdKxYgKTjeOoH/uROuHrVlAZjzUU1uImLcd0=;
        b=LU4nLZEFeNQ51cfXQcvuB72cRV6LEM72R1k+Q1h7DAsaH6H2o1N71Rgal1GD1zSUih
         DEoXdFb0d+52/ppPigjQe6jISVr/hbUt/6Iv7u+wMgVweFhnHt/0XqiGLzhKZELwi/9d
         Hz9W1+1idbpspw2etj/6U2hg1HpALROoLDM6CcujtMzI2KoCXh70FEvPpCdvDvfmP1mP
         FXmgEBPYIPw4cmVHg1cGz62/ES5+M3XIA93fZluDdBeA6G9lXVNq+Ef8VVZEhf3CmjP8
         IFRSdOkx64JK/KhLexqeqb3BJY4162NtbrQVKlmkWLKSA7fJxY+FEfIhI/HYAsrOrJ7t
         XSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786080771; x=1786685571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4URKGYUdKxYgKTjeOoH/uROuHrVlAZjzUU1uImLcd0=;
        b=YAYz7G4jiS50u29VlmVgJwiQ6Acu9TZ1uaf9bX0J5GZr7UeWQrqb4mkUEzH0iRYc19
         jYquWW2bE5uFIrewblF6IaFLGJoueKaFmktgxnDMz+AxdXG+SK30so5sheVwqhauxLNV
         BqR0s6/GZyCqG0L5vF+ZPf5ES7gR0Q+3c3MbpFnHH1YJLgriocul2EThKwfB4AXzwz9z
         UZ1d3MwaGYuLe8oinmmH2yRyf+YBl0Qzr4NAPCQvfe7yTPFbwMx6jY9Jl/vWKMn8mj6L
         2ypPagLwHnGz+/zdR6N1l6MXcSVekqrWOASFnSFBBSxgX6RSZUXt6Ryt3JGp/nvscAeP
         nn6w==
X-Forwarded-Encrypted: i=1; AHgh+RrysItabIu5md1WG0FmS6JtNwEDIzcG5fHW//7qjuhyEPUErgk0H5lCWgGA+kD+WIbyZqkjMGDgsyStzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPfefUirzHGt7SvNIIOQR0Ywamvy5zG+WXkg0Z0SDvANeumlvG
	g+J1LB+UCJV3s+7AXoL2+e15QeKVHo6K+3yfO1P71MWwgGz3HdpZkvjl
X-Gm-Gg: AR+sD11JjL+6Q9AsxyInLLtAz2QGsC0BoE0iKl4Y+7wg7tvmg7QpNUIlJ0Mj26PYbo4
	+LEhd3UZ4QwdqZlC84eZuakwVOb19EX5aD7CzVlfuqHRp9sIxwPBYHmdjemvTq8jsJedp2F10+w
	P45TtJYzO8kEUS1SFp4g4909inM1PK6u98PYUVykZUgmxg2eKVTW4KbLv7z7oLHtaPjfJ9E57Uc
	U0FXrEnzpJTQbynLZUibiOgQWQIcCefnhP97QhF9T6DbhTFZ9whM72nbP3ysxj5PEqW1TiXxpdO
	pLqI4YazdWvOOVva1zCemCa2wDM4E+Xo+WGJ6o8Qdxm0JtpINuhigb+FRSMpLF9Ew19DTZftsuT
	t0O3pglbt4EljINXEJw9Bbpm6D8LopjutUK/Y8FXZuNzook2B349zWEhacwghUdSDbVWfEQAyb9
	iKSpOUw26JHMsT4m02GVCU35HskZrSyH2RK6374gSFEvI78FaEiaoIZ8yi64Jlj00hCMlIyLkdS
	wrnm6Y=
X-Received: by 2002:a05:6a00:3021:b0:848:8715:c2d9 with SMTP id d2e1a72fcca58-84f5df36a04mr1309064b3a.2.1786080771542;
        Thu, 06 Aug 2026 22:32:51 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19634dsm108940a12.7.2026.08.06.22.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:32:51 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	pbonzini@redhat.com,
	shuah@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhouquan@iscas.ac.cn,
	"Yuhang.chen" <yhchen312@gmail.com>
Subject: [PATCH v2 1/2] RISC-V: KVM: Add PMU event filter support
Date: Fri,  7 Aug 2026 13:32:26 +0800
Message-Id: <20260807053227.341700-2-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807053227.341700-1-yhchen312@gmail.com>
References: <20260807053227.341700-1-yhchen312@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_223252_567437_92402925 
X-CRM114-Status: GOOD (  19.98  )
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

Allow userspace to restrict which SBI PMU events a guest is permitted
to program via the new VM ioctl KVM_SET_PMU_EVENT_FILTER.  It takes a
struct kvm_pmu_event_filter whose events[] array holds SBI PMU event
indices encoded as (type << 16) | code.  The action field selects ALLOW
(only listed events may be programmed) or DENY (listed events are
rejected); nevents == 0 clears any active filter.

The filter is enforced in kvm_riscv_vcpu_pmu_ctr_cfg_match(), where a
disallowed event fails configuration with SBI_ERR_NOT_SUPPORTED.  It
governs new counter configuration only and is not retroactive.  The
filter lives in struct kvm_arch, read via SRCU on the vCPU run path and
replaced under kvm->lock with synchronize_srcu_expedited().  Event
indices are masked to their valid bits before comparison, so reserved
high bits cannot bypass a DENY filter.

Advertise the feature with KVM_CAP_PMU_EVENT_FILTER.

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 ++
 arch/riscv/include/uapi/asm/kvm.h | 20 +++++++++
 arch/riscv/kvm/vcpu_pmu.c         | 31 ++++++++++++++
 arch/riscv/kvm/vm.c               | 69 ++++++++++++++++++++++++++++++-
 4 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 60017ceec9d2..1cd3d6a11057 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -95,6 +95,9 @@ struct kvm_arch {
 
 	/* KVM_CAP_RISCV_MP_STATE_RESET */
 	bool mp_state_reset;
+
+	/* KVM_SET_PMU_EVENT_FILTER */
+	struct kvm_pmu_event_filter __rcu *pmu_event_filter;
 };
 
 struct kvm_cpu_trap {
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 504e73305343..da4f639fa89f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -12,6 +12,7 @@
 #ifndef __ASSEMBLER__
 
 #include <linux/types.h>
+#include <linux/stddef.h>
 #include <asm/bitsperlong.h>
 #include <asm/ptrace.h>
 
@@ -396,6 +397,25 @@ struct kvm_riscv_sbi_fwft {
 /* One single KVM irqchip, ie. the AIA */
 #define KVM_NR_IRQCHIPS			1
 
+/* for KVM_CAP_PMU_EVENT_FILTER */
+#define KVM_PMU_EVENT_ALLOW	0
+#define KVM_PMU_EVENT_DENY	1
+
+/*
+ * For KVM_SET_PMU_EVENT_FILTER: restrict which SBI PMU events a guest may
+ * configure.  Each @events entry is a SBI PMU event index (type in bits
+ * 19:16, code in bits 15:0).  %KVM_PMU_EVENT_ALLOW permits only listed
+ * events; %KVM_PMU_EVENT_DENY rejects them.  Enforced at counter
+ * configuration (SBI PMU COUNTER_CFG_MATCH), not retroactively.
+ */
+struct kvm_pmu_event_filter {
+	__u32 action;
+	__u32 nevents;
+	__u32 flags;
+	__u32 pad;
+	__DECLARE_FLEX_ARRAY(__u64, events);
+};
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index bb46dcbfb24d..756040913468 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -733,6 +733,32 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 	return 0;
 }
 
+static bool kvm_riscv_pmu_event_allowed(struct kvm *kvm, unsigned long eidx)
+{
+	struct kvm_pmu_event_filter *filter;
+	bool in_list = false;
+	unsigned int i;
+
+	/* Reserved high bits must not bypass the filter. */
+	eidx &= SBI_PMU_EVENT_IDX_MASK;
+
+	filter = srcu_dereference(kvm->arch.pmu_event_filter, &kvm->srcu);
+	if (!filter)
+		return true;
+
+	for (i = 0; i < filter->nevents; i++) {
+		if ((unsigned long)filter->events[i] == eidx) {
+			in_list = true;
+			break;
+		}
+	}
+
+	/* ALLOW: permit only listed events; DENY: reject them. */
+	if (filter->action == KVM_PMU_EVENT_ALLOW)
+		return in_list;
+	return !in_list;
+}
+
 int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				     unsigned long ctr_mask, unsigned long flags,
 				     unsigned long eidx, u64 evtdata,
@@ -773,6 +799,11 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 		goto out;
 	}
 
+	if (!kvm_riscv_pmu_event_allowed(vcpu->kvm, eidx)) {
+		sbiret = SBI_ERR_NOT_SUPPORTED;
+		goto out;
+	}
+
 	/*
 	 * SKIP_MATCH flag indicates the caller is aware of the assigned counter
 	 * for this event. Just do a sanity check if it already marked used.
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083feeb76..a5a3a2182d1e 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -53,6 +53,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 {
 	kvm_destroy_vcpus(kvm);
 
+	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
+
 	kvm_riscv_aia_destroy_vm(kvm);
 }
 
@@ -187,6 +189,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_MP_STATE:
 	case KVM_CAP_IMMEDIATE_EXIT:
 	case KVM_CAP_SET_GUEST_DEBUG:
+	case KVM_CAP_PMU_EVENT_FILTER:
 		r = 1;
 		break;
 	case KVM_CAP_NR_VCPUS:
@@ -265,7 +268,71 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
 	}
 }
 
+#define KVM_PMU_EVENT_FILTER_MAX_EVENTS	256
+
+static int kvm_riscv_vm_ioctl_set_pmu_event_filter(struct kvm *kvm,
+						   void __user *argp)
+{
+	struct kvm_pmu_event_filter __user *user_filter = argp;
+	struct kvm_pmu_event_filter *filter, tmp;
+	size_t size;
+	int r = 0;
+
+	if (copy_from_user(&tmp, user_filter, sizeof(tmp)))
+		return -EFAULT;
+
+	if (tmp.action != KVM_PMU_EVENT_ALLOW &&
+	    tmp.action != KVM_PMU_EVENT_DENY)
+		return -EINVAL;
+
+	if (tmp.flags)
+		return -EINVAL;
+
+	if (tmp.pad)
+		return -EINVAL;
+
+	if (tmp.nevents > KVM_PMU_EVENT_FILTER_MAX_EVENTS)
+		return -E2BIG;
+
+	size = struct_size(filter, events, tmp.nevents);
+	filter = kzalloc(size, GFP_KERNEL_ACCOUNT);
+	if (!filter)
+		return -ENOMEM;
+
+	filter->action = tmp.action;
+	filter->nevents = tmp.nevents;
+	filter->flags = tmp.flags;
+
+	if (copy_from_user(filter->events, user_filter->events,
+			   flex_array_size(filter, events, filter->nevents))) {
+		r = -EFAULT;
+		goto cleanup;
+	}
+
+	mutex_lock(&kvm->lock);
+	filter = rcu_replace_pointer(kvm->arch.pmu_event_filter, filter,
+				     mutex_is_locked(&kvm->lock));
+	mutex_unlock(&kvm->lock);
+	synchronize_srcu_expedited(&kvm->srcu);
+
+cleanup:
+	kfree(filter);
+	return r;
+}
+
 int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
-	return -EINVAL;
+	struct kvm *kvm = filp->private_data;
+	void __user *argp = (void __user *)arg;
+	int r;
+
+	switch (ioctl) {
+	case KVM_SET_PMU_EVENT_FILTER:
+		r = kvm_riscv_vm_ioctl_set_pmu_event_filter(kvm, argp);
+		break;
+	default:
+		r = -EINVAL;
+	}
+
+	return r;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
