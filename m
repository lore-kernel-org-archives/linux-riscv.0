Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2E0C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dBG4EsZyVRFWYpLyeexKOHuOyiAGW8m9++Bq0XBiask=; b=PNEfLe2enljPCgGqXD4SanPxN9
	1CsYCSwxG28KoxPz4KagoCGFgQpatmstJiwlWWaAWVFn4Y6eONBceVIv/w8zj1CWoXkodqLYUwudR
	S22YA9S2OBBzFda1C2/xMjf113QpNYwCwUUc80geyyw2/7OB/lWSd6SiFtyvui3wXvvni8bl41RsU
	aTW/vFMvf5LNKGAScQ2vhBK/gKiKKpM9RKO7CU0QSVDwGNF2ngWrYjy1FHpXV96NCLOE6SUSpNgub
	1c37ZHBetYvAHmp2yj0cMrZ9HM7FsCJcfGhydchsK4WNigXgmz4gAMEsg+KCjYE5IMP0mMHueNAgC
	2PgOEE0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57jf-007PkQ-05;
	Fri, 02 Jun 2023 16:34:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57jb-007Pfm-1J
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Jun 2023 16:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dYi36v/YAwaQRjgMVH+8EY8FA7aBBtQ+BKuLP6eDkvQ=; b=enY0ql5YpqvK2gFI1ngsZG5v6y
	aCseBn6HJQOBmXFLFFRyyY9uh+kPcgpEDENwcUz80/lbHCpSIhwYgEH+wSUIpf17hEWgYrhaIdp3o
	sAvCMNV6oM7tFl+QXstlPrP+JBfQ4DXpvBTn76OP4vU6CGKlzWaqUb+0xDzC96cuU9+uGvqboqn4Y
	HNwUoOV/qAln1tEVXv4FM+uIwPykZ3IaAgQtUo8BuVRD8V3kw+MEN1Dd2EWwoLMwHAJGWDkS4U7PD
	AFyXrQ4d5fBJLNHomnEStrGR/sK9vjdHu+zBzOf1SQoBeXnKyluYPWTW9hRjcBQ1bQAEDNmvd069M
	9+lRiFkA==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q57LX-009LkM-RZ
	for linux-riscv@lists.infradead.org; Fri, 02 Jun 2023 16:09:51 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-256647a6fadso845395a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722184; x=1688314184;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYi36v/YAwaQRjgMVH+8EY8FA7aBBtQ+BKuLP6eDkvQ=;
        b=Dw12ocPSe9vJUzYvSsSf9AU3CWoiwTk/XWOJWSQ28tLpoS2cFvmMFQbSf/qpjpxy7v
         oO7YPmr7slJeCTpuInsqqCsWP0mQqS3ua3oN9mzqlTzskeKCsUc+Eng3akxDWWH0DIw4
         jhV0Z/aBx0lDztLRsncoYBKeU0QZUKmq2gyk1zRIGBfBu0xTC7gF0pRwGDV7061++Ztg
         o5Q/lPpRn/0BOjk3RHl0WBfcrcdb3R1NScbQhD6quOJddTL53tPtBy4zB10NE0mDM/7t
         Ap9iqqT0iz8St+1DIUrYSZSYDvTKdSKGgplDSGDJzXhKejoEUVmNl+mnTfSIjic7IX8O
         rhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722184; x=1688314184;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYi36v/YAwaQRjgMVH+8EY8FA7aBBtQ+BKuLP6eDkvQ=;
        b=MHlMaL/mynOq2v933t+g7phzLtTY6sf0zIeoaFNfx/VYdHOYGdnGUyqZfPKBmdobDv
         D1Yhhf+bBUc3L6Xm9Qj0JtFREPEs898FhKiPz91xWSnr+6Wjmhfiw2pfreu4a2AOrQuw
         7+ABzEUhJv0G34MNQbJ+P4IXqyA/ueOQLxD3eC0rI5b/Ysk6QuiCiAp7MDtWhzriCYXz
         K26N/2zaZuXfbS5iEr43kGmlLSQeJkrWoxHAcqmKvjnL5KfpC703Zz2LGjH+b+Qky81u
         qvGKc/3dy9k2+BiYJhhd8YO5RUcWR+b7oqNsiwdm2hWpfSpfAk3ReJyhRHM+MDUpFbYi
         +tuw==
X-Gm-Message-State: AC+VfDwprTpOHwT8GbrMAgOFoN1V6mGCHgOrnDTfRBumU/2oqqRAYO6A
	oERi192RHdWdkfnRhBANWCuRUf+MwU15
X-Google-Smtp-Source: ACHHUZ4+c4f5xcGK/eLSU3xHgu8tOZbN6Cv39+hh+7NNc/cJ0dF1+UQE1gqaCbeHO9GT4u+sOrr9aoJh/Nwo
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a17:90a:c08e:b0:252:733d:15dc with SMTP id
 o14-20020a17090ac08e00b00252733d15dcmr97816pjs.2.1685722183850; Fri, 02 Jun
 2023 09:09:43 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:10 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-13-vipinsh@google.com>
