Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF1FC001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 03:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l++K+5f5mz+m5pphMtD04oPkELzUlg88HiBpH5RpJvM=; b=cS0dNyp4FWXAIGvL4DMfHrDL8q
	EfF/RSL7/IcmoO4ktPft4yatvhiTAf9X/2zQjC4hQ0YyffVj17O8qJYgM4uSjUHaLS1Rf5HqKsSwd
	N8+L8WQ/aZCzZW2eMzpPpgGUEJrm0cmSbAp97moaAP0wYMi2BWQi3pT3xPrhGpmSkCLNtCcAxKjrS
	Q/es9nx8EI2QAYO3QQSSRSRumTV0nYr53EXyzg/Ql7hDaRq47hwPjkR7Uf8J+T5A8rAt1S5Zq7PCm
	Tc2cbLDJjzLzJ2XkwHEvRmRPZ3LYRz6X6X09BqD7ZzLb8PaNQIsfIyQmWFm+dlKfv8supjNCV7Z3b
	rmB9ttBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN3Lm-00FiTN-21;
	Sat, 22 Jul 2023 03:32:10 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gp-00FbqZ-2E
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:01 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-6bb0ba9fc81so4439026a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992577; x=1690597377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub1b4RkH+SiNL7JMG3rpDZe3A40I4dIIMSmDo0IlQzA=;
        b=mdoy5qzVWH2lXFeq+l8GrcDaZ/AZtpebOXZQbAycbvs9F3gc+FWUF9ZJWPljZ/WTZD
         N7E2CrdeVR5j4hLBJ6lRk+I7mY3w46nxq1+pryXFAKZcAm6ro0anIkD55cC7HYUHEtBl
         +dJrlJdeVINBllBXagJSINAu10sD/s1fUyDdrNYf7y42VzG1fL7GeDIkL7+WYoytIjDy
         GHMZhXrzf4o6R4qf5HOBkK1MFK9gmO6/4OMh2/Y3htnJZzNT+xxMwKlwZX5zfwWUZjjA
         VHLWteESBncMN/9UQw6Di221i0kp5JpanK4qcj2hiL8RK1AhymvQXKdy0Wc1MgLrg4t+
         08/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992577; x=1690597377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub1b4RkH+SiNL7JMG3rpDZe3A40I4dIIMSmDo0IlQzA=;
        b=hv5EPH1jF4ovYPVF7r/oXSzAo83+7BuKtXOqDJ9eW4cSwjqWv4DJJTQnEx9ASIxpwb
         U0Ar0t7u/7ZxB8Kc2w2FKq3ZRsHNQq/2+4PFa4YJZy4WJtwiVpMOh2T4muOkoxdydvs2
         hTDU7zrPNS+gumaxK8HavDobNPuD744sw8wFC/jmdW3AOpkOZPeecFpu/l09wDS5jdXM
         GeIdX2dS4TZPTlGdKmSBtTmEevDN7fPjqqzkUA8Z3nrgdL4GA58EBrFWCvGIht/Srhoa
         CZwcLaQfptFP60nniE6e/UtmGwulN0XeSTZ+R0ePu8iTrAB/hJbrOjtZ3mENJdzsp+eL
         +bbg==
X-Gm-Message-State: ABy/qLZMYGmFRS2m+w6/rSs7kSVUC9vBw6bKshOKxE9pTuER/vv9q73q
	o8Jiz2t9yped3Re/HPMv78Kgxv6b4WKB
X-Google-Smtp-Source: APBJJlFePHecSR1HloqjDSzzI/2i9CNM4+/1NwLnWrMA4yKuyKZVLYbN6w7CAOZHg5mvVOxwFFo83RQaKDLL
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a9d:6d03:0:b0:6b9:cf90:87a6 with SMTP id
 o3-20020a9d6d03000000b006b9cf9087a6mr2197907otp.1.1689992577845; Fri, 21 Jul
 2023 19:22:57 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:42 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-4-rananta@google.com>
Subject: [PATCH v7 03/12] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_192259_755076_D3374BF2 
X-CRM114-Status: UNSURE (   7.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

kvm_arch_flush_remote_tlbs() or CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
are two mechanisms to solve the same problem, allowing
architecture-specific code to provide a non-IPI implementation of
remote TLB flushing.

Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
all architectures on kvm_arch_flush_remote_tlbs() instead of
maintaining two mechanisms.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 virt/kvm/Kconfig    | 3 ---
 virt/kvm/kvm_main.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index b74916de5183..484d0873061c 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -62,9 +62,6 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT
 config KVM_VFIO
        bool
 
-config HAVE_KVM_ARCH_TLB_FLUSH_ALL
-       bool
-
 config HAVE_KVM_INVALID_WAKEUPS
        bool
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 70e5479797ac..d6b050786155 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -345,7 +345,6 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
 }
 EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
 
-#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
 void kvm_flush_remote_tlbs(struct kvm *kvm)
 {
 	++kvm->stat.generic.remote_tlb_flush_requests;
@@ -366,7 +365,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 		++kvm->stat.generic.remote_tlb_flush;
 }
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
-#endif
 
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
-- 
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
