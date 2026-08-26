Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03091C61DC7
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKE2yBTdAwt/0EXzPx7KGuf0IQBFiM+RhO7F3HXBg/8=; b=pA1i58LM+2qjYy
	PTVFeShalpJ/sB7xkDSv/U9qErCd8RQqEoVztj7FfOuXiDTvwdt0VaxNAcJ5gzIo2Ex8hkL5XMi+N
	rLsZoOvkuYbTbeZnvhjQ4nzIxr631y58xGN6F83wBuUAU/WZyxv/tKtGt2KcGhHmCIQVI8Vr11S1s
	BpHmrdQrR87Blme5j+isq5Uoi4oYJkrH7BfstlDBigjZ8ofyqlNUVY+hJrycBFbNlSZCcHTPis/bH
	JsS0ZRI0HiE5oRD3ZV+z4ID1uwNivpcDFaXFbMYQ1rN8hZyhKH9HmLXEcoc/hkJ+wlw02NzzVo8QK
	fxuzSi4+vyIdr8gLBUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgl-000000036e3-2G2D;
	Wed, 26 Aug 2026 23:05:47 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgN-0000000368D-2E6U
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:25 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-855315ccb64so26761b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785522; x=1788390322; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YWeAmxR3HdkD+eL/iYkERMpi9Iin+GwZMkGAjZk8hSk=;
        b=au9gX8fkeJDpvIjdA5wdYq62Ubdb5ifniHcvqo4qS0wW/CkyFpqCjsmpoCRQVYNw2s
         17eIP6VI6WAZ1nhfHJ9Pk9pCXKCboNGpcflrMILBPdmxYMF1wXv3loTgZseTlFDV/nW2
         j3yFWdmufQcpFxJvjJbng9k90kn+tSvTFc9+q/OlHu7ofmykc7aYaQqNmZEzbdVC32ti
         3yx6oGvRWPGVmPN0YgggUdWqhSbzcETmjMZo4b6RnxN6XuxovAb05/FKf1jrVpWRMc7h
         /a/UaOWDX/I7Fc+AAPS8DqQuBFpYz+Ma00cfucA9vMzFSF/ZuTMnQS1t4C4cKqjt8aRd
         0FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785522; x=1788390322;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YWeAmxR3HdkD+eL/iYkERMpi9Iin+GwZMkGAjZk8hSk=;
        b=mKHEIFGTOU8ENOr3tY6rjXIm4dPHuVgdM0T5s766zBC1Ede7N8ShdXfCsJS0wG82uJ
         SRHbyv2ZRVuUqOvDMvBqBALOnM8pBA6o44fkHTaJa+Jou2ch+TtzHUa+fwviPH+kha1L
         yzPhL+QUQzGVQs1f5KpYKSfojaohMEgpuMxVDnInQvRkzZkP7qHtyJRqwUQ3tke6tbvo
         SXQFue9lYSP6tVAAdE0l24WO/p/tsF/Aat/M5WKdwNao+eY3JwUbpFfk8kojawKYrPIK
         pxYqhkcx3SjBcVq1YshouIhZC9QyV+GZ/JdH7vXw4JKrmhXukwlveIk5lhFdkCmOimD1
         GfUg==
X-Forwarded-Encrypted: i=1; AHgh+Rocufd9KgVpJXGmyJugjXmLlk4WidQXPQd4Emp9jDB3pvW2MZ9y98oRCiQZl56W5HRaJQihTZs9fcfOuA==@lists.infradead.org
X-Gm-Message-State: AFuF++mS9Cn3vSflQo/ZuspoCJSlJRUqP/idX0232OrWThR3U/G6LtFT
	pD/li8vYJl3Yyb+ackEnYPZIgvBU8Dpl6MEIiQ5Kd7WJF+DfHdcHhu9Q8m60c5K4ZR2At/+m4aO
	H0caYaA==
X-Received: from pgbaz9.prod.google.com ([2002:a05:6a02:49:b0:c85:a528:228f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c916:b0:3c8:d3a4:7b40
 with SMTP id adf61e73a8af0-3cf7576da18mr22519138637.2.1787785521893; Wed, 26
 Aug 2026 16:05:21 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:56 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-6-seanjc@google.com>
Subject: [PATCH 05/20] KVM: selftests: Use goto instead of do-while to retry
 finding unused physical pages
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160523_594401_344E2423 
X-CRM114-Status: GOOD (  10.72  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Nicholas Piggin <npiggin@gmail.com>

Rework the core loop of the physical page allocator to use a goto instead
of do-while loop when retrying with a new base address.  The do-while loop
obviously works, but it obfuscates the success vs. failure paths, and in
general is convoluted.

For all intents and purposes, no functional change intended.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[Rebased to latest mainline tree]
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
[sean: separate from alignment change, use enomem label, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b071d77dd301..bbf6d7684c0c 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2049,23 +2049,15 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	TEST_ASSERT(!protected || region->protected_phy_pages,
 		    "Region doesn't support protected memory");
 
-	base = pg = min_gpa >> vm->page_shift;
-	do {
-		for (; pg < base + nr_pages; ++pg) {
-			if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
-				base = pg = sparsebit_next_set(region->unused_phy_pages, pg);
-				break;
-			}
+	base = min_gpa >> vm->page_shift;
+again:
+	for (pg = base; pg < base + nr_pages; ++pg) {
+		if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
+			base = sparsebit_next_set(region->unused_phy_pages, pg);
+			if (!base)
+				goto enomem;
+			goto again;
 		}
-	} while (pg && pg != base + nr_pages);
-
-	if (pg == 0) {
-		fprintf(stderr, "No guest physical page available, "
-			"min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
-			min_gpa, vm->page_size, memslot);
-		fputs("---- vm dump ----\n", stderr);
-		vm_dump(stderr, vm, 2);
-		abort();
 	}
 
 	for (pg = base; pg < base + nr_pages; ++pg) {
@@ -2075,6 +2067,14 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	}
 
 	return base * vm->page_size;
+
+enomem:
+	fprintf(stderr, "No guest physical page available, min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
+		min_gpa, vm->page_size, memslot);
+	fputs("---- vm dump ----\n", stderr);
+	vm_dump(stderr, vm, 2);
+	abort();
+	__builtin_unreachable();
 }
 
 gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
-- 
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
