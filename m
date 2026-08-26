Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB43BC5DF97
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcR9/rX9PzKBYYwi2pVuKFCamhVnAMtoSXmj8kFj5ho=; b=mNuWb3mZmqYFpr
	3GsLa1RJNjAOsnM0feCwxlEHw3l97ucRFUsMfea2L+2S0UvA/Fl/u68tGoikFC9IYaE94WOj2uBZy
	sWeO6xaJPD6RbC8pxCELyVCbJeQ3J0e/QUA90s9/wvheLregEroA5EpjqEmAFuUocEV1uRG215BlI
	wyF+jmENrt0SXV68YulHMEtD2IT/ivSbHY/ZGwlKLyiVhb/8z6K3/eG5NN6o8x+rzMHr0vxut1c40
	zcRpEucSNRgu4IDs8juz2ABLfbnbLbvjRnv86pTRJoG0jE6zhxLEnR1Q0KqG2BAzQo5wfX5VHmlVc
	gHjjFa247gxAZaVIjjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMhz-000000038NE-2G9Y;
	Wed, 26 Aug 2026 23:07:03 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgd-000000036NJ-0PwO
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:41 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2d63c16fc5bso32622245ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785535; x=1788390335; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lK9hNNEVcV137VJifUj1j8FlSQZ8ZR6EJrURDAfa97I=;
        b=dJYgbknAA+AnFcf+N2ODbQSdWYmTekfmg+UYMQ3MVyvU8JSgInH4GnYWQW+TqIjyMd
         x5t0HqKXdAFDR02hGOEWl53yPW0dVieKeYQrA9ARLbWltgChxSxD9wnh0qs3LHn8KU3V
         QJiU8TdJUMZJVyzZ7xzFJRI9hXS1ucEboOm6hhpIBxSPHuvEFja9aFVyp3RT7bkEKCO2
         RBFR/j+LB3pk/jAq4g1iErd+XS9eXrEovx/npBUAB9xdie9RC3Clq6L3eYbXw/Zc6DzT
         yaGmeoxmcoZsKi1tlMALMQ0mALUPVDFiMy2PmRhWUDRJOf1bm/Z/sTpxcFHLtlTVQfQx
         c3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785535; x=1788390335;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lK9hNNEVcV137VJifUj1j8FlSQZ8ZR6EJrURDAfa97I=;
        b=EuWKwWfzB3Nkyfjza9ru3ntqpOoY17c7YID3D6UgHBKEY2xbM0Pc/uxid+tVEaLaoy
         ScB0dWkIrBpjZXFQVM5nR7RR7JHLEhuHCYOzeB4QekRYmvbH2/kMj8Dks9zxU3NnHgVz
         bmw6aPqqJn6eNYPj+o8HRe/d0Nh61ipFd8reHh8TtIhzVX2X8I5slzlv8RcIzEmKJTzO
         UYWbX6TPfQvkm3L89hG07dfR5ci1db1se7Zv7p7BI7bnjzlYkAAJjclBnVjBpt1jKO0u
         +WEYwOBgco054aRwaPgllJ23gGEzB/VyBVbSU+KEfsdASDHoP5o6O01TQ2JJxb30LP4D
         afYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJkECCGPHSWv6yQY7ZwuIYsulTms8MGtGA7dI98gLOK80p+qRrj/2HdFvkmKmEk88eGJKnCrBx0PVlBQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mSQDePaiiWNYF2N01BkqbJFvAwhS639ErwRJ+g7u3TcxLl7x2F
	KnJv6OKqZBKh72oNbEbcWSx1psBN/Cc4N+2MY+bMr0nl0cDM6IyEwUCwr/9W6uJ6FXpyFxtWJwB
	znzUQUQ==
X-Received: from plblc16.prod.google.com ([2002:a17:902:fa90:b0:2ce:9b92:ec60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c7:b0:2ca:6d87:cda0
 with SMTP id d9443c01a7336-2d7079fa6d5mr157756405ad.6.1787785534676; Wed, 26
 Aug 2026 16:05:34 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:06 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-16-seanjc@google.com>
Subject: [PATCH 15/20] KVM: selftests: Use TEST_EXTRA region in x86's smaller
 MAXPHYADDR test
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
X-CRM114-CacheID: sfid-20260826_160539_242153_1C36680B 
X-CRM114-Status: UNSURE (   8.97  )
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

Use the TEST_EXTRA region/memslot for x86's smaller MAXPHYADDR test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_add_extra_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index 3dca85e95478..b21798a385ca 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -62,9 +62,10 @@ int main(int argc, char *argv[])
 	TEST_ASSERT(rc, "KVM_CAP_EXIT_ON_EMULATION_FAILURE is unavailable");
 	vm_enable_cap(vm, KVM_CAP_EXIT_ON_EMULATION_FAILURE, 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / PAGE_SIZE, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / PAGE_SIZE);
+
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
 				 MEM_REGION_GPA, MEM_REGION_SLOT);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
-- 
2.55.0.887.g758fc8c411-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
