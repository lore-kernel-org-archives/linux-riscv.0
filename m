Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A92C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:35:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0887611C7
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0887611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Na0Ew5QI0VKkrAgqOe1/b2rPZFhIdEwDk3P/M9aqZE0=; b=2uUMWLdiQ3XMLL
	b2fUav2eUFLxfsqKShYfvx+do/PAB3qVuwtsoY36fDpdIZNZTffVU53FYy+txl7Pq58APeajU2S/j
	hWdvM1O9gQn4ulS0qnhvHUeJgPsGfexDzyrkzSwQy4KrP5IxvuaX1CTe78QzX4tNkpeUqo4f7HhHH
	TkZltRb48KnqihbXNqsYv/YTOwy13succLsODEd83Q0Wj/W+2EXcP7TMq2RygVXmURunUAmsrfN4k
	0ua5nIac9aEk2Za/VH1M0qSfm/z4THfG6EbqSY8XLqKnh6gUL/e6cw6aDDPG6Q+eoPBRLRre4tqdN
	Oppf+97LSR+1sUVSF30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQjJ-007HQ7-TB; Thu, 04 Nov 2021 00:35:45 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQaC-007ChT-CW
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:21 +0000
Received: by mail-pf1-x449.google.com with SMTP id
 a127-20020a627f85000000b0047feae4a8d9so2319575pfd.19
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=A6RNuBqUgsG4d2AkEOuVD6njvyuDvF4HW/gggxH+5XA=;
 b=OEQtzcgzg8iUsXNKyYwVPMo1zK+4Kr5qoKxGqBuItQV2mlefdBnexzTvsQV8x7tFLB
 DJ7N1H9zaKUjIJM9lgUrmNBtCvPaEhJRmE75YYyGNfGHftU+r7zpZ5tAJxYDGkRZ5UaN
 eCFKKjVPfyvAv1MPQ+W3cG8F1U785VZ2TB/bCNeburay+vZTg802nta3hX92M+l5e/kY
 v9PkejhG6TTnKgDhaZRjUpks89CX+RjAuwRAYXLN4sVhejbhHruqwLuHdy9a63l08zeG
 UQHlhHNETrOYUd9aJ76VJnvg16EQRO47SPl2LKCIPj/pp3bTuMRIyoksJkM8yu5B2mRm
 sSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=A6RNuBqUgsG4d2AkEOuVD6njvyuDvF4HW/gggxH+5XA=;
 b=se82MT3h8tea0gXeU0vo2zIz1y894DhbF9ywghnWfFaKAE7HKndko7Wyavst5NezL7
 0t2TqxoH1l54CkP9iRQyPtP8ZtgWJ6YBevuwn9jpjbNkUe0dU7yUoJorE7sdB977QjTO
 xAPX78WinffRHzT/LLtsrGbVqDeSawN3he/wwg+jMIU+wA8fvgjguuq7PnqB/O13bKL9
 SH7yRMi+/2SahCzVg4ClBJH7gZZc3DiXvMLuTBlnxLxrenrmVfft+Qmko1hE5zcNi33l
 CslUjte1nctGFlOfaE+FTKDXs2ghbEbVUCIjsQQDXE8MBNs3XrtgufQ1KPnrpm2OYwlk
 k5IA==
X-Gm-Message-State: AOAM5318dW2IhTMBbbNJHuQ2VCEUgyEUkv6MJWC2P2LWEQpShB5d3LNP
 32gfnumADXRqsTOlGfJU5UMHs63MgT8=
X-Google-Smtp-Source: ABdhPJwlGR9LbkwslcTVo23oQzDGM/4MShAybN51snLAMyuOhBW32wf0LbVvAKT8z91bQYBzxg51jn3JWKY=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2181:b0:44c:f4bc:2f74
 with SMTP id
 h1-20020a056a00218100b0044cf4bc2f74mr47624205pfi.68.1635985578784; Wed, 03
 Nov 2021 17:26:18 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:13 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-13-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 12/30] KVM: x86: Use "new" memslot instead of userspace
 memory region
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ben Gardon <bgardon@google.com>, 
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_172620_434435_C24D2413 
X-CRM114-Status: UNSURE (   9.15  )
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

Get the number of pages directly from the new memslot instead of
computing the same from the userspace memory region when allocating
memslot metadata.  This will allow a future patch to drop @mem.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index aa2abca47af0..c68e7de9f116 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11646,9 +11646,9 @@ int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages)
 }
 
 static int kvm_alloc_memslot_metadata(struct kvm *kvm,
-				      struct kvm_memory_slot *slot,
-				      unsigned long npages)
+				      struct kvm_memory_slot *slot)
 {
+	unsigned long npages = slot->npages;
 	int i, r;
 
 	/*
@@ -11733,8 +11733,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   enum kvm_mr_change change)
 {
 	if (change == KVM_MR_CREATE || change == KVM_MR_MOVE)
-		return kvm_alloc_memslot_metadata(kvm, new,
-						  mem->memory_size >> PAGE_SHIFT);
+		return kvm_alloc_memslot_metadata(kvm, new);
 
 	if (change == KVM_MR_FLAGS_ONLY)
 		memcpy(&new->arch, &old->arch, sizeof(old->arch));
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
