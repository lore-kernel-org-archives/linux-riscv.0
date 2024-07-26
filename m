Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48A5C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hVb8fCrRCd1jE9cZzerfbToZT3GcnwjYEHgRuEy+0g=; b=m2wuInC7m13DCW
	Zb8wvoeAyxh/861jOnpymAVu43sIibbdVcgfaAOOFPHAN+5cXkxZpJILdFuKbMRqhPbgtUBJOc89d
	nvZIg9kD9FwW4iltarBP+fJ9nw+uHsgdAVos+vqFO6OPnmzisYyEA3/14GwQL7RyRCaD5nC/CbrA9
	7wmWzg7C2k0QRDClAAFG1/t3/Qf6Ilh6MCC7ImTEgC9K4Ehn+FNjh+r2uCmT3C7fNAVSwZNFRFCeK
	9VZCnZAL34IleOWlxOoSz7G3amgERhPYWh7knTfoYrUbCrATwtLcyt8xFbuCk0gv7S5owd/jGBezK
	ys7BjHfqDyPmWjUzatYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVAT-00000005dqV-3HYD;
	Sat, 27 Jul 2024 00:20:13 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlV-00000005QaQ-45Fn
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:30 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fd72932d74so11084305ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038065; x=1722642865; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WWjK/C8AJGiWvc7o48+tH+q+w9m6pJN61mgGRKL0h6o=;
        b=qUU4OHgbOw2M0kRlim6KlT4W+dp5p8w6E3f8xq1UppxM8UA1RcMojCUFYNfdsRFxCl
         aOO+824kw1jD8RjFbLKGuxUxkjF2YLzrhMS5VoJCJJ92di/sz/2baNLTk+GAIYLWvcdK
         RYHrZ4np0WDEcjOMLI042UccPIwPAJCKiJ9P+xxqQcghLAIJZpAPtRps0pY34ssPPR+K
         uxspnpnFpO2/inQ7+s3ZQHp/Bt4P4Van57fp/t7DNcFscgYoeKTty8H23R3LOwRgqTVY
         7wt/QEGVMg+vBotmBoXqrqnCyp9Pwie8rkKWeJqd2KS0WOzP/BhfAoBbTIyOksGes05g
         DuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038065; x=1722642865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWjK/C8AJGiWvc7o48+tH+q+w9m6pJN61mgGRKL0h6o=;
        b=c7sd7yuQCK70nAMvUeQbMLPGcifFGxy1GHxKUo8+GDTGtqceqLD0dVbYW7OXc42x6h
         Df6gfQ4ye6TXSXKfyfBgg/AZVSNI9kU64+pUAjwWVJL7+vV5rmUlQ3iSq56OjgSm0AnE
         TI5ROEjJtZOhTTPs5P21W/k0c6c1EpZjgujjzFzzOIxkWQ0Reuw5wDt08qejcFgWmhkO
         41iCvGyuZmG+GBHkEJ0RpkILqFKbjn6zn+AUY+yIzCZaLqJKcrrRWprWyqIKlf5svZW1
         bcHP6UV5KirnySoNGLMFZc4SVUDEZiUP7pB9YSTpAUjjf09/NGMWQLYlfH6PEnf5+Knd
         cBjw==
X-Forwarded-Encrypted: i=1; AJvYcCU2H0i7FcWvx2LNAgKX1NYqnqQTFrLeywNgM/ko1G5bNqS4tOjuekLxWk/eXOXMOg9qTTYDP5OeDDU4wyKHiKcb/xWv3F20LFV1YIy4TMqD
X-Gm-Message-State: AOJu0Yy1RKGvJ+Ag8ZUfNIgS7/WaOy36xYy8xyo2lWGO5etckrnA7VBs
	1MC6EIoD19rQ0bFFnNr538ni9lBQgEqDS+AHCEQuGWtAOgnwcxINhV++e0+Hxwl5ZpNYuMThriO
	uSA==
X-Google-Smtp-Source: AGHT+IHjueGi4XHTR80VLKYNSmezTNqicqTjy1hjWkoeqfVxP7xL/6dlCTgQugjOLvFflviFEVZzvXY7ZzM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c6:b0:1fb:80c5:ce5d with SMTP id
 d9443c01a7336-1ff047b2dd6mr400915ad.4.1722038064523; Fri, 26 Jul 2024
 16:54:24 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:01 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-53-seanjc@google.com>
Subject: [PATCH v12 52/84] KVM: PPC: e500: Mark "struct page" pfn accessed
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
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165426_268567_61A4509A 
X-CRM114-Status: UNSURE (   8.51  )
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
so that shadow_map() can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.  Marking pages
accessed outside of mmu_lock is ok (not great, but safe), but marking
pages _dirty_ outside of mmu_lock can make filesystems unhappy.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 5c2adfd19e12..334dd96f8081 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -498,11 +498,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	kvmppc_mmu_flush_icache(pfn);
 
 out:
-	spin_unlock(&kvm->mmu_lock);
-
 	/* Drop refcount on page, so that mmu notifiers can clear it */
 	kvm_release_pfn_clean(pfn);
-
+	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
