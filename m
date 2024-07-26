Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4689AC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7GMyjyb9nffM5R0+oH38R0aNTKHC/khB2UY1OXfywA=; b=5G8BjGtYRCTis+
	s4l/gUDWbDOaILqR0W/oQySZKLUwcvaX2PK7aO71xXtyPlV601tCQF/eyaB8qB2xDGQ1dwUY3cWcS
	U9hR8hHQ5GJ665k6Jupyvtxd6EF3Rddrr/6O8cSNaXtEfGSxYKU08ryyUcPGDKvcxR+ojSOYpuam3
	2tQIgV+FX5PLr9tVGgjejtWnC0EQVrEsD/HIMfk4ngX+dU0VhlRuIehNXTCdgqMafa2jjXKyUZ5Uz
	X7qpey0UqYAjA7aX5D1XEsqJYD4EknDQTtzJR4Vner1mv/aEBhA0XbsS7sttcmhWMzMHmb+mWHhpo
	UcERhCstR13tRBaBN02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVGs-00000005h6g-0OzY;
	Sat, 27 Jul 2024 00:26:50 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlv-00000005QvH-3RB3
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:53 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0335450936so475815276.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038090; x=1722642890; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XEv6FisOGr6vpV2eziQMsIEoEavMf3RHPa1v90mbDdU=;
        b=EeCsWPS9kIjQeoy2YhVAeX8xthgjWzE22IQrjisj/hzoLhWw/cZNvxdgXKZd+ivJ5B
         dXklDq9YktuJK2q/IsJ231CG8P8ZBxPVuhoS1eaK+6KlYLxfWVAGEkmxL/akQFweDMvX
         CtagECM/ocgqShIgyoYH8oIEC1YyRUQZj2EI93Uot2LFbK3q0r8/mrr3IpuXro0JYRLc
         z4G7HavOIyyHLQt2fAaN0KbNm2VcHX1vpvP5D9/LRgSa7FYyrRYGEsBJgsHZUuQSYmOO
         L8ZTvt0xGAcJjM7n2ZX+hm5vY9MtMwG6e2IMwg/sDbtg7N0TaCZGdYImjosRDo18eZ+i
         mMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038090; x=1722642890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEv6FisOGr6vpV2eziQMsIEoEavMf3RHPa1v90mbDdU=;
        b=CgICU9TO6VtKQTIRjzis43pyDxvRHO6smXtOi3HmmhbAUNqIi2HiwUl9Vspo48y4NF
         wN9oRYCPoJbvGxImxQmJEBgFz5qJysW7st9p/qOY2j+9PdM72P3CO88gQoJcwFtYOMHd
         pVke675cqfZq+Xi//1YOczD4iiNJPlzjmrbUP8AsfONmuZwZJTMuyFiWOwraSyxaNRCP
         bO/xe3YGxpBjpffGpMI62Zdu5g5b8H+KoKHLUFRcI58y2R7aZfsEbK7iruZpGLUmQ53d
         ZFg3JSOgf7bC9wR8DfvFHOMGjK+3CMC8W2xgKlgi9iWBl/fSfBBdJyDrWnCZ4DnwFpOJ
         GEPg==
X-Forwarded-Encrypted: i=1; AJvYcCXHynyuvVjyGG4zDOjEBTOozomU5Ab5rlcRRRtxtHyG5deU86xxmoDVuD4mUD0gwPBRrYrqpuRrlNR7q38iHV0xDXY2Dud9JkfIeN89s4LX
X-Gm-Message-State: AOJu0YylZTCnr/llbhR3NtT+m+u8VpwXamXT1XwxV5tTHLiNafiF8IoY
	KZ4ez6tQ0lxCtqWGxV8WS5iJ/3ohXYiJg963/kC2KLvAPXO5O+Tn8CbS9NPSfpnSciS/FDtInDz
	C5w==
X-Google-Smtp-Source: AGHT+IEFsToK4Mtfkt/isyLtzSbxuiJaEYiedQjj5sFCo8o3/vbFtfyZ9L8therJfArRWUvkwGk/K/B8SPA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1002:b0:e05:6961:6db3 with SMTP id
 3f1490d57ef6-e0b54503b59mr2236276.9.1722038090539; Fri, 26 Jul 2024 16:54:50
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:13 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-65-seanjc@google.com>
Subject: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty only
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165452_051165_582C5125 
X-CRM114-Status: UNSURE (   9.88  )
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
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 2634a9e8d82c..364dd35e0557 100644
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
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
