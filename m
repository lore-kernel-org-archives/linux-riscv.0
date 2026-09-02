Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C0DC624DB
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfhbXpfB5mnbypGxiJeOMYoOpDXKyJ2kvUcT91U0pmA=; b=OSID1Tvn/7u5V1
	TFKnv9wPhXpsQ28Ng0Ezv/MOB9bcCiJYkj5bC7MOXMdGOvh2iYBq6ssiOkp7tb0Uyz7pG4EFsokPP
	SvsDchHBa0VfkxIzs9fwqV9W2StuuPAp2o72nDyLgYgUpOa/cwQIEOSZA22sstS744Lz48rwf/twW
	hmn2Sfmno/yA+KB5pscUUqHb4aDX5IyfikWfsMDxszstkn2BWRF7K7u0MAvm82cLkPB2OvAg07gpu
	9gB4ozU9HQ5JIR8Tj6XKHyonEVOpLg6BAcKTRukXgLBUu40N683rrzLdFj/XuyR2bijxXXDRK1Y+m
	ZS8MsTd2Vl3OCSqJ6UwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2N-0000000FFY8-3mQW;
	Wed, 02 Sep 2026 16:42:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o22-0000000FEhf-1DRu
	for linux-riscv@bombadil.infradead.org;
	Wed, 02 Sep 2026 16:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NSZqPcNxcDapPNldInB7JTSEZaOXSqhsga2ZRaSmlrM=; b=Qohg5TWjBVbD3Ky5s5dKi2pBOa
	0oGzAqxA5a6rY/5UlK6hhdqiDQst8gb6b4N87CjXLnE774yoTRRmm53QBZlkh5U9XBHnUGUN6Zmz6
	Qx5QbVb8C9VQrofimPPTtJpqlaYMlh/IwS5Ugxw2kdkw3GSCPSS6LlR3bH0ERp88RnQEckaeoA2jn
	cZS7qzLa/tAB9vp3JRq5SqUqkokyzsUQ4nFHzar+GdJRH7xomNGKRn6C5GiYcyzP/YVxU7BXB1P89
	1BXErhAWnHjxZDLACFByR91K2wpQnuysivkY27m+F+GjiqxpRy+cxR4YX+622XeLGDgQOWmiYKW6M
	tyzhN5Fg==;
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1o1z-0000000CD9c-1HyC
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:49 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso1619556b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367304; x=1788972104; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NSZqPcNxcDapPNldInB7JTSEZaOXSqhsga2ZRaSmlrM=;
        b=SkucdbEAaJjK//0C0vWIX4FP5PJyV0j+iP/pSclIw6A0RxLBZdpNBogg77O45cpgF9
         p8sFxmWQ1wwzi3a0t7Ln7e3NhRKhyrw0Cz8wrDmL8vZFIaitLIPSUQausSnnQSORjIlv
         iIkAV3vIOBHHY0YXNk/ZFwNSkp4pQAia2R99fgczyyoXlcJy9346Gb36tOJ/PfP1ZF0P
         MjtK8e1Dx+t3SqVON7QqLekS5u+5edlwVQGIJOueRx/DMdQn1dkOh/1vMgldjGNSmZS9
         fSJfZu7WJA2JozBY5rXkDN6+LxzFjsdBRCygIF/MQu0Fj0VH9dNA54Vs1nSliW5FnX41
         MOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367304; x=1788972104;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NSZqPcNxcDapPNldInB7JTSEZaOXSqhsga2ZRaSmlrM=;
        b=fWWLot6p+0SAaYSrgC0OCS/NQPJiGUW6P8+4SprhhsK4kGLH3HVbYI5pRv3hE0BPgs
         QlhqovsSrrDuu31PJJWXQ3m/e1Gyqya74RVORx/7+FYY2ElV65kBGUq2IkUuR/otUjgA
         mUmv9ZD5wmzbWdVyRmbpIFIRcvMJ2ZDqju4xczDlCOCGrpkW2qso/Hgo03Cm4W17e8jj
         9clkayXdz98XoITZKha00/nk5zL1OBbIXr5P17IR+Z2B8A6nMKE09gmsO1bAzPNSBHwW
         ksuarf/nNUaELJkZUMD+GclwQDOPU/ifgzGD2VWaJw9Vz15+39OD3N6H0a499hFq1f3k
         pwoQ==
X-Forwarded-Encrypted: i=1; AKwUvByapxBllbNwYbARo7A2xOfo/61KjTbZmQtg9oRVVBFPD54w6x6M350ZCMkKUGOl3MP/YjBM6ogWdKvPmw==@lists.infradead.org
X-Gm-Message-State: AFuF++m270TCk7a0NTXgosszNsWNPydo2/XhDpWNMPi62+5kob/XdJaW
	ad6N3z7IGLUwOMQ95mrFZCsMBT0DXMn9WDfC/hojb0+lr2BSL7K4BI8gO7fQaDwChjCgYVLexc0
	fqhzp3g==
X-Received: from pfbgv8.prod.google.com ([2002:a05:6a00:4e88:b0:853:9149:8801])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:238b:b0:85c:c8db:8e4b
 with SMTP id d2e1a72fcca58-85ed23dea9emr8785308b3a.6.1788367303872; Wed, 02
 Sep 2026 09:41:43 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:19 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-17-seanjc@google.com>
Subject: [PATCH v2 16/20] KVM: selftests: Use TEST_EXTRA region in set memory
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_174147_447878_0EFF17DC 
X-CRM114-Status: GOOD (  10.92  )
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

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
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
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
