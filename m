Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26BFC7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kM9b5D0TGJR7zXaObeBnlfZxmZ5BE+n0HHJP5S6uTqQ=; b=y6Dqm34yHwPy0RVyWQmqsXh91B
	X9wsLq4qutoUYd0+nxJmSe1iY/4XZKs23nCWv1NhdjazY78X0A6Xg4zUZtsK4Ie4bOsK50vKAMXdo
	JGlQmCvwWopHoKfhRmP+FO+UYdLE0rfUj5mL3AUc8THSRs2VCPmUrRM92Ovuhqlvu93IpSivaMbyU
	TfXazrTjZUqo9DlyzgIIK0sKfMJ6oC113zcoVLBC3Ced0QQC2GtYEUwdSGqx7kXVtausD1USOgFNq
	/qqaYNbro1DIcbapATypgnDMQlm3mc3wfRFSOz1wq4d6HA79cUMUB+61gWQ23f6OSEp0iXUqCJykM
	EcDxjkYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57ph-007QzK-0w;
	Fri, 02 Jun 2023 16:40:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57pf-007QyQ-2i
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Jun 2023 16:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i16qvWrTxXmM44zqvAfMO+VQ2ZgLrONxQcP35eFduXw=; b=N39ifwT6cq+ncpU1JeZggVz2FN
	OzMf6ERE7wz5L6HQVMyMOlVnqwCljse8peO8NwJCvvmnqxHYRtajHhAvxujywKmXVb88KRYJbiTpJ
	/UrM9Fubyo3RXY3ct0x8Mur3eUXPYQzi54WiTo064ax62lQTuzWRobAwicNDcE5+Z+w/mBn6wnsRu
	3fArgOl/NiED2IgUlFQRt4qslAw14MSc813R5idXQlgDo5bRer1vCgwWOpbW0x3RoINFINUapW/H+
	ytXlKV1KcicePJQ13Mb3ZzlVtWQ2yeaMpcyYjXXQjJHRyV/ycDjc7tT/MevMkq8BuwZ/ss8tFdoDR
	QWA2aUNg==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LS-001NAk-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:09:46 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-51f7638a56fso2227841a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722180; x=1688314180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i16qvWrTxXmM44zqvAfMO+VQ2ZgLrONxQcP35eFduXw=;
        b=7epqj+D7b/Vs8MJCaB/Yaig4pdk6Xsa6+PhHha/KiUX7vkzJuwNVRvh/QKSBOYWOoF
         9Kl1CGagQi1DXxlGyYvTod7C6g15Jc/lvseccbcVTnZGlpUMuN85YotpNb24SiVNDe/4
         jJWg+BewppQ9iRi+5TbG/EFvPtgidVbx51XdS+ZgnSZfKoodj1WI4tk7ctB/2mpU7ujt
         5GR5L1lxyi6Yc/dQP61OizppKV4BxJWb97C2tfKTvu6BWLjF7QcXhyPnKGED9xXxbRV0
         rkKjEao0Yem9n3mVyvzo3PMl7x2joHF/KT0tNezMLtd5RxYZ9imnBCUvokvJr8Ssuvgw
         mKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722180; x=1688314180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i16qvWrTxXmM44zqvAfMO+VQ2ZgLrONxQcP35eFduXw=;
        b=Cvv811i2xF4+ohJbeYVkFIdTWCI9J9CyveCQtoJrZu+6AhW8ugL3zqJDpgcFJ/ob5C
         Lw6YNNuoPEUg8Pcw20IljwGNnHaSjVmCHSHQmQSgNLtJQTZJOF06VyWesTM+PPu+RTy1
         sf85RVhR4/+MybLtieGinWRV+LIWPl19uXLChYybmg/hIyKrdTTlFGA63oZzgYpxRBVz
         /WwsCV+Veppkbj2L6V7EaYHbhRq7tv7ni0m4O/gAn37/XDp5LjFTjGdkxlolGdaPv+3V
         bQ9ZPtKhdD1YAwlR04FW911jMU8wjp6xrb1+3vv7cCIdFix8B0IlSnk+nBdwD6i0StYL
         R0Nw==
X-Gm-Message-State: AC+VfDyHa0PNDetvqOB8vq+rYOhiB0VfyjCnys9waeI8IQQBOjpE2Iu4
	Yw/bEKD1pVN0mxHShHul7r0miO5ubayw
X-Google-Smtp-Source: ACHHUZ50eFmYtmjd+7phpNHJVAKKYKF0b2Pf24cv0bbiOkOy3oeWBFiQvv39uMwyDgbA4q0xlnPSa5qY2vtt
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a17:903:3251:b0:1b0:6a10:1ba1 with SMTP id
 ji17-20020a170903325100b001b06a101ba1mr117384plb.13.1685722180001; Fri, 02
 Jun 2023 09:09:40 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:08 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-11-vipinsh@google.com>
