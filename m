Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA76C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3A8vIT4fNQXyDQDDsMJ43xgdTIe7sfd7p3TcY94poo=; b=ZzCreLdrMUoLCc
	t70iPhvf46OlXNO1O1D5q5v9UQB1TMdpPCDPxcl8hNvhSSy6WiFFerYE36JZcd+aBEC8TCEdePOh1
	wysSJtlQ3+yrfsUTJAbIF0xi88qReNDAOa8GFh9MUD8Ge2/SkeISG95X+kEAasS0gICmXmw5dCUCz
	t199omX+OaJepWRGh/ih0Rlb8bvhKfqa9LbnjCD+Wj1OxrkMP7AMXDn8wJJTGXRW2B933f8mS1OOG
	4Hmi2BfkgRm9vDC/xXHrP+zDHt+bzfA3D3YzBywd4V+CrDmOYuMa85847iWx5vkZpCoslLRzAf+zp
	Hovsg7nZkbmxRpjgGCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNB6-00EzMl-Cc; Wed, 02 Nov 2022 23:29:48 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1r-00EtaM-LL
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:16 +0000
Received: by mail-pg1-x54a.google.com with SMTP id p18-20020a63e652000000b0046b27534651so83551pgj.17
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5gvBLFzYAyi/HCXZ+GVBUHE668bhbiWmi3vwDs9Tl6k=;
        b=I5bOS6bfxLXiEBfjSJmP2kPQXW/SHnwLLTr4Pv1YGOJfWIPhzpIEkiKigvzufOLE8z
         PySBQSx0d0+tzNvKQjZSy72HymKoAuRoscdVD3mz0rt/jB8Y6EZI0Hs4WYS/QcUkjCkQ
         w8JCNgcxA3AK/X9od3l54Dm9fYHBQunkNi2G+VlGLZfuFSeGcLjMIp0YguN3Du588HWY
         UWsywY+dlyhYN95M8oqWM+ViHOjI8pWnpvPSFJCTuFlV7XnGnW9UVxSozj4IBjaVYRja
         c+tkLJnZPA8seMLOKTKBakZMCiOE4R5iDaDnVWvTgDI/JcgRlH/AKu7MnFyysyA6h5nx
         w+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gvBLFzYAyi/HCXZ+GVBUHE668bhbiWmi3vwDs9Tl6k=;
        b=G24PAqbzPDPR0o+iuN91a/UwBSqLtzKriG7Y+e885WfdCARLGh2edljF9EtY+aFv0g
         KlgwSfV9DaoeAVHxWIKebwqRAb3UXLgMu7c16mnzG6XbzxKW3+JRnlChAvw/6LEDz28A
         2r2oBDHCgl5deqX57k5a2Dxh63WqTAG+T/EKQwCMa/yf24ckt6Lc4VRD+TgGMWNYtEuh
         GO6uBSAZ33kH1fMiBxeiLRf8b/5q0UbETftUGaEPv1pt9WwBNd1NHqe9AovaFWZawsJ0
         WYMXgI9qM0ZtMQIAG4uGfYIgKXjKiOxwzU+j7Ns9qL6+heXAxDxaVd7C5YbB1k+n2O61
         wEoQ==
X-Gm-Message-State: ACrzQf0MgsLPNXX8IuTMnJhA4247ckgNG+Zwt72+rBCKR+w+j7Mw0vNB
	znXAl+WCno4a3yDmVazf51LWs3eLPkM=
X-Google-Smtp-Source: AMsMyM6XQ/aBNhxY5VjT+v6espe0fFHwkGjh05tLgVXfHik64KiilbScLDe/Y3M46ipvBiC6zA50qPgHreE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2294:b0:56d:7387:8a06 with SMTP id
 f20-20020a056a00229400b0056d73878a06mr18916476pfe.17.1667431214429; Wed, 02
 Nov 2022 16:20:14 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:02 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-36-seanjc@google.com>
Subject: [PATCH 35/44] KVM: SVM: Check for SVM support in CPU compatibility checks
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_162015_730353_B4282718 
X-CRM114-Status: GOOD (  11.81  )
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
index 3523d24d004b..efda384d29d4 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -549,6 +549,14 @@ static bool kvm_is_svm_supported(void)
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
@@ -4129,11 +4137,6 @@ svm_patch_hypercall(struct kvm_vcpu *vcpu, unsigned char *hypercall)
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
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
