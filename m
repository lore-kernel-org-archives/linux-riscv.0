Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBDBC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4qNQG3wCPu0jzUJm0HzggdcqUFpNGgeHxHv3V5KhQI=; b=p4qcgRwNKSO+27
	4fGN4069+yzGcKsLxA+5Q4HSle2R2PmHxwQSWc2xgMZESHwODnDj3biFomzEgBVb1WKNsQRcZ0fXV
	4pkBNPI5wYJ7KGQYpr9bQ5MgM4DYg2yXFTOGMtKjNXrtHaSaY3IebpwGffhJ2pqaYlx5Q7FRGEp3S
	Sfk/4amK5DLVn5Eoqbd/6fiTSKU7bxuz6WoW4prT6e8GbQuzI9KVwq67V+MDMB7Umnq7N/N7gz6Ma
	y4RxHohSlRqMttIDIUbzhaKU10XK4Qo3woDqpOmLdC+1MYn80VQRvye5Qt6T1d1iSojqTtPFj+zBq
	OOZNId7REnlf6LiaL8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV9x-00000005dVO-1yJc;
	Sat, 27 Jul 2024 00:19:41 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlQ-00000005QVF-05EC
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:25 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2cb600e1169so1649951a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038059; x=1722642859; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TqUPaGEc7V7k122pX7jZuWDsKBXmCX3Y3KCoLsEzljY=;
        b=xqt6MwrjwiG6Jl+edJpYIKVxwh2eVe43CG086lQKI580H90HRUv0lj8vBbu5bbCCZq
         9+vN4U5/5t+X5VCZMfImh5UwCCCOFP80XxNkXd9MD03+LfrM381W855UWTJ3ec7e5cNN
         BpSVT8UXDflXmVB3dZm03eSmhFTrM7I8X9azctBc90W4TA/rFhkgsN1rNmBpFFAwujon
         4PFXd63IAym6fyPKqbr6i/sBxeKjPJMxkwKNZw40fyl1EplZ/Uhh3SINAlG/StjMTt+c
         sGE/IETuFarpv0/oVtyzkiFiGQyJCS3pgDXVPlYrHm0Gw/ZqUli1j4Bs+oAFx4FQvXpi
         cATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038059; x=1722642859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqUPaGEc7V7k122pX7jZuWDsKBXmCX3Y3KCoLsEzljY=;
        b=ZiaWj97IuSTlvZqQXUVPc3OtKSBfvT8N5YMqK5yQVhqpk0ZDgG6sF59mTuSm1iqqXU
         WSW3cUE29cGMaWJY8pHeYgqX+XGnPLUVVxXnFsdCSoWiuQUpWLSitTmAIo5kjDl7W+Iu
         1Kfpcft3B6Nkh9EI9nayCx1iUk+24ypowxHszV78lfHXIChha8+lzZCgBt39Xw+M+dS/
         Wa3Dk0RBwO2oEOETCuv79nVno7YLENnG8GTXsfDuc0gyguuOzDBfYxu/l9J0dUe++De8
         dmnouJRJ7NimeTuSvCo+9dZ0zi1Y213PmSvOgZo3Qv8QgNzPfoRSQi3/2nbvbv6HdsjB
         nypA==
X-Forwarded-Encrypted: i=1; AJvYcCVfAVYD6paxqOete1y7x3q86UvnPISF2x4GlQsyabWibxeOVqxpKLs/F5G4WThmLGAgaRzDWqcfkdhF6iu2Z9PDru23kC18uMUYTk6nUJLJ
X-Gm-Message-State: AOJu0YxEt4RyGFsRkiTKJjua/wbtGX2b1sjiWdUH6M7MsA7FHVBJb3l6
	LmRuM2SiAhDsALxwWy6b87LAXjpnb5JvPKC4i9NXpA5FKWMvqZ8TJ0d7VepSoLId1oPw+hG87mc
	WAg==
X-Google-Smtp-Source: AGHT+IH7R2Sq6ws3raxo/M+HjUZh8HrSGcUFKZNBVKBew2cgXvpkeEwYajfUFO1jgdCm33mambqvR7vew2A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:19c4:b0:2c8:8288:1f3c with SMTP id
 98e67ed59e1d1-2cf7e08defcmr21966a91.1.1722038058548; Fri, 26 Jul 2024
 16:54:18 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:58 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-50-seanjc@google.com>
Subject: [PATCH v12 49/84] KVM: VMX: Hold mmu_lock until page is released when
 updating APIC access page
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
X-CRM114-CacheID: sfid-20240726_165420_218488_E8D27029 
X-CRM114-Status: GOOD (  12.80  )
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

Hold mmu_lock across kvm_release_pfn_clean() when refreshing the APIC
access page address to ensure that KVM doesn't mark a page/folio as
accessed after it has been unmapped.  Practically speaking marking a folio
accesses is benign in this scenario, as KVM does hold a reference (it's
really just marking folios dirty that is problematic), but there's no
reason not to be paranoid (moving the APIC access page isn't a hot path),
and no reason to be different from other mmu_notifier-protected flows in
KVM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f18c2d8c7476..30032585f7dc 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6828,25 +6828,22 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 		return;
 
 	read_lock(&vcpu->kvm->mmu_lock);
-	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
+	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
 		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
-		read_unlock(&vcpu->kvm->mmu_lock);
-		goto out;
-	}
+	else
+		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
 
-	vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
-	read_unlock(&vcpu->kvm->mmu_lock);
-
-	/*
-	 * No need for a manual TLB flush at this point, KVM has already done a
-	 * flush if there were SPTEs pointing at the previous page.
-	 */
-out:
 	/*
 	 * Do not pin apic access page in memory, the MMU notifier
 	 * will call us again if it is migrated or swapped out.
 	 */
 	kvm_release_pfn_clean(pfn);
+
+	/*
+	 * No need for a manual TLB flush at this point, KVM has already done a
+	 * flush if there were SPTEs pointing at the previous page.
+	 */
+	read_unlock(&vcpu->kvm->mmu_lock);
 }
 
 void vmx_hwapic_isr_update(int max_isr)
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
