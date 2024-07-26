Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59D4C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/qDwyx259eO1i2OHMzMvDXZJJPmbiMhEVZV6Xf7Jx0=; b=VZla1sdkqYedJ/
	fTS0AsO1oKBoqjXRPtANRSVOCp0lMNefPi3YgcdrKtbOZFiFqAMtoETSGqDhODW3vXdysnmq4u6kK
	vZ/XUvx8t8xgfRwmTasEZXtaVMOjnhPbHG2vNp/6tLMAD6hSzXHLcKn02ooUGlYNYJmYOUzXX9rdZ
	VZ5imMcTiuzjZ+KHqNtRaH1G9VLlteCtM5sF2+gxXfWo6siemvjls4PW/48k4DQAJFHTj7kVKpNv7
	jjcXIXrsnbio7QTrIJmznmwv8ZCG813wJ2i1uNmyrSuTu9JQYi2HccKSS+ILqAfv15gGFiNJkf1EK
	+jpTO8fwm+a3tAb0unTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVG4-00000005gmH-0AQ7;
	Sat, 27 Jul 2024 00:26:00 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUls-00000005QsI-0EBx
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:49 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2cb5594a9f3so1506360a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038087; x=1722642887; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oFlnnuKhNT9l8QiAImtf2ecgGSNucZgQMIB0EjCSaJA=;
        b=EMwhLJunDrk3NB2hn/Boeh5Fn/qHAb9ITI39S+dEzdcmoT+THiAX+15JlSddAh1Sd9
         si5tj1z58M7KGA/vcZrvF6X0zigGCNdHPbfxApmzsUZnPrkUPSaglDQ8xB7uPA3sR8OI
         vtEJkWDpMUO3aBnxG9w7/ROooekgtXv0jZkaoO8olC5HHqElBX4aeb/RNYc+q5iy4CP1
         vmquzp2u+LI1ZrmA66xXzACZAtgcOvc2aBO/6JHSARjiQBiLPTd8nWm9/EqfPXQntXp+
         bwFWvzy8Cs8ApdSa3Dt3rEp2sovh6NWoDhcS/jDeBSNxe1KgmgykLUkjsGVtG+tCda0n
         f7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038087; x=1722642887;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFlnnuKhNT9l8QiAImtf2ecgGSNucZgQMIB0EjCSaJA=;
        b=jaRgMm+ZfgnZqhLLRtB4lxO1L+hpER90UVzz1SQiYFN6IjTSg38DciVHkUFI5DY8qy
         p/KdZltxe6h7TUwUohlzsxxka/SsLis/Ir8SViVHlHbcCbvP4zoG1kmUAPymA401u86L
         wrUdyQdZeBYhcUlJ2Wew0ShXoxovsinbsEeg/eEMmiyHTwDFIWWv8/dPmKebvE1RdJ+4
         9yLHVbtTtHkU3k/WFZHZpQmTTL6SnCwhFn0ytSYZ13IxaLPIzqNcK38CE+CYNLctLxXI
         8uRw7zy/khmr2XSxASZRJUIq3WGju1i8Tq5hZ06bAEdHXWkXMgQtaw2NYvQhD/VtVIeb
         dbmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUvI4UphZKo4NOuL0MSpIJqziGm5F3dqIl7TRT7KO3l2CsF1VpDXOEuMJyso8HUVl0ovoHZANs6oTYPEOqVErH2KxxmiW24/EA1Gm3zUV2
X-Gm-Message-State: AOJu0Yw3A+LgwQ1Z0y33Nx33s1A0IznTAaN/4jPA5irsN8yGCigqvSXS
	MZoSx3RjuoIw92IfCEa+NccbzpzcbGy4DGowGb2/8ZLeqVOruiWuiuK4dBaeQbSb/n4nJ4ps6JS
	PxQ==
X-Google-Smtp-Source: AGHT+IHpYPU/r0yyvqEOzDrNXs+L4GUiZCI45y4AH9hPwSk8nxMjnSbjsFMJ0nzRNCC8+VosuScTVNX7UfA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4f8e:b0:2c9:9a89:a2ae with SMTP id
 98e67ed59e1d1-2cf7d4317d2mr2552a91.0.1722038086790; Fri, 26 Jul 2024 16:54:46
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:11 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-63-seanjc@google.com>
Subject: [PATCH v12 62/84] KVM: PPC: Book3S: Mark "struct page" pfns
 dirty/accessed after installing PTE
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
X-CRM114-CacheID: sfid-20240726_165448_115795_809691C5 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

Mark pages/folios dirty/accessed after installing a PTE, and more
specifically after acquiring mmu_lock and checking for an mmu_notifier
invalidation.  Marking a page/folio dirty after it has been written back
can make some filesystems unhappy (backing KVM guests will such filesystem
files is uncommon, and the race is minuscule, hence the lack of complaints).
See the link below for details.

This will also allow converting Book3S to kvm_release_faultin_page(),
which requires that mmu_lock be held (for the aforementioned reason).

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index bc6a381b5346..d0e4f7bbdc3d 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -121,13 +121,10 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	vpn = hpt_vpn(orig_pte->eaddr, map->host_vsid, MMU_SEGSIZE_256M);
 
-	kvm_set_pfn_accessed(pfn);
 	if (!orig_pte->may_write || !writable)
 		rflags |= PP_RXRX;
-	else {
+	else
 		mark_page_dirty(vcpu->kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
-	}
 
 	if (!orig_pte->may_execute)
 		rflags |= HPTE_R_N;
@@ -202,8 +199,11 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	}
 
 out_unlock:
+	if (!orig_pte->may_write || !writable)
+		kvm_release_pfn_clean(pfn);
+	else
+		kvm_release_pfn_dirty(pfn);
 	spin_unlock(&kvm->mmu_lock);
-	kvm_release_pfn_clean(pfn);
 	if (cpte)
 		kvmppc_mmu_hpte_cache_free(cpte);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
