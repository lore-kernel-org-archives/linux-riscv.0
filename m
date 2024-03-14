Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16A7C54E6A
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 00:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myg11l5vU1apTvQYEbI4RFoh7nM7W1rPTLoSitNMPfM=; b=r+zVzOiITwiXqF
	0v3IP0LTtrHUT7DDx+/8Qp/ccioICs2SnT6HgcS6Bj7SqF1JT+2yICRX5lhB/KKtQoqoFblayhLBk
	BH3M5lB0qKl7LJh8mlZWFvswRSSyfXG5ZMnRBQz8Mk1wVldzdpuJW8FzAQO8FfVi2aDYh400lu5mV
	hhHBABApmiS+zM/MILpMwDH7mVtqgSCgl2MamwpGAVPAg4UM2hVwfeTFhteb4PbvHhqlssbrMtX2X
	T0nhpmtfqFQ9iU0H7kWpcCEoE82nVm203hBvkm/zYlcmYabNTP1Nbj9437O8NyvrJM45tYVKBeO/W
	nADlSQN+jpssJl9dHvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkvUe-0000000GAxM-0Le4;
	Fri, 15 Mar 2024 00:32:16 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTf-0000000G0Ck-040E
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:15 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-60cbba6f571so29564497b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458828; x=1711063628; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uF6G18lAXQi7SGjNgTcxotaL8n8pv6tjDstW0Eyh3/8=;
        b=jEJBKeTKAIgmH15H/lHN28fbMaiYa0bKtuYroyQX1POYA8VEH7NkmuDzuyOV4x5X+L
         pOxne2BJTpC5cfs9vC7MirjxxtkjUWCHp2djT6jKnyH3h4jmebV76RoIX4MsvLE/CgNJ
         tAZRT1nCT+EkooE6dflvTsZuX5pDSbQzw1Y0bepS/CcDiBw4RD3rCNMskpcwsTs04Wz7
         wUSvxli1cXZZoYlgiVVW9IrbD2ZAm9iPo4SoMCLLUhtAbCSFcTYIVmn7q4GVQD2Qz2/k
         mLtp6aokdNdg2BAIl5s11uWCrtczpT51QILUHLiRu9gAW55HfY5pk8rFoX7Eo1J6swN+
         mAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458828; x=1711063628;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uF6G18lAXQi7SGjNgTcxotaL8n8pv6tjDstW0Eyh3/8=;
        b=ZZxcVkoj2wMJxaQRGOpvhApkbhMKAnosXDQakuZG83fEUo23tI9mR3j/pUbebR3MvT
         re54FhXn5urjeOmClO8aYJvTIZi9y2jiTm2btwGt2BHX9DjLK1KHKRIopop32CYWH/93
         7+KLwOx7gMhSoTwAbLIYnmUHJBi4W7mqN14Eydx3GYnu6XNbRnJFylWITQAluV7zp0vd
         SSvfekI+A5QEqYYBUQUEFSGg79W/iWOdC4L/Ifhqdsq8sWN6+7OPw71Qituap2brbou8
         VRU1avV3qkoIDhp1B4nQbvbh1PyAzELO9pZ4T9hcv021SkEp1Ef+QamDtfXTfJOnxpKE
         p5lA==
X-Forwarded-Encrypted: i=1; AJvYcCX/m8+yFljlIzUVwhSkSkfoCaZWKXw47wEl3/2kjTwwZMt4KYKE3s8TkyFyKe4mQuopvZAwAi3Ai7EOqGcqa0InuGiQiIphGyL8snulVALR
X-Gm-Message-State: AOJu0YzyA43aqLEDUSIYV/zuZTaEDgZGYtjHJ+eV69h6YSyz78ycsK5x
	RrK8KvwnRmxmrBwzYBeoiQKDJWaETfWrmj9X8qmp1Efml0Ysf9SeRPMq+7kjTP/lM0AxN3ysLhm
	mfw==
X-Google-Smtp-Source: AGHT+IGMAa0pMvN41GmLVswUQh74G2T7pDQzvawBbi03BR+h8KyfNdFr8QIGXJ12aJ6DdfK8GuReLQ77fHo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:18d5:b0:dc7:68b5:4f21 with SMTP id
 ck21-20020a05690218d500b00dc768b54f21mr168369ybb.9.1710458827844; Thu, 14 Mar
 2024 16:27:07 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:34 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-16-seanjc@google.com>
Subject: [PATCH 15/18] KVM: selftests: Allocate x86's TSS at VM creation
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
X-CRM114-CacheID: sfid-20240314_162711_131397_7F9FF9AD 
X-CRM114-Status: GOOD (  10.27  )
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

Allocate x86's per-VM TSS at creation of a non-barebones VM.  Like the
GDT, the TSS is needed to actually run vCPUs, i.e. every non-barebones VM
is all but guaranteed to allocate the TSS sooner or later.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 5cf845975f66..03b9387a1d2e 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -519,9 +519,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
 				int selector)
 {
-	if (!vm->arch.tss)
-		vm->arch.tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
-
 	memset(segp, 0, sizeof(*segp));
 	segp->base = vm->arch.tss;
 	segp->limit = 0x67;
@@ -619,6 +616,8 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
 	vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	vm->arch.idt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 	vm->handlers = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
+	vm->arch.tss = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
+
 	/* Handlers have the same address in both address spaces.*/
 	for (i = 0; i < NUM_INTERRUPTS; i++)
 		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
