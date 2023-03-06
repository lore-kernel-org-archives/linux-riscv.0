Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE09C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 19:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5OKlMCeMRc5Mf5AqRc5CWoTVJYio4lRHBiK0BH31u4Y=; b=HNbrER4DZuWzw6tyB+XlFPJckA
	enkzbl8H3cbMSRD2dOqkq8DgQx8MXGFZdz0j5PeLK3upKiF98FyUGDdMhwO3jaZsWujclQ8RSgSfC
	GKg4i/9Hi9QM5JDLCt8cFzk6a0W2uTfwDJerab1Jm2eYySrkR1FbsdezlRHvCx9CSjipukrXFdrWr
	5oxJXDHfYiIzRuPuOp/ZPmFanESIm2bGnioxz4iJ5ePFP1WWfeZU/r/KkgKeUnC2PYKGidJyfW3BR
	CYlGMU13u0yqdqO5kn29tf1Lw2umesJ5YaFWJHNN3sNlgM9uPeviYy2ilGZNdPlhqxeOpE3SkLKlQ
	Zqo6PwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG70-00ES2Q-OI; Mon, 06 Mar 2023 19:03:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG6A-00ERad-6g
	for linux-riscv@bombadil.infradead.org; Mon, 06 Mar 2023 19:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hy1Buh0DyhAQ1dsWc1I6Y0GrKiZLM4ytS70wq/2qiU0=; b=hK58AzGQBxAbfsw6G4kanEQDA1
	0sqztLvxyUScj8jQ9sYAv1vP3QZZ8sPyivpu7o0IkZ2O6e5B185w35QNtZ9S9SwV6BtRWZiAEyal/
	MkCRfCgnLYGfOw9m7Qbma3vba0pUSaI+iEnYCp4ZmBJARTPLlVCiBLEUHYWBgjRhaO56NNmf0BHk7
	+grTpCKEu8pADEh2zO5QLOPvRfDQmSLxYvWYp+HuMkfuUNo1N+de0kaKwCXmSQhrQ3sxQV9ov/rVa
	o6r4kIwMVQSr9WRLZh2lQUf41ZQ7BBjRdguElI3qR/B35gDFDPSEzXHFLmzrr0r87wNlo7ZZb4QPP
	3zNEDgcg==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZG66-00Glqt-2H
	for linux-riscv@lists.infradead.org;
	Mon, 06 Mar 2023 19:02:12 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id w192-20020a25dfc9000000b009fe14931caaso11492165ybg.7
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 11:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678129326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy1Buh0DyhAQ1dsWc1I6Y0GrKiZLM4ytS70wq/2qiU0=;
        b=Letr5LRp7bS0YmkVINmE83RF8//+0ihwPomgSJZC4+dkD9sFUFEL35AQoxcfPpIbXW
         Y1mVJA34aQ9Fn9+jBPkAovdeUPbAGsum3MVzw575zB3u4rfwK4ZVePdw3VSiVo2j9C9v
         3XnoKl7fEhlmtkQ5DdG9/UhFj+tyVjNmSih/iYAuSQ6xwOtYmbjOYgHRAkzFRXa92dze
         ZQvrRjBbIKvFglVzBDH4EAw30eROHuzuIjsYKsJXNnWsAQHIog+eYwButoAe0B9OxSD2
         pOTz7b2aOyFjFOUOaTEw5+7DJRfnksutj0fbq9nxtjgFb7SGFFpwHZTOmxj6KpssL5px
         NozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129326;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy1Buh0DyhAQ1dsWc1I6Y0GrKiZLM4ytS70wq/2qiU0=;
        b=8GEGB3xX1kH/aN0cBaUMQDP3Z8gpvs/UEf9VurrZV4ACfC/sVtewob9OSLXc3xARoK
         zkt9tVA6GFALSNam0FlRtSryUTzsgSO/6jNv2nLLlR8Xy4A6U1IscTjvKjB9KwWkR+JR
         lRn9SyD21ZhLEFMzAp1pXVjDch2w3BgJ9tGLGvibOi3XDA9BB5oDdjUKlek04xR3tnNJ
         fNyEmrNwAJdE2nxiQgBao7PyXqfH8rMWRnu+qf85k9y0CLACyg0JQt60UAzRJexlbQqH
         BNXvUE7XY8nLE67H56DHX1cbdQQsvSMhG3oTzET/Hd5NUJbcuZ8pyO/hCZAx7sN2hWc7
         HOrw==
