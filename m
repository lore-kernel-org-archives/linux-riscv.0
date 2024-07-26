Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2550FC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MG4C1m2hn6sccMCpZwJh/R3d5por7tjjzSt5FSMOEQ=; b=A7qDs/M5xNehfd
	LQiDW2w5T8e1gg04lKuu9lZNKgkhXqZRuDxDs5baLVHQi3WBfp7thtt5ZZqpUBIg+2k7B1onC9DVP
	ZKms6FqCKgWNgipTPJPmHznP0gH/NN08R2XDZyQLYXbXXidiJXwbBEBlYmTE/RW0FbPs9ptHwVxAc
	IiN9sobEoWCAzMwFtzzWbasv4J9sR75qtsA3XmQdyJQX1vOUipE2SIMexep2wChdS6ZrmxaI1gemQ
	vEuXF45GeIIR9y+Zk93lTPta5hhghh3vAHxsvfFkScg70yS7BAyNFvXt+2FNDwjeiJE1+VFIH7sqY
	N6VAOjZ5m4eI3DpBEA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVAS-00000005dov-08bb;
	Sat, 27 Jul 2024 00:20:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlZ-00000005Qdt-47a4
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 Jul 2024 23:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cHTm12hU98ihrn/4YhoQtTNxFr6qD1GrOX0sqy5dmrg=; b=CZTRi8jLfDlpvna2dsvIBASjA5
	vLJ3trbL9QseQ4wLkjYN1pyM66OtnHyU0zpvgtbO+j0h/9yaciYUyEbBAl16Dv2kXfb7aC0NqvrNe
	/3me0zorBaAynuuoogjhs5QudVdcpMbcbDwu6kdGZ4dPFgJ/tX1pKPUshaOE0RNKWLrLh5SlAH22b
	zZMSpNHSSbSohbQ5xjEULqj/QZwtCi0/01BcUcvAs0K5OL2q2GVpqlISjxXPkvWfjGZUSjhRlhOAl
	zkib5qpwHSrFdsvGlF3NV+gSKi37+G/qt24XFP965OO3AQurDO0EGY4i2xmpdo8GwbffKtrE2FljO
	sJiqgTPw==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlU-00000004K1F-340I
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:28 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b2ca961ebso499352276.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038062; x=1722642862; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cHTm12hU98ihrn/4YhoQtTNxFr6qD1GrOX0sqy5dmrg=;
        b=1b1yYmKP7mnXxMD8tnd+bW+btmybxXMpXB9ZXxcbBPnk+y4Xq9L0jBGrXdeHOBJaEd
         uC+H+nUCYNpyEQdXJ+nfU3WnD90l2xR7m6qttWhkfpTr9nbPF8hyg6bFDel1hBhA09Zh
         W7s0yYoht5LCR3cLfE53AP+OBr0k9fFZuH7KoAmBCJ+/zmcPeuu8FHEcAca3Y+9cnw9E
         LqoF0LHpsAIbV7LI27bxZ3EDfXCAtVRXou/8AkGPVA9M5IKZv4XuTsUBH7LbVJI3mvLc
         tdeUZ8Tq2/MfUfEFY67Tet/kbztVAei3X6LYK1t45ciMHH9UmdCg+dP2KDlWAG8o0+Q5
         22uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038062; x=1722642862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHTm12hU98ihrn/4YhoQtTNxFr6qD1GrOX0sqy5dmrg=;
        b=ZHGKXSAeDkHXGOto/+FYQLyD1SJHNVGkgxDlmFtCORRW5X6avxEWxsw513xjKpWLWi
         GDfAo1FAFNnTwYfqIbzV7Bi6hyPAkoZ/yqEXtnf1Pn+4G6A05QJLac2V2xQpBUi65MB0
         So7DySoL2l3zklXgOMasWM3Z4vP1KDzWpJsgQBPe32mv5OlOrS3EAe1PfVcIHqsXagiW
         1+c1npCV/nM8/2W4wTFTWy69l8lEekBhmYGpkWkcxr3xH1mfaDReO03/7rSDcocBXLVc
         GUIQEXOLLVgv8WiN4p5Hg2vfC4wZEI+7oRVzsdLIH70JV0Gcf47n7dMv3D6BR/i4GGjJ
         Jj7g==
X-Forwarded-Encrypted: i=1; AJvYcCV70ccluEkFM0QxxRTR1FSt5L/Dn7wjhb2lsLqJyGEpyeO3VR4LQ/A1LrM3vmveCM601DgWWt4Z/q42GA33ir+3uBbpP7AUpOmJjfAYUALz
X-Gm-Message-State: AOJu0Yz1+Lz3wDDfvdtxSl5DsTfLBaT3/N+fdyrH/0bOE/QSGc1uERzF
	7JmbedmRJhFtoDf4zylXewcIOdSOij3zdk6RCRWBHoBUwMrPdfBCJup6vY8bVC9xwMy8FELiL2v
	f7g==
X-Google-Smtp-Source: AGHT+IE591qeJqHACb7CkRANjpP2e5907DfMapi1wU/6IAMP+NJSB5aPgL5hiS9fj7k9JDiJNu7gQfM60rI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1005:b0:e0b:f93:fe8c with SMTP id
 3f1490d57ef6-e0b5427fa67mr79886276.0.1722038062601; Fri, 26 Jul 2024 16:54:22
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:00 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-52-seanjc@google.com>
Subject: [PATCH v12 51/84] KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
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
X-CRM114-CacheID: sfid-20240727_005424_859615_AE280884 
X-CRM114-Status: GOOD (  11.93  )
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

Mark the underlying page as dirty in kvmppc_e500_ref_setup()'s sole
caller, kvmppc_e500_shadow_map(), which will allow converting e500 to
__kvm_faultin_pfn() + kvm_release_faultin_page() without having to do
a weird dance between ref_setup() and shadow_map().

Opportunistically drop the redundant kvm_set_pfn_accessed(), as
shadow_map() puts the page via kvm_release_pfn_clean().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index c664fdec75b1..5c2adfd19e12 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -242,7 +242,7 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
 }
 
-static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
+static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
 					 kvm_pfn_t pfn, unsigned int wimg)
 {
@@ -252,11 +252,7 @@ static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
 
-	/* Mark the page accessed */
-	kvm_set_pfn_accessed(pfn);
-
-	if (tlbe_is_writable(gtlbe))
-		kvm_set_pfn_dirty(pfn);
+	return tlbe_is_writable(gtlbe);
 }
 
 static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
@@ -337,6 +333,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	unsigned int wimg = 0;
 	pgd_t *pgdir;
 	unsigned long flags;
+	bool writable = false;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
@@ -490,7 +487,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			goto out;
 		}
 	}
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	if (writable)
+		kvm_set_pfn_dirty(pfn);
 
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
