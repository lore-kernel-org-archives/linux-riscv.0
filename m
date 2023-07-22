Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB633C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 02:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K6kdBz13XlhPqltDMzTwAOSwRJ2KbjkMdW6u06cpF/Y=; b=Cv1NNtOz+URMJLcwWquyDvpcY+
	24Nwd8fgTnjY6kPCXT+qBoad/cLdQNDe7n2E/EbQ5J7E6o/qWzuo+C8O+DrUo3j7WEAbVmt2zPbrU
	Slq1ne5iTKd5ckeBxgiaarOfGNRhlJzoin0IlLOksKVOTfM908OwBNlTRw5Lnuthk47w7r7ZSGRAO
	CzkiSEIFE2V49IWJLmB0Tg0v74qb4vExjJNX5LkqMRIhO00J8RBC0AaezPmlymB1coMwM010pPRv5
	1m2EfoZeyVrcLiRjuR+RmnlY+VvJUJndA7LlQdkgsN2wWQplh9a4UJu4DpURGeSQDGDuo4KpX3pje
	t0VL3Zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2He-00FcNB-2I;
	Sat, 22 Jul 2023 02:23:50 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gv-00Fbx0-0G
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:10 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c0d62f4487cso2569376276.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992584; x=1690597384;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=akm4rYoa5SWJwDL1p07vXyqImi8p1ZVsCq+MNzl6DtA=;
        b=gD47/RM4uIWWB198/JeUALJq9RfWDqhNJ9T5fekg0gN1CVJhZjOmQC08507malSUwO
         o8ec3lTUjSjfYC2IbUqRVy/vilrsVI8K95GVPsWlQt/qMh/hSichPIFf1Wekk8S82QaE
         aVRm06MJGxxB3ZyI2EnZn9V/QdvXIJ8ab6Dhuw8+FQ47EWQsWa9EmDNplWPwsPvOynXC
         jScOlOR/WNZmECtmPX+CzDPzHwrYlcah9TbaF8K5Alw1WCy7ukloCqn7xLelXXi0WAXJ
         ELXUAYxDpW3SIEct6UF/c4gbo3AktDz7eTG5eF/V+xS8z5st6Vf5lBWUrNNu9Q2slUD4
         LXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992584; x=1690597384;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akm4rYoa5SWJwDL1p07vXyqImi8p1ZVsCq+MNzl6DtA=;
        b=DyhkgzcAW2mNX73cgX4MHvkDKHWV5cT1r2BWV8S1GFlRVgi94tMv3J+Q9IZZ56RCOC
         kO3h6x8zWhpFISvpHSsfFxATrmazODgK/kx3It366PLv+EKp4ntjSmr/WNZ1Va7NtufA
         f/OgyEdtYYgBpGOlGdApVVM/q841Cc728+SkKpYZsfnZ/aVCZlQr1GndRqETkw55tVPc
         2kGEtL0SBSnNLnAKLokuhi6EYJvJYX3gF5QlFALgOGXBkZfP9byulUiBmx/01niyeab0
         GBR+N6LFElzQ4ZamJn5J3X19nGrEFxuprYquXY7Hfyov/ZUieSL6UxSiKT+dHD7bCJ3w
         GWpw==
X-Gm-Message-State: ABy/qLaxO8VSTgK3pCJciAssiVwNJh1HNac7t+jp/QVK3mASTy3cGI1H
	VugK4Lq4dDTqlhDAsW/VRZCsQ/MdW+Sn
X-Google-Smtp-Source: APBJJlFexiNbjtr9UnRFqoiOgPpMB6cQsXecNSzI+a2TM+h9ESr77gcH7b0vgVuv18SKk9XbnT1XiXcZKWub
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:aa05:0:b0:cf0:e2a2:eb3b with SMTP id
 s5-20020a25aa05000000b00cf0e2a2eb3bmr22446ybi.4.1689992583856; Fri, 21 Jul
 2023 19:23:03 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:48 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-10-rananta@google.com>
Subject: [PATCH v7 09/12] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
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
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_192305_157839_9367E415 
X-CRM114-Status: UNSURE (   6.52  )
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
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
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
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
