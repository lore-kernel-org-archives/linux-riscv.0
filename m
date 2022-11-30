Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33985C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fLW8Eyl3Hf/YGwNruFcd9/qKnB7mwcay9OCaYXnf2g=; b=xnfQV8pW94Mnx+
	gtoPmTmITTCB8GCqUG7fzaUKKRP5C6qdFfYyIfbE63uVqkQUOStSdxhOfgKk8oOUNUFII/Y9T1avc
	n8lCZnhK8oX8CU/0od+Gv2qQN+l8t0MsvoQi+mVzmGH0UiXczy0XV540ZTJyikmHBs9f0xfOCh+v9
	KgG98ywFIGBJKMF916Uioxo9NEP/ILYOMDQko23gtlRIjRPFgEUhfHujxYdsQZ+rpjTuzfrJzq+IJ
	xW0GQZi/UGn/SM2Bpp9zdcQK8HxoBVM0QvYj+Qi601MhmstJIciHEPM+3VOmHzj9VC0I8rFV3jBAt
	QH6rLRUjYqc4twdUbEVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wbv-003H4k-9t; Wed, 30 Nov 2022 23:35:27 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WLO-003AHn-Rw
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:18:24 +0000
Received: by mail-oi1-x24a.google.com with SMTP id bj30-20020a056808199e00b0035a0734664bso128868oib.8
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9siMTxNa3uAP5fZIzNGfC6XHHMwgiKNlJBnmhPRbPro=;
        b=ChW1Nps965Qp18Q6+pUQJ9HaZg+bsuoNAPERVx5vtZW0btHu7mssz1zq2swGpNBnOO
         xeSdi4iwUV2bHGTbxVVeaFbSd7hDQi+GikXoUOMA+ds3pfZUeA7jrH6W4f5P6c5pwr9B
         U3XVYRZQ7E6Yrhd7CzlvGARnYPdmscwvfkiQmHkzv9OBvomDdeXYt/xK1+qhaSsZxp4N
         N9NxXX+4yvTNEHy1B6JV5V2Zu6j+0V3rnH/CXLtu/bfRs93WfDHZOPYCsGgSMQHV2o0D
         eDMkxgUR8PhMKsVPRy8wQRrlE6YEWvcusAVfquXtz1XnSeeHga0XG3gUzph6fBCETn2R
         dxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9siMTxNa3uAP5fZIzNGfC6XHHMwgiKNlJBnmhPRbPro=;
        b=S7LeUaoUIuHG6T2aiA9Y3DZeyozEWgBqnrWzzj0OEs/nr1NrPQyReip3GUX9McsZJy
         Ye9QvaEnrJHD9MY+TpoEIQGr+9Ri1U4Jg8i/FDevGhhLegnAUY8vpdzfMwuwVyucNco7
         t8NCZ7uMABeHa/82DPkCrkzEhNcvA8zZO4qUqE4qhKOJuZFu809g+zbJFzrynJZGMd43
         NqeYrWn0BRGLw3bOtfspMIV1FsSk8+9uH4pokEhPf72lXNxj9QYBim0FGveS2sj0MOlo
         s0y5Q6Yxt7+jkIyucnZP5J2LIxWw935WTQiMjs+JB96whJSx/zVGi28hFdMmFImn9b9p
         EVKQ==
X-Gm-Message-State: ANoB5pnsdeJ2xCFXK8vPtIDbvltz3cngggsx+ZsDo8B3z2sg9mLj30uF
	s0nTapbtYtLm20KlgksdT/wEovw8pWw=
X-Google-Smtp-Source: AA0mqf6VC0HWkGfsmW3gbMncl1EgCwyuCiATzAwaZawtYWdw9a793FC2Aun76Ue7cKpeYcZGTN4fYSLmS4k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:43a4:b0:219:1d0a:34a6 with SMTP id
 r33-20020a17090a43a400b002191d0a34a6mr2520763pjg.1.1669849843212; Wed, 30 Nov
 2022 15:10:43 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:22 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-39-seanjc@google.com>
Subject: [PATCH v2 38/50] KVM: SVM: Check for SVM support in CPU compatibility checks
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_151822_973271_95C3BB62 
X-CRM114-Status: GOOD (  12.06  )
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

Check that SVM is supported and enabled in the processor compatibility
checks.  SVM already checks for support during hardware enabling,
i.e. this doesn't really add new functionality.  The net effect is that
KVM will refuse to load if a CPU doesn't have SVM fully enabled, as
opposed to failing KVM_CREATE_VM.

Opportunistically move svm_check_processor_compat() up in svm.c so that
it can be invoked during hardware enabling in a future patch.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 49ccef9fae81..9f94efcb9aa6 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -543,6 +543,14 @@ static bool kvm_is_svm_supported(void)
 	return true;
 }
 
+static int __init svm_check_processor_compat(void)
+{
+	if (!kvm_is_svm_supported())
+		return -EIO;
+
+	return 0;
+}
+
 void __svm_write_tsc_multiplier(u64 multiplier)
 {
 	preempt_disable();
@@ -4087,11 +4095,6 @@ svm_patch_hypercall(struct kvm_vcpu *vcpu, unsigned char *hypercall)
 	hypercall[2] = 0xd9;
 }
 
-static int __init svm_check_processor_compat(void)
-{
-	return 0;
-}
-
 /*
  * The kvm parameter can be NULL (module initialization, or invocation before
  * VM creation). Be sure to check the kvm parameter before using it.
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
