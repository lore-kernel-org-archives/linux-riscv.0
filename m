Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01857C61DCD
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5q+qI11qOrbEwbf5f02Scx7wJptqtwKZeJrxG/Xwb8=; b=ISOm4RSFXWX12r
	3Lk8QMerxGL/iywloYDzPfmgVn/mscmkNONhXOE50JdqnACfnD/WkEdBT9TmeGABENaITxlGQu8QX
	el04o8K/xVCZA3nHOoBSlFQvwSjwm4OmgKH72CltSOiZcXH5gF/6+kJg7QdlFYnEBBrcB5yc/XKhh
	NIvDv0WJDSKJbpLQRUXfbz/xMYwGXEfH0Qqb2eHRwvSETmF15WUNS1e0rPPpiPhOC5Apjr0xI2Lrj
	xRjF+9sRIympuEYcArHaY9OCrBee8U6spJD46H+F108AWr9WvtFgywMGwHK1qz3KVWtMBxTibnh6t
	Ar2N0smNUGhT2CGODwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMi9-000000038cg-2s0f;
	Wed, 26 Aug 2026 23:07:13 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgd-000000036OH-3Xzv
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:45 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc1cb806660so1462047a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785536; x=1788390336; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GKwDIzPdhs+/PUMGOrKYMYY0J2+uedR4TSeAqB3q+w0=;
        b=bKDiZxb2P5yNknt3t1SsiiQ2+65Ub3+HB+FcEzRwrwuOVNxF8PCBQOQWnH8LMuIo+P
         HaYOzn5uoA6exBps6I4E1jkjzgXTq7HNLvJM5M5Zy8BMRpuXu1+L9sWPtmc46tMFhoBW
         Iy21RFfDyX/5vHR+SSS/ODwULXOh9UV6+o12vt76xN4SHEcpF/kEysfYHByHPvh1SZWr
         H94nU4dB7/UrEdmQiZGIM8fjJluf8TDYS3Q3pJGaW1+K7uwkTKBvfV5unSOW59890WSd
         U0/12G6XOTInG5Sz1LOz8TDvUWbPv0MO7kdtJZAR8bFx6Z1+bS18xrOgN8fLn2r5NV+d
         qS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785536; x=1788390336;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKwDIzPdhs+/PUMGOrKYMYY0J2+uedR4TSeAqB3q+w0=;
        b=GzLXzAXnV3JLS2HkmogSZxu9Irj/cBIZDXwuNsESLfIhgQMQPmgU8Wj/TKON6RcvvO
         LpH4ZoLs+NXRoiBefjwllLodQNmJQH5YZv7oDdDPkkXPoJOkD0cahXFML9AeDFmT97u6
         aXGPPWk506QodbI2yB9auCc0NG1DnjKfOrbZWtWSP+3aolRBhEa0gLot2bLlsQvMl3bY
         LqbWuZ1XZvTp6YKmlhmaqMXJOwUzEkfhd7IcDec0xs7QISiweooUo6n2Yw//4084238q
         SzcJm+AkSIEPxMlcSiZb3sL2UFxFK1bXb/wxkpP2mHEe/R09EkOzA3UCWnWXf/ty0ifq
         Frcg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8fYzGfw7t0A0+OwTf6O0JBL2xga/F1Sm44xcWme3CHeW7YEV01NRPL0aJ/va0ZsN/KDHsnDNCOKYu5Q==@lists.infradead.org
X-Gm-Message-State: AFuF++msj8OcKFFdMvC4rou5syGTJp/kHR0RPKcoL6ZbAOC2kzVtPzo8
	8q+Gl6JX5EoYwe6f4ABWc4KjMrP5mwZeZRqlTsE6Al7y72iNwWK50w6PDlcsX33EEyQgzlWrThf
	DV0KUMQ==
X-Received: from pgcq30.prod.google.com ([2002:a63:751e:0:b0:cc1:c78b:a2fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4a97:b0:3cc:f0c7:5999
 with SMTP id adf61e73a8af0-3cf84348241mr20316754637.16.1787785535770; Wed, 26
 Aug 2026 16:05:35 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:07 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-17-seanjc@google.com>
Subject: [PATCH 16/20] KVM: selftests: Use TEST_EXTRA region in set memory
 region test
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
X-CRM114-CacheID: sfid-20260826_160540_107863_C06F8037 
X-CRM114-Status: GOOD (  10.27  )
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

Use the TEST_EXTRA region/memslot in the "set memory region" test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_override_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index dffe9654f45b..9d21594e2f81 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -116,9 +116,9 @@ static struct kvm_vm *spawn_vm(struct kvm_vcpu **vcpu, pthread_t *vcpu_thread,
 
 	vm = vm_create_with_one_vcpu(vcpu, guest_code);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS_THP,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / getpagesize(), 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS_THP,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / getpagesize());
 
 	/*
 	 * Allocate and map two pages so that the GPA accessed by guest_code()
-- 
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
