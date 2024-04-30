Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDB2C41513
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 19:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWctkpgDzPptGw7DuLnOz96OdKluCUpWXmbQUaI92uo=; b=tRwKyJXJiAGkLY
	3JGnCP7kQTw5VkM2H9eWbrez8ZzuUMCDvYIfNi/JiJGzy5xeHdWJzOCWQgQPgg61pMwxFBrzpFNmW
	QaX2psn9x3OBIRYadLVa/hGTbmzE2gZjBdgzzFv/m9tFCbsKfKVg3NlV+Y6t3tkgkNo/mKaLbKWrX
	OYTje5vJkaDTkwHVOqioLfGE8hMV7KxFDGDXvaNeWSX1dH+LV71lpJjET0b9O7Xg7lwCt7ETGxQKn
	wZ37mvLYCKLBxgxgNu7NC2eHtzhMLfmHWy/FKqKSDOZtJpRupYeKapRH9XENCHlzrjnz3UTprve9/
	L1b1K2qF+AlTvFayn2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tDR-00000007iqm-0VjB;
	Tue, 30 Apr 2024 19:32:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tD6-00000007ifm-0BkT
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Apr 2024 19:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=teE05Ylose2pcYDprhAFOjLN/sOw6wgj1YwY4a/EgBU=; b=TNmjpoJzL3hMs9h236L6reITg6
	0xKaPUCwQGY9zOCu3A31ZZRV4PvjGUMY1lx0HXNjhlHOnjIEmAsrLNR6n+dofMrVnwYWSvdbP7pEK
	0foOuGJqE/siArJDu/NDUwXnaLzu99TnvtynILyxrXBEbAt/l8riU35ly0l1pDeBGXpA1AmBeKRJC
	HskT1kvG3wYFajb9VLl9HqgB6r/WpTH5XnV/Ki2fCvMjjk2eT/6soAdK/Lte1AeXsix12QAAjyyB5
	u/XdoA1zHwVObP58LTRxRNeTF6s3ip9llFL1pmGHcBCX4jyM1+NrdDCdWr7Ufie8EdIaVOUzsDpIW
	FZGj4CKw==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tCz-0000000H4iX-2ADD
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 19:32:13 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5f80a77b95cso6645313a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714505524; x=1715110324; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=teE05Ylose2pcYDprhAFOjLN/sOw6wgj1YwY4a/EgBU=;
        b=vVUnsEO4akngVv8GmaDt7uecNUP0qaaX+kvRTPPgAySOmC1D4z5s/MLvKhdfNH+pSG
         9z7bv/Un1yjBuu7xphX9/wDADmznizYI3sJjhtYggcfDn7uenLYk1BJlvE6XRaWdZkvv
         ysbtD5LGKlMLto9Tcbb36oYmrrpX5GpmseX+GVABohy2q+pRXQu8kiyg/nlOzX3GdY7Z
         eDQ0bNWpl97WJmq2pmjeA6mBMzuCwenWHwOZdc7bzQT15YhJoWfV0T1yhnFz2gS/4Rz+
         KEijvIJ0KLp3jh0cQXDspe4FPet5a0508xgTtF4m7O67rfRAblDf9ctCbOZHtDRIbFOH
         PM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714505524; x=1715110324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teE05Ylose2pcYDprhAFOjLN/sOw6wgj1YwY4a/EgBU=;
        b=eprvKv2j3hzQTU2+T19Y9pQCGusJmRUkh4mQWHYGyypkqFaFBF3ekeuEH21tVaiJkb
         E4Zr1stHf+2YbMtNMkjZ+v8ci9hoGzfmBUPc3MZJPeqOK8iiZkU52+LXJGl/ljYa+G1C
         Ipitp0n7Y/LmG0VtJz9Fn3JoleI6Oo/UYVjtxfAiJWmMvbpGbj+DsZok8zGkQem1COCN
         XEC7sH++OvbU7EORWjXAWxM6sWUVYsoUg9zDhsPAm/bjZrP+x6stelk3Ky2vn9tXXMMD
         v4TVVNI44exklvQ+YCA0O8CII56cqiH0fYlWDM+jI7zNsSIPHH+erKs4jlIRrSju3wGX
         UW6w==
