Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31BBC54EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2nvZkKKg54aodiLN2O0LUDEVXGpqPBku+etGVPxWHhs=; b=JfUqy+u2NDIxmzfyzVtTSo/iBa
	Yh4X+Iv6CVyOjMmrJVOXMCMJDXi+S5jNleRDCz47Gam2f7m6OolyVhu/MSnPrPXRE6792nxp0w8/V
	j2syPEB7n0DFr0QdRLd0h+W75BY7cHyym5xi668+JJGbxl07YoifeoHQSfXe/qskRyyct2IK7x2gv
	s+S/ElXdALKHnsn2GBqchuf6pdDp61oWXSFhkS7zrkltnobrI42qV+2nJ2LKRrb7U498+PczL36qI
	5DlzwmrQA2rjVo4HdzQg4GpSWRiHRRLRzojwchCYiu44ENzArCz+c4DITruJZyfUt/sxwccybdSbC
	Ole3RWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL8Go-00COen-EH; Thu, 26 Jan 2023 19:50:50 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7B4-00CAbq-AI
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 18:40:53 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-506368dc06dso29264197b3.9
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 10:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFZa9l3vyucfCG4Eq3J8ahjsI/hEp3XR7lOR7mP5Tis=;
        b=VN8PcPha7Z2Hg2wUqIDXSVB9mIu3m5t7TqCWhS7ECVnfl8R6VT46nDUUpIdPd8qYIu
         sPbmuYUrqofSVjFpAQL/fHfGTywYaxsZmAQ4hg3IUfTCV8TgsrkwIG8rB6V8so/pVILl
         FbZnf6P1zimoFc9xDC9Nk70G/4VeIh3saPIAZ7GaELcRYjZXPiiuTvAxlL2J7MK+GgBB
         R79bSmOGc2ymgpjljLv3Gs+t2Fpik0oiOCH+4+ATd2NpUHX4NQuK4+vww/XPqJ3KVOzW
         Dzdepdf9i5pi4SZVLHZGzkaG3RO4gSy6JIe5EWncXIGCyemgDUkXQuACg068oRZAaLUa
         bEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFZa9l3vyucfCG4Eq3J8ahjsI/hEp3XR7lOR7mP5Tis=;
        b=3JN1K0UkD+uBqoSfz29pMBylE7a5OUQAi6BDnPhfsPDMY79oyo9mX4Hnl0U0TVgC9R
         5yVGgL7jpB40PcF3OS9jbMQZ1nZER8EyOzQxavzo2fkh0geC5DzTs3qcgnEOABTIE2ni
         9869ezCE82SvPjUx9yzRW3DYBtPx9ZC7DIj/7J19Zd/qtGJjR7g9lk+QN1glfXBQXtug
         s0hkx+dNQNsZJmtJQPvV296g2mcUzlS3M4wH5wDjjqi/eYCFWo13+vts21zQhR1TpDVd
         uZSHg84oQgYh85MdqnP4DwJ52TF9l0cT6VcER4v7JwhBxu/ho+fk+sABl2cHhCDL+w30
         EqTA==
X-Gm-Message-State: AO0yUKX5WANRH5B4QIKhIUAYCvx1L1xj+SlWDC+QJMx9k2wze4mpBNbO
	j7cqE0lU/wx4lRV2D2zD9pCuHDG50iX2NA==
X-Google-Smtp-Source: AK7set+zuBoUhMsYx0pNBabOkZre6s4lpq4SlxleAkv4G0uh1Va2tnBH9KvK2TQFyhdS6n4IjKUpzb9Uws//rg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:5204:0:b0:507:86ae:c733 with SMTP id
 g4-20020a815204000000b0050786aec733mr835986ywb.358.1674758448911; Thu, 26 Jan
 2023 10:40:48 -0800 (PST)
Date: Thu, 26 Jan 2023 10:40:23 -0800
In-Reply-To: <20230126184025.2294823-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230126184025.2294823-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126184025.2294823-6-dmatlack@google.com>
Subject: [PATCH v2 5/7] KVM: x86/MMU: Use gfn_t in kvm_flush_remote_tlbs_range()
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_104050_416603_5C845E70 
X-CRM114-Status: GOOD (  10.71  )
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

Use gfn_t instead of u64 for the start_gfn parameter to
kvm_flush_remote_tlbs_range(), since that is the standard type for GFNs
throughout KVM.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 2 +-
 arch/x86/kvm/mmu/mmu_internal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 215a8b7f5e03..34b670e719af 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -247,7 +247,7 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages)
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
 	int ret = -EOPNOTSUPP;
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 3bb21d29d84c..0dba4d8304a6 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -170,7 +170,7 @@ bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
 
 /* Flush the given page (huge or not) of guest memory. */
 static inline void kvm_flush_remote_tlbs_gfn(struct kvm *kvm, gfn_t gfn, int level)
-- 
2.39.1.456.gfc5497dd1b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
