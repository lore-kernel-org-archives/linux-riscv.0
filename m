Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAB7C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaMgFjdVBM3+laLRQowGsz/8fEXpUMZNSd8y4j9xPYo=; b=Gv6CYBrSLy9x22
	TF2Uz24zhDV7Vn7oBRW51EAA94PMILFNAL4/6Fpz5AC70f50hygvNnWsZf7+1crpZsIEoWFDO/D2O
	5pvuVH8Z2BrWLZ+ypf/APPG4uz6bI2hENTUksJi6NUm3WgF9e7U9gaoSmlZHAbuT1N761sjpSklIu
	K0mye+YqKWlNygdKty4tEdz97yEQASPHjmgpzc+OpzXAIjQPJBNiO349DgqRi8ygfDx17TehlYt6e
	umq2cyhbh2LFDzO6HYYqLQD3qX8BFNL0INgJnzhtQdLsQGqbB2A41Y2W1vu3FYtmK8NUp33b9p6kN
	111eYEZJY+J7aOwFbv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUnl-00000005SAG-204b;
	Fri, 26 Jul 2024 23:56:45 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUk5-00000005PJW-14Uz
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:00 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-66619cb2d3eso5952047b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037976; x=1722642776; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fmU/HR7p0h2R7XRsIfqUXhH6E22vlxrvSMQX4VgE/mU=;
        b=GVn8sOEUzxgznAvb9AiWU8gjhZyCq/rJ8VnBH0A8r009nlMVPGsiw9gETcgaWmhneM
         qa+UDOqXZ3G8wKRM8AHmFCZU7TCXKpyljFBP6TzS9csb8Vm2pWzcDa6mKqX8RZ+0K6En
         Sej/kQkfdSI36yBu3UsYXAHi53bm/yC5IEhmpZhA3D3VgRYDj2VoCbLCKQ9w5OBuTWr1
         xd53j6HnYECQy3oirnWS0OhU/SfEVnHx4rl2WD/Hm6tSh3Y86JIge2aC7coOk57ne+xz
         pDqHP+I9Gao1yPIndBVu2Wi+C9zLKL6RrMw/UddMHq5whhSvd6QecVofVNacmbrFcHsR
         9u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037976; x=1722642776;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmU/HR7p0h2R7XRsIfqUXhH6E22vlxrvSMQX4VgE/mU=;
        b=GaFww0ghEHCuVrwXlnaQCeZyO8+aAT6qsF6D66UhuzTZpgs2+8ucBtdfNo53X8t8CR
         UF7wvY+ItEoFxN2ftuj0QUetL+euRGzgo4bDv/uCgrUkJ14JZctt6Y/aIGIDTOpJ1H0U
         5j1r6tL2vjEgQGuIZmebpV49eR16lDoOOmvSTb4Uui12o5vk9mbx2AyGoxidoDAIAhRc
         iZETNoSYnwj+G3e6fhIh/ypbM5fDjizKnaewy3g8Z6QIfiD7yiiPa5d5uXge5m4x+NdQ
         Ncpn1HsUQpzYq19tAsegTDmuMcGHtbA9RVBHSuvMqkcW6US/q4BGiKyuCvXG4B07TQTW
         o3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCULpPvmHfC3cqrUPL8zWhrVWTzxxWjKgPz72nCGvA/iHUZzv+XTDLMnWm9CTMSHCuTqWaw1cDdyLm+EBCGHWw2PKB5wn2pwQqWnJSVkxDXy
X-Gm-Message-State: AOJu0YxkitXsAfxtROvlCvA/Wkhv9YXYnuVstsbmr3KAjJobgX9FDYFq
	wjKcIe0atVt6xJGQwqjiIB8pjKfTiQzjpYUS5pLHQSLM8oz2cLncVnXTrgxprDRVey5yjjQ/3n0
	szA==
X-Google-Smtp-Source: AGHT+IEZeCODu/YeM5d/iOhxGxPVHISuly+z8I6+5BlUeuWOyJE5t2wqwhMJ9ApQGl0yAUOujG/KjtPFVv0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ad14:0:b0:62f:f535:f41 with SMTP id
 00721157ae682-67a0abd4d1fmr288247b3.9.1722037976008; Fri, 26 Jul 2024
 16:52:56 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:18 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-10-seanjc@google.com>
Subject: [PATCH v12 09/84] KVM: x86/mmu: Don't force flush if SPTE update
 clears Accessed bit
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
X-CRM114-CacheID: sfid-20240726_165257_518963_1C8D6454 
X-CRM114-Status: GOOD (  13.97  )
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

Don't force a TLB flush if mmu_spte_update() clears Accessed bit, as
access tracking tolerates false negatives, as evidenced by the
mmu_notifier hooks that explicit test and age SPTEs without doing a TLB
flush.

In practice, this is very nearly a nop.  spte_write_protect() and
spte_clear_dirty() never clear the Accessed bit.  make_spte() always
sets the Accessed bit for !prefetch scenarios.  FNAME(sync_spte) only sets
SPTE if the protection bits are changing, i.e. if a flush will be needed
regardless of the Accessed bits.  And FNAME(pte_prefetch) sets SPTE if and
only if the old SPTE is !PRESENT.

That leaves kvm_arch_async_page_ready() as the one path that will generate
a !ACCESSED SPTE *and* overwrite a PRESENT SPTE.  And that's very arguably
a bug, as clobbering a valid SPTE in that case is nonsensical.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 58b70328b20c..b7642f1f993f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -518,37 +518,24 @@ static u64 mmu_spte_update_no_track(u64 *sptep, u64 new_spte)
  * TLBs must be flushed. Otherwise rmap_write_protect will find a read-only
  * spte, even though the writable spte might be cached on a CPU's TLB.
  *
+ * Remote TLBs also need to be flushed if the Dirty bit is cleared, as false
+ * negatives are not acceptable, e.g. if KVM is using D-bit based PML on VMX.
+ *
+ * Don't flush if the Accessed bit is cleared, as access tracking tolerates
+ * false negatives, and the one path that does care about TLB flushes,
+ * kvm_mmu_notifier_clear_flush_young(), uses mmu_spte_update_no_track().
+ *
  * Returns true if the TLB needs to be flushed
  */
 static bool mmu_spte_update(u64 *sptep, u64 new_spte)
 {
-	bool flush = false;
 	u64 old_spte = mmu_spte_update_no_track(sptep, new_spte);
 
 	if (!is_shadow_present_pte(old_spte))
 		return false;
 
-	/*
-	 * For the spte updated out of mmu-lock is safe, since
-	 * we always atomically update it, see the comments in
-	 * spte_has_volatile_bits().
-	 */
-	if (is_mmu_writable_spte(old_spte) &&
-	      !is_writable_pte(new_spte))
-		flush = true;
-
-	/*
-	 * Flush TLB when accessed/dirty states are changed in the page tables,
-	 * to guarantee consistency between TLB and page tables.
-	 */
-
-	if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte))
-		flush = true;
-
-	if (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte))
-		flush = true;
-
-	return flush;
+	return (is_mmu_writable_spte(old_spte) && !is_writable_pte(new_spte)) ||
+	       (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte));
 }
 
 /*
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
