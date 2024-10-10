Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AA7D2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTdnpZ7JGQitYNiafNKXELF+PspIaiBa0jHtVVqySk0=; b=wjcvm8U2pSUlEK
	yZEF/BgFiq9NT/l8uYcdeyUsqpxNQkv0+TcCeJrPuLwB7S099KR2GH8ImXUUa8piXsU91jDft5NOP
	vzn+DNO9QSBu/Bgndlk80oY4QT27CkX1alR6QHvKCrEKJ8mevdO/sN+3aLsbGv8JEPKB+QX55CuIW
	QQ3+D6uwF95A8a/gtZpyOUcjjNaJ/hn/mjO/P61xDCKpkZ26ntOojeoOzGvJpr7l2XzM8DM2r2mPG
	YPOLbwtkjWhSy+3XpqRKIirBrdRo7UmdXOV82B5SOG957cwCBOaQ06TYxOgL9OnW2P3vnYS3IlzNU
	WWpTdNddFNNxtaWH7a1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzp1-0000000EH26-2nsS;
	Thu, 10 Oct 2024 20:31:43 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxs8-0000000Dr7L-3HbD
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:50 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28690bc290so2031250276.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584807; x=1729189607; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nHP38EtPz8K1+ebGaPqvgAKvgaQP36cKGSrn8JpxRdw=;
        b=uPMYi0jlcTO7wI+Xm2S76hfStVln/w8HUwai+nZMA8xWjcjtyTkYO5BLvyQK9HVnVf
         IoC4lxHelaOpDAbOwDoB+oedr7QlY1s0rbnaO+yPdv/IKAl3sf4qGFiPJRU3CPMHE1Ts
         bmeAWdy0d19eYiKgbHnbIWmxF0u1ugZLdKpLZO2jEwuBE0mZanlwFxa/r776lqNmdndR
         7aH8b9KOMLsBIOlzOWkLUDwWW1S1geoFO5SEFRbl3u07z8W40g/J3NQFWAUGK5Zf9guL
         qrxNClMmqikhJpVN2wcLFUeTcVHJZSytmG4budlvJ+haM4VLpLTbPtFg47vTPcWmRRDU
         xtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584807; x=1729189607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHP38EtPz8K1+ebGaPqvgAKvgaQP36cKGSrn8JpxRdw=;
        b=vKy7ct3HWJgohfguumJYkUHHUL5zhVIlb6XDtTs9sqhwrhcwtVYwWaK+TtiO4AnZXa
         jUKBtBJKo/UQdXl1PbCOBk4A49Vlv6dAE0nnJw3GFmPUqhKmmMTgAPrdla7DZ04Tgyr0
         4cVszaOd71S/7oYWeWV7dJWQ3cXNxvUDi4YRChidFII9pNiskIUh3T+0WxO1L4eIjnb+
         yF0SJdn6QOj9GKIATc3S5Kx89Kj0gcsUSWPDBX7Qr8TNH2wib1KglgnzQ9qZt27jE86U
         yqo8XX08pLwEMwvKBg36R7nlQNFe4RzJ/Hm+a+csr8h60GhxywUPHGEakP4AVlYh9MsP
         u2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUAOnpFFSGS/Ft/6I4i8kxOpbKcIzEG7z6nNTg3X+gEmjKlPpkwgCmZheUfK6sYohIaqO45M+aLvcNKHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmLNiRrfnuLp6tJMtnyfRBBRQcI+o5MJ18RErjNnhEaLNImFkt
	KRBeArEz8TtbpJDtvr1VepOuomKIcSY2Q/lPs73fIXdgvhbTWJ2Yb6W2PAc4kNapue+jsgB8waf
	Yqg==
X-Google-Smtp-Source: AGHT+IHQvsj0FcPHwm2v4Ks73fb0XY1uO3QmFFCKoUyfp7OKRYByAKtc8uXQ4anZ8QaSR/IH5oavOTtruEI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:b86:0:b0:e0e:8b26:484e with SMTP id
 3f1490d57ef6-e28fe516b5amr5188276.8.1728584807403; Thu, 10 Oct 2024 11:26:47
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:56 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-55-seanjc@google.com>
Subject: [PATCH v13 54/85] KVM: PPC: e500: Use __kvm_faultin_pfn() to handle
 page faults
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
X-CRM114-CacheID: sfid-20241010_112648_860470_81F950DE 
X-CRM114-Status: GOOD (  11.77  )
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

Convert PPC e500 to use __kvm_faultin_pfn()+kvm_release_faultin_page(),
and continue the inexorable march towards the demise of
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 334dd96f8081..e5a145b578a4 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -322,6 +322,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 {
 	struct kvm_memory_slot *slot;
 	unsigned long pfn = 0; /* silence GCC warning */
+	struct page *page = NULL;
 	unsigned long hva;
 	int pfnmap = 0;
 	int tsize = BOOK3E_PAGESZ_4K;
@@ -443,7 +444,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = gfn_to_pfn_memslot(slot, gfn);
+		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
@@ -488,8 +489,6 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
-	if (writable)
-		kvm_set_pfn_dirty(pfn);
 
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
@@ -498,8 +497,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	kvmppc_mmu_flush_icache(pfn);
 
 out:
-	/* Drop refcount on page, so that mmu notifiers can clear it */
-	kvm_release_pfn_clean(pfn);
+	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
