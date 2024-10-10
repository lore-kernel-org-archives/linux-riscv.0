Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD15D24455
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+EXa58M5OB2otP+DWaTk0pt464NBWamj3eXsytYiGU=; b=xl88Ueg18CgjRR
	Et49NicxLUZS88GWQS96We0/UCUzxj/Eh/zZ8myy76kJxvi23xRXJZu8TwOjTuW1W+umjJYX3LBQg
	xiLT49GqHZgdk5ioEwVKEdSeL0taEJK03bfp3eBv7WYDpZMq4PRYYiCc8Cn0kba5MSVZ3Ke6imjny
	5UWbTq0mIHwRLTuGnez+B109RfGUWjgWdDHH1ogNMi6E9uggawnu9nuiQhYQj4Y5VxJMkNusb/llb
	JX5jztq1rejQLFvj9RBmnqbCoIVLOhRbghXPDnUrcuRSHVSrMsAYlkSk6z6JOxHJvblHinSi9pPon
	9mtrLBG5/6GVS50b6fsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0zN-0000000ESVa-3vBj;
	Thu, 10 Oct 2024 21:46:29 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsF-0000000DrDa-2uqg
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:57 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e2baf2ff64so22506637b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584814; x=1729189614; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9PLNR7J7/StxhsadOj2FvapRbIqIfrDfQ6nFmhEUvk8=;
        b=oxXZstpB7bZForNibrdtUdgMDhKCKO5NoyWz/FZhmXi1O/5zBMkdNGoOBmZUnuHPL5
         G5xj1yNE8SP9DIK/5R+FSLX1z3xFvSK7JT9CV/kxO/TU+0fFWjpeJqmMwLlYFO0Q+Tv4
         I858qQIY6Wc0qtONrNlC8gbObQgUKRGiuFgn7O1Kkb3dzs2Qp7EmMuvNXtmlilk77dG6
         00Dp5QMLKTvno0LnGfKXj09dJixXH9wsYC90KdPrw/8w/aMV7XGhbAVdXGuP5cSdmKEJ
         /2emmDAUPw3bLmVyf1eaRDVyfGHUrBZvZno+DFT7U8iIof4e8MNFX2e2pMznO8WrlsKE
         bLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584814; x=1729189614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PLNR7J7/StxhsadOj2FvapRbIqIfrDfQ6nFmhEUvk8=;
        b=FApOMGNuKm3WKOu97vfcyWi2XMYzvdGbQZ/1pw+iSHZdnRmpf3fVL2sEsOzZfkj9Zz
         hhllv90PihfSSiC+rVsbit6O255depZZhyUMmVG7xYlOWLqBRMXLn2YWqnCZFBxlUge0
         wkpv8XnSmmfTh21bAF9+zcTvqFX1Xvevx8LlrS+IawTNtXC52GSRn1ZphQKOxukxtRLv
         p5ZKLEcI+NpFvy0VtmS08BbqDTkIfhkkjrMAs09BR++70LsF+nQgHv5g/PBC33lp1bvD
         Nbr2vjkYgkfy7vY4tN+JJkRGXrJPjcbPlHqGOWMs/cLRZMCKbq3B+6nOq0Q7gGKLbeiO
         77fw==
X-Forwarded-Encrypted: i=1; AJvYcCUIRuYtHX60MRodAYoNwPkmRwArfmexYnYYRgJlcyA7ovYmSVPGLBK4LG24xSbZxxLc/VJ7qDoK/wyGvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5oFiL/KfoEwrre50ZdPdpPbuhO1es2nv/JuL53V3160tmiT3Z
	UpX3BfhLandTU3pJZSI0P2fRKqUu5eO5RApbptZLBj4CVeq6soANgHRvxj8ipMtgpFD65uq3NnE
	yEQ==
X-Google-Smtp-Source: AGHT+IFTz5/NgoL1lG2XSkf5pquU6CJl4M8l3x57mh4U7FbzzS84rW+oHIk+OXb87gKu92fZB4cgNqwOitE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:46c3:b0:6e3:21cf:a67f with SMTP id
 00721157ae682-6e32242fb5emr1006557b3.7.1728584814138; Thu, 10 Oct 2024
 11:26:54 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:59 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-58-seanjc@google.com>
Subject: [PATCH v13 57/85] KVM: RISC-V: Mark "struct page" pfns dirty iff a
 stage-2 PTE is installed
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112655_826230_744ABC6A 
X-CRM114-Status: GOOD (  10.32  )
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

Don't mark pages dirty if KVM bails from the page fault handler without
installing a stage-2 mapping, i.e. if the page is guaranteed to not be
written by the guest.

In addition to being a (very) minor fix, this paves the way for converting
RISC-V to use kvm_release_faultin_page().

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b63650f9b966..06aa5a0d056d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		goto out_unlock;
 
 	if (writable) {
-		kvm_set_pfn_dirty(hfn);
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
 				      vma_pagesize, false, true);
@@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
+	if ((!ret || ret == -EEXIST) && writable)
+		kvm_set_pfn_dirty(hfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_set_pfn_accessed(hfn);
 	kvm_release_pfn_clean(hfn);
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
