Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF61CD3ABC4
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJSC83O6HSbkBgO8EFIhO98jTYTBiniTdQrj60TuBBY=; b=hA0kp1J6uaE3w3
	/LarRa/mGniXTj2yY8aa7uUN5AZyIJmKUVxXm5NLs3rCQsujr33yEhNt/KUnRLAmg8fZtMxCD+gSl
	+SqeMM38lcJWKXn5HYavq3zx7b/iRVZB4P4XzCDcqdP2zcUUmjnUueo1V1dwjuLTNLNrmym8xwfsG
	rwaSmxqEk3bKqTUZDkxfS7rz4iw6gY3NqfI7NW1BtSB8Wfglak6DWTEWvCXBQg5btv64LktYfS4yR
	lG7ZXamPw8qqaDaNeVQhtuDElRRP1xJw1MamGoEcYRoCsUr2olYYld+GN+W2aQtvKPupnu4bLBnsn
	7mUiLCuSclFtqIpGXTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg23-0000000AIun-2jvm;
	Sat, 06 Dec 2025 00:20:15 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0b-0000000AG23-3i2i
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:47 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7b9208e1976so4918867b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980324; x=1765585124; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0alQNA5MnRougM8104k8mY12SAXvJNUdA/VqOuM31LI=;
        b=TpuCIbyFQ89yixdtfcwu/98zsmetX1DHDp7mT+KPT3lN2/MtV0Yt3nRYYQFmX8D6KQ
         dhJ3z2kI8YT+78D13ZWgvSLAecoO5AUtM25LJCxNW0g6hjL/1qghkIItb2sv3acJBvgL
         hSZSp80Q3vieghQMg2Y65/dhwh8+LFBBIHBUbNQ4MXxwi8gvlH8SZ2P/xKZEr5M5pTmA
         1jF06XyOZ/5ySxz6hqVqDFhL4KcCfMairNnOBD4k4F+N6RZbhfXWs3AWuVa9BfYEkt7Z
         5op7jMjLgY1V+hYcwoh58AanF1PhT8nnYZlX5mOIowPMn4pEnH5tnfKk5Ad+002HsRcT
         B9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980324; x=1765585124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0alQNA5MnRougM8104k8mY12SAXvJNUdA/VqOuM31LI=;
        b=V2A4RPq3U2+m2twp0hWpeZl81CwZI50NoX08UkMdbpWdc7e+DAfm8clpEOcd3NRjVd
         mD6XfAiQ+f5FSrGk+4LLPKU8qNPxa00pkaNQrahwlqfjPFHqHFNkxt5N1rBaVSXNrG9N
         K9r9XWTtf4ltT3CnbytEDG17txY31lQzkKt3HocdnnYEkeZMriRcuK+m6M2YReCEStWg
         aqGcLQAsUdP8iGtG419OfkBfI3DnsHtALLAlVrpJLa3DeN/+izn3NC0n00M4/ThfjjhM
         yDCjTWtj0Yztz7ukceUxgtmiVUAFdG5tC37ZpYNn3a6mmBG9A0WTIRAdsTPER6hKivz4
         3ZXA==
X-Forwarded-Encrypted: i=1; AJvYcCW0fI8DwwLuKa8wveDzi5bZsHJwTDoRZjSQd3HHchKffQD1FEtsKWtTpltYEZwLIpEblkLlm+s72X1ATw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLsX7JFxYG1pVtM5GQyQIVDSI8ujxeRGQlCUb6l63skUC8MtQH
	TMcfbtdgh+0q8aWrg1QtweDTWaGVS3SCJDtnVx/cDdFqRvXQoBO3OrQh0VZ/OfNjdRVc1AEEjUM
	4C/qPGg==