Subject: [PATCH v2 12/16] KVM: arm64: Retry shared page table walks outside of
 fault handler
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
X-CRM114-CacheID: sfid-20230602_170947_927710_5DEC967D 
X-CRM114-Status: GOOD (  16.19  )
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

For a shared page walker which is not fault handler, retry the walk if
walker callback function returns -EAGAIN, or continue to the next SPTE
if callback function return -ENOENT. Update the kvm_pgtable_walk
documentation.

For fault handler logic remains same, i.e. exit the walk and resume the
guest when getting -EAGAIN and -ENOENT errors from walker callback
function.

Currently, there is no page walker which is shared and not a fault
handler, but this will change in future patches when clear-dirty-log
walker will use MMU read lock and run via shared walker.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 23 ++++++++++-------
 arch/arm64/kvm/hyp/pgtable.c         | 38 +++++++++++++++++++++++-----
 2 files changed, 46 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 23e7e7851f1d..145be12a5fc2 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -716,15 +716,20 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * type of the walker, i.e. shared walker (vCPU fault handlers) or non-shared
  * walker.
  *
- * Walker Type  | Callback         | Walker action
- * -------------|------------------|--------------
- * Non-Shared   | 0                | Continue
- * Non-Shared   | -EAGAIN          | Continue
- * Non-Shared   | -ENOENT          | Continue
- * Non-Shared   | Any other        | Exit
- * -------------|------------------|--------------
- * Shared       | 0                | Continue
- * Shared       | Any other        | Exit
+ * Walker Type            | Callback         | Walker action
+ * -----------------------|------------------|--------------
+ * Non-Shared             | 0                | Continue
+ * Non-Shared             | -EAGAIN          | Continue
+ * Non-Shared             | -ENOENT          | Continue
+ * Non-Shared             | Any other        | Exit
+ * -----------------------|------------------|--------------
+ * Shared                 | 0                | Continue
+ * Shared                 | -EAGAIN          | Retry
+ * Shared                 | -ENOENT          | Continue
+ * Shared                 | Any other        | Exit
+ * -----------------------|------------------|--------------
+ * Shared (Fault Handler) | 0                | Continue
+ * Shared (Fault Handler) | Any other        | Exit
  *
  * Return: 0 on success, negative error code on failure.
  */
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 7f80e953b502..23cda3de2dd4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -191,15 +191,21 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 	 * Callbacks can also return ENOENT when PTE which is visited is not
 	 * valid.
 	 *
-	 * In the context of a shared walker interpret these as a signal
+	 * In the context of a fault handler interpret these as a signal
 	 * to retry guest execution.
 	 *
-	 * Ignore these return codes altogether for walkers outside a fault
-	 * handler (e.g. write protecting a range of memory) and chug along
+	 * In the context of a shared walker which is not fault handler
+	 * interpret:
+	 * 1. EAGAIN - A signal to retry walk again.
+	 * 2. ENOENT - A signal to ignore and move on to next SPTE.
+	 *
+	 * Ignore these return codes altogether for other walkers and chug along
 	 * with the page table walk.
 	 */
-	if (r == -EAGAIN || r == -ENOENT)
+	if (r == -EAGAIN)
 		return !(walker->flags & KVM_PGTABLE_WALK_SHARED);
+	if (r == -ENOENT)
+		return !(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
 
 	return !r;
 }
@@ -260,24 +266,44 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
 	return ret;
 }
 
+static bool kvm_pgtable_walk_retry(const struct kvm_pgtable_walker *walker,
+				   int r)
+{
+	/*
+	 * All shared page table walks where visitor callbacks return -EAGAIN
+	 * should be retried with the exception of fault handler. In case of
+	 * fault handler retry is achieved by resuming the guest.
+	 */
+	if (r == -EAGAIN)
+		return (walker->flags & KVM_PGTABLE_WALK_SHARED) &&
+				!(walker->flags & KVM_PGTABLE_WALK_HANDLE_FAULT);
+
+	return !r;
+}
+
 static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
 			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, u32 level)
 {
 	u32 idx;
 	int ret = 0;
+	kvm_pteref_t pteref;
 
 	if (WARN_ON_ONCE(level >= KVM_PGTABLE_MAX_LEVELS))
 		return -EINVAL;
 
 	for (idx = kvm_pgtable_idx(data, level); idx < PTRS_PER_PTE; ++idx) {
-		kvm_pteref_t pteref = &pgtable[idx];
+retry:
+		pteref = &pgtable[idx];
 
 		if (data->addr >= data->end)
 			break;
 
 		ret = __kvm_pgtable_visit(data, mm_ops, pteref, level);
-		if (ret)
+		if (ret) {
+			if (kvm_pgtable_walk_retry(data->walker, ret))
+				goto retry;
 			break;
+		}
 	}
 
 	return ret;
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
