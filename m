Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627F8C624D6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwPcnLC2sqdfYdtOyqi/Xdi6JU4gatDt6p12i7ZIyoQ=; b=0oZWqnf+kdgAxP
	t/0HLjHJK2x/aWq8+0EaTKo7n7Q1cmd1TMlQkAgcfGK8QJbtQhvh4LDPSSZ3PyM5Ves6ABFJFeNxU
	htPT0mr7/zgv/aryuYWJU9h1zA78VG6zcNqx8q+2OqSdYfL0xHQjhPiItiGOpZc/rC4R+FTSUufNS
	f5Nh85nNidtx2xBaZR9Vkd9OhCzKx2jY2Md06K8E217V1IoFvVzsHXY/HsnutvVUaySG/FIse7ETm
	+hnbds7rkD3eYMhmh7UMC0bfU7SysDozu2sU0QGY94fSjgiITq6tRRcgz1CfQ57OYhzZ2fJru8fwo
	/DSq6XzTzzsZxjGp4Plw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o25-0000000FEnY-01iJ;
	Wed, 02 Sep 2026 16:41:53 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1p-0000000FEEY-1eg2
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:40 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2ce7dff6253so461255ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367295; x=1788972095; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gLFvTuC7gXbjk/rOLKK/p7bC02ttHAq/6LyCTsnQIyk=;
        b=Li+FwmLKfEV8wrUAr2yqI9bFEDReDvApqZ6Nn0EbE8XOOHFVZj0e63A8mEHfOPYYIU
         YZzQXsQU4yG65zXACyT4gVYjXetdi2dIljFGCsx4U5U5P7tJP8fDqD5gC8t4ANib0XsG
         EcJTdwVxZRw8pmUTdD+0G/BNvaGujmPu7j+vlUPVZcpeZHiFsmkJImJgEw8Qx6vg42sz
         39fIiSxOWTsri8YRcrDYQTkkwYx7AiU790Lds+eQWtGaV/dGUkDApYVKBex8dMFGj1Ab
         8cB7Tp+e/xXeBUrt5l5CaCCrLiWv0UclD8LCeoW7kCqFNYOalvwD7VOPdZKC1xoPFRNX
         tp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367295; x=1788972095;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gLFvTuC7gXbjk/rOLKK/p7bC02ttHAq/6LyCTsnQIyk=;
        b=nesmNNhwX5GhlM5G+wMRrw570JYsnzra7AEFWti6dkkFS2V4+BFh++AMfjHLEeD60B
         Q6H08dORAtz6nlgLXLcb6HH5NGv5HuEzR5VVBQ+ryWC/O60amjM/YycLsajb7VB3UlmA
         bYCdzkO0LpbMLpxTLzB5eqUMXvXZpY0hkZfRbkSnTMzDmxR2rCFhNf9hyiRUPEWLj1GU
         VZtSNb6BHsyvVll3VjqhNXWelyDyNn5EBHhX6nEFCgoAv1eAyCLesk5EoDE9FIMftc0S
         L8rrDaQjhiBU3T0VzytWoF98zL9SN5aoYpXIO1QVAP0Fr1hAORslCnV5esHAO584stkS
         pxqg==
X-Forwarded-Encrypted: i=1; AKwUvBybSdoo2W+t5Yom9WMF7DjYJ6u+jWdSdX1LtVWNwACvR7RvGNz93Gj4pl5VxmB/LtJZ62RahMOKzSuacg==@lists.infradead.org
X-Gm-Message-State: AFuF++lMsUV3isdWTWyOgOViEgfcEKionO0AWRRAZiFPF1tdDBCmaz2e
	7DqbmUmaf/bs1i88J+D4F1t0Fkata7HqfkJWQQEQubAcSmXQbq39zW9HFnA7FP5Vdg6DAeucupr
	t4OtaRg==
X-Received: from plpf12.prod.google.com ([2002:a17:903:3c4c:b0:2ce:9b49:d497])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:946:b0:2da:fa62:4aee
 with SMTP id d9443c01a7336-2dafaef6574mr4292355ad.1.1788367294564; Wed, 02
 Sep 2026 09:41:34 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:11 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-9-seanjc@google.com>
Subject: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API
 in the memslot perf test
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094137_610434_85CE8319 
X-CRM114-Status: GOOD (  10.11  )
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

Use the quad-underscores physical page allocator API in the memslot perf
test in anticipation of converting the outer versions to take the memory
region type instead of the raw memslot.  Stating the obvious, the memslot
perf test creates and allocates from multiple memslots, and so can't use
MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/memslot_perf_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index e1299611be32..844ea9b7bb41 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -339,7 +339,8 @@ static bool prepare_vm(struct vm_data *data, int nslots, u64 *maxslots,
 		if (slot == data->nslots)
 			npages += rempages;
 
-		gpa = vm_phy_pages_alloc(data->vm, npages, guest_addr, slot);
+		gpa = ____vm_phy_pages_alloc(data->vm, npages, guest_addr, slot,
+					     false, false);
 		TEST_ASSERT(gpa == guest_addr,
 			    "vm_phy_pages_alloc() failed");
 
-- 
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
