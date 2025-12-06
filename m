Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0287D3ABC5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJU8ieeC+Y9ykLz33bVBywiOfNYxy7QQ81vbkWpxFKs=; b=1t13DR5CmlnLqG
	YGBdlTCm4mgCTjsB7FqJgdHTmhITyXUtS08jPHIrIYFdBynoJwxiisz2WWvnQE+KNdP37NjybyZ8u
	ZLtOdPGzrSZ9DFqV4rSJ4K4ntTGlL6lUMAF0e1wfUe9F1W955x+6LJy16XvLtZ2JYqqKiaFhAXlsA
	VM4ZueXd1BEbGBHX8hN4BEXoz1gQDMxkaj3Fi5aWNBwJApODqb6JNorzEPAPKmvvRr47rMFrZkQ2H
	nZc6ay7I+OSPWyvIRbZiIaD5fyfFNSwQe46y0qeaEFMWc7xhxVPiJa3M8Yx25H0KvvriiFYmuXPU1
	76/8GfY1HOuQ4oEZ2p7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2P-0000000AJi1-3Ngd;
	Sat, 06 Dec 2025 00:20:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0n-0000000AGNk-0AMh
	for linux-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QTKuKPWFr6bVN6iN1gTHfORH5j78nQLhYRuj2ERNrVM=; b=rDteROy5ANJ58b4woGlArjcKHS
	WFeSaNhs2KcfjCzXWDjha3lmk+bX3Pt+u0a8O1Dk32h5hDgLQ0LnwNa8MeSz1A8LnJ21yL9vML0QS
	UG9BEk2cUxcqFLTWKlIfbP1YCQ0FESLgMxxBVswo3D2CNfJtR6BciDoEzGHFus8D/4tTCL7tb5r4V
	EVmYy+6ontlD0CJ8NCRtNyLnBJd2wBZEMUVy0pi/4Xn3iBEnjh+OgZee2HcDL2sNsPGYXLL6HXX5Y
	MikYJLwa2NXqX28FRvkVEXtD3Q4wl80o0v3Ikg+F/qy2rcSiCcVJXKaKeHInT+i6TPO+SgV+rtrQZ
	apuYYz4A==;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRf9B-000000072rN-1aMb
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 23:23:35 +0000
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so2919085b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980330; x=1765585130; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QTKuKPWFr6bVN6iN1gTHfORH5j78nQLhYRuj2ERNrVM=;
        b=EVwjnNVNzsGNuLoNrHYLxH8YU2vkb48uJ3gvXQ9QVnc9tblmZMrZjgDbK4VmypxbVY
         xEx1GkuFlyKP4gi/UVVay0bMSmf4MX3F10jJWbiArREUlW7GIDjmZQ3BQhY57CCtGSSt
         IgfQfzMDIj+JjgLIFm+B8pGjMRVJISNYINpT6A8eXDdmA7ObokdOQNaZgu/z/jSSM2Ev
         GCoElyi7NcByqGLUkw1DiUp0PG3JfYV2QI3nWO8v8wQqN/8h6q+ZS2wkgmFIHC7cg24M
         v7A4xJw2H5csIJXA2ZpBmE6gB97hK9l3j3YLAuWjmqeht8KSRmzQLqkf3unIrf7tzaOV
         iC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980330; x=1765585130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTKuKPWFr6bVN6iN1gTHfORH5j78nQLhYRuj2ERNrVM=;
        b=hTEtr4xg7BheR0HQvca00s+VoM/E9Sx0CgIyDxqGIYePD7l402Rf14NAPvgg3SLHYM
         zBTLtF7ThqgO9Vv9ebd0++Z7FJQnfELLrrRtbfLwSupugPIrbHHYn2+3Ua3RZA0LGuWW
         BzmxBsPEQI0OI7XjC5RrFXQv+FO52XPaasM/2U1U9kwWBXNANKVrYf/WdDtsGWJYdYUL
         vrI/WRXcZ6SgnDJ0oDKgy2ceVUjVdDXqCjk6d1nZZrz9ucXQGA5D3GUmSDetmrEk1rQc
         AAlnuQ+oP56XixUmzFERehqepkQ0zElFCfOyJdwX/vSnvvgE/jtUflINiMYB5qRGinCt
         dZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVurvXgUnEeQ5CkM/KYfovTW45O4ynvXNOvdcHLmILwSVMuPTFB4UidSkQ6HWMR8Jb9moFmaPdUnGf2Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDphqeHpVUfUMwnYtjsWXNGIfpxrO8c/sprVfa9kD7THNY9D1i
	Eu+z3zYzCQHA1bisX6nXGmCPmiG9h8ogXUa7InnNbssO83qo/g/1wGeBqvIyOJffLcnjcwemYZr
	AIJ1Ofg==
X-Google-Smtp-Source: AGHT+IHwEgCif9QeztnHlCZf32TA1mft1ORkKdnbi9mkgV4eyxEEshqnwgTA7OOXOPfobSPR/sGAg/rO4Do=
X-Received: from pfjc12.prod.google.com ([2002:a05:6a00:8c:b0:7e5:49a7:f55f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f91:b0:363:cd5e:8f87
 with SMTP id adf61e73a8af0-36617ea8befmr929454637.13.1764980329483; Fri, 05
 Dec 2025 16:18:49 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:17 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-42-seanjc@google.com>
Subject: [PATCH v6 41/44] KVM: VMX: Compartmentalize adding MSRs to host vs.
 guest auto-load list
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
X-CRM114-CacheID: sfid-20251205_232334_116655_7CA2F247 
X-CRM114-Status: GOOD (  12.53  )
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

Undo the bundling of the "host" and "guest" MSR auto-load list logic so
that the code can be deduplicated by factoring out the logic to a separate
helper.  Now that "list full" situations are treated as fatal to the VM,
there is no need to pre-check both lists.

For all intents and purposes, this reverts the add_atomic_switch_msr()
changes made by commit 3190709335dd ("x86/KVM/VMX: Separate the VMX
AUTOLOAD guest/host number accounting").

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index be2a2580e8f1..018e01daab68 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1096,9 +1096,9 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
 static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 				  u64 guest_val, u64 host_val)
 {
-	int i, j = 0;
 	struct msr_autoload *m = &vmx->msr_autoload;
 	struct kvm *kvm = vmx->vcpu.kvm;
+	int i;
 
 	switch (msr) {
 	case MSR_EFER:
@@ -1133,25 +1133,26 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 	}
 
 	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
-	j = vmx_find_loadstore_msr_slot(&m->host, msr);
-
-	if (KVM_BUG_ON(i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm) ||
-	    KVM_BUG_ON(j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
-		return;
-
 	if (i < 0) {
+		if (KVM_BUG_ON(m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm))
+			return;
+
 		i = m->guest.nr++;
 		m->guest.val[i].index = msr;
 		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
 	}
 	m->guest.val[i].value = guest_val;
 
-	if (j < 0) {
-		j = m->host.nr++;
-		m->host.val[j].index = msr;
+	i = vmx_find_loadstore_msr_slot(&m->host, msr);
+	if (i < 0) {
+		if (KVM_BUG_ON(m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
+			return;
+
+		i = m->host.nr++;
+		m->host.val[i].index = msr;
 		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
 	}
-	m->host.val[j].value = host_val;
+	m->host.val[i].value = host_val;
 }
 
 static bool update_transition_efer(struct vcpu_vmx *vmx)
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
