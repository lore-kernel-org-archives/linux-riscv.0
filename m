Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC1ED3ABC2
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0IKOMRFWHL6cTotkWfWBT66y8VrRQYaKTBiqPMAjEI=; b=dFvdCGZKDQQ9cl
	wn9h5NPkXE2ApCT0fceLXYevviOCugkfIGMx08r6I7T5qFtDewGMvsyc6dAJ/xpzev+5DGQ5UVT7k
	/6luvAK7HQ0h3rpa6MUKbl13s1wtEfcMkRdDlV/TBJGh23KBPqeEKIq59Hf8YJ44XGxWRyA3fH0lE
	wAgqbjrlnU+bXcE2dxXyGnxuY5LFK+gi7mJZOG37rWUYbnyI+dbv6GiEMq/zfgJgfg8vxpe6ESaGB
	IBkKYeIWR1SdjV8ly2V1tVHvc2EMR2tQwWwDrxMXdf6oNx0DVtY/ctfAeNV5RL8Cq+j9i/GZULRj3
	TZApjqmxA/buXyHL4CFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2k-0000000AKHZ-1eUx;
	Sat, 06 Dec 2025 00:20:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0q-0000000AGTW-3t2Z
	for linux-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=igvZhN+qFglUKI0D9M5DwytuE53IkpoWDDVxPCMFY70=; b=nkR3Ra75BdzPQbjK5hRW2UMF9q
	lsD/qDhQJg6DTcPoeCfLj85oOw3NbTTe2dTOqB/Wpyy/9yhXKFyxcG7uRRRrcbgWpKFJVjCyeSbQC
	xcVnlfNneyxpl3jHbrKovsUTccF3UCPXQuTftK9az9f+ka0mS7K+ID9l4MAvasrhYDheQhzkjggDQ
	bGWxd75bNlCIwanIvnsKSq57bywATtG8uOfp0mK/3iXaYphfpHWTHYZ+JMuoT4Y7iuYYOFfRJtS/2
	Dv2h83rx4MBGg4YkbcUGAwd/+/dPckMh0OwoWt+ZycNonFOPzqyXcLBfORZPWTPTTzfks8bBjlTtg
	3BCjzDkw==;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0k-00000006SoJ-2pJy
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:59 +0000
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso2305193a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980331; x=1765585131; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=igvZhN+qFglUKI0D9M5DwytuE53IkpoWDDVxPCMFY70=;
        b=B590VdDDBmjaZeBvXfIebozpnsHny4TzX2JokZMkKvKt6JRK+4WDkxduoL0iSTbq4J
         ZOdupiphhdauR9ia4I0DgGe/zhGzTYY484p/c3mHps6uxZR1J3HWcz4nOh3oqjlvKfdk
         wsJP90ln87/9QLV25H0hKOzaBpI7Rk4HOYvYMTK4MS/TXj1/m41ijv16ihsyUe9WSTrp
         Ew5dal6blPirsppjDwOlRQaC5ETtlgMw7JwyYHJmA52Mo6I19MlcSVE3/qss9XMEMdv1
         8A/14EKGAFuSuFO94BzazwPdmxXaxwLqm6jAloaAdBWX9Gd4pVoiL41r3xrVzS4roFxE
         tKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980331; x=1765585131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igvZhN+qFglUKI0D9M5DwytuE53IkpoWDDVxPCMFY70=;
        b=opTYvWmdBZ7qwk3z73kfggCR81Y34RCFvMWrTR7ZMkTUIF+LXm1HM9rA5YZXG/mvMr
         V4p7JESq4bR3DgVTx6GnZ03RK2nbN/sDwb9jFZX5wIK868It+nGgT9tZ8nhgRRGGBO31
         ldFdNZdGK27biVN5CHYa/MAU6hO8R4l+FjY4+bWABtBOsyDcXL0Da00iZV3LL9B1BcVp
         x87jm4znPOplTz26fSbhD5EdSNsueNNe1AO3vhUSx4X9o3tWRLv61ye9Vg2qcnFiKMIS
         Kwivs7zEB46YbbuM1Gyc+MWb8yNLJjhGykcySsH0lSOyhBQWzXNfCTxPwgYXeW0KJ973
         sOsA==
