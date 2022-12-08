Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5CFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F3Glwb4J7pVjfojh5QP3hVqSY7MrInvTABufHB9HvMw=; b=QGZHFhp9SP/2Labr6AZDv66mMv
	sk7tqv+F1e/rUHl8h2cx8rHVVy252oiDCsmWEBGtne6nsb1VJ4neTcXidmX3icM75HtT1xHC9stgZ
	oz8XdiSnEcaSCIpCfqgk9hlbY8m0yQPrGkyEQSeMty4euYwHYoxC8V60lE3MZQacC3Q+NIpFfqHnv
	K6CotDrZJosmTV0bpTGA7gqo00Sj8PKrAqybtXyvFdoSPVkzdWMe+nU9LcbUT2wt6e818vmG8M9Om
	0DsejcjevZXOlzPkaCagB4Jh4dwFsV6piGZkAn1hrHxNgUGr5Wae7IGj+RsjWt/etdTfdCWtG5y/N
	FXn9lKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3N3Q-00AAQt-DS; Thu, 08 Dec 2022 19:59:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mz1-00A7bR-TU
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 19:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9RmR6EwIqCFDBLvxI6selt5ga3zw1fPd7MYyun7sh04=; b=kpOmd/NbMxBaYH9q3oxarLuaKQ
	VJdQJ7TrpJAgzq4TYfyO07uxX2ea6RrJIOEvHjTovuRjlXO+JKWUXV/6tLvvqDtvEGBj3ObyJfkKV
	9FkJX3kubwh7rhiOOXeb4iJo1OQ2Z0DXmmdpHWCGUIhA+YWh0CSH7UHz8zf+lTGyMi6LDabu+XYwI
	aWOvix4R6/P1rYfOt2qGLwCC+jE3+cr9TW3qUcKHH3YuTGgHwlnC0uLayuW8IZIfJNL0NQ2aOd6dp
	9W6SZoTgREK+ff+oa0GPZr9qsbS2US1rbv3S24QiqxXmcUgxLf2YxrQ9mPrFgSoxUFrkt9ugkorvN
	E6iFZPJA==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MkC-007Fx4-0K
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:45 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-368994f4bc0so24890767b3.14
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9RmR6EwIqCFDBLvxI6selt5ga3zw1fPd7MYyun7sh04=;
        b=pUH2F0cXu3WIGRD2ce8NSaVZncsouuIq0PwSt3Hx5XNNzUTAHyLwoPUZmYYFi5CtSP
         nVhq3u0B+puFODMcSNnljB/IQui4QQoBBoT7VK2vjldq5K0TcwfXSpD6l8CQHX5MJLf1
         +ObCB8QWeBiWlCf7gO5CWF4MLRqEya3iXno1lfQYF2S+3pFzK9GESTP8LV94Jcgc/kmm
         DGrmedpnRTomnz9+8f0JJ8smD91kG4llzTsIt3IMmR0C9KC9suLzy6zk0g20DYlyZJGB
         ATs/tP0070Y72621Cd+brELKn4hhj6+ekuepajebi56ZFA2sqrDn/ZHk1U80/2BWwxTx
         E8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RmR6EwIqCFDBLvxI6selt5ga3zw1fPd7MYyun7sh04=;
        b=Ymx40+qPsEVjcRk6EkeQ4s+h0ja9cb2fkqV95rl4k30DweojuLY9IeXelz0a1jGSYV
         J//xZyb1ADSGb3w5xBVv+Quup00cvo0sTGDmrsqJu1Ii/KRxVsxiaqmk0pEFiv0HRTym
         J8vr9mwM9aOeIosBMvoCCGl6K7OtFPQKSPI+cLoMA11OQyiAIreE7TP0R7qZvWA92quN
         a0000VDj4oAlLtwezgaymMZfY95rozJHY1tx8aTAWEqYY7JdSjxdJ9D6hadyVF46PEwl
         GHcfHBGimbfM2ZRJQdqVP9D2p90JGE4EhiTJ5Hh5cEEOfCREBowCPb/+A9GzQlNp9Eju
         u/LA==
X-Gm-Message-State: ANoB5pnoECCceXBXM9QL7Dq8napTazz1PkrQJaecpn7bsdAyJpxf1E2B
	6NAC1TogQqLmA8RZ9j+WjgVcGzIdUDvncw==
X-Google-Smtp-Source: AA0mqf7cV11l2t3OM7agzc6qRsrai4lnDlxSMNa6gi84ZckjSbH/wAyvmmZJEJroavTOpSqZ0tfjElEm8egcuA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:d9c1:0:b0:6fd:d054:a0a7 with SMTP id
 q184-20020a25d9c1000000b006fdd054a0a7mr25462879ybg.112.1670528375112; Thu, 08
 Dec 2022 11:39:35 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:37 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-18-dmatlack@google.com>
Subject: [RFC PATCH 17/37] KVM: Move struct kvm_gfn_range to kvm_types.h
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_193944_092624_8C7642C5 
X-CRM114-Status: UNSURE (   9.41  )
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

Move struct kvm_gfn_range to kvm_types.h so that it's definition can be
accessed in a future commit by arch/x86/include/asm/kvm/tdp_pgtable.h
without needing to include the mega-header kvm_host.h.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h  | 7 -------
 include/linux/kvm_types.h | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 22ecb7ce4d31..469ff4202a0d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -256,13 +256,6 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
 #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
-struct kvm_gfn_range {
-	struct kvm_memory_slot *slot;
-	gfn_t start;
-	gfn_t end;
-	pte_t pte;
-	bool may_block;
-};
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 59cf958d69df..001aad9ea987 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -132,4 +132,12 @@ struct kvm_vcpu_stat_generic {
 
 #define KVM_STATS_NAME_SIZE	48
 
+struct kvm_gfn_range {
+	struct kvm_memory_slot *slot;
+	gfn_t start;
+	gfn_t end;
+	pte_t pte;
+	bool may_block;
+};
+
 #endif /* __KVM_TYPES_H__ */
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
