Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4798FC001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PaViFzNZW/MEk1sYlFYu2Ku4bnfvE3AUgYA0D02kb/o=; b=IoYUHlX0ptSS2IWehbT2HfUI3o
	3bV8Ducj0hWoSn8xrGLmmcTknfIiThFshyUFtU83uTy/SxK+1r0Pi1q7/iLQi0jck51RrxjijHyuk
	oG9bOj8hnmF7xHxpcE01RHO8amcvJC2cMhTqU2QSxkxbbbYm3yz25vjaiF74ccGR6D5jloKgfgaoJ
	iVTEDB4O5flG+C6sis8cx2B7A/aUpN6gc8xf3+1gqTRGrPoKtQgTHQPbb64kb3Xmm/lt4fNV+PuPQ
	tlbR7y169Oz+s0AGyYkS9ZkBDppDZduX4SDeS3QOW/8WitdIjWApY2bo6yqR2VB9uqFqgvDAA2OLX
	H9AbgZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtj-003dMN-1H;
	Tue, 08 Aug 2023 23:13:55 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtV-003d5D-1m
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:46 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d4df4a2c5dcso4105570276.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536419; x=1692141219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRsJm5KN8y0omlFlyBVh6FOC8Y/5Pdk4ttGOceHQNGg=;
        b=CQf/TxanV6OEd32ELCfkkts3XxnHA4pKxGHkzWqcVZLhDHcGXQK8pxhlEmtKwP/tpP
         UAyUov8OA4rqJcX0xB4frWPFkoC8zGz0reXRyqNoFb6QQc7uiAJt57EURlLsfXhtvSua
         dVYnrRYGo2ZXskRE7T0A21bujPL542X8vcR00OPyT91QR3v88w0f/6FbYWXk1Xzn0erM
         sTAg25XQTO1XYYl95Z33YL5N1hptl2XY6pPHEzG2zsJje3brq/4ttctRSjL4Be7i5xzH
         VbfCPWiV7RKvMZQeOm7dW2jfJtV7whha+buhr6WES83vayzqgg3bRBsrouX7l2lyMHB5
         9ejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536419; x=1692141219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRsJm5KN8y0omlFlyBVh6FOC8Y/5Pdk4ttGOceHQNGg=;
        b=dYw8LXsqGI9/HKoEr8NsFg0ErxfJAsQPexl7P6DXBox6K1sOBN66yiynZpUeI8xeVt
         u0jA0Kf9AFVtLzbkGtE8Tp6qWIqXddtXSqLjtujXUi4YZ/ynvu/EvEierJlM5NMsfKfu
         ZBrXAATeopdy7YL0atpCswQrAIBZ6zy+Xs4d8ZXLm/GHMHpSisM9CRhAfU60bxWdFhMA
         loq5+cH98cctx3e7iYmuHI+K1iToQ7DJ3Wh0ivWd7wu6SHsIjg89Pp4Sw/Xf43BMh5YA
         MJG59t0jUvX8f9TxJoBNjlXoU6JBTvt+QrNGfgfh4g/zQmS7VQAOX1+O8iNRg4UHpEEX
         NbqQ==
X-Gm-Message-State: AOJu0YyWP05zxGgva4DFKEdmaSGCj0ZG6hKtL3evAvwcWgxNazFiJiYq
	wKGLnoILiCHDtdflO4dVWoyyMzDqO7Fo
X-Google-Smtp-Source: AGHT+IFGVRqil1pLKlKZOPozuSk7xjlyKiysAnrSD74F/QH1sqvC3Ds73i/UAyOLkTltrm9Gi6kXcopawKrT
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6902:1788:b0:d45:1b81:1154 with SMTP
 id ca8-20020a056902178800b00d451b811154mr21428ybb.2.1691536419023; Tue, 08
 Aug 2023 16:13:39 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:20 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-5-rananta@google.com>
Subject: [PATCH v8 04/14] KVM: Remove CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_161341_652122_679FB8BB 
X-CRM114-Status: UNSURE (   8.41  )
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
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 virt/kvm/Kconfig    | 3 ---
 virt/kvm/kvm_main.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index b74916de5183a..484d0873061ca 100644
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
index 70e5479797ac3..d6b0507861550 100644
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
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
