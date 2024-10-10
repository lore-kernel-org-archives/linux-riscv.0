Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C690ED24441
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ird9RK1nMnxvx5f3Q8pk6B2t9fiC5bgi9PKxFKvrKsE=; b=CDEjPvBRAorM3G
	P6ZrS/SukI8emDwQOFQuLA9gA81R+/YYleQ648xOE88deOltMp+3QkHxJTS7kywE+3N8FQc0Gw8m1
	V6/VaWRHAEoS1HMedYbcWzSlywlim4YgXXBEQizVq6F6Mo4LMPqHYj+wGSpYQcKrwMCj5Vew1N6ir
	tnw4TnNqFcwkq6mLt+MFJBf8JfwsqrQo9jeTU7RKqhE3Jq2BsFk1tl3utwsWnQvp8b0FNmwytPJat
	G6iSWu+uBKHBwRym+SlxANZoJTHu3BBrPA1Xb4aG5mBHXDRcqRiikgvg1aP7dBlfxzioecW97P8HI
	BmrZ8f5rlgLdn974Uhjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syz1v-0000000E8ti-3OKc;
	Thu, 10 Oct 2024 19:40:59 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsY-0000000DrTq-3Np3
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:16 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e148d4550bso1323671a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584833; x=1729189633; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3FFUjrr9Bcuid6sLVD5OEsWVTb8VG25P9bGjkNYbAzk=;
        b=jRyJBHlowWWe5rLfr7phIk02+Dz1smiC9B+8+l8fjItytQHfaPqfwXS9kwAda+9AmE
         shexSqSJbO2Rx5qii1tALAryS4pGnWvtVZCfeOEjmFWSO4HKZPxS8nkGfwDKwQymv5/V
         wfkt5jyod4tGS84UNkBF5H1yJop/76JLfNyM1euymRTGgEs/dQq38usgpogljBsjQeGI
         Dm9WN/3n4aZGT70TBOP644TkbWftIVyZDtlLOtZt6iA+3KaFCeUyJfaSP6mtPhXMMbZl
         celjnP4Ov3sMYoEohXSA+AP8wA6JsEeZNgXH6S6QNub5U4W5uofyo/ebOoZSoyqeVbK2
         vrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584833; x=1729189633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FFUjrr9Bcuid6sLVD5OEsWVTb8VG25P9bGjkNYbAzk=;
        b=bYQD+DD5aMfZ7efz0rFpNR3oqzGIve5q4W+Z0avdxBvsq3MenBLVwBuloQjasOsk5Y
         V+Yy5rnRPLnmJ+QzHWqChtuvmkuL0VzgyLIKRYko94fZ+B7DVYb2kN22+9w9JjRZiiGG
         m+wufA15ioVC4WzMp+ky8bkrImvNJQiSNXi2p9EJXKp/0f7IKjvbXHfIG6TVbprirlMG
         D5/j3Fq05AToWarrb7x/mXPc/QQhrLabaAPwi7jnjYgR/sDYu3ZATO6/sITzS1KxE4px
         oOogVYWOVRaJxsHju9JiAcVH6cYg7x3T1zjKv1fwFevpzggPLBFZm7LNaDPl1vi0+tWt
         jN1w==
X-Forwarded-Encrypted: i=1; AJvYcCVJpbmT/aqr3anOUT39sBJ3WdayJ2Y3aEUXDfpqGNTmK3f5RuaIALMs7Oe/bAva73MbOWtEzSt2PW2WxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1e9k0ILK1gUcBqf2gE2Icyh7LiV4TyhNSASWe5pAMndaBQg2i
	jCMc6n0D6YO+lmVno88b1KA8JAfQUpo9GeQOIjP+MlwqNKymLrNU/pNKBuccAaCbrUagNSF9XlH
	L7g==
X-Google-Smtp-Source: AGHT+IFpwqxWKAWfrUvKF1EatvnBv5g5CrzcpgT/ZTuiTODJnzoCoYK053S1MFwF0WyL9wI3LVhDYDAiv74=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90b:46d4:b0:2e2:e148:3d37 with SMTP id
 98e67ed59e1d1-2e2f09f1a56mr94a91.2.1728584833102; Thu, 10 Oct 2024 11:27:13
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:09 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-68-seanjc@google.com>
Subject: [PATCH v13 67/85] KVM: LoongArch: Mark "struct page" pfn accessed
 before dropping mmu_lock
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
X-CRM114-CacheID: sfid-20241010_112714_964461_624660B8 
X-CRM114-Status: UNSURE (   9.77  )
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that LoongArch can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index ed43504c5c7e..7066cafcce64 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -902,13 +902,13 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
+	kvm_release_pfn_clean(pfn);
 
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
-	kvm_release_pfn_clean(pfn);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
