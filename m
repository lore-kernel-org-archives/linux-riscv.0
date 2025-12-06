Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95272D3ABC5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+UMTiIugv6hBiNDK/arghpJAKuiNKE94hDtnMhtnBE=; b=yPqL0EmLL6mj0R
	An90DsNYHlHQ6da7PuBFkstP+YzHjLpb6h7R1wg5/3wwoMjQA7BmAVcLr2cxn4R3qzR4kj3d2y/zz
	asQPq6bif36jPb5MCkeSr9h7SVnez+5D9VEV05UNcNn3eHenscjyFOqrAGgxvb7iXYLfSj7Ow0fdB
	Aa7scclYu7oev00T7aUYb1P7n+Hk0ebx6itgLSuZ02ABq6Gan4cQpz2L3wGb+ZU8OYj9obU62Kp9s
	mAryhLEMdb5ZrPPSoqSCyjiUzTNJ0oN9gz/V2L0b84QTD7uhSVdWf17w9yk5MqWRdOPRsIamt2jbi
	1VLTq0WhtazLW0LVVW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg26-0000000AJ2q-4BgJ;
	Sat, 06 Dec 2025 00:20:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0g-0000000AGAe-1GRA
	for linux-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2n5D0Ng0cmebeVdxSFqRanF8f5+ncu9wEbeJjFPfHxU=; b=o52FYMYc3FCaAa/johREv3hOjb
	OLrWfAAwY0/t5gB1586N2dko+zvPQ+w7ucUYA63S4ineE1qbs6CpwFjlCyxPwGZ4T84aBrR3U8Sxo
	DVVfsbmxvr/WQj+FmNwDulI1mwHycuwrAaBiz8KCCDDLQvEgtE0qBvHVi1IlYQPnKcyhaV9UTdgIr
	Czb29zdZu20AhyLxKJQCFXBavKi57j2OYYvDxsbjhp02WWXklhKh5rYRV8sdTevmN/YYftlNicQQ1
	UdSntiXGJEsG7mAK1AYGm0GFa6+G9TfodxocjXow4HjhZBXFtW2aNTAmhZpIO771Cdk6DDgIHC8w5
	flYjTf7w==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRf94-000000072mh-1mU1
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 23:23:28 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-29da1ea0b97so53775795ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980322; x=1765585122; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2n5D0Ng0cmebeVdxSFqRanF8f5+ncu9wEbeJjFPfHxU=;
        b=tdmL7xKhjLhTZVduKKDyjxC2Rkv4DCSprkYlytrxOrN9MDh+owlmiuk20D54TzPqKu
         bIS3iuZzzooRFJ4fayglAo35iNwj231izzXheNcUQP+v0EtxKVYag0Kn2/CyiLgyP9m7
         q8hz+PqdKCAzSsft3DTlZ8v98+TSKtHaerCzUpUhxTQUQ8hrHzNhuliIYGbxh6DCimF2
         5vTanPGfLwHwyBlFkL5azpgddGv2+V++NJNsmKdgkJojaVVHqeMN42yV4+M4VYXi/nHi
         AQbBwJyJcKpGYi4taQihlD/Uj6LdMsgGylzi9kVVu37K+7kfASPPHTwC72ksf9s+G8j9
         9Qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980322; x=1765585122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2n5D0Ng0cmebeVdxSFqRanF8f5+ncu9wEbeJjFPfHxU=;
        b=CQh0ljthab4zCV2EbAJgSwbo3NnBo2GZ2os6YF6jqJbCMZJANfc5XgRa4QGNOiPq/o
         1ic4VibfDG2WyXV8+priHLo7BrFn+yBXkkTm67PiD0+mpAF3MVCMxNnprleyzxrH09Ic
         FnQ4C32hjsRuu5M3dpxqkw4bZp5y8aIiR6SoaEG2fjO4tfAiZQ2xXeWaBNRTjKEW6JH7
         X53zKi3i++RGMBaEhF2SYKrAVZkK7LA9n2kNvksKz48p2/L8L5x9K/5FNSE6Wpr6mAM4
         AF9orX111loBk6cnhtzd22eS3W049C/cC8ic2t5hiie3GhojkbaMo3QtvpKaw0Uam1rP
         Fgsw==
X-Forwarded-Encrypted: i=1; AJvYcCWD9KN9edfbXmsGpyCRumeZOSvFj0CCR13/v+BApbpwYCWbSr1euElPHfahWoyBso0SQfLIM5f+SSIbCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWW13bw4v5h8/v7pXRvkR8wY3+6Xi3eoeD0/CGl16zCx1zL08j
	UfFNG5MjrlwY/+KpSbZsL0jHmOIixBhERBzeBEOqcW0p3xJj23cSVpAyWt2oTJASP3LLcCKWNnD
	kxjuvmQ==
X-Google-Smtp-Source: AGHT+IED91Xjb0+dxO7/M2E0zHU6IQhei8lnafvXM15EOvowaasBkt+pNEKc95Jh7HmLdvF7r/s8Wu6xUzQ=
X-Received: from plbky13.prod.google.com ([2002:a17:902:f98d:b0:29d:5afa:2c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d48f:b0:295:62d:5004
 with SMTP id d9443c01a7336-29df5695ff4mr7109145ad.26.1764980321808; Fri, 05
 Dec 2025 16:18:41 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:13 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-38-seanjc@google.com>
Subject: [PATCH v6 37/44] KVM: VMX: Dedup code for removing MSR from VMCS's
 auto-load list
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
X-CRM114-CacheID: sfid-20251205_232327_036026_A0573D43 
X-CRM114-Status: GOOD (  10.91  )
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

Add a helper to remove an MSR from an auto-{load,store} list to dedup the
msr_autoload code, and in anticipation of adding similar functionality for
msr_autostore.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 52bcb817cc15..a51f66d1b201 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1040,9 +1040,22 @@ static int vmx_find_loadstore_msr_slot(struct vmx_msrs *m, u32 msr)
 	return -ENOENT;
 }
 
+static void vmx_remove_auto_msr(struct vmx_msrs *m, u32 msr,
+				unsigned long vmcs_count_field)
+{
+	int i;
+
+	i = vmx_find_loadstore_msr_slot(m, msr);
+	if (i < 0)
+		return;
+
+	--m->nr;
+	m->val[i] = m->val[m->nr];
+	vmcs_write32(vmcs_count_field, m->nr);
+}
+
 static void clear_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr)
 {
-	int i;
 	struct msr_autoload *m = &vmx->msr_autoload;
 
 	switch (msr) {
@@ -1063,21 +1076,9 @@ static void clear_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr)
 		}
 		break;
 	}
-	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
-	if (i < 0)
-		goto skip_guest;
-	--m->guest.nr;
-	m->guest.val[i] = m->guest.val[m->guest.nr];
-	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
 
-skip_guest:
-	i = vmx_find_loadstore_msr_slot(&m->host, msr);
-	if (i < 0)
-		return;
-
-	--m->host.nr;
-	m->host.val[i] = m->host.val[m->host.nr];
-	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
+	vmx_remove_auto_msr(&m->guest, msr, VM_ENTRY_MSR_LOAD_COUNT);
+	vmx_remove_auto_msr(&m->host, msr, VM_EXIT_MSR_LOAD_COUNT);
 }
 
 static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
-- 
2.52.0.223.gf5cc29aaa4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