X-Gm-Message-State: AO0yUKXKjDA8s8HAg1mhzX0no71n/35GeeW8y0dIMcnxNm4oZy2EaMh8
	SOn+FE2pAqsMf5loHcZ1f/0+MG5S+hp6QQ==
X-Google-Smtp-Source: AK7set9e2oV5ajrE5TnGPzkyECRcuaio2KGOJRsM0L6WhO9k90cawVld9W/AAFXa4Ih5X3b9O+P88E69HqyVhg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:b667:0:b0:534:d71f:14e6 with SMTP id
 h39-20020a81b667000000b00534d71f14e6mr7365447ywk.9.1678129326079; Mon, 06 Mar
 2023 11:02:06 -0800 (PST)
Date: Mon,  6 Mar 2023 11:01:56 -0800
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230306190156.434452-5-dmatlack@google.com>
Subject: [PATCH v2 4/4] KVM: x86: Drop union for pages_{4k,2m,1g} stats
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Eric Farman <farman@linux.ibm.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, David Matlack <dmatlack@google.com>, 
	Sathvika Vasireddy <sv@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_190210_779615_0E696CEA 
X-CRM114-Status: GOOD (  10.99  )
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

Drop the union for the pages_{4k,2m,1g} stats. The union is no longer
necessary now that KVM supports choosing a custom name for stats.

Eliminating the union also would allow future commits to more easily
move pages[] into common code, e.g. if KVM ever gains support for a
common page table code.

An alternative would be to drop pages[] and have kvm_update_page_stats()
update pages_{4k,2m,1g} directly. But that's not a good direction to go
in since other architectures use other page sizes.

No functional change intended.

Link: https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack@google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h | 9 +--------
 arch/x86/kvm/x86.c              | 6 +++---
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 808c292ad3f4..a59e41355ef4 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1473,14 +1473,7 @@ struct kvm_vm_stat {
 	u64 mmu_recycled;
 	u64 mmu_cache_miss;
 	u64 mmu_unsync;
-	union {
-		struct {
-			atomic64_t pages_4k;
-			atomic64_t pages_2m;
-			atomic64_t pages_1g;
-		};
-		atomic64_t pages[KVM_NR_PAGE_SIZES];
-	};
+	atomic64_t pages[KVM_NR_PAGE_SIZES];
 	u64 nx_lpage_splits;
 	u64 max_mmu_page_hash_collisions;
 	u64 max_mmu_rmap_size;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 072f5ba83170..101ad6b7e7b6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -240,9 +240,9 @@ const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_STAT(VM, CUMULATIVE, NONE, mmu_recycled),
 	KVM_STAT(VM, CUMULATIVE, NONE, mmu_cache_miss),
 	KVM_STAT(VM, INSTANT, NONE, mmu_unsync),
-	KVM_STAT(VM, INSTANT, NONE, pages_4k),
-	KVM_STAT(VM, INSTANT, NONE, pages_2m),
-	KVM_STAT(VM, INSTANT, NONE, pages_1g),
+	__KVM_STAT(VM, INSTANT, NONE, pages[PG_LEVEL_4K - 1], "pages_4k"),
+	__KVM_STAT(VM, INSTANT, NONE, pages[PG_LEVEL_2M - 1], "pages_2m"),
+	__KVM_STAT(VM, INSTANT, NONE, pages[PG_LEVEL_1G - 1], "pages_1g"),
 	KVM_STAT(VM, INSTANT, NONE, nx_lpage_splits),
 	KVM_STAT(VM, PEAK, NONE, max_mmu_rmap_size),
 	KVM_STAT(VM, PEAK, NONE, max_mmu_page_hash_collisions)
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
