Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFEDC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZoN5pQnffheeKPPHJoP6sKHLdPOvLeEFhRHIReni8o=; b=MF5DFlVCe00Xx+
	nl48Y7FT3Y5/DBvinWNeBP9W5ooF9dNEFNQ4qML4F5a1DB3iEuO+23TLh4+pgwRfwX6RAMWBH5qkn
	9AbsFpBx/hrObMrDAL2wVtRVz8eRiqeJL4VhRJgEFSKotq4Ux/EdbL9pXTGh10pnR1wTeDl1PyDsC
	SFfY5/nbaaEkxciloB8hUL11M5BcwF2VUQ20JiqmVvFuGKlAukEaeNuaTKjgYPriUYHz1UWA9RmpI
	RHGNOutFSvg9BsTTudLTlns5CaGRRRMsOl0jOlsX3glWbOhIl6kq2/BufEFS/ZsGYBCZDRe/PIb0C
	P5hpHge5Zz9zLTbcbx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuWf-0000000G2Je-2wA7;
	Thu, 14 Mar 2024 23:30:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTj-0000000G0Ia-33tg
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Mar 2024 23:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uvANWFYN1jpIYLHOo6AYUHWQUhBZT4UdCnC51A9DHBc=; b=KFyoh/YuOOnEF4KDoTCh+Xrch0
	hTwn6QT6Jm0tAvMUCYiFeLiV3XcUC9p83QbTkoRRpIlBLLw8xHlN2+dr1NDDpgZTaDPYl1Ow6b8pX
	TMv7jhz0YSWS8gS/MP0xFM9DGm2F2x4a4wYjJvLYqWAb8RpeyijN/q5RUCrQy0bvB6QQCAMoit02z
	Is/Tt89D2ZLCgO1NRTGOfooZl6zRaHbPCtmqzph5RlZ7Q2YoiBrdrg2GaVWXKwNPqUZXQdJ9AhP8+
	2g2hClnDj9cgbK6TSPqSkrnwiv43C582j9eB2tVcRqj7Ucm9plgJR1GwTiX3VBCG7iwxV9ISlcIhq
	U/avGNIA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTa-0000000Aiul-404j
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:13 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-29c751d57ddso1227425a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458822; x=1711063622; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uvANWFYN1jpIYLHOo6AYUHWQUhBZT4UdCnC51A9DHBc=;
        b=HbDbMEtd4JjkIfVz8GzTm+SJJ2wVvRtJZE2H3eh4lWO641P0jzCSPVMkndDKksT6Tj
         9NbNIEXKLHwlqYy6MRdUtTX/4JecBPTdD8qqHudE7j49q2G7aNhU+uhiaov7ybiD5WFu
         HnufadObWWKlyTvrxXoj6ocLwQYPKoVt1VtxHjrrOS3LnBUf/Ff6+GFbExEkLyzHaiZ4
         W9nqHDn5ALn91xEiZPoEv4E5Iak6dxoz8wM8p7+St+/Jit73/tm2WPFoEyPiOy8qPifs
         w2UUU19i3OdeU+QFv22kZnbI/dHUXRTej5zgrsXmRGKuEdB7SdQ7I9iR/aqSooEcYAnR
         h1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458822; x=1711063622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvANWFYN1jpIYLHOo6AYUHWQUhBZT4UdCnC51A9DHBc=;
        b=f/JooVMI/J361XdB+nGjClsqU+bshWd+mvx4HVAkY8/8gEtANXgXjzEyQrYw/FSP30
         aC574TCAwSBBFOVI5LoWE9iIBCTU2XkzQrrxAZ/GzlU0CR+cdfb/yc6gb2DMA67SLiYm
         X9FKf5lV1iFzLSc+upo4XRffogCy0ts1yjqqAXYUwNGurTYUbVI72kMFdBgLIjr1vqxS
         KVwVZ+dTJZwmqxyTAweva8zMtR6fzarufTt1EeXG9VhpKee0JqM7r6ujLR2eD1NHYrQ8
         mgIwbAMsnBMQO98oKUedAwOfPr82XGg/VTQy4Zgff770RsHleJ3KdCB9r8lgvRDVQB5z
         rkrw==
X-Forwarded-Encrypted: i=1; AJvYcCWia+aBUAA4/1yklcZ3solzXcGQ2i9KKGhy4WT2QoyQdi4Ac1xVccrsicPEyd1tq+il10YzdK/O+Gsi87gBMWfC0YKYQo0jbx+rKw9v1aGz
X-Gm-Message-State: AOJu0YztNa4mkaDe35hbp+mcXMbczCpqi8W4cao3pL8E9B5ZT6gjKJLi
	njNdkXyKeCu9tx1p09o/haLrrrgw5tS2vLAg9UYS4TRoOkEPJRDuwwRCxTMgMKgWOeBGpAWEx7U
	lPw==
X-Google-Smtp-Source: AGHT+IEmqFL1IXL1pIFLbyp7eKBr0s6FFOiXRR1g8DgzlSysrKWmAergLMAyluCim6XJlXtnyauxch/eeT4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:b07:b0:29c:6d5f:a6a8 with SMTP id
 bf7-20020a17090b0b0700b0029c6d5fa6a8mr8117pjb.0.1710458822156; Thu, 14 Mar
 2024 16:27:02 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:31 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-13-seanjc@google.com>
Subject: [PATCH 12/18] KVM: selftests: Allocate x86's GDT during VM creation
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_232709_050120_1D9474DA 
X-CRM114-Status: GOOD (  10.72  )
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

Allocate the GDT during creation of non-barebones VMs instead of waiting
until the first vCPU is created, as the whole point of non-barebones VMs
is to be able to run vCPUs, i.e. the GDT is going to get allocated no
matter what.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index f4046029f168..8547833ffa26 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -518,9 +518,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 
 static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
 {
-	if (!vm->arch.gdt)
-		vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
-
 	dt->base = vm->arch.gdt;
 	dt->limit = getpagesize() - 1;
 }
@@ -644,6 +641,7 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
 	extern void *idt_handlers;
 	int i;
 
+	vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	/* Handlers have the same address in both address spaces.*/
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
