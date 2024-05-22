Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233ECC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwjOOqUVwF0qr8UMJB5Y+DHo8JRP3Gum9G0807AmqaM=; b=qrprjGgMcsB/Kq
	myuDS8UlRkU3gQP++c+cEa8BJCJ6vW0gbWWGLYNxdFatWMJWRNpTDL085HkkHgrLXHcJzE0ylYogp
	DufdgdnUR93oe5gDey2sYIpKvoURI1HTqOS49GpnUUlqfUe7p0wmhucXKULVbixAKqu2HQOuUTXPL
	joUKIz/Wel+L2kp1+va8K76OINj03fDt0qjrS0WPsnhUraaW18vRTkELVg9DxHtHTIRowHyfvylTj
	FmStwKwZdIeKcrcz3AnMOvhhaSpPvHrrKQJ8wgVHRi9tIjBRjdxeWqWXyay4yTpeRvbu1qFeapydy
	Gcccd6DBHhr+8O07wYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bzd-00000001oiw-09PS;
	Wed, 22 May 2024 02:46:17 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9axw-00000001ecT-2bF8
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:40:30 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-627751b5411so138420977b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342027; x=1716946827; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=N3tcdNqgpk0g0Qawt6D2SIU8FL4Y9j5vsBcc8xUlRY4=;
        b=2oWGlNmCe8w33HIw9yv4q15DZuN1ISUv3VtStwK62131kbYjxOBYNiOtI8lPumkUwk
         C/dqbCvjkJG6Ag7MLebMpYcqdq4HlPRSM4nyNZ1sU6q3WD6+yf9c1mg0LNELhf87puDW
         VcMISYhRNEWbs6F1TrIfQZAZsncUreiG2qOYGqyxNg2IStN23Wasgi9zP+rGjjqGDstl
         OkCtGhC/MBXiB8mt0AK3fW4ekqDSFSMndw4Krem1LMbjYcBfStwibVz769HUOU2ZWNQg
         GEd0QrLM7sn0/MrS+am7Q88fBf88LyQKWhw1dC4Uk0jfpi92DmrPA47hN7cOW4iPc4LT
         32gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342027; x=1716946827;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3tcdNqgpk0g0Qawt6D2SIU8FL4Y9j5vsBcc8xUlRY4=;
        b=KQpULjhf6+Zw8Z5yBe90TctJmQGMEu0KGXiOteU6Pojd2hYNNGUWYUl7Ybb0+brL9c
         scHUUl4HibfA8zbpWvFRYiPIs6JHlaem8+MZFbpqrol77qP3FKp0FW1JxrNG8modEsP6
         pA8/YrHnpOPDnc5nekVV3kBBmbIrVBusG6kiRd9qVOzMTQWbGndvSOjI9jWu/Z6gRILz
         IEx6Y6OXPjiC9LzLQoX9V8ImzEbERf0LYiM6Gt/4ofSPq2wpUkDmWUTYGEHJ9nSH/v6+
         AypLckCiJJ2ecmaRnoAXsJj0g4FjVHa3oWqKoSJDEhiYVN6XSROWTdOtu9mU/XKWVlaC
         bKKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV9CjYKeLB890hgdBwDl/xlvmINotiP8srb+E4BELFlV07zXvvMyY4+CScQDYm2NVCCh5uxcCuKcHiez9X0Apz9gyn93kioO+6W+gfRveW
X-Gm-Message-State: AOJu0YxYeM5gAyoAHgOO1otMI280E9VgCh8cdf3dyHJgPEjuuaH9Be6t
	vafztARszKYWnVofMkhZVEIso3nRgbEP6GD986dfDXoPHuS4Sb6jx9ftP64oDS4o1vT+fudBMbb
	MCQ==
X-Google-Smtp-Source: AGHT+IFL81/qwy5rtkuJ10qcaRdu2JQbneM9E+pjVdbps1/0e/VA4O7XiaE6CliC0DQxJV6ImSRXVMyGgXw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4984:0:b0:61b:e6d8:1c01 with SMTP id
 00721157ae682-627e487fd2emr1914977b3.10.1716342027243; Tue, 21 May 2024
 18:40:27 -0700 (PDT)
Date: Tue, 21 May 2024 18:40:13 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-7-seanjc@google.com>
Subject: [PATCH v2 6/6] KVM: x86: Drop now-superflous setting of
 l1tf_flush_l1d in vcpu_run()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_184028_700360_01E2F37F 
X-CRM114-Status: GOOD (  12.23  )
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

Now that KVM unconditionally sets l1tf_flush_l1d in kvm_arch_vcpu_load(),
drop the redundant store from vcpu_run().  The flag is cleared only when
VM-Enter is imminent, deep below vcpu_run(), i.e. barring a KVM bug, it's
impossible for l1tf_flush_l1d to be cleared between loading the vCPU and
calling vcpu_run().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 7 ++++---
 arch/x86/kvm/x86.c     | 1 -
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index da2f95385a12..552b6a9887a5 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6672,9 +6672,10 @@ static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
 		bool flush_l1d;
 
 		/*
-		 * Clear the per-vcpu flush bit, it gets set again
-		 * either from vcpu_run() or from one of the unsafe
-		 * VMEXIT handlers.
+		 * Clear the per-vcpu flush bit, it gets set again if the vCPU
+		 * is reloaded, i.e. if the vCPU is scheduled out or if KVM
+		 * exits to userspace, or if KVM reaches one of the unsafe
+		 * VMEXIT handlers, e.g. if KVM calls into the emulator.
 		 */
 		flush_l1d = vcpu->arch.l1tf_flush_l1d;
 		vcpu->arch.l1tf_flush_l1d = false;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 60fea297f91f..86ae7392cc59 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11264,7 +11264,6 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 	int r;
 
 	vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
-	vcpu->arch.l1tf_flush_l1d = true;
 
 	for (;;) {
 		/*
-- 
2.45.0.215.g3402c0e53f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
