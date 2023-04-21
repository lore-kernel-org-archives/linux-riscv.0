Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641EBC7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QbwBK3IZRPaGL8bmuD4EMEkidtl3bOXLsAVLZmWajgo=; b=Bhgezknfc7oyjramfnmoNSqRKV
	R4jcC9S79MxVQpq+WrC03gfnjNCXdl2wVc1NksvfuWofgKUAlbDvUTe3eM2Cq6hieqB21t6D/h48i
	UZIwKrnaPYCMMYmpeOUstzgWUX8CUarSx0o3qmMaY2JIdJW/qSF9Yr0hhM9UrkbQQ5KqHZQT4XCea
	9VLMk3nutjNGWER5fpXOwz9vlNE4dHpIUU5+26/FixQ/MyLOAxB7Irp6NytbQdKsaLtsB95V6TVB3
	vcmmgpRhxy/7CbbQ3e+V4DAmK2WVQZTTL6NPsDM7KQRWlfZde7cz5Vvv1i5zUz4EGV6Yhvd509a10
	n8EAr00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuii-00BWAX-2V;
	Fri, 21 Apr 2023 17:38:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuiZ-00BW5i-34
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Apr 2023 17:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EZkpp0Q8jjYvxCvjV0ny/+Rc/wVVpL1bL7ck4xeVhlc=; b=WLhuiiGrQDbVxBSdDazpiUacvd
	K6P7rS7QX6AzbJAk7IYqcZ5vvswpzqX+/FVuHeiiOY/iOXWWu9XLT7MrTP4K3Yy2phqXtDdbB94Rn
	0IoTvK0TfO16OFaJvOVwkAg5zOUF7e0UvgH9u4Ix4pryaR61G+kWSHwkK93n2xiIYMnJ0HR25MpoI
	fO3aYOJsLA8JQ5dkvR1+wd6cp953xQ9XnPqWKJ6DeK4jegZ+ADa/0sZ/IFi5xrddnYfKzT9YBqHrd
	kTd9teQNqgHkXnW4wuIug/6cFX0m55wh8Y3XZpC3XVvNVyNOX1jyo7Q6Y2+R6bCHtIXQXEa0aNFMZ
	Lnie657g==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppu0n-005NDO-05
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:53:31 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5144902c15eso1476169a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682096005; x=1684688005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EZkpp0Q8jjYvxCvjV0ny/+Rc/wVVpL1bL7ck4xeVhlc=;
        b=0h1fkH+Qg9TAAOhRy5ByqB0jrA5qVCSK4v4VOevyiT2ApjSQTkdNJB5NveNHYdDJyn
         UJHQdihO3xA3kzsZEepsUYjUUldoQQHE3IwikHmH626x/P3dqcuE74kUFvi/fYfmL8id
         EDHpOrTTDrdls8Ay6MgcRCV+nPsBif06WnlTwtqTPlBkRDbsQd0Ihsksz1E+BPVTlwL+
         Wr1jDKNxfs+qyRuwYH973UQwgCLkK4mXV3n/qkGEbaFtetzvIDazfRsZNp9s0jwVrFs5
         k56stUv4Ja+Quv0wmKFN8uJmrJL9UvFWW6XEpyc/9yhzn8gHY1vEcRlztKntO6uIDVGX
         jZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682096005; x=1684688005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZkpp0Q8jjYvxCvjV0ny/+Rc/wVVpL1bL7ck4xeVhlc=;
        b=ebfyx6MtugmJe8tGA1Jpso+OSUCouEK+Cd9fBPWpQwZn02kxk1sOvw1UJz6F6AohcI
         5Oc4H3vTe+lgqu8E7yK9AazYoLKj3hFhaeVc2NZvAN9kR0RAZtF9pW+G7SjSIfYx0fua
         LFuK4fuQfR+HljVK6vT8kJR55Tuod4Nc1ckmRXG5qFDpKLO72GDFU3oIo5h6+Qmpl9xX
         jbJfvccqAQwUrgHNBFMPzPTXbggwPxc+wDkKaJcvsS9LCYjdy2PGx9YQmyvomj4Nbj9I
         lkVlMVqhGOiktkKeax3KjGPhoyZVKtD2cstHAPaZX3fqIyl5jozEoonjaOo0cMXafEm1
         o8pA==
X-Gm-Message-State: AAQBX9cORu5Cw09Ldfmzl75NrG+mYtJSAyNVWCXBnGkdUCqWmRdiEByo
	QqYdm1WnZkqMTP1f3U36a/PVJAFfrhGR
X-Google-Smtp-Source: AKy350bDKAEiJjC/uv+A89c39cSNVyu8ADQH7b61iTn5O1CeNgQ8Eu2os+9yNYOIL6Af0Fk180jnNb9Y53o2
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a17:90a:690d:b0:23f:a851:4f04 with SMTP id
 r13-20020a17090a690d00b0023fa8514f04mr1467442pjj.3.1682096004881; Fri, 21 Apr
 2023 09:53:24 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:53:05 -0700
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-10-vipinsh@google.com>
Subject: [PATCH 9/9] KVM: arm64: Run clear-dirty-log under MMU read lock
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
X-CRM114-CacheID: sfid-20230421_175329_328498_04B86715 
X-CRM114-Status: GOOD (  10.32  )
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

Take MMU read lock for write protecting PTEs and use shared page table
walker for clearing dirty logs.

Clearing dirty logs are currently performed under MMU write locks. This
means vCPUs write protection fault, which also take MMU read lock,  will
be blocked during this operation. This causes guest degradation and
especially noticeable on VMs with lot of vCPUs.

Taking MMU read lock will allow vCPUs to execute parallelly and reduces
the impact on vCPUs performance.

Tested improvement on a ARM Ampere Altra host (64 CPUs, 256 GB
memory and single NUMA node) via dirty_log_perf_test for 48 vCPU, 96
GB memory, 8GB clear chunk size, 1 second wait between Clear-Dirty-Log
calls and configuration:

Test command:
./dirty_log_perf_test -s anonymous_hugetlb_2mb -b 2G -v 48 -l 1 -k 8G -j -m 2

Before:
Total pages touched: 50331648 (Reads: 0, Writes: 50331648)

After:
Total pages touched: 125304832 (Reads: 0, Writes: 125304832)

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/mmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index e0189cdda43d..3f2117d93998 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -67,8 +67,12 @@ static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
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
@@ -994,7 +998,7 @@ static void kvm_mmu_write_protect_pt_masked(struct kvm *kvm,
 	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
 	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
 
-	stage2_wp_range(&kvm->arch.mmu, start, end, 0);
+	stage2_wp_range(&kvm->arch.mmu, start, end, KVM_PGTABLE_WALK_SHARED);
 }
 
 /*
@@ -1008,9 +1012,9 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		gfn_t gfn_offset, unsigned long mask)
 {
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 	kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask);
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 }
 
 static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
-- 
2.40.0.634.g4ca3ef3211-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
