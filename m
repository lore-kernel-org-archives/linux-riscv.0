Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4E2C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9/1zwWHLRmh9p9yb5IA8WLsTBtZk/eKLoA120Zlpnk=; b=Q0JEE4Bg1nhnJk
	/3mciT/xUHxjGSYPEys5uPAe1UUesoc1o2Ta+opuejr8/QJbHDwjkasJS7c8xmhoWwT56SEcuvYLs
	R1sauLAdkTK1x768/B1x0m/gEqtBHnTTpD6B+XDogH4WPNqpGwHOu+dQ3oKgog1DoI7trEgRalOIk
	9YCVB/2rXg0zrm9OATtkMq6J+Y6Qg9hwTHHdjUOkLKVSpUhzjiBXBKG+CsNdt85nQ8RXJ9ptBh4wn
	cJ4N332MgxhNqzaJxV69YmjaIUpud3c3tF5qt4Jx1UCmLuBijHz76dX8eVK9MzI1MvR3OvD3BUwqr
	hBo4ME+1hRXKh7U9DrDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuWT-0000000G2Ay-4Bed;
	Thu, 14 Mar 2024 23:30:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTg-0000000G0GD-2JhF
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Mar 2024 23:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pTVZRdXyCVTnuQGgLheWcCsaF7bim4F1PK5VbaXQ+t0=; b=QGoYfdq/EV7ErCBf+Ykl7R1b7Q
	ThO3/3lLQQt3EAphiMX52IiKgln/Zxpe/wLt1kz/p/AnZHLvTP2ROwrVGM9beKsWr2lxlcorxeifW
	h9NvBdL9k8LFMlG4XvUjIR2EaoUb1MkVGWCtBsNn30X/9LMXByhlBUAexNfdWf4Hg2E9Dj6W/HKaT
	EacO0tNJjJ32xctqBr6c633a2oor1x9NR9pqsNMjYNkMQjYyrzOpRF2Ub7IectdH/ToUmuTUyjqq0
	2Y56Ud4+uA+H7HMRoY8uqzkoU8Zkh6C2MFPlhegR8MJLHwdOGSi4k19ePhKsuWgpArbKCLawVwqHE
	5x1838AA==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTV-0000000Aitx-2pNN
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:04 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1dda642853eso15348305ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458816; x=1711063616; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pTVZRdXyCVTnuQGgLheWcCsaF7bim4F1PK5VbaXQ+t0=;
        b=1NjkZ5h9AIzkZ9pGmhKJ9cwuhNRr+T6s0koe4iUrHH7IiXjTOh6aeI/PiwzHVFLhai
         SeHzZzmVSHfO0UrBMq5vOHupvLKl7XiPAH+ybG54su3vWxh02s2bb0WhvFxC1wyd2zwM
         igCACUJXY6jB39DZN3NwOwb2kTWIK1BRs1HvA4aihQ2Lenwz9BnVe8cueFemhx2e8+W1
         C/kCrbkdJE7K8J+tFOjN/HGVXvlU4hv1hbLAv77seoJIhGjRXUZ70cAyxdfHf+1Uw2ua
         QBTMR4tUSMuw4vVJnAMIR/SmYSX6Y1zLbRo7/2WfdLcwuOBydDnMn2GiNMQ+QuPVEIqu
         F3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458816; x=1711063616;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTVZRdXyCVTnuQGgLheWcCsaF7bim4F1PK5VbaXQ+t0=;
        b=cpWXAwY1gwwPZTy5k5M7NgCskN3U3tPieHYtrkqqFhyb61ZXl9j88OJfNNq82VrAul
         fwfVVE5aibNJaR1ZDDxHBOFogzupFtYLy1nNHOQyfPoaAPDk6x6Oy4iUJSn7H/Jfvpz6
         3f5kr4rkqJ0uE3pNJVe3AxfuObqwVh9sP81932QFycpDaiIDvlDI3m+LPcPG5zQXLHC3
         CNFkxBHb0DSOCd+ldlySTHCz9pnNzb84Cv7p5uBsHIJKl2m8ylGlAWdVG70v+wDZc8Ie
         oLW/EF2KYYdmzaPNS8CCUmJ1Twv2gutyROHsxjRCPEImjLoxWziUiuO8Wt0EysW7HZz2
         HaDA==
X-Forwarded-Encrypted: i=1; AJvYcCWNDHbgyspGlGWvaYZtJjZK2vt8w0ACLBaV0qhJ3DMc6KSnstzENEvlMn36Gh61+BvAXAA0Bj1Zlp2dAocJWuUYIlpeWTc2XxWPQFDsBtro
X-Gm-Message-State: AOJu0YxJNjXnh4xyAGQYXuTmdUu2Sa1FtBkG17ILXJuHp7pQYytsFrFj
	7MU23h+pc5n9ubzXjR4eiRM+qncF5MKSSwYd0Ea2g0yBFcLYPT+cK83VG8L91qQa0u1z7KwXsM6
	SCw==
X-Google-Smtp-Source: AGHT+IH7S37OXvdlnB5BIBxBCKNBsO+Ay6MTHPEIT19iC3iZ0sD1f7oPcvL0HSDVvR5Ys+olPa2yoMgb6k0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d4ca:b0:1dd:a324:30b5 with SMTP id
 o10-20020a170902d4ca00b001dda32430b5mr9294plg.9.1710458816466; Thu, 14 Mar
 2024 16:26:56 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:28 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-10-seanjc@google.com>
Subject: [PATCH 09/18] KVM: selftests: Rename x86's vcpu_setup() to vcpu_init_sregs()
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
X-CRM114-CacheID: sfid-20240314_232701_966552_897B7897 
X-CRM114-Status: UNSURE (   9.66  )
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

Rename vcpu_setup() to be more descriptive and precise, there is a whole
lot of "setup" that is done for a vCPU that isn't in said helper.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 3640d3290f0a..d6bfe96a6a77 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -555,7 +555,7 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
 	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
 }
 
-static void vcpu_setup(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+static void vcpu_init_sregs(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
 	struct kvm_sregs sregs;
 
@@ -716,7 +716,7 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id)
 
 	vcpu = __vm_vcpu_add(vm, vcpu_id);
 	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
-	vcpu_setup(vm, vcpu);
+	vcpu_init_sregs(vm, vcpu);
 
 	/* Setup guest general purpose registers */
 	vcpu_regs_get(vcpu, &regs);
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
