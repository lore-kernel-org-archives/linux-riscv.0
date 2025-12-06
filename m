Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739E6D3ABC2
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWeWyG6Vx/5ruN8p/vTsyQXDIzEBoFW/UZrb7/9WJTQ=; b=OZcU2kHgO1ZVKQ
	Juqgw19A6HkbK7srnljYWCUDmYG5XUTQf/zU/kVuiwiRmzpsu4tIEMS/Qo+rBjsuIQueyjHnGxm6P
	6jPsL5wBi0xhJfXww3PLH/TMFzOvkLHuk/HayJVL8B2C0FNFHtEdZqbXPIllntlnFVenUInIDrjES
	fhqQ7yMrlqZ1q6hGYT5z3rSfeG9XOFT0mErc6r2xtcajAD9JAxorAVNJ579wDC6lqGRCb930f+BEp
	ZlD9lIqeRKvkkwNaprGxpvxhMRKoDbv8FtdEThozZAG9Az+R+Vu5Vg8jQWM0XW5JQ5M+Sw2dvqM3B
	62wkc992itFMphL6quTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2M-0000000AJaA-0G7A;
	Sat, 06 Dec 2025 00:20:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0j-0000000AGI0-1xzg
	for linux-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OETTgwJdKjLOXcIOe9hfqxKY+IkrMGSVX3FLBG1neIA=; b=YwYaE3l53s8aLG4EJ/TB+LYkxx
	G7wB8vuc7LDG4hQ9192KE42jnjOhbrvzAGzRGeqwTO+UHCo0eDR+lpe5r0ISZg3tjSuWJxy0L4UzF
	MqmkuwYYnRex7cKhs0gqZZQrSL8jJMt5WNFJIOrcJ/oXyOoIL96lZlYg4rF8hSUn1ibdeyjx1qaUY
	6wSCm4P40tQszeM7PjBhTyzKsR9v4ugU66XTiGCQy9fi1jaUl5S8oJPW/bYP2xKuwX+qeC7tTiMWO
	iB4/6VTd6AUtK+fT7BnmLgkje380Pk0NFY0nmQk8+lkrej7oaoe108QDNazpdKC0un/qbt0I+UuGS
	21gk3IBA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0g-00000006Skf-0Qa3
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:52 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34176460924so2634329a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980326; x=1765585126; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OETTgwJdKjLOXcIOe9hfqxKY+IkrMGSVX3FLBG1neIA=;
        b=aJS1l01y0RXN3DhJh+egHkjGRuoRFVL7/GAbI4id7y79YNEdS5GBZGEH2HurTcrVrF
         F/xFEuhkBLe24WJgS4NuSL2TjuX6roS8+rmTHH9JyA3JlkyKLScmISuOnzdtsJXPcxTd
         lrtmgOLj7wiWr43SYrctx8GIYllnT04JHx5aHZt+Zu0oVTvfRI089EnYwE3ogn7glU0q
         FEY+4KYpPDMcbYbpW/+FKOPM9sSYD1svbI0rOGMD1wxslbA/ImtK5I3IIy+HFJfcngY7
         tRPzuDB+undJetbOhgzwt/npu7PYERBRB7mOi+tgfh+Gal7+HqLS8v6DaUwmFWkWuNAr
         52mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980326; x=1765585126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OETTgwJdKjLOXcIOe9hfqxKY+IkrMGSVX3FLBG1neIA=;
        b=TUKGEU5kE+RduTkfcA/gefzssMG3h13ktwu8Z5D326hidUmVnjf70A/PrimW/ee7cq
         muRdPiGgMVa0LyS+xU04raMS6Zh0XAF9lIrGK+XKOw2OrIKgwvxrOVVtoTtyMGMmIm1y
         4WUm83EtmUwOsiHPFfo7mWtwqPicszh+hPyfa5H9Fq5ZZFPgd0g1buYTP4hikRmIGciD
         flSnYNAItHv50e7779VC5tfEgYqn7MKpdPwqNaP2UQkvREr3hPGqKg8bZcgdrh7mA43m
         lVQX7ewsZxDApMWaSwavlI6+TT3W+rs71R1nUoY5oGlTQCvWjQfSkwf6kvtPRSRHjaWj
         nvXA==
X-Forwarded-Encrypted: i=1; AJvYcCU/A7y+ZSU9NgCJNtOKzHX6qV8q9XqKNv5ksl4foTW3SxhVdCn0L8VsPgrY4GP98oJdNgik6DZrPb8Fsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3LJ5cwgtniuy4PgMTmF9dDOHy5OZGv6fVizZUnQb4CNd5kixF
	u1vsmJuzJXf9FPdFfQDhK6y7AgoF9B3mFBlkPWQ+DXvcS4+2p9QDNlNQ6eXiDku6AQWegPeP3ZP
	PDD63aA==
X-Google-Smtp-Source: AGHT+IEhe1pZpq0MW23HxJ1d0U2ymT/Zcg6wxeHV4r8IvmytRP6tpgYpoHJSoQtNjxepJopTb3+TB9OPRJk=
X-Received: from pjis4.prod.google.com ([2002:a17:90a:5d04:b0:340:b1b5:eb5e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ecd:b0:340:f05a:3ec2
 with SMTP id 98e67ed59e1d1-349a25fb8c0mr658162a91.17.1764980325670; Fri, 05
 Dec 2025 16:18:45 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:15 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-40-seanjc@google.com>
Subject: [PATCH v6 39/44] KVM: VMX: Bug the VM if either MSR auto-load list is full
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
X-CRM114-CacheID: sfid-20251206_001850_162921_EFD65A31 
X-CRM114-Status: GOOD (  11.15  )
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

WARN and bug the VM if either MSR auto-load list is full when adding an
MSR to the lists, as the set of MSRs that KVM loads via the lists is
finite and entirely KVM controlled, i.e. overflowing the lists shouldn't
be possible in a fully released version of KVM.  Terminate the VM as the
core KVM infrastructure has no insight as to _why_ an MSR is being added
to the list, and failure to load an MSR on VM-Enter and/or VM-Exit could
be fatal to the host.  E.g. running the host with a guest-controlled PEBS
MSR could generate unexpected writes to the DS buffer and crash the host.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 38491962b2c1..2c50ebf4ff1b 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1098,6 +1098,7 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 {
 	int i, j = 0;
 	struct msr_autoload *m = &vmx->msr_autoload;
+	struct kvm *kvm = vmx->vcpu.kvm;
 
 	switch (msr) {
 	case MSR_EFER:
@@ -1134,12 +1135,10 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
 	j = vmx_find_loadstore_msr_slot(&m->host, msr);
 
-	if ((i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS) ||
-	    (j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS)) {
-		printk_once(KERN_WARNING "Not enough msr switch entries. "
-				"Can't add msr %x\n", msr);
+	if (KVM_BUG_ON(i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm) ||
+	    KVM_BUG_ON(j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
 		return;
-	}
+
 	if (i < 0) {
 		i = m->guest.nr++;
 		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