X-Google-Smtp-Source: AGHT+IE9VOcwrfHydwxf79golQ2o2etTa7qJp+DbC2tY99Fupcp+X66ru5yHSbM1504AJSJDzZlYcA1+Jcw=
X-Received: from pgdc11.prod.google.com ([2002:a05:6a02:510b:b0:bd9:6028:d18c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4ed2:10b0:361:4ca3:e17d
 with SMTP id adf61e73a8af0-36617e37b3fmr739726637.13.1764980324070; Fri, 05
 Dec 2025 16:18:44 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:14 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-39-seanjc@google.com>
Subject: [PATCH v6 38/44] KVM: VMX: Drop unused @entry_only param from add_atomic_switch_msr()
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
X-CRM114-CacheID: sfid-20251205_161846_042668_CE8CF2A9 
X-CRM114-Status: GOOD (  13.66  )
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

Drop the "on VM-Enter only" parameter from add_atomic_switch_msr() as it
is no longer used, and for all intents and purposes was never used.  The
functionality was added, under embargo, by commit 989e3992d2ec
("x86/KVM/VMX: Extend add_atomic_switch_msr() to allow VMENTER only MSRs"),
and then ripped out by commit 2f055947ae5e ("x86/kvm: Drop L1TF MSR list
approach") just a few commits later.

  2f055947ae5e x86/kvm: Drop L1TF MSR list approach
  72c6d2db64fa x86/litf: Introduce vmx status variable
  215af5499d9e cpu/hotplug: Online siblings when SMT control is turned on
  390d975e0c4e x86/KVM/VMX: Use MSR save list for IA32_FLUSH_CMD if required
  989e3992d2ec x86/KVM/VMX: Extend add_atomic_switch_msr() to allow VMENTER only MSRs

Furthermore, it's extremely unlikely KVM will ever _need_ to load an MSR
value via the auto-load lists only on VM-Enter.  MSRs writes via the lists
aren't optimized in any way, and so the only reason to use the lists
instead of a WRMSR are for cases where the MSR _must_ be load atomically
with respect to VM-Enter (and/or VM-Exit).  While one could argue that
command MSRs, e.g. IA32_FLUSH_CMD, "need" to be done exact at VM-Enter, in
practice doing such flushes within a few instructons of VM-Enter is more
than sufficient.

Note, the shortlog and changelog for commit 390d975e0c4e ("x86/KVM/VMX: Use
MSR save list for IA32_FLUSH_CMD if required") are misleading and wrong.
That commit added MSR_IA32_FLUSH_CMD to the VM-Enter _load_ list, not the
VM-Enter save list (which doesn't exist, only VM-Exit has a store/save
list).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index a51f66d1b201..38491962b2c1 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1094,7 +1094,7 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
 }
 
 static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
-				  u64 guest_val, u64 host_val, bool entry_only)
+				  u64 guest_val, u64 host_val)
 {
 	int i, j = 0;
 	struct msr_autoload *m = &vmx->msr_autoload;
@@ -1132,8 +1132,7 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 	}
 
 	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
-	if (!entry_only)
-		j = vmx_find_loadstore_msr_slot(&m->host, msr);
+	j = vmx_find_loadstore_msr_slot(&m->host, msr);
 
 	if ((i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS) ||
 	    (j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS)) {
@@ -1148,9 +1147,6 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 	m->guest.val[i].index = msr;
 	m->guest.val[i].value = guest_val;
 
-	if (entry_only)
-		return;
-
 	if (j < 0) {
 		j = m->host.nr++;
 		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
@@ -1190,8 +1186,7 @@ static bool update_transition_efer(struct vcpu_vmx *vmx)
 		if (!(guest_efer & EFER_LMA))
 			guest_efer &= ~EFER_LME;
 		if (guest_efer != kvm_host.efer)
-			add_atomic_switch_msr(vmx, MSR_EFER,
-					      guest_efer, kvm_host.efer, false);
+			add_atomic_switch_msr(vmx, MSR_EFER, guest_efer, kvm_host.efer);
 		else
 			clear_atomic_switch_msr(vmx, MSR_EFER);
 		return false;
@@ -7350,7 +7345,7 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *vmx)
 			clear_atomic_switch_msr(vmx, msrs[i].msr);
 		else
 			add_atomic_switch_msr(vmx, msrs[i].msr, msrs[i].guest,
-					msrs[i].host, false);
+					      msrs[i].host);
 }
 
 static void vmx_update_hv_timer(struct kvm_vcpu *vcpu, bool force_immediate_exit)
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
