Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A409CC54E5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odIZdNvxEApn73sW5CU2EWkeSSIBmAsDl8PlLBN/6b0=; b=NRtQu4UwYRwj/B
	b05Sz9PCJ2m4vPaHwdpnFvj5Mq2lz0U4O/9ai3SSvNYG4ir2Y6tt3VLMilzyJGFmI0Ug5uJEh1elW
	siqG5INzyApSk3Z1fhRMtacJMF5kBPqWOvRvh3vRhpSNCHRd7tA5JiIAVDgv/jPFZfmW9MgXtqMBw
	Ofr7Q22YfpbUUgjP3DBBdtTcq3l0tqFcf1zTWVsHetWn5FMujsaYIYKs2zfXbMFx8fcXvlEMhWee8
	P+ZUPQGtXBYgcrX+Ht4PxlP0khnxrhZrjI5zLYHps2rE7RgISIKRlXN5yfCzwc+6NT0ScNI1fdI25
	xKlY7oRK69xIvLfIFDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuWO-0000000G26P-2MQp;
	Thu, 14 Mar 2024 23:30:00 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTb-0000000G09r-2VR8
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:11 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dcc15b03287so1936371276.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458824; x=1711063624; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WoFzTDbs1SGZWiz/BWvPtXOQrZCNvORTtjaiRTPj8cA=;
        b=wr7IblnxycKQ4pMAR9rpvOk2SaNttMp35Fm8IME9Wo8cddKf+T523nzHGOxnajaQa+
         QZls4Dtf3eDRm0RfUEcvL02WxEh02/yNvrXWlTvmyx4asVq4ZuuvrGR0zO+c3XlUj6PV
         RX3HZll/KtyzRgS5ja3GrJE8VijNFBZsSeihjWu37hcMDf9hcZpLDCQI6Y+eX9h7wNRb
         NXT6mwKsUKG9k4na7ZWahR6OfG/sLvbx3m6Yn4J/wW719hPw/+qibCEYedA7vlTO8Ccz
         qkXmrfHRDvN51P6deWiqK1s3eiSZYWx5UaisOqXIg/J0AGm0NuQUGOa51Q7zxRK5GhYL
         J1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458824; x=1711063624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoFzTDbs1SGZWiz/BWvPtXOQrZCNvORTtjaiRTPj8cA=;
        b=mqYjr/jZMKxrQKgBBRnW7kPl8+TosL+VE7z+/yJ6nA6tSuNLtu/FP81uLyR6ZgZ9V4
         hyIw9hjDXxsXc5nv9GOhn3c3M/CMkxW1hTMMhWYQBlnP2qpE7NpEvXv6RyN3ajr2MyBZ
         pQVsJllCk70NK1ZPfAtPeXmYAiMMcKQYyPlmeF2LxQxVRm9Pf4kFC+yDEFptNTYpSWJx
         tLGp+2YFvJVE6Y6UtqScrZGD48doDwnCM8Y982x2ZUxpIl3pMJLiausgneBzeyPsB/Em
         NZx1/Ta7dExLxC00UP38P41y7R4uxDLHh1ZxzLlth4nR3nSjDtBznl0zJwB1NGUsejum
         +v0A==
X-Forwarded-Encrypted: i=1; AJvYcCX/RU3bgPUw5tvPzw+YfFQGEhy0Gc0Z9efxzDHbx+8Bd8wjhwcrkx53jRM4eu1GZz4Sh3iV4n9cfnjx2u/t6NW2RICAcxs+5Oby5uPEhsPr
X-Gm-Message-State: AOJu0YykaKaIC9EuCkYFdbx8yLInTvKSGYoC1l9qSyyuTBw6O9Pa2k4h
	uvC9FiG3MWULhALOTKJbWIbCsHnpuSpf6VF4PhZPQQktDM5LS1lZhM1ly46BfTtiwURpIi+v8gJ
	wzw==
X-Google-Smtp-Source: AGHT+IHcMDu3QEHM/t3996zb5RxqsBHPTHwvDMlP8Tv3VDnGeL/s0WR7fo9rdGQ7MgRJw43RolfNSTpIRT8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2009:b0:dcd:c091:e86 with SMTP id
 dh9-20020a056902200900b00dcdc0910e86mr147737ybb.13.1710458824203; Thu, 14 Mar
 2024 16:27:04 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:32 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-14-seanjc@google.com>
Subject: [PATCH 13/18] KVM: selftests: Drop superfluous switch() on vm->mode
 in vcpu_init_sregs()
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
X-CRM114-CacheID: sfid-20240314_162707_794999_BDB297C6 
X-CRM114-Status: UNSURE (   9.73  )
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

Replace the switch statement on vm->mode in x86's vcpu_init_sregs()'s with
a simple assert that the VM has a 48-bit virtual address space.  A switch
statement is both overkill and misleading, as the existing code incorrectly
implies that VMs with LA57 would need different to configuration for the
LDT, TSS, and flat segments.  In all likelihood, the only difference that
would be needed for selftests is CR4.LA57 itself.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/lib/x86_64/processor.c      | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 8547833ffa26..561c0aa93608 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -555,6 +555,8 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
 	struct kvm_sregs sregs;
 
+	TEST_ASSERT_EQ(vm->mode, VM_MODE_PXXV48_4K);
+
 	/* Set mode specific system register values. */
 	vcpu_sregs_get(vcpu, &sregs);
 
@@ -562,22 +564,15 @@ static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 
 	kvm_setup_gdt(vm, &sregs.gdt);
 
-	switch (vm->mode) {
-	case VM_MODE_PXXV48_4K:
-		sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
-		sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
-		sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
+	sregs.cr0 = X86_CR0_PE | X86_CR0_NE | X86_CR0_PG;
+	sregs.cr4 |= X86_CR4_PAE | X86_CR4_OSFXSR;
+	sregs.efer |= (EFER_LME | EFER_LMA | EFER_NX);
 
-		kvm_seg_set_unusable(&sregs.ldt);
-		kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
-		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
-		kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
-		kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
-		break;
-
-	default:
-		TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
-	}
+	kvm_seg_set_unusable(&sregs.ldt);
+	kvm_seg_set_kernel_code_64bit(vm, DEFAULT_CODE_SELECTOR, &sregs.cs);
+	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.ds);
+	kvm_seg_set_kernel_data_64bit(vm, DEFAULT_DATA_SELECTOR, &sregs.es);
+	kvm_setup_tss_64bit(vm, &sregs.tr, 0x18);
 
 	sregs.cr3 = vm->pgd;
 	vcpu_sregs_set(vcpu, &sregs);
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
