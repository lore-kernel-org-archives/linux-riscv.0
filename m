Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8452FC54E60
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 00:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZRkFO8hEWHHnM/BnDloBiPDWmRcZTXgqd6smuwpGB8=; b=uh0s9yn1dzKaep
	ZgKWkeBJT3mLn+oexgCEIud9NUI4nnp+X/r79kcIqCSY5T4ApSCUEAR+DwAyeeyNdjNIMIT2VnDZc
	XJg8YQ8UkiA9cKMBR/AAtTpoDcboONUMXsgp9RoHDfWd4r6lU+pnrr+77hNpxEeCwlbdANgQogQBK
	eJBE2Ax/Y23XDqahC+3gJ6xkK0JuiTiRGRcdK6dpCYt0Q5iCC2X0vYe+eRBDNFc64ufIBW/YRUib5
	rTP+BpokaIhPfcogE1BCa85pxZtxwfATbCNT4PH0V3KpFOzVoqSmC7RO99r8NZ4V6VN1wLUEcOBLb
	9x2jBvQ3Zuwt0FeqFe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkvUU-0000000GApp-1vyI;
	Fri, 15 Mar 2024 00:32:06 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTZ-0000000G06u-0wLg
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:09 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dd169dd4183so1686494276.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458820; x=1711063620; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=j/j/mb3JtyoyPDhLhkSAITq95aQFSMlle8Dlg66amAk=;
        b=z+NwZM8rEaod+rOFkd4il6htFvTamKopwVg2NVZWxF/tpYh4hhfPtW+82qgct8iSz2
         y56BtS2yG8AuUkKKKD1qU/L7rNfoLC3ydjjpT1iSLIDZ8cCh23xIZXxOSbIEsQx48mBp
         D67l2vlkR2u0mGw2Wf3kCvcOX31o6cUJmmuFlDFjCmTqa7257HO0+fQa5PfZ/Cu5Vj0Z
         uQVeTaMoVwT3d6LMzpvSCfjvomQuUwhNraBq45kbAwzf3H1oueOTLru6aR0LDOMXgniE
         Y8MOAFpQCvg19lAdWXZUeKiOTtKrZ+WramgCyV+M/tNVmrLkndpq5bN8Y/2P0bybQGAq
         ZdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458820; x=1711063620;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/j/mb3JtyoyPDhLhkSAITq95aQFSMlle8Dlg66amAk=;
        b=RYSkzv35DD7mtZp997XAhll8jY+QQTiC0xcOB842Kve/5TW25Dl+mnLORgIrM07eZB
         qbNaTuYZq1v3v/PLSpQUskgJVnctn/iAis+dBB2h8eGNYo1EIXni+IvHZwYPDLyOslIh
         gZg+k6/nQp5KE5x5IG1BEsFvcDWUqroKXwSeyHnK4P6fHHyt/5aHqZT0rkX2aY+nK2da
         UGFnhhnmZs4VCnidcRgVY4pcTQNlpYea3g6VWOnY5AhjB8Jp6OOihftgFy3cSeXADkBm
         4Tf8UXgYpqWz2k3StCwQ/f/5u/T7Gnl1mHiImNhRD4gvszCmgEFHNmPzzlxPxuIsGM2t
         m7fw==
X-Forwarded-Encrypted: i=1; AJvYcCW89EcvUHUwszZd3LW3eb86sRPswfuF8Yw9oXrR9l7idKErfqI6Ij/KhroznRMH/lBjle6wasNrIVBsalZ36lZ4RCVgshb/hyQhT30AWNgI
X-Gm-Message-State: AOJu0YxjvyZSs+15kYLKTHu30FAbQF7/o6q4/B0vLTeJ2u9h/gmsV2e4
	r43vCmOYjVirqH9dKx/ATWrH+yuS3E2dsfXvNN1uaJOxJn+VSo2FSnj5ry3shvBZ8y4Sj7XcXcc
	PHA==
X-Google-Smtp-Source: AGHT+IEgFldUzAavXJ42YJM5+Q6BHlgBbuisK5vIFOhA5ma+0WFPVDRLg0oxmN/Zi21+BucUmJd5KHT651s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:72e:b0:dcc:94b7:a7a3 with SMTP id
 l14-20020a056902072e00b00dcc94b7a7a3mr183110ybt.12.1710458820208; Thu, 14 Mar
 2024 16:27:00 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:30 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-12-seanjc@google.com>
Subject: [PATCH 11/18] KVM: selftests: Map x86's exception_handlers at VM
 creation, not vCPU setup
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
X-CRM114-CacheID: sfid-20240314_162705_487269_0631C30F 
X-CRM114-Status: UNSURE (   9.04  )
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

Map x86's exception handlers at VM creation, not vCPU setup, as the
mapping is per-VM, i.e. doesn't need to be (re)done for every vCPU.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 5813d93b2e7c..f4046029f168 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -552,7 +552,6 @@ static void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
 	sregs.gdt.limit = getpagesize() - 1;
 	kvm_seg_set_kernel_data_64bit(NULL, DEFAULT_DATA_SELECTOR, &sregs.gs);
 	vcpu_sregs_set(vcpu, &sregs);
-	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
 }
 
 static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
@@ -651,6 +650,8 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
 	for (i = 0; i < NUM_INTERRUPTS; i++)
 		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0,
 			DEFAULT_CODE_SELECTOR);
+
+	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
 }
 
 void vm_install_exception_handler(struct kvm_vm *vm, int vector,
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
