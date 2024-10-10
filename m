Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148A4D24455
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLK2cRfsEDkaGn3/Q3Ka2N2Qce9ALCnRdot2Df9vcNo=; b=p5j5zAN/VxT2B9
	USmALwm5Z0k+gmWM94E6VO3MZjExKTEkNKYeum+L8NzgIfRSrRNX1x9DPBMRMTGLr1eSQ4kt5kpKd
	jAonqX+maIa6XtVjObatuvOaRslAHiRQUfSj5pHm4w6nyMElmymgMdbfk+XUEYhoogBP3w9SX1a0y
	/Y/oA70X7z13Ju6Ox5NwYPL8akXfwwmSgLnmpFLf99Fhq4EzVutB4qO7+OPa066KysreAs6/uYStT
	ldhFeQ9smcXi5J+uYq7kGw0eqkstL3QuZRvogatchWXDTO3DgvLvGVV9Zky/G4m6QmfvAIs4J69l1
	llCR6eZAr0VK8cyKc+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0zb-0000000ESiG-1LMY;
	Thu, 10 Oct 2024 21:46:43 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsW-0000000DrSM-2ojI
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:15 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28eea1074dso1984587276.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584831; x=1729189631; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2XctyNuj5rmp2glWM4MaDBrVp36o24kp0nhTjUz4HGM=;
        b=YAw0UCrfTR8yZSyO2C++/akkY9F8ImVdU+QHywnyEzDNoziQZcTnFyWLoTIQpJhvbV
         Y8Pdn3YxYXd0G6JVJDHuHfdxdQ9m+Qk7S6GzmJ9qM85akpQuGxzBDKtJPWDI2IUxznCD
         vq6DmPEgcnDV0SF23KJrvt4oUa9M6w69GM7oSp9H743VLbGqcPfYLAjnqaTw6lH5kL5I
         AeSEU2al1IUe8APYV1qkZosGuvEU/HUkQXE+1awQrmJRkpjT8XqM9EaKYUWt37X5qHY/
         OQdNCE4r4uavOa2sXQyoineMlK5JoEa5HC2eFTf5e4O7iVUYru4c1B0gd0vQezhVxbT8
         DApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584831; x=1729189631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XctyNuj5rmp2glWM4MaDBrVp36o24kp0nhTjUz4HGM=;
        b=GkXGYfGsJBfOBS+sypJFmITN0jJsB8HzyVQugJVIZbeFPUhziyCdZB3+o+SCpLFgZy
         J4a3Fz4VY8Vd8QXm3OtGJZTxzNkZEug+tNR22K1MEHy6VlQE9ekP1GvgR5dhRzawrZPr
         PW4eMNSGctrXJWwDSQgrI7BWdmwOsgSHoKJWi3w5ytvB49hp14LjVuOFqA/TIBR/8wUB
         HLrxkFwaJCzT98J1OT9t4bGHoUT9ShKVWrYY7Ec0fAo5+Lt5B4YZa8xSJe8XAkGgpuc5
         K268dOPkXS7P3yuH16slSwQvqOvC+7hgAhhNk1PSjEKNcFV5K+9e6pIatlpWSzEe7dym
         rDhg==
X-Forwarded-Encrypted: i=1; AJvYcCXiHJEUiw2UPoEdgxO1eBROjHj+i/wiMPJdZ9KDa/LDYAYoNdYKap++EVTpEZjvfcivuZkHyTp7EsaEmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG3j0AX+ERYg6gYS2x6G9BAPEXQpQ7CYRKJ8JNkvSyC+wmN0AF
	c4KD+BN+2aTx58zsDMJQywcd1hNzNcBlF2CXOoWqvhrKFfS4uefKGg9LdY1O5vbHlOffs3wYayJ
	Ljg==
X-Google-Smtp-Source: AGHT+IHdtHq1a5g5QmW1TlBMuTKUOZ7R4d6aOVSlzi7r2JK/pfzCqaKRixPsJw6iRhPElP6sWQ73LfqmPps=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:d353:0:b0:e28:e74f:4cb with SMTP id
 3f1490d57ef6-e28fe0df614mr96115276.0.1728584831124; Thu, 10 Oct 2024 11:27:11
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:08 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-67-seanjc@google.com>
Subject: [PATCH v13 66/85] KVM: LoongArch: Mark "struct page" pfns accessed
 only in "slow" page fault path
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
X-CRM114-CacheID: sfid-20241010_112712_844863_13A0150A 
X-CRM114-Status: GOOD (  11.87  )
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

Mark pages accessed only in the slow path, before dropping mmu_lock when
faulting in guest memory so that LoongArch can convert to
kvm_release_faultin_page() without tripping its lockdep assertion on
mmu_lock being held.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index cc2a5f289b14..ed43504c5c7e 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -552,12 +552,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 {
 	int ret = 0;
-	kvm_pfn_t pfn = 0;
 	kvm_pte_t *ptep, changed, new;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *slot;
-	struct page *page;
 
 	spin_lock(&kvm->mmu_lock);
 
@@ -570,8 +568,6 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 
 	/* Track access to pages marked old */
 	new = kvm_pte_mkyoung(*ptep);
-	/* call kvm_set_pfn_accessed() after unlock */
-
 	if (write && !kvm_pte_dirty(new)) {
 		if (!kvm_pte_write(new)) {
 			ret = -EFAULT;
@@ -595,23 +591,11 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 	}
 
 	changed = new ^ (*ptep);
-	if (changed) {
+	if (changed)
 		kvm_set_pte(ptep, new);
-		pfn = kvm_pte_pfn(new);
-		page = kvm_pfn_to_refcounted_page(pfn);
-		if (page)
-			get_page(page);
-	}
+
 	spin_unlock(&kvm->mmu_lock);
 
-	if (changed) {
-		if (kvm_pte_young(changed))
-			kvm_set_pfn_accessed(pfn);
-
-		if (page)
-			put_page(page);
-	}
-
 	if (kvm_pte_dirty(changed))
 		mark_page_dirty(kvm, gfn);
 
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