Subject: [PATCH v2 10/16] KVM: arm64: Return -ENOENT if PTE is not valid in stage2_attr_walker
From: Vipin Sharma <vipinsh@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_170942_301179_60607C7B 
X-CRM114-Status: GOOD (  20.19  )
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

Return -ENOENT from stage2_attr_walker for invalid PTE. Continue page
table walk if walker callback returns -ENOENT outside of the fault
handler path else terminate the walk. In fault handler path, similar to
-EAGAIN in user_mem_abort, retry guest execution.

stage2_attr_walker() is used from multiple places like, write
protection, MMU notifier callbacks, and relaxing permission during vCPU
faults. This function returns -EAGAIN for different cases:
1. When PTE is not valid.
2. When cmpxchg() fails while setting new SPTE.

For non-shared walkers, like write protection and MMU notifier, above 2
cases are just ignored by walker and it moves to the next SPTE. #2 will
never happen for non-shared walkers as they don't use cmpxchg() for
updating SPTEs.

For shared walkers, like vCPU fault handler, above 2 cases results in
walk termination.

In future commits, clear-dirty-log walker will write protect SPTEs under
MMU read lock and use shared page table walker. This will result in two
shared page table walkers type, vCPUs fault handler and clear-dirty-log,
competing with each other and sometime causing cmpxchg() failure. So,
-EAGAIN in clear-dirty-log walker due to cmpxchg() failure must be
retried. Whereas, -EAGAIN in the clear-dirty-log due to invalid SPTE
must be ignored instead of exiting as per the current logic of shared
page table walker. This is not needed for vCPU fault handler which also
runs via shared page table walker and terminates walk on getting -EAGAIN
due to invalid SPTE.

To handle all these scenarios, stage2_attr_walker must return different
error codes for invalid SPTEs and cmxchg() failure. -ENOENT for invalid
SPTE is chosen because it is not used by any other shared walker. When
clear-dirty-log will be changed to use shared page table walker, it will
be possible to differentiate cases of retrying, continuing or
terminating the walk for shared fault handler and shared
clear-dirty-log.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h |  1 +
 arch/arm64/kvm/hyp/pgtable.c         | 19 ++++++++++++-------
 arch/arm64/kvm/mmu.c                 |  2 +-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 957bc20dab00..23e7e7851f1d 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -720,6 +720,7 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * -------------|------------------|--------------
  * Non-Shared   | 0                | Continue
  * Non-Shared   | -EAGAIN          | Continue
+ * Non-Shared   | -ENOENT          | Continue
  * Non-Shared   | Any other        | Exit
  * -------------|------------------|--------------
  * Shared       | 0                | Continue
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index a3a0812b2301..bc8c5c4ac1cf 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -186,14 +186,19 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	/*
 	 * Visitor callbacks return EAGAIN when the conditions that led to a
 	 * fault are no longer reflected in the page tables due to a race to
-	 * update a PTE. In the context of a fault handler this is interpreted
-	 * as a signal to retry guest execution.
+	 * update a PTE.
 	 *
-	 * Ignore the return code altogether for walkers outside a fault handler
-	 * (e.g. write protecting a range of memory) and chug along with the
-	 * page table walk.
+	 * Callbacks can also return ENOENT when PTE which is visited is not
+	 * valid.
+	 *
+	 * In the context of a fault handler interpret these as a signal
+	 * to retry guest execution.
+	 *
+	 * Ignore these return codes altogether for walkers outside a fault
+	 * handler (e.g. write protecting a range of memory) and chug along
+	 * with the page table walk.
 	 */
-	if (r == -EAGAIN)
+	if (r == -EAGAIN || r == -ENOENT)
 		return !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
 
 	return !r;
@@ -1072,7 +1077,7 @@ static int stage2_attr_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 
 	if (!kvm_pte_valid(ctx->old))
-		return -EAGAIN;
+		return -ENOENT;
 
 	data->level = ctx->level;
 	data->pte = pte;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1030921d89f8..356dc4131023 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1551,7 +1551,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	read_unlock(&kvm->mmu_lock);
 	kvm_set_pfn_accessed(pfn);
 	kvm_release_pfn_clean(pfn);
-	return ret != -EAGAIN ? ret : 0;
+	return (ret != -EAGAIN && ret != -ENOENT) ? ret : 0;
 }
 
 /* Resolve the access fault by making the page young again. */
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