X-Forwarded-Encrypted: i=1; AJvYcCUHk7x5PhLfkuAI9izqzABKZ62jhBsC+bYW77Cw49A56xYmeTMmzZAvwB+inF3Z11KewwHM124U2tgMYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgHMKewWr6pU8Gs2I6KwxoUYDadM+3DB17I9X3N4G5uq3uNVwM
	+57+5oOrTa5SNEup84HktdbWhm5a4lDeGharrVANlTZz4/suTXBj7pQ7G9bxQdf1sIeyh8BrbM5
	H+/+r0Q==
X-Google-Smtp-Source: AGHT+IELoQ04EyxWWYOkaKJLtcnZ6DpPNmUnBZcM+48DKxRjXGIekKbShjkFhb2K5/ObBWXw0pAx2mabe98=
X-Received: from pjbsk6.prod.google.com ([2002:a17:90b:2dc6:b0:340:a5c6:acc3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc47:b0:343:d70e:bef0
 with SMTP id 98e67ed59e1d1-349a267fbc8mr680584a91.21.1764980331409; Fri, 05
 Dec 2025 16:18:51 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:18 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-43-seanjc@google.com>
Subject: [PATCH v6 42/44] KVM: VMX: Dedup code for adding MSR to VMCS's auto list
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_001854_801855_87E3C5E3 
X-CRM114-Status: GOOD (  10.88  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a helper to add an MSR to a VMCS's "auto" list to deduplicate the code
in add_atomic_switch_msr(), and so that the functionality can be used in
the future for managing the MSR auto-store list.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 018e01daab68..3f64d4b1b19c 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1093,12 +1093,28 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
 	vm_exit_controls_setbit(vmx, exit);
 }
 
+static void vmx_add_auto_msr(struct vmx_msrs *m, u32 msr, u64 value,
+			     unsigned long vmcs_count_field, struct kvm *kvm)
+{
+	int i;
+
+	i = vmx_find_loadstore_msr_slot(m, msr);
+	if (i < 0) {
+		if (KVM_BUG_ON(m->nr == MAX_NR_LOADSTORE_MSRS, kvm))
+			return;
+
+		i = m->nr++;
+		m->val[i].index = msr;
+		vmcs_write32(vmcs_count_field, m->nr);
+	}
+	m->val[i].value = value;
+}
+
 static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 				  u64 guest_val, u64 host_val)
 {
 	struct msr_autoload *m = &vmx->msr_autoload;
 	struct kvm *kvm = vmx->vcpu.kvm;
-	int i;
 
 	switch (msr) {
 	case MSR_EFER:
@@ -1132,27 +1148,8 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 		wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
 	}
 
-	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
-	if (i < 0) {
-		if (KVM_BUG_ON(m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm))
-			return;
-
-		i = m->guest.nr++;
-		m->guest.val[i].index = msr;
-		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
-	}
-	m->guest.val[i].value = guest_val;
-
-	i = vmx_find_loadstore_msr_slot(&m->host, msr);
-	if (i < 0) {
-		if (KVM_BUG_ON(m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
-			return;
-
-		i = m->host.nr++;
-		m->host.val[i].index = msr;
-		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
-	}
-	m->host.val[i].value = host_val;
+	vmx_add_auto_msr(&m->guest, msr, guest_val, VM_ENTRY_MSR_LOAD_COUNT, kvm);
+	vmx_add_auto_msr(&m->guest, msr, host_val, VM_EXIT_MSR_LOAD_COUNT, kvm);
 }
 
 static bool update_transition_efer(struct vcpu_vmx *vmx)
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
