Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1131FD6D251
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 01:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asVFjgeDUVQb4DWAqxxIpena8yOVyKMu/eZakmMUUfU=; b=dR7VxQ5pTuZIoE
	zYnVT82P2TuYmWmVLk3XlRlFnazT+/aA/+ubxfEPxBNw4iJ7A1UI+t2PiKXEtli+cVCew9VoC4Igo
	oa9w80k+tMOjdWZlN5/eonoFc5P2ql8mcOF7DrP48Q3aaNPZxMwYQ5Wgfg5Nj8JoaOockRXg0r2Nl
	JjfIf+6erER/1tfsFKjTl5wZHyKO6Knfup0qDmEyhYyq1KednjRimG+dyOV88+cB/uY0sRbYKSCF2
	gcXiGp1B1yaaUYOmgtR6C6S2I3wApFnvTou/xR8l9awvsuggPsKQMrsaN0h9+FboS2T0m4GWlZc8J
	htPC73DUK115I1QB4FDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSvj-0000000EOFU-1rFy;
	Thu, 28 Nov 2024 01:02:51 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSp8-0000000ELs2-0ZvX
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:03 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-71d64300526so170664a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 16:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755360; x=1733360160; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JyP1JUxR4wRqvaLFIbbuwXgM3uy7FspWl6pSel31SGs=;
        b=vBX1O/Ro4vkaoAdfcOeIC5HMhMY/TBzEAc5TapUOqUi4lURcqWQxdx/dt3ELDdEof1
         K3Q1TJXNJMO/AqrfsY/S1hR/68wdwppsVeQwzzl9tZexQ5VamLCS2JudZDbvd+2LdgaI
         H6odHrcKb0aN+9lYZ9yePA7tX/i+c7dXvaU0vPKWC+l/XeVOVkqFoAmXUZzOJNdoap/d
         rd494LmTobFWu4erRA1//nybSjZIEuVU+720y2PlXIVZguWdzH4NOdaGaMNM/xXUHq5Q
         OFXumDGxwjPTaR933zGZB+VY0vv0Q1qeWq2MdHYxKRxZUhaQtElk5pV6PbWGhECJ45dI
         mFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755360; x=1733360160;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyP1JUxR4wRqvaLFIbbuwXgM3uy7FspWl6pSel31SGs=;
        b=j9A4hCLIcbaYOqLyBh9Ux4fU316K3qd83Ag566VnFcoDri2vWWuti/+vKJa/NRQkVt
         5eZurLN5cFTQLDxKIEqeJxqCQz6OsBf659Q8lBqjli76h1gAN+3tC5KZab/esnOPXNmq
         y/7CKUGgI/mklxtCWkdjEibQtS1+dlK/NUN5j9YqalS4bUX3jiRcGF8zo7NssmnaPPpz
         BFoPhtWX+muXSs46k7aTml1YPK7Hip38s54XctssG/8mBr3/jYxmbME33OcxNvrLhqT5
         mMGcFRxBViKc6SqGNckf7pUbJIUuE0Q9jmn97yIPgHJeJZh9A7WYLPQI/b/O5uZa5tV9
         Kq8w==
X-Forwarded-Encrypted: i=1; AJvYcCWsObZIgmwXDVeqxPSCManx4d8xcmQWdhmTgvJJ1gHYmQfhlYLAq9Co07qbVkru9rngCmo4NyobPUAC5g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1jyx25xppR6KF7dpbTcdLC552bVJ3CEWqbsVfAYPy+pBUqqXx
	tEdNkG+vuXZIlqjQwyjmrgmuGS4XyuzNnMq5DJfbvBoYifDoiu4ENDp2NEM2+MeGaAsQYujWOma
	bTg==
X-Google-Smtp-Source: AGHT+IH8OsD6EvK6kpKey4op5FA84HiW/8R3R+eIuJX0ly9wWTrNA0B30UgLwfP51sElrM78pAke6fhK31g=
X-Received: from pgah20.prod.google.com ([2002:a05:6a02:4e94:b0:7fc:1fef:7deb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:6c14:b0:717:fdb4:c207
 with SMTP id 46e09a7af769-71d65d00ddamr5604090a34.26.1732755360453; Wed, 27
 Nov 2024 16:56:00 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:37 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-7-seanjc@google.com>
Subject: [PATCH v4 06/16] KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165602_177178_8593906D 
X-CRM114-Status: UNSURE (   9.33  )
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

Try to get/set SREGS in mmu_stress_test only when running on x86, as the
ioctls are supported only by x86 and PPC, and the latter doesn't yet
support KVM selftests.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 0b9678858b6d..847da23ec1b1 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -59,10 +59,10 @@ static void run_vcpu(struct kvm_vcpu *vcpu)
 
 static void *vcpu_worker(void *data)
 {
+	struct kvm_sregs __maybe_unused sregs;
 	struct vcpu_info *info = data;
 	struct kvm_vcpu *vcpu = info->vcpu;
 	struct kvm_vm *vm = vcpu->vm;
-	struct kvm_sregs sregs;
 
 	vcpu_args_set(vcpu, 3, info->start_gpa, info->end_gpa, vm->page_size);
 
@@ -70,12 +70,12 @@ static void *vcpu_worker(void *data)
 
 	run_vcpu(vcpu);
 	rendezvous_with_boss();
+#ifdef __x86_64__
 	vcpu_sregs_get(vcpu, &sregs);
-#ifdef __x86_64__
 	/* Toggle CR0.WP to trigger a MMU context reset. */
 	sregs.cr0 ^= X86_CR0_WP;
-#endif
 	vcpu_sregs_set(vcpu, &sregs);
+#endif
 	rendezvous_with_boss();
 
 	run_vcpu(vcpu);
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
