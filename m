Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C568FC05051
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U1cSACK+ccOJSU7EPy+L7HkwDbDjOap761Gd7jjR1wc=; b=tiRekYFU80wOxgXs/5wymbUSUu
	bHF+wtU4dfK4lmkIRL9HsyGmTLOwXA9GoajYoRC2IEBcA1HwVMR2NvMXTTCZlSaM9XKO4sR8Txvzs
	k19ahFlHHAnT327RcahgQSY62FivqKLjCT2micmzpknae2azRBrv4+PHHj3OKNZgW6ilcFw2Ty5OM
	COaBXSRglz0+2tq95GwCR3qVSl+3jvnX8sblMS6zjPUE5+6F0jnqNMMU/7a/ND8T0A8OMS5xABXaQ
	Lne7p6757HOjOvEEHfkc76JQxJEuE2XrlEZobkw1gm5VWu9fgtxQPIymCL5GDXZMw6YmfnUA/6CbV
	K2hMxpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVti-003dLu-2d;
	Tue, 08 Aug 2023 23:13:54 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtV-003d57-1t
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:46 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d4e1be2dd10so4149094276.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536417; x=1692141217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fF9z3Q1T3iKa1+NaqgmsAKQ9ZnVImh9YcGmD8OzK9j4=;
        b=Ld1x0UAAPCU2iNVMHuMjG6B0mRqC01G5XmrR49OD5ekBM+hQ47Lz1vPTQOE9Tr5Br5
         BX4nU2fyQoGGqakeZ7MocsuWSlLwxNgdhGBwiNTVlmTbC+b+hhEmvF5KQzcDGXQHniHf
         dyBlM/h1HcV1T3N3V+nLOLW7Ezrkt/Pno3Kgysbh2Q6+afbzKckk0AnL00fLjdc2sRnT
         VlzSKBNqhrU3kXNgERrGdXMA6yHTAQeK1SKxpS4/hFwjbsJV3fXh7O3sMLhqgXSqH2/5
         7bx3QZPwlmmukhHDNyNKKv+4o0fEeYSAzOCOzLhRc8WynuLwSpq0v0AjFElLDtSI3e7L
         E4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536417; x=1692141217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fF9z3Q1T3iKa1+NaqgmsAKQ9ZnVImh9YcGmD8OzK9j4=;
        b=aMYeMswJO3FF0ytfyIfUAhA9FuhnusYsk4f76lRzsKn7+VXynvcam8Scf04hV1OrR/
         ST1UntEmvU0B9KB2vfQ2C3t6vVNR9s/C0a+7NgeLc0YIXd0BvgKA7laaMJ09ty23Ro+P
         AeqpedCjjO6/8mBMToy5RIitTkAAtesl5Tl17lR9vFuI6vZS8oaEgo1ZHZ2prF+LCJei
         sWipeSsgtWqOYHrcHXyXaBQqPAfyWarKGcNEmMjeHZG49f3nTL53DaP2xA2lLC8YU6A5
         yU5adYe1vCD95vYTaq3pBkGjgVXu2gW+zSHftVOoziiLbN5IBKz2r6AerYvt6l3j7ND4
         oiCQ==
X-Gm-Message-State: AOJu0Yy1Rxe19AcJU/SEZyTLNyE6x5VHsBhrk03TwqS70AMIt5/+EQmd
	xtZrB5Ro8GrxU9SOZs9LPNtSBsTQnsut
X-Google-Smtp-Source: AGHT+IEkNRtlsA4ms3b9+CUTzSiCBd52BXOcAxUcg/jLLvdvbtpcQ/Jup7ZubXa24xkvWpmhph0yYPJIU1oJ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:3288:0:b0:d44:585f:dfa8 with SMTP id
 y130-20020a253288000000b00d44585fdfa8mr21095yby.0.1691536417147; Tue, 08 Aug
 2023 16:13:37 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:18 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-3-rananta@google.com>
Subject: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
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
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_161341_644882_2BCD356A 
X-CRM114-Status: UNSURE (   9.76  )
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

There's no reason for the architectures to declare
kvm_arch_flush_remote_tlbs() in their own headers. Hence to
avoid this duplication, make the declaration global, leaving
the architectures to define only __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
as needed.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/mips/include/asm/kvm_host.h | 1 -
 include/linux/kvm_host.h         | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 9b0ad8f3bf327..54a85f1d4f2c8 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -897,6 +897,5 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
-int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 
 #endif /* __MIPS_KVM_HOST_H__ */
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e3f968b38ae97..ade5d4500c2ce 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1484,6 +1484,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 {
 	return -ENOTSUPP;
 }
+#else
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 #endif
 
 #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