X-Forwarded-Encrypted: i=1; AJvYcCU3j1vCZfJNbbgrEG9DKo79CxxIHwknZ8MSH4UX9DDpdeUVAiWprgAaAE8qwhXilANB/20CnS46F7ldKxTs/01xg619Fq0vJSJehjuCvz1J
X-Gm-Message-State: AOJu0YwiXduvicRfUQphDM3v1bT6WvLFcNol1CD1XwVnjQm85IjTebV8
	mDqpR5dPEapzEXtvSabm3vmJzit7KL8AttSocRk6hsf8L8aEJ9XgUK/Kb+A31Ugt4l+qR39ArPu
	wIw==
X-Google-Smtp-Source: AGHT+IEbG2WGq5H7HJJ3oJz7X/vycBy/FzdcOadqmLeOQqQxGZZjzOUu53htbVlU23el0Z9xOdv4S0UMTZ0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:6a1:b0:5dc:5111:d8b1 with SMTP id
 ca33-20020a056a0206a100b005dc5111d8b1mr1313pgb.5.1714505523833; Tue, 30 Apr
 2024 12:32:03 -0700 (PDT)
Date: Tue, 30 Apr 2024 12:31:55 -0700
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240430193157.419425-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430193157.419425-3-seanjc@google.com>
Subject: [PATCH 2/4] KVM: VMX: Move PLE grow/shrink helpers above vmx_vcpu_load()
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
X-CRM114-CacheID: sfid-20240430_203209_794881_61A70CB6 
X-CRM114-Status: GOOD (  10.25  )
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

Move VMX's {grow,shrink}_ple_window() above vmx_vcpu_load() in preparation
of moving the sched_in logic, which handles shrinking the PLE window, into
vmx_vcpu_load().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 64 +++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6780313914f8..cb36db7b6140 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1402,6 +1402,38 @@ static void vmx_write_guest_kernel_gs_base(struct vcpu_vmx *vmx, u64 data)
 }
 #endif
 
+static void grow_ple_window(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	unsigned int old = vmx->ple_window;
+
+	vmx->ple_window = __grow_ple_window(old, ple_window,
+					    ple_window_grow,
+					    ple_window_max);
+
+	if (vmx->ple_window != old) {
+		vmx->ple_window_dirty = true;
+		trace_kvm_ple_window_update(vcpu->vcpu_id,
+					    vmx->ple_window, old);
+	}
+}
+
+static void shrink_ple_window(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	unsigned int old = vmx->ple_window;
+
+	vmx->ple_window = __shrink_ple_window(old, ple_window,
+					      ple_window_shrink,
+					      ple_window);
+
+	if (vmx->ple_window != old) {
+		vmx->ple_window_dirty = true;
+		trace_kvm_ple_window_update(vcpu->vcpu_id,
+					    vmx->ple_window, old);
+	}
+}
+
 void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
 			struct loaded_vmcs *buddy)
 {
@@ -5871,38 +5903,6 @@ int vmx_vcpu_pre_run(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
-static void grow_ple_window(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	unsigned int old = vmx->ple_window;
-
-	vmx->ple_window = __grow_ple_window(old, ple_window,
-					    ple_window_grow,
-					    ple_window_max);
-
-	if (vmx->ple_window != old) {
-		vmx->ple_window_dirty = true;
-		trace_kvm_ple_window_update(vcpu->vcpu_id,
-					    vmx->ple_window, old);
-	}
-}
-
-static void shrink_ple_window(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	unsigned int old = vmx->ple_window;
-
-	vmx->ple_window = __shrink_ple_window(old, ple_window,
-					      ple_window_shrink,
-					      ple_window);
-
-	if (vmx->ple_window != old) {
-		vmx->ple_window_dirty = true;
-		trace_kvm_ple_window_update(vcpu->vcpu_id,
-					    vmx->ple_window, old);
-	}
-}
-
 /*
  * Indicate a busy-waiting vcpu in spinlock. We do not enable the PAUSE
  * exiting, so only get here on cpu with PAUSE-Loop-Exiting.
-- 
2.45.0.rc0.197.gbae5840b3b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
