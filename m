Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F989D2444D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEPlshgRWRRqhP7abXt+CqAihZdROvyf+AKZQkYdANQ=; b=2lCrrj9jla3uK/
	H0m9XVtqo5AWrnwyVn35cO2NceEm3IpMau4PwERor9JUWqOVr14EjWwZEQKf/VRGTKJkX0JAQz0Iu
	Cw+qDOTXp7XIexib6sb3EBF+i5M57O6bSO9FYVIMtjKeXhdug34JUGmWo7vdScixkZyfwQI/IWCMZ
	bAhgkTBiaJzjCZMvKhBGR05DWZd6+fVjzktKtdtIhlwCcO2mvmYz09lz3cJJ5I09pCLXysdlzt6UQ
	wRzDWd9PDvXnx0OAbt1D8Mw5GJAkV+tcugS4H8wrlAFzu0MPusPldgKRLmWsbTgMUBstNFpzgBJWn
	vihOXf2Wn/11/HK9sZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyzH-0000000E8RF-3MfW;
	Thu, 10 Oct 2024 19:38:15 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsU-0000000DrQM-2PBY
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:12 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7ea0d46d1f0so1514631a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584829; x=1729189629; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0kIT1cNFK/xt59MDB/Io88ATgyMybLemEwY+DfOgUM8=;
        b=ncGV/c+AluGiB5Wub5u8UvSkBS0krkBKkswJl6TMY+O1XuP40I467d8ozAcdtO7hSX
         bztAb+6FlXzcvwIsAQ6TTFHDKDi7VhRVvgGcklZgclHPJPmQIJUmDxuuKMxJyiWV4Us9
         Ml94yw8Oe73armjC74hfiiSHJHgPJIO7CSlAJKylZc6klQTjK+b7jKsxlkI+sKtaU9qd
         cifr07vNF2dIWwlBAwdWJ4VSg4uRAO8nMuyrn3L4ExIpZkQBXLiKPMlqGK55FpGn/Tqj
         k6bkx9fc/VgXfATlBMbhoK+qvMiheT5pGQJ8Qkty2qp7noqUc5YtxHoCd3kwzYuiRXs3
         y4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584829; x=1729189629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kIT1cNFK/xt59MDB/Io88ATgyMybLemEwY+DfOgUM8=;
        b=fDsgSswpDw+ZGjqjGGVVd/p4hv2yIK1qdkEJRIhUQbEyj9oVf7H1h3WwBexlttkb1a
         V5WHfDWph8GJvKDDarhpSAE4YzTi/jaiABhWnXUQeYTPZ0z5Ms+bNCiWUXGj5cY+6Zpo
         Y+5qrhPFUERNgLt3aXsLgBl+nQAloCVW+aE3qlb8n+2ppBWAFt2pixWUf5gmtiIgM275
         /YoY1Z1qD1OEz6TpREfzzAl/2wkw2X7WKVT2u6BAygj2yd1KPsp9yLJ9NppToftgeaTn
         XqY65kYoOgOFa+7m8IGt6LpnEkdmP+7ZDRzKxg+4v523aNeUzgKdn3LumMVifO7jsREN
         AkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+WJR7pL9mkAMVlz5cMHUrKBHa/roD9huKgqze0ZcHrC5IQfsK2KRfmoKjkLqyW2A7l3Uo+tlXm+nxsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDjaiBpHOVNZzn6ah7WtxGG7HmJJj9bcZeOnecyHrEom/xKlQx
	g0RPWzGcb9/X0eXM4o9cvmE1LXT3FRZE8T4irCVoeOfrPuHN3WoeqW14qixUlM1AKryuS71HpM3
	8fw==
X-Google-Smtp-Source: AGHT+IEVjHGN/ZoxQo+Z413816spxD1Vig97FmVkGQ57WYZx6k/7CY2I8TFVs2SPVm+Oq4UkGx7TgXf3+Fw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:192:b0:20b:bd8d:427a with SMTP id
 d9443c01a7336-20c6377ab7bmr1062205ad.5.1728584829203; Thu, 10 Oct 2024
 11:27:09 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:07 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-66-seanjc@google.com>
Subject: [PATCH v13 65/85] KVM: LoongArch: Mark "struct page" pfns dirty only
 in "slow" page fault path
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
X-CRM114-CacheID: sfid-20241010_112710_656332_3380CD48 
X-CRM114-Status: UNSURE (   9.71  )
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

Mark pages/folios dirty only the slow page fault path, i.e. only when
mmu_lock is held and the operation is mmu_notifier-protected, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).

See the link below for details.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 28681dfb4b85..cc2a5f289b14 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -608,13 +608,13 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 		if (kvm_pte_young(changed))
 			kvm_set_pfn_accessed(pfn);
 
-		if (kvm_pte_dirty(changed)) {
-			mark_page_dirty(kvm, gfn);
-			kvm_set_pfn_dirty(pfn);
-		}
 		if (page)
 			put_page(page);
 	}
+
+	if (kvm_pte_dirty(changed))
+		mark_page_dirty(kvm, gfn);
+
 	return ret;
 out:
 	spin_unlock(&kvm->mmu_lock);
@@ -915,12 +915,14 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	else
 		++kvm->stat.pages;
 	kvm_set_pte(ptep, new_pte);
-	spin_unlock(&kvm->mmu_lock);
 
-	if (prot_bits & _PAGE_DIRTY) {
-		mark_page_dirty_in_slot(kvm, memslot, gfn);
+	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-	}
+
+	spin_unlock(&kvm->mmu_lock);
+
+	if (prot_bits & _PAGE_DIRTY)
+		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
 	kvm_release_pfn_clean(pfn);
 out:
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
