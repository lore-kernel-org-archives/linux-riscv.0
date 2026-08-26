Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1E9C5DF97
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbSbjG9vRrXS25V5hRHNrd5AIKs/OxfPGdsc4In3piM=; b=qIL6gLRFoQ7OLd
	ScrUlQVz58BnFU4bYI5T2sarKc/nqO+v1hk1BK1aw1Ot0BwI3a0XYXR4ckfUr/M/a3e5GMPJ7O3t0
	Ddj8zMynceXb1g3n+bS+vDddpmvm9owQBM3rJbcmb5lGTK56Cbr3eKo3c38UgaWFPX2pzcoX+JHDw
	g0mALiRpEDnUpdNrCVvCZtfnNonPzvyVrJktGVt7F7xWyzg4heUA79DLln3jEKwlndVe9xbHFgeME
	HjIILlA6OTPC1xK6V9bhHB0xRNR0rxNE5tid8TGQxWcYL/e3x2TwHFODILxtstGE6WjOVmrP+0uzN
	xaue9HAy2GYqh3HyVItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMhm-0000000386v-26CU;
	Wed, 26 Aug 2026 23:06:50 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgY-000000036MG-3ldK
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:40 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc132709c76so162878a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785534; x=1788390334; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6dP/JlGXbpMmzJiAs51wjG9zHvCLsaGeW9+h1tHon4=;
        b=t96QDKFRVQlnG1/FeNyzZvBeIlN00HIx7EqhMRkkdsrRRcUqrnR6IHWmhOWHxQu0hZ
         9FaLP6Obu2wvvlSZ5Fxiw53NU3Qyl1ucOmfrYrj/BWK8z8qBo8ppnLSWolnDt60S2ue5
         95PG3Atv1A+HxjyHjm7wNSnifgHCnn3k8ukUEcviovRzEMnUzWdXk987AwpnZq9CVfbd
         4h1hu4vFOZszHba08hDNEagNpN5n46iwvKuyJroUbnYD9AkcD7/8vRNRN7jRresVMEpX
         Zs0bP2Y751xNf3sNAVQV4DOqXoez8kmdBIExAF4ss4RVrhzssq95QtFgoWTNE6Onih4X
         lqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785534; x=1788390334;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6dP/JlGXbpMmzJiAs51wjG9zHvCLsaGeW9+h1tHon4=;
        b=RxmEiiIf7ePHxRjWKRiwlx77JFfJSjKuDAqnrgEKOK34BmTfG6Qsdt9fMUvbxB66Ee
         zuD1UPzeKiw2bXF7IkWB/ZOvdSZ0816DD+ROeCU/od9pxbvH4EwQLMPkbso7+jwg/Sr9
         brjTs9JIEq3dm0pcU17aljSd7XTKHJp5ktXQ/kG5dvSV2C9hH5ySJVitmkyk+/JkqRCQ
         l/XikMuNJkiArkdIT1kWYJkGffZQHV6hHlHYJXSeQeDIo3eu516rAEMuTiVNkjqGrlBn
         kueCNYRAXdO2o5d+Ib2oJKqXwVB9J/5Dx0mhQulQZSx1HF2440Ho2X4d6lUiAQvcve6n
         MAyg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4fJ6I5NzmidaRhuq7NdCYyPIP4gc+cieoPEraHU7q+rC2CrogFdbaoxaZWK4lij6o3flWq8XHW4MVhw==@lists.infradead.org
X-Gm-Message-State: AFuF++kmADN9pnYW0M+MdzhJzZeukjKYWkoRHu1r/Bfw3ktY/Q5e1a5i
	fmhLBU6rfO4r/UAIYc1h1JrmQ1obavX2YqSuWZb/Ci9ST3pbeKXWqSFnkGgcWgF6Z07rTWdrXxV
	RaQ+VMQ==
X-Received: from pgcv20.prod.google.com ([2002:a05:6a02:5314:b0:cc1:c423:3804])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cfa8:b0:3cc:8f53:26c0
 with SMTP id adf61e73a8af0-3cf86dd6053mr21955403637.17.1787785533546; Wed, 26
 Aug 2026 16:05:33 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:05 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-15-seanjc@google.com>
Subject: [PATCH 14/20] KVM: selftests: Use TEST_EXTRA region in arm64's vGIC
 LPI stress test
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
X-CRM114-CacheID: sfid-20260826_160534_960257_90C7CB9A 
X-CRM114-Status: GOOD (  10.91  )
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

Use the TEST_EXTRA region/memslot for arm64's vGIC LPI stress test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_override_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 9a69c439a0f8..9865b204fdeb 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -164,8 +164,8 @@ static void setup_memslot(void)
 
 	pages = sz / vm->page_size;
 	gpa_base = ((vm_compute_max_gfn(vm) + 1) * vm->page_size) - sz;
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa_base,
-				    TEST_MEMSLOT_INDEX, pages, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       gpa_base, TEST_MEMSLOT_INDEX, pages);
 }
 
 #define LPI_PROP_DEFAULT_PRIO	0xa0
-- 
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
