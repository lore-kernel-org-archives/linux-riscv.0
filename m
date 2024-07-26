Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B566C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rlwd0jmgODqPiZVVLLJm01T4eTTiJp8/0FBl1S5oV4=; b=VLPuX9R0hdobuC
	Js3o69PZ5m5PSm65pYchgg2YI6hhub659xdhHsGLwdizBHH4oGILl6hVI0VhukAeM4x/UX1o/1g7F
	sabzrfmC/Aing0J5UQC0YXo/SThUGU16dOfq7hqEpXmzIbhJom9fDSNqsC7iOcSjSLhibwOgT0eIn
	zk3fSRwsHedQLy68UxnZzw/SiweSSYyLiqnDuuSW7mQOhCe0H/VKlu69LMV/zlnuu9CyfdfHZlC0M
	1T/BPjfmGkEynyE8rX+JF8o7eq6TkjQ+jkJQuN+lqutNjuYUE+MiJhfQDyuWtVXtf4JH2DZ8bd6fm
	Dyusp5i2vPgjrxillkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXV95-00000005d3I-4BXs;
	Sat, 27 Jul 2024 00:18:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlR-00000005QWQ-1h4W
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 Jul 2024 23:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gyzdwZRgQhOlsIfYTCemvzcmHdUAJy3wvQe/vDjl5Fg=; b=IS4ADe4G4uVI60+bi97vnkpe/F
	j5Tis7jqS0ZHmgQt/gb27Beh8NYwbGYMcWNWggAA0gT/YuIJjmEVjcnsRBPVFyP3LS080rgxxyImB
	9OoI3xDA5Fk5dTDMW0GrUaJEKgjpe3Oq52cyeTp5+fPdvituENI47bIiIkx13abjoVYJ98obiVZEO
	Kl6DS4V9GO9Pi/CZUKYhjH0ZUMRw9I5+Jo4Bf/RTpVnoWjFbwErE00TGJaPHe9ZExfT0nylSUhRS5
	1lGuBuA4zpaVOOBeenAylAVr5VBOB4b+Uqu2aERVQePGk0ii7v8cyS4aqn43dzRQAlqvbrPF+VxzV
	0ynMtmFg==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUlO-00000004K0t-1HmQ
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:54:20 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-665a6dd38c8so7216657b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038055; x=1722642855; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gyzdwZRgQhOlsIfYTCemvzcmHdUAJy3wvQe/vDjl5Fg=;
        b=UP4nL2qMNSlVLcitmVs1V3U24gAiYO0x4JX+StE1g7LxiiQdHwe60Xc5k5VUGMwFaA
         uHxFMZ8Q6iL1XiGm9jD459N5/BkpyJhfGT92VqHyKk0rOkSPaoA38Xmxengi0wqOmXVd
         36ngHFiz8yGFgJdHE4gq+icHoioEq8f/KvijZ2LXDW35nqUsWbndmtpTI+ww6BurOsLv
         mlqgzdX1XIFfMDqmfXfZ5fVyCaqMZi+V4tYajebxnsAjgyztXxYJwUC4+YNX9tDcUrAU
         WnV72f16B6k/KKqum/1b0Y9XSMAnd0dbCEH6E4J8Wz0/5xw2Ya8IaMdCKSeIzLjDAKKT
         bxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038055; x=1722642855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyzdwZRgQhOlsIfYTCemvzcmHdUAJy3wvQe/vDjl5Fg=;
        b=f/pLeYeK77gqucnOukcyMV63xppUSJvoS+SEuFSY20A+q8wMWwLtL7Bn1CFAKJd6IC
         WzIe11O7Vh3qScZzx9BjFLIMjgYSqltTVnNuvMM8OzmlFhB2D0XJc/RxFdtY04VBBdoZ
         /NzdqrsW14hxe6kxje7i+8ZsMVy83PcdaczodXhIvGiEh1W6wTVxG9+8sbTT6SRuEFu+
         g37dHtWh1bcWBT+BuWndJnYrZRX1pDgNASLsMySXJUabfra0l50GkpIjJiQkOrvhBE9k
         3liv/MaB2szfB4AQINYVCJOnhJG8G5cBaTebK7nLYOTZGdmy9NvZnKDuFFGL3BJXxqX4
         t/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3EYCNli/oSSvfu5dYGl2QsvBOxx81UAs0JdkEWWfLJJBRIu47g1UckqM4Z9cZN+Y93FSODlBxhZQiGH1cACvGzhEnn5C0MDHbuWhU9O35
X-Gm-Message-State: AOJu0YyPeM++KBTuctLru87XTygqS8fEbZfDpXlq+2DODJ5H0ZkWVhTW
	zdx+VFF07EPE3C0gHzLQzJCIH5UunOxG0V3N1is+ivlEPhogi6LZRrNXI9IxOoapJgFa2IdfQJ8
	AhA==
X-Google-Smtp-Source: AGHT+IFpeG9OHD4NFko0QV+s2bLKC/mOPhRZ2kdDMQUp9/Z6e7qKWnbHym6UcCLJKsXB8YuZDTrWfSN5tHI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:14:b0:66a:764f:e57f with SMTP id
 00721157ae682-67a0abd50e9mr49107b3.7.1722038055008; Fri, 26 Jul 2024 16:54:15
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:56 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-48-seanjc@google.com>
Subject: [PATCH v12 47/84] KVM: x86/mmu: Don't mark unused faultin pages as accessed
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
X-CRM114-CacheID: sfid-20240727_005418_582277_621CCE2B 
X-CRM114-Status: GOOD (  12.11  )
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

When finishing guest page faults, don't mark pages as accessed if KVM
is resuming the guest _without_ installing a mapping, i.e. if the page
isn't being used.  While it's possible that marking the page accessed
could avoid minor thrashing due to reclaiming a page that the guest is
about to access, it's far more likely that the gfn=>pfn mapping was
was invalidated, e.g. due a memslot change, or because the corresponding
VMA is being modified.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3cdb1bd80823..95beb50748fc 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4339,7 +4339,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	 * fault handler, and so KVM must (somewhat) speculatively mark the
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
-	if (!fault->map_writable || r == RET_PF_RETRY)
+	if (r == RET_PF_RETRY)
+		kvm_release_page_unused(fault->refcounted_page);
+	else if (!fault->map_writable)
 		kvm_release_page_clean(fault->refcounted_page);
 	else
 		kvm_release_page_dirty(fault->refcounted_page);
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
