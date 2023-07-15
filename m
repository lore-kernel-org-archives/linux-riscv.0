Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6F0EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 00:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7Ma8LJlvjM0EmmkDCcTJNIauNu4Mv3mAY7vArsBEWeY=; b=xkOrAwx66hxWhZ8FSx4c664M90
	VvP5uTbj3L7eRarzgZDUR9KBXjBthER6ifljXkWFa9cZP19pYv0VJ9+KYUoakTXQlMrsVNSYeG6RG
	KYIphfnJZVAF5/lbKIW/zyGnLWFABEz9Nyugls084vPDSh71y0Xs1TwU6kSCbKID/eA/3i2SHH7CL
	cw+nWu9xje8wTGZy1gu+YSEpMKmj76ob1aqH5s+vFNq9M/JmbCDNKgCN9jesULQ0BdLohE4j5WRx3
	cB4JI3SEeFC5nwjYnCwbB3a8agtEt1xFwClWGQSIrUKKTWgqveC/7oegPINas2W19v/eFLcNpt/QR
	JYdUpQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTYp-007akR-2x;
	Sat, 15 Jul 2023 00:54:59 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTYC-007aEb-24
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 00:54:25 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-55e16833517so3327576eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 17:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689382459; x=1689987259;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8/SKuTbF1S2hgzgftCz+xbv+GwRa24E0ShAGUklW+4=;
        b=hrja88/7wxXiKsBqU4+BG+pM3MGM1S9DOyuubBS6zRCvIJ5eqNbAcqAnTdgYLBUU+G
         Xw+Q5KoogRXe6+j6MLR2KwqS39EPOItOND2hac4t/iid35aWJyaibOjPEAQmdMwYmjfh
         VzbdHI6TI0GOlWQpr7ND4xoMQoOV3vp6+LinZ0mxaFOfj8s73O11srFhZJK0pIAlsFoL
         P4nRJGXix8N2JZo0MJURuNa3SeLrZLgRbyyEKe5e1sT6jjEyyH20skLSiG1kT2BH+lWW
         M2jwktjB/uvksSymt5eF0yyQ/JrIKi5z5nYd8WpKGE+ItYKnNyJygjYrNRNPHTh4T2bz
         A4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689382459; x=1689987259;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8/SKuTbF1S2hgzgftCz+xbv+GwRa24E0ShAGUklW+4=;
        b=lQtz9YqtSa6EMJN4rNNe4jW72cT/jMxPazysN7PIVWUH/t4rQrXNYZEkiekEINL0i4
         SfSqT1xjgT9D7H/topdyxyPpemur8bMBo5aRw6z7NEgov0SSBPE975lsV1w5jmaeB9rx
         Ek7byoZV2ottpKEO4645Ks6eC3dgSKCvGxViU8rXpBteEDJS2zs8a1X5ysV2EKiREATk
         mN6rKrGtr8YBun2Yo3FPy8XMztJfcm6S32VxpxN3s3mos1+Nx+I7fpyBOWmwIofNoUok
         0GVhYQRnyGcpyqaoJPWdULjTyttNB0xlj15BEX8A4dpxBIMsH2U2/aI+s49bKWcozDn9
         VKRA==
X-Gm-Message-State: ABy/qLZtWmRYGeH2aja+xrfQ4x8hcSLsuV0w1mrcjhkPfxEF5b6y3fqA
	eY3iK4wrt9XwHJmgwhKdgdR4lfUosWPc
X-Google-Smtp-Source: APBJJlGuVOPdQOdSPn66tc6hZHiX5voXQ8Bd1Pq3KdWw9uZBWmzdkmlscTzl3Cyfs81jovCUQVWibJUVXGKq
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a4a:5213:0:b0:55e:38ef:109b with SMTP id
 d19-20020a4a5213000000b0055e38ef109bmr445620oob.1.1689382459192; Fri, 14 Jul
 2023 17:54:19 -0700 (PDT)
Date: Sat, 15 Jul 2023 00:54:02 +0000
In-Reply-To: <20230715005405.3689586-1-rananta@google.com>
Mime-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.455.g037347b96a-goog
Message-ID: <20230715005405.3689586-9-rananta@google.com>
Subject: [PATCH v6 08/11] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
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
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_175420_720228_6A49CA86 
X-CRM114-Status: UNSURE (   7.07  )
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
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/mmu.c              | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7281222f24ef..52d3ed918893 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1114,6 +1114,9 @@ struct kvm *kvm_arch_alloc_vm(void);
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
 int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
+
 static inline bool kvm_vm_is_protected(struct kvm *kvm)
 {
 	return false;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0ac721fa27f1..387f2215fde7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -172,6 +172,13 @@ int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
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
2.41.0.455.g037347b96a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
