Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A600AC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXlHOWyFo6WQfMbKzG8WNln8YYRqS84b+0gpszeN9ic=; b=jsOByDHoDh8O2R
	GPK9IIDJ9YAM9NMAI+FmZZ52RqnMYVRntKd9dMgrqWeCJdd6oAFcECnhor8GvyyvLarqwHgdqFdNN
	6VUoh64pq7lALq2j7IMXIYtLLPqV0pSoRuTzAGZfDJTdL2flmGdXU9FI8o3WuR6E2KKrx5aP81FZJ
	dAGu1EaaU5sl3rBLGt39wsEsnmgsJtsywsdWspxXIBxK5BMyFF7uS1d8n2e4T2dV/8si3w9p71RAy
	iGL6y0P2+gI8cjSY/UbsocupWDTPFhkgocdAF3sVYbQS8vh8WoGqGzxZ1A+3/3I+zSD7VhSUV5Pvu
	1LCVXB/8oGHV7Lk4GavA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUsB-00000005UcI-0VL8;
	Sat, 27 Jul 2024 00:01:19 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkT-00000005Pgi-3zr9
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:24 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-65194ea3d4dso6504947b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038000; x=1722642800; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=khS3+Cji6+1mvvdZyBUq0wqzq89EmN0cfXvMph1EjiU=;
        b=KvxIQGnXip473lLe0HoToInPHj5B3ZtL3zx5YTJiKrbCyzIxwLoAFRRWRAPESmPsLr
         Ic4RmzryO37taIULCvQrT77myehCiDqNH4UN/mpNXb3+4A/WfPsPJNSIGX7AZJ+/0oZX
         xbjm9CV8ZKtaG8XG4gBxuFbw7yFy9uyAJ1iL03MlwUwMFMslPIdfOrY9/UMwuZ/su+JZ
         ZkDtdP9Y4xtiuOC103tVxcrBbRXz1Sp+iaxo/2HO7WIigITw08/xqQmXazu7AT+bzBZW
         7PqI1BLLTnVL+Q82qzaj2gpgR2D9bLfIKD7N+wYLPn1mbwT4hVt35j0l8CvBpmCzjGDI
         4pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038000; x=1722642800;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khS3+Cji6+1mvvdZyBUq0wqzq89EmN0cfXvMph1EjiU=;
        b=T1t/LmqB7YhTpkKwMi7RR0lQ4KVSdpdMnjklrFdznlX7VlUQGguiNi4if5ZoGv7A0z
         vJnDH41ifCPTGzBirJLb549WR7mN0OK7uAFlxklYrOtjPWwgOiflPWQAEY7eD4Z+agC1
         jpbCwTVMi/lbNHNu2kzs80CLKZ9uo6ZOjLtYbDicwDQsTLj+17QfwzZnAhxzamLKz1b8
         JQCtoydPmiTY3t9bV3D2dQ/xoNRVyZvbErdUj4ATWLmJ/T5DGzXQKw1T1lDdsuqLpNRT
         /uacFpUXHrN3d7+ccegknYereLZn7SKlsqRiey0m+FeFVAAPQOSNW+tibrX3uloEHKpp
         fqIg==
X-Forwarded-Encrypted: i=1; AJvYcCUyrIyuDMoMYMwDoNHXnnwcSwEX3FSHamnESlVzHejPW/Yv2uSQqhMWFlySae079yq1fI5RmQbKB31bLODmn3XjZfbN8s+WT28BnLQkWlqr
X-Gm-Message-State: AOJu0YxlPSPDc5W2+cciiqk+2yFFCj20TpWYZnGFd+9IJ/bksceBNqZU
	nQw6pypCVrUXo90Sy3qK01rNa7Tsv1VOz1pYZGXKwcWTkO3cus5wCEaYfIui3XaIMi2z3k5if1s
	hNA==
X-Google-Smtp-Source: AGHT+IHn8ljNba0QNoBWKfaXu8Wx8VTGIoZ1RPeW8pDsltrF/Hl6Iy7/rU4VvDeHaG7eZvfgbbZBLlqPjFc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:806:b0:64a:8aec:617c with SMTP id
 00721157ae682-679fffd3e35mr362617b3.0.1722038000511; Fri, 26 Jul 2024
 16:53:20 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:30 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-22-seanjc@google.com>
Subject: [PATCH v12 21/84] KVM: nVMX: Rely on kvm_vcpu_unmap() to track
 validity of eVMCS mapping
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165322_078963_CED15E9D 
X-CRM114-Status: GOOD (  10.31  )
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

Remove the explicit evmptr12 validity check when deciding whether or not
to unmap the eVMCS pointer, and instead rely on kvm_vcpu_unmap() to play
nice with a NULL map->hva, i.e. to do nothing if the map is invalid.

Note, vmx->nested.hv_evmcs_map is zero-allocated along with the rest of
vcpu_vmx, i.e. the map starts out invalid/NULL.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 2392a7ef254d..a34b49ea64b5 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -231,11 +231,8 @@ static inline void nested_release_evmcs(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
-	if (nested_vmx_is_evmptr12_valid(vmx)) {
-		kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
-		vmx->nested.hv_evmcs = NULL;
-	}
-
+	kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
+	vmx->nested.hv_evmcs = NULL;
 	vmx->nested.hv_evmcs_vmptr = EVMPTR_INVALID;
 
 	if (hv_vcpu) {
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
