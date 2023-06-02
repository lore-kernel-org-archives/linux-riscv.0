Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2764EC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RYMbeVcN3YlyoVAaLwZYIi4Z6bZJ5YAtFP5NbNr4mLs=; b=fX9RtYIH7NTHC5vwsQe6Us7TE/
	U8T5wk2lhg+OzhlqTnM28oyc4TRYzBB2hqPxi6RWLBr79g7Sp7J0KV8dobNPKjaF4H8DZi24Bpi2p
	VQge4WyG86YKXBPI2EZYG5yXt/kRX7K4di5yG6iNf1uLvYbNVErmXBXRBJ2eq93npX6yNWgRiWFNz
	eUHYIsh9LK7HQqBaYjDaXLjB/jYnHlPcSmCrkiLBndEdD1yjzI33xe64RrDuidZEX42jc9yzoHVI+
	wHDE3dXl535bTb3kTUwdqxH8mgX811SUW4wAztK6cwVhQL9B6yAipLRUGh69AHqsxOBpPIcY7VgKH
	5bVCZiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57jd-007Pjm-2M;
	Fri, 02 Jun 2023 16:34:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57ja-007Pfm-1t
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Jun 2023 16:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iiQKR5r12cEmfxEtqKB501qQ7U5/inaqlNqkSHrg1Dk=; b=tSXRJ6oqoXDv02Alp0HFidWh5F
	7VzCmZU0NbnIeO9YTHMBQ5Uq/KFYFUOG+4303fEDV/JK9TL2PZ3IF9smQBWETTyNAGOjO1NwdqMRa
	mAVfEuSZeD7Lv8JILo2GBkyEvW1Zq9HTm9RnLls5mt/izZo3p0iW4zVIWS08F4A1y+/kLtTy7AE98
	7WHz+q4vAwCpLu8/0uzFDwppLX5BGs8LKwOLJjCBeZqTcFaAlpV3on/83+v+vtTnAsdl32mEtDCjm
	Z+S8S8w6iA0FS1sCFnzRmPgjjOoL18h3TLiPuf3q1Co3shhqEf06G31Ha8OCvCC/WEvMwggd+YgsY
	noy6o1ww==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q57LZ-009Lkc-Jq
	for linux-riscv@lists.infradead.org; Fri, 02 Jun 2023 16:09:52 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-ba83a9779f3so3264030276.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722186; x=1688314186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iiQKR5r12cEmfxEtqKB501qQ7U5/inaqlNqkSHrg1Dk=;
        b=pa3mVvglr9ldo0oASWJgWygRLd3hw8lG1pjLeB+Qzm3K3zOU5BQU88aja7wxcgPXwA
         AwayadZx6shxLAXjuJFrDzlMtsvb67kGNUVBIz8jQ9pcx5Jd6BF7pMABQixgPuk47qo/
         QPSMIrvsitPTIbIvBs3Unmlez10KGpvyazPz0vuoWxeM0ddu7MUX6bOpsZv5FX/RHsfI
         ab0UhQ4BKG9ohwFpekgRN7rsQtHAtMFU2PEbvOsbX5+K7m399sRVLlUcmEJAu36XrUm4
         MIK72o4Xoc2dnSjS77GyfH7dzmpmSt4gmenJO3sxGLvRMkP8fiKXjBjSppWa9vRlnGfd
         FwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722186; x=1688314186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiQKR5r12cEmfxEtqKB501qQ7U5/inaqlNqkSHrg1Dk=;
        b=MZPKCuJXxvdWJSdxxMUnx3wTNg5cQGTMzGbztkfrDkBF7RZczQUO+tr2EJOtmz5//R
         10BcwOeuLn8zzIZXExoBAllXlS7EeE8gQkEvNqfldHrLBKhivMyWPVWuSYx4lhPQ9gYM
         cocE4TPAphUv+DtZlL+bv7h0EKPcYVXFkOCM8bEGUDjGf81JkexmrKctWZZMAzrXd3ix
         5mz+zCIyhZAcn9kqpwTqTlNUP81ZcYnUVystIDCc7duGlgDpS5X23yhkGYcSn7mh+5pH
         SpJdiHCLCgLvTm3Arm1IXMjrYub7SFeiGMRRYwEM4O0cdd8MZOQDxIr9tWcJ1xzUbB+t
         4F8g==
X-Gm-Message-State: AC+VfDyhgrpjSvJd9VYf143YVLPjWCXjbdWe9mvYC5xQV0Nk6jVZ20CZ
	LB/OFxL9dhJiKQVR+WAqSCFettkprcRZ
X-Google-Smtp-Source: ACHHUZ4B/VNE5B0Lzqq5kfdIQx5Z2vYuoQBh8/63RZRhZfWL9mTILlGstZ7p9kQje0NOJUJPGy2sE9Fs2xL/
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a05:6902:1545:b0:ba8:181b:2558 with SMTP
 id r5-20020a056902154500b00ba8181b2558mr2255805ybu.4.1685722186031; Fri, 02
 Jun 2023 09:09:46 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:11 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-14-vipinsh@google.com>
Subject: [PATCH v2 13/16] KVM: arm64: Run clear-dirty-log under MMU read lock
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
X-CRM114-CacheID: sfid-20230602_170949_698435_51116518 
X-CRM114-Status: UNSURE (   9.05  )
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

Take MMU read lock for clearing dirty logs and use shared page table
walker.

Dirty logs are currently cleared using MMU write locks. This
means vCPUs page faults, which takes MMU read lock,  will
be blocked while dirty logs are being cleared. This causes guest
degradation and especially noticeable on VMs with lot of vCPUs.

Taking MMU read lock will allow vCPUs to execute parallelly and reduces
the impact on vCPUs performance.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/mmu.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 356dc4131023..7c966f6f1a41 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -74,8 +74,12 @@ static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
 		if (ret)
 			break;
 
-		if (resched && next != end)
-			cond_resched_rwlock_write(&kvm->mmu_lock);
+		if (resched && next != end) {
+			if (flags & KVM_PGTABLE_WALK_SHARED)
+				cond_resched_rwlock_read(&kvm->mmu_lock);
+			else
+				cond_resched_rwlock_write(&kvm->mmu_lock);
+		}
 	} while (addr = next, addr != end);
 
 	return ret;
@@ -1131,11 +1135,11 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
 	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
 
-	write_lock(&kvm->mmu_lock);
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	stage2_wp_range(&kvm->arch.mmu, start, end, 0);
+	read_lock(&kvm->mmu_lock);
+	stage2_wp_range(&kvm->arch.mmu, start, end, KVM_PGTABLE_WALK_SHARED);
+	read_unlock(&kvm->mmu_lock);
 
+	write_lock(&kvm->mmu_lock);
 	/*
 	 * Eager-splitting is done when manual-protect is set.  We
 	 * also check for initially-all-set because we can avoid
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
