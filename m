Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D78C61DC2
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25gqkr254BWEhcUZ4/fB1Lufp8ePPsEWZIOgcDQ6k/8=; b=uFRtz3p3GsskWw
	HDt9RhI0fW1chDCmWgi0Hs9TCjNmEwasowE5Ihj6gAbzz0bxzLE/ZPBi4imuH7o6XIa6E5XPZUubv
	a1qymUFTlIGZG+Cd/tyKPDUvUm8LsXP3rlIQaqSuc1OHi1Qnpny0FUIumpdSwRmlKv2Clewm66HQY
	8j+U1Oy0c/i4q3G8THbK34RlAduYbRJHQ8m03S2a6B7t+lD1A0zaA/YAhakv779FzA+jjRNprRcVc
	gWnK5g4xZaYErwpT6ENx0TxG/MIL3T/mwLGAjZpr+br+DVMUjnZ6Zk2VEKQ6wuSDOCWSLw0Ki0NBE
	5QAh+OCBzMrAYkxWX6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgR-000000036DT-0KXK;
	Wed, 26 Aug 2026 23:05:28 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgI-0000000363d-0Cf4
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:19 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1283193a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785517; x=1788390317; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=94pyTmilRwp00Qy5PlO0fIgUZFKJ9TnrjxcqGpSFO84=;
        b=alAJ9nRwWEdpW541qsChVbRu6rFVUYBWUFPQIgEJbbwe1J8YW7XKx+iYzugc7AkOJM
         gyou3q28uAneU3Bejf1/WH4UbMXhMF63YfidYmLlWclCC99Mngnj/uJKRNu95r0OL0Ho
         5GjB8F6yrvAsQrYGioPD4RVAl91qMN16s6tweIalcB/IS18gMgMwNX7sf1UlSfd03HSC
         EUkWMxw3/kH1t7FZRInSowR6pYZh/UU5FzczuDZQqpOptqATfZlJsg27M2ifc8xjbmq6
         +VsU9HtMegEZTdiUz9RWbu6dejU/XdRGmlft9szY6AstYGu3bn9p/0oIQcbc+9fIlx3s
         ImTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785517; x=1788390317;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94pyTmilRwp00Qy5PlO0fIgUZFKJ9TnrjxcqGpSFO84=;
        b=f+84TQqNlIWcE7512ZE4Q5qiWBMkvmgl5slP+zsz6sZhghvBaGXEoW8ULdye1XUNOb
         Sn24PP/U4R0MQthKIyTWSPBBxqQSYeqU/E5qt9wfrKyhjigbx6FGQocC/CFbwMxWAtzP
         dncozJ5sYUZJRO29BvA+xTXJO5rczOw2j1MFoA82qOkXthqrVguQeGMIAIGwyt6bLXS2
         qTIxnEqWUs1Gn/uSq4qiGOLcFKY6tEL+B98Gf+5VT0owtc6sFZTnWdVAiLoTQkWYBTjk
         RACiccPvQr09jn9eM6M5cD5oHCsXoh5/fIEes7Wa4uoDWPmsJgMYvNSBoX4a1Bz8IPmC
         YTGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSpeEFXw+oLTp60VL6sRhSRKuHp6lYEWdtGH9sqNJQsqqmT0G3STMaWfAfYcnVYoM3cZ6ukxwPusoxww==@lists.infradead.org
X-Gm-Message-State: AFuF++kfWi8RWIm96abs87rit9mztY1XqgT+x65wa/Om6lCbtYGi/qi+
	hpfRXBLqPI/Hr8y3jn3gs69Vu3vosz6gowdDNEift3Xn2TeDNUBbCgiSULn8tfk8h6da9SYdw90
	qtKL84A==
X-Received: from pgct13.prod.google.com ([2002:a05:6a02:528d:b0:c99:5634:7551])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7008:b0:3bf:7bf7:7913
 with SMTP id adf61e73a8af0-3cf8445170emr21857267637.14.1787785516420; Wed, 26
 Aug 2026 16:05:16 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:04:53 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-3-seanjc@google.com>
Subject: [PATCH 02/20] KVM: selftests: Bump the minimum GPA for page tables to 0x200000
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
X-CRM114-CacheID: sfid-20260826_160518_139756_65F38C29 
X-CRM114-Status: GOOD (  10.03  )
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

Bump selftests completely arbitrary minimum GPA for page tables from
0x180000 to 0x200000 (LoongArch's minimum), so that LoongArch can use
vm_alloc_page_table() instead of open coding a rough equivalent.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 5a7a455b5387..70906a0d1003 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -175,7 +175,7 @@ static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 
 /* Minimum allocated guest virtual and physical addresses */
 #define KVM_UTIL_MIN_VADDR		0x2000
-#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x180000
+#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x200000
 
 #define DEFAULT_GUEST_STACK_VADDR_MIN	0xab6000
 #define DEFAULT_STACK_PGS		5
-- 
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
