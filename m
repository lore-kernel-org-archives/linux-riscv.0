Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24182C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwPvhL3kuVgGqOVgRS3CIsYPYp89ZVe3rI3CJdd5om4=; b=Tgqg1uKag4Brm/
	TrTDpWw1C2cqlMm4cFltS55032iBXXcVYXQJaNkCQWpPcRiHN4wL8h6LhJDbebH+J3OUnddAU9Mx4
	wPfNzVSoVH1MO5ZGxQO0mTQBHN1J0f6+YrVMQ7m5Jd3k3JHSNP8OF1lo9pcmWEgDKJnPgWViM8m2Z
	NIqk/PuonX8YsiFKu/X/7P+6OOJeEkuaqajGF4Z9OtlFSvKAnUX5qSund2VK9L01C0+xh2q/ea9Fl
	7Tt5y5si/GllkYZ2etr71ypqk6qtKE5bxZHzWNkKmzPF91WFbOjm3Dw9U1RlzcxELoIZdtRu7w0Oz
	ZCL51rPV1Q4evBnHynfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUtC-00000005V8n-0sbJ;
	Sat, 27 Jul 2024 00:02:22 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkY-00000005Pki-1q6i
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:28 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b39c429a1so451525276.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038005; x=1722642805; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xlV4Qu7sFx9TmbqoV45yeLGjyM3cIO8KzptAxLEtfNk=;
        b=E04bICl1HNMPH2Fal1W1r33/BM5sE8j6hp2FR6P9ZcLqCOca6v6PclinKzCE58peW4
         EmHVgWfJIdltJOCsb7wcjMSi9x+q07JbSGCmbZJRwsPPHSQhmMOpur+7Bjgpuv7zJGYE
         PDVji0dYews91RzvPzzeBya80B0yPkHxbIxHVfgsaY4obdtVglbfyOiML30UDilx9sMn
         h/QxnamTx1JkNE1uyjEZg3uQuZtcnA8XqbH8fszqSj91mhxvBl3F/P9GfvPTg/nagapR
         sPRZgFb4iP6z62XhsSnxpugQoBt5m/lZnv0ZVYJ2dbiDb4lZvV/AZAihcpX1zXU/OIlr
         D+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038005; x=1722642805;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlV4Qu7sFx9TmbqoV45yeLGjyM3cIO8KzptAxLEtfNk=;
        b=qqKB7Lx4nk+tjL3WeAa6+418dR5Nw7mBlDAsLLzGpZuR+WToxYfzkfRCUoE5tRpjk7
         IC6SBhabyR+F53LBz4q9CaEFFnNQ1/Bdd85SAJz+DzNk7OnddpTxMCeertxJ5NXNNU93
         ziSXxDIV0PSxAs8lvsYpoK8k12d0Cp8pKn7wVBnhP3qsh61b1RFLjE48bNvfrU2CybVa
         jD3QDyUppXodddgAlkqqisLVp0C3dFS6C0CFYXBx3S0fTVTEpCh36Y9tPuvXSnyVTVZw
         VkQpce1exGMaPjs39Fjx51f1d+xeBd2LIt7eqojkOFrSENaKW/mZHq9qj6R6/3w7Jyzr
         AhPA==
X-Forwarded-Encrypted: i=1; AJvYcCXz4OCFLYh1t0RyeKj9aKtl7A9FHzG4bU4uiJrnDfdAGZCABb3eXOgQHj5JBx1JuqjfjfEQBRKab7kwEDnq8D1yw5TRH3i82gdCr8h8g92j
X-Gm-Message-State: AOJu0YwHenO9uOe/yismfsJ3qkj9cWnFW3Cvqd0tQ88epGVC/lJYDdwl
	e97+mLfuTxpnCHubSuisx0/xngaKvb7rjtAz+aP2b3U6dHlelMuJAfGtalH+NFPdapz8/ZkzGn+
	IAA==
X-Google-Smtp-Source: AGHT+IGzjee8SmO1Sa/b53YWKn3FsBJYizAY4tObHxd1ZNVi3RptE5IxRlqmItgGIGNjjqk15j+5giHmBC8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:8d2:0:b0:e03:53a4:1a7 with SMTP id
 3f1490d57ef6-e0b5454c840mr15153276.10.1722038004800; Fri, 26 Jul 2024
 16:53:24 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:32 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-24-seanjc@google.com>
Subject: [PATCH v12 23/84] KVM: nVMX: Add helper to put (unmap) vmcs12 pages
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165326_550793_6EADA2FF 
X-CRM114-Status: GOOD (  12.66  )
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

Add a helper to dedup unmapping the vmcs12 pages.  This will reduce the
amount of churn when a future patch refactors the kvm_vcpu_unmap() API.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 372d005e09e7..8d05d1d9f544 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -314,6 +314,21 @@ static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, struct loaded_vmcs *vmcs)
 	vcpu->arch.regs_dirty = 0;
 }
 
+static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+
+	/*
+	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
+	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
+	 * and if it is written, the contents are irrelevant.
+	 */
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
+	vmx->nested.pi_desc = NULL;
+}
+
 /*
  * Free whatever needs to be freed from vmx->nested when L1 goes down, or
  * just stops using VMX.
@@ -346,15 +361,8 @@ static void free_nested(struct kvm_vcpu *vcpu)
 	vmx->nested.cached_vmcs12 = NULL;
 	kfree(vmx->nested.cached_shadow_vmcs12);
 	vmx->nested.cached_shadow_vmcs12 = NULL;
-	/*
-	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
-	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
-	 * and if it is written, the contents are irrelevant.
-	 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
-	vmx->nested.pi_desc = NULL;
+
+	nested_put_vmcs12_pages(vcpu);
 
 	kvm_mmu_free_roots(vcpu->kvm, &vcpu->arch.guest_mmu, KVM_MMU_ROOTS_ALL);
 
@@ -4942,11 +4950,7 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 		vmx_update_cpu_dirty_logging(vcpu);
 	}
 
-	/* Unpin physical memory we referred to in vmcs02 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
-	vmx->nested.pi_desc = NULL;
+	nested_put_vmcs12_pages(vcpu);
 
 	if (vmx->nested.reload_vmcs01_apic_access_page) {
 		vmx->nested.reload_vmcs01_apic_access_page = false;
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
