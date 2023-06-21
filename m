Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F8CEB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 17:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DCq6+LLXfT8Zs0GZzU/V56OFKt6IuCOBIO7xx9EBs7k=; b=Wsty1VbO7ztIbGNIE9rF+det0T
	QHD7YukJF6wFbvxVXZInY2OmqDH2/VDY9j0/gQWmgZYFlToj7JPe1DC6lQM2CorHWfPUR/W0gKAq3
	U3Ti74vxmlVMz5m33jE2XvxqxL7FQuSCUNMrtg4sFO0cxI8an/67zfXZfb9Ktuq9n1M0UyCpQ/GeU
	kz7oPDvaxGSZoPNTQvWPo0eeDhJ42P3+V9vl/8C+fJD6EWDI1G/zRrdayeJqRVvFJwqoBZYQtK67C
	mV+lnAmFMWavvQe1KFWXBijYvE5sEPhB2F2q+pMxlZjZvYSU3i94sXxFF01D1Mjk3fdDGeUWTNJhT
	VbfUUmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1z0-00FHeK-2q;
	Wed, 21 Jun 2023 17:51:06 +0000
Received: from mail-il1-f201.google.com ([209.85.166.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yS-00FH4Z-02
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 17:50:36 +0000
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-340b21b5927so48736355ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 10:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687369829; x=1689961829;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dtGUI04cZLcqHqfVph3GLMvS0CVYqac6sXI/vA3EN9c=;
        b=wUCfp8LIVxVyw9rOjJ+xxvqYiNhrMKEQGqZAIrYsflCWYaL7sMIjnn5LDzBF8HHkci
         fU6aqWxAcgnmVfiz4UwopUTnDAafaCROX3yoC8OfXmrNVemh4RlpXriU2kIUlflYJXHw
         uMCeKHy/l1FGUBNLLAGrP3KIWF3x8c8QA6lH15hhdrXNCDtmipcd1fYAZABG46exGlSO
         gFSuHconOaa66m/06jG0Ro0iy0bHzhaKM98M74q46S68x0wg14fu0205JCX28SDxNDoC
         IeVohMieqPadYlEk/nIWyWNaXHuxsT0P5qiOFBg+yGi/qLEjpv50H3iXe5QJF2vkwCpH
         B3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687369829; x=1689961829;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtGUI04cZLcqHqfVph3GLMvS0CVYqac6sXI/vA3EN9c=;
        b=RKn6KBeosLP/4zFojkaIdhFEnjOyMJlOcGYmgGuHaOic+juQCU9vjp+CQtMYQXqN11
         dMf83GdYc5KjtTVJscRaw2ve7oxS5WC/owlrMFN+RXQijD5RTF6gMMdfGqFuVKWxLrIm
         xed1L6oDmL9hv0vXeJHgX4UMMtWKWkVzvfEmwWEX24KQqi2J0ELsr2j2PLsix0JFirjW
         CBfzkiU0wm72x+9vviFXV8VxnZH/2CJK7TcIysuv/3qL7iRVWy4itldFjN0X+sgIivHn
         rvSTqOJu8BNLUJQhbi/S4UCdfiWZnx8FZCtinVsAZXtBYKE9QDHoSnsfqIQgdvYSwj3y
         TdTQ==
X-Gm-Message-State: AC+VfDwepqdis9gY4pof9syPIQWVYMU+1wJhv+GNgo4CPu3EtzFrLRPF
	7L+jQdCpVLOedd7QGMuG+5wXmYkZkEdQ
X-Google-Smtp-Source: ACHHUZ6E9qc4T7u9+yG0bI7LCSWrNIIprVuEXDN8tL08Gxqy8ruadzAtjVxDCW2tLBKnP2MlbqXA+k7+GwdZ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a92:c9cb:0:b0:33e:6230:aa65 with SMTP id
 k11-20020a92c9cb000000b0033e6230aa65mr6242404ilq.0.1687369829258; Wed, 21 Jun
 2023 10:50:29 -0700 (PDT)
Date: Wed, 21 Jun 2023 17:49:59 +0000
In-Reply-To: <20230621175002.2832640-1-rananta@google.com>
Mime-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230621175002.2832640-9-rananta@google.com>
Subject: [RESEND PATCH v5 08/11] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Raghavendra Rao Anata <rananta@google.com>, David Matlack <dmatlack@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_105032_047491_9873A387 
X-CRM114-Status: UNSURE (   6.82  )
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

Implement kvm_arch_flush_remote_tlbs_range() for arm64
to invalidate the given range in the TLB.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/mmu.c              | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 81ab41b84f436..343fb530eea9c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1081,6 +1081,9 @@ struct kvm *kvm_arch_alloc_vm(void);
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
 int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
+
 static inline bool kvm_vm_is_protected(struct kvm *kvm)
 {
 	return false;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d0a0d3dca9316..c3ec2141c3284 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -92,6 +92,13 @@ int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 	return 0;
 }
 
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
+{
+	kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
+				start_gfn << PAGE_SHIFT, pages << PAGE_SHIFT);
+	return 0;
+}
+
 static bool kvm_is_device_pfn(unsigned long pfn)
 {
 	return !pfn_is_map_memory(pfn);
-- 
2.41.0.162.gfafddb0af9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
