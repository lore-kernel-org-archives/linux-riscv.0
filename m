Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36932C61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgSryshKuI5++NrfGCOTp1sXJDkLbtWAkfyhVj+WcDM=; b=K5p1ukHqRC8L4v
	1YpEaN19Ey8ycVB32qaZ+gbrdTUuxbPiiW+c08vVGbsuILv1DVOygAyy+cEh8rJsDhkB8cvsCjDLd
	Rk6lJP18KpdwNvPsi5ve6iNzkTPjqVWiMFhbDEXD3oar9D44WvK8rLEkdhCF7UkA264LEOysgNTiN
	AIPZ0dJQTQwSNJf7MHn6OjLhY3hItQWp7cuWbwflA00W+9Ft+NygZ7zH9ma4Db5PSIUJPfgT9xtzx
	KEqGThMDe0A5dILZUQgXjiSPKzQYE607C4v/me6OYKbOJR5XxBA1dobnKY5I7vZSZuaQxqNzQ8X41
	08WxpSysoXMxqz4fDu9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o26-0000000FEru-2tFZ;
	Wed, 02 Sep 2026 16:41:54 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1p-0000000FEHP-0nLY
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:40 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-8553305b7c7so1048651b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367296; x=1788972096; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wcKMUlmJ0lq2oBOCUrCto8mVZjPEk4eBpEgiK6nEFRg=;
        b=em5rSUvRvwwfoJkzPx88faHU/CG9fhOvDjhO7YbhLtZSiI2Yz6DYeVejfR7S82Pzg7
         Ex2t7/ZvxbfOx4hPGODlSIZPp8go1CKZSnyj1PaffTUuFdOKVwg03msMmjxvQo634i97
         QLQnB7SJBTnwpbzo5lG6+8dPHGbe9j9rlQPbgaJ+4hybPCrGhmsex6IuVOeH9vnPXN2p
         W5rI7bT6YZ9zQBZcPnPOEFTCZ1HoLUzWazacmsQQT+/r5lCmZLXNU+s/vBTkWg5vRMuY
         B9cqEvrkFIbMpwEV9a37+WmQpx17ngwNhyWgdfXOyoub5gmD00cbrfik570IH4Du6a7L
         6woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367296; x=1788972096;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wcKMUlmJ0lq2oBOCUrCto8mVZjPEk4eBpEgiK6nEFRg=;
        b=GeqICNjOKuwT2cDKi6l9m8jK52ePxWXU+igrmQzBsbZADnYEKStX5AIpzRwrusdoqk
         ZFSFeWv8YjunJOPglEpmzUz4hBIQq4x6TmbxZqXtfitvkfEoMzUZDq6UrzxDPAQi2Iaj
         hRgLKZSdSOc164Jr4l0XrLvKBHpko+jbkmocZjPhH5IjvsHEwtwXZcJJfUWFrSDJFw7t
         nEDyQb2hN6O8itVtq6EH+gHvN8jeLbxoLfxrRq7RfyAsxeO/tHP05ME6yPiIKeL/IJUX
         M0o7yqsrfUk/FiM1OX7PPkahtJTmrRQfDoy1qmzzhRzI3xe2piRcfXV1XjLYY8eDWGyJ
         o63Q==
X-Forwarded-Encrypted: i=1; AKwUvBwU/iKGZ3rDZWL+LjaEQ8zQQ2PcCStFX9mMZGJfED3HHNFOVBKgcYXUaPuhMLGwmC8JTA4t3ZjmGti6HA==@lists.infradead.org
X-Gm-Message-State: AFuF++mq+q/aHm8UaGJurIoVAwPERqvMF8gYP7+M1TGD5yUrnvkgDEL6
	+AsjkdIKFpxfBdvd+O/1+AgrqKWngDdnZ/vorRSBjbFws29eXDBOsLecUEtHs5selyfHtE3nFMF
	zELBFng==
X-Received: from pfbeb17.prod.google.com ([2002:a05:6a00:4c91:b0:847:87ec:2a9f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:997:b0:84e:f90e:492f
 with SMTP id d2e1a72fcca58-85ed25e06efmr8429625b3a.7.1788367295680; Wed, 02
 Sep 2026 09:41:35 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:12 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-10-seanjc@google.com>
Subject: [PATCH v2 09/20] KVM: selftests: Use the innermost page allocator API
 in s390's IRQ routing test
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
X-CRM114-CacheID: sfid-20260902_094137_755822_D7731627 
X-CRM114-Status: GOOD (  10.86  )
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

Use the quad-underscores page allocator in s390's IRQ routing test in
anticipation of dropping the @min_gpa param from the primary APIs.

Note, it's not entirely clear that the test *needs* to use a very magical
@min_gpa, i.e. it's possible a more elegant solution exists.  But that's a
problem for a different day.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/s390/irq_routing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/s390/irq_routing.c b/tools/testing/selftests/kvm/s390/irq_routing.c
index f3839284ac08..cd26cc1aed80 100644
--- a/tools/testing/selftests/kvm/s390/irq_routing.c
+++ b/tools/testing/selftests/kvm/s390/irq_routing.c
@@ -36,7 +36,7 @@ static void test(void)
 	};
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
-	mem = vm_phy_pages_alloc(vm, 2, 4096 * 42, 0);
+	mem = ____vm_phy_pages_alloc(vm, 2, 4096 * 42, 0, false, false);
 
 	routing = kvm_gsi_routing_create();
 	routing->nr = 1;
-- 
2.55.0.966.g6673acef38-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
