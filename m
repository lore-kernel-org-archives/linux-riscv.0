Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F556C5DF97
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OOH4Yqs9vcVrUR2Z2qWMAkAIXj2zNpeg+2AEUANncA=; b=cN5WhsiqzYLhKN
	3NtrO9y9dodjAB437tWfliRiUzkNNnretWfQeu4b0XycNLMhrCkRc+5H7WdsO2zNzFOmJ8mUZR+mD
	8uS94e30hqLhAgKOCIWcCnNXAOi8Yy+kLyQH69gv8uBfSGZZe2Pm1ixQT3GLoQl88T5EOZ/ef+NYa
	wsoEU6dhuZ1ypeX+nIxPQrCkIh6Bugw1hq+8QZpg/8KONnrK+9LckxIyRVvmYtuRHMcZYL3Q5m7R7
	lmeAIjLdkpUgF47nAEn5jvQUSOIN61+2IczASOQk7zmjiKuglnkQzIpRAjRIEwKyIP0Bcim+KSCov
	QMDJodaidpGPN5KWyyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgy-0000000372h-29bL;
	Wed, 26 Aug 2026 23:06:00 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgQ-000000036D7-3s15
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:29 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2d7367b7b35so1204425ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785526; x=1788390326; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nkGDVNWv+E37i1qgZxGANcWGk8EcR4uX9VZBG0WIwSA=;
        b=LEXa28338ZYb8xUZiUlUTKQnVz2oymalPRW1AxNlcvZTLDZEd0cLbGCJQiltH887Mz
         KINMhUpV6xKmzu79XDfk4q/QFfAeY04H5DFTG4bvpR1CKvI6otxoHI+qA02biotU7jiE
         zpKflUHJJRZFz110fTVZITWS97qWrFBUPKdachZZ+wmoOjq+GpzYZ+AsvLQ54qiAzlZ0
         pGHAn92+CAo0lrrxgoB+uI4bj5EuZBv1U4fn0gmUNoZ4MLu/rCJZCe+YbBpcg/5jaTyj
         +QtZULKCiBZSxjWnvQ2CC5JHW4nlt08t670G4G9qCLvoMc9Fr9NA5XcbycHva5DL1zFn
         Ex5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785526; x=1788390326;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkGDVNWv+E37i1qgZxGANcWGk8EcR4uX9VZBG0WIwSA=;
        b=s5GwWJNHR/Dxq+h4IAvAEH4PDBkSS7Sjj8Tjvz50VELfIOJdfRfdbxBKEaWMwIzfcm
         C7ukmluKcxRtA1L+lE8MXgS4/3rvL2/EBx1XhfLA0CCoNcTHHyV3q2/xITN8hE7LhEfo
         5L9sCG8FUvhJRBNH+TleB2JptEjE+l+gRmOvyWLl3nAbmxM05criItrXdFoiH2g1gFyC
         l5xcooVrJRgk6FFXh4qhHax2uBF/YmW+hV/gjWcvx2UHL3oWn6h+nv+HW/8umhAI7bUX
         k0PTc5lhSXvi+XoyOlkGpOlshqL3KwcGU6gf8omr8B6h48Kt9p9Ccy1aHcY6N791KIg/
         E3+g==
X-Forwarded-Encrypted: i=1; AHgh+Rq1SMzAf+qtoXmdFJXa1sBviEdCQ28kIggHEzOFZ8bpv8aFrYpmacVnVs3UNuaKGTTe7V4VC+WCOeIq/Q==@lists.infradead.org
X-Gm-Message-State: AFuF++mDicz1LHlc87s9Jb/NKyDh8OA2TBQUS8x4kjL+k5iLq6XKRo5Z
	+UyWqIFpkz860nixTaNvOXK9aAldnz0hUESA5J3ZjuFveVWYsn/eT4rE+L5tby+ApqrKLLemrU9
	LnnolCw==
X-Received: from plblc14.prod.google.com ([2002:a17:902:fa8e:b0:2d5:62cd:db79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19ed:b0:2d7:107c:917b
 with SMTP id d9443c01a7336-2d7107c934fmr164734915ad.0.1787785525359; Wed, 26
 Aug 2026 16:05:25 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:59 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-9-seanjc@google.com>
Subject: [PATCH 08/20] KVM: selftests: Use the innermost page allocator API in
 the memslot perf test
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
X-CRM114-CacheID: sfid-20260826_160527_994609_72C08194 
X-CRM114-Status: UNSURE (   9.26  )
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
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
