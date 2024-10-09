Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32243CEE326
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeAZ39khsJ6Ntryf8LTiX8KqSWzmm4dfzPdvJAMGPzs=; b=C3PfPS70m7kSjp
	GgKA2qn1yWS1b9Bd7ChTx9FnXJeOqMGmbvtTLWhz3fcVjGmcKd5RaCXjUGjEUHn0C4fsIJHfjtDJH
	ciuVnIf6VeuIzIO5nDFtyjqv5UReKUDgyWGkenck0amyD5eOSBHXHkBkyK5DnQQwdq+SvQIARNHyS
	3HNfIlp/5DwtWG74gFTu8ZMGJ+iZEooOd0sntb/cKm6ghS1LOiLsGJTghEspjouf04i9X3NFe5p1Q
	4JupHPEb8Ujo1pqwGE4jpKbnbHSJLcbv7sBJRyAyDH0LmBVyWM0m8eko0IHWbfl4piO046yBngKtG
	3LZuat6tKgpnytNcB9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZ8Q-00000009qpU-04JC;
	Wed, 09 Oct 2024 16:01:58 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYx0-00000009o8F-3YQ0
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:12 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e29b4f8837so14728647b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489009; x=1729093809; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=mkSNDDdTvmOytZei+cHiV7cpe/wxQK6hsvQ24y9wIjk=;
        b=016w4JAa89JQCKYO71Yr3v8C4g2zrMzJ4OrrYLZkf/qP7vnyV/pvTGFm3I2gavMjwv
         ZEobtg5ZYmmAdxl378pL+KqN8jJMWqAo8THwVCNwhPGygXVqU4MaP6tH/LyzPcQOd3yz
         ewoFQ6UhbhlgFw+z9Cg8pleIVJxi0034/DGMybQ9h+Bv6aG1d02lQ+zTZr0NqRZpAHIT
         uGhkN8b0EfeMPPtDOe7q3oPs95dZool2qDN3pr7WJ4xWY4xeF73JR9t7dVY6Yk2iB7Tq
         ASJTj80YQ+4Hj4dFPh9LGTLN4z6WgiE3HzAGGcp4boYSvnyczUjpTpapwfl8NAUl2s8Q
         26mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489009; x=1729093809;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkSNDDdTvmOytZei+cHiV7cpe/wxQK6hsvQ24y9wIjk=;
        b=ShqyqtPPZ9boCSY0VwlIpIqJNoJkN/05o/JH7ZNxzHq/M7PjRKKHMNnAayGof2Zmzm
         v/SpjlJ4Sy+MWcISo3NRrauyaCxcwg3Fg9ec6TU39uRzA8OMdJtw7WO9KJKv2xGgjEbR
         7FqeRsvdAo7KFvMTsX6i4cCqy7C4Mlf81sAn9bxdeGYptS618YDcjEsYeS/Fegna/QsD
         GdSPQbRxrlMlqSyu/CRC07os+o1DtqhkW65iGV2LOpCG5MWdNaIr1BmWQPzCn+XN4rZq
         h78kxiWwmX6DfSvfynFVhMdeOFjCkfW23dSKscRnN3uakKeHInBEWLu8TLMYjGHhfrdW
         qn3w==
X-Forwarded-Encrypted: i=1; AJvYcCUTapt6VtrIXGurIQr0LijUGGZL0P7yI8gmSCeV0jO0oezVpxG34NXTciN5nLCqMmFEodiT6wtT04hcVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8DbfUwGHsoeEzkmvvIGAY40oycdX6rNyGLmYnydJIxMVUcctA
	7QWE21HjpRvaqnGdMsxxsIoFR7Ul+xYUXpEjtOpcmtGXHG9aK41aDqCUOFS4jWvQdNHtt66XV59
	huA==
X-Google-Smtp-Source: AGHT+IE+D7P5FL0ahoVlcq9P7kEER6bVqpKARxPS0zk7xyFxuVv8bFBUXfQ/Ook8UnSyIIw/scGTO80UaRk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4706:b0:6e2:a355:7b5c with SMTP id
 00721157ae682-6e32f33bf7emr177b3.5.1728489009508; Wed, 09 Oct 2024 08:50:09
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:46 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-8-seanjc@google.com>
Subject: [PATCH v3 07/14] KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085010_968692_AA7227DC 
X-CRM114-Status: GOOD (  10.13  )
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
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
