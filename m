Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8A3E7718A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 01:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0YWlstE+jGJqMeUqTIZ2y5d/+PfJCHkFS6VkRWEYHk=; b=r3qFj2741uIjue
	p8MtxIXkyQy6l/d/j+QTMf/RBFqlE8kczownhXFP/gtFCUleKeRXr9Zip2KwNKtDKw4rV7IxM8gkx
	373gdJjmp/a0gdKefeMn1cnL+AckbuyGy1ZGQyCLhjCfzuGYVJEjfNlatyJfjUDwgZwX0K2Qu9fFe
	MXFFKOsInS0pLIZZPq5gcXK4h9E15RInUKgFQJYItBux1LmAFv776vpc8BEeHfYfNZjQBOm8RVrjc
	N5Cj/g9P7K1OSAnzLKXe8wnf+JZFOqXkXvNR8aOw+tOBLHsuC9Vri561q0PBZWHSAQHjt+8z1Q5RA
	MvYMeEOHCLB9+xM6OYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS3U-00000003eVY-1hwU;
	Fri, 20 Dec 2024 01:43:52 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORz1-00000003cxj-12Ez
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:16 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-728f1c4b95aso1391519b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2024 17:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658754; x=1735263554; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=C0bgCVLlKE2bsIas/97mE7OWeLqD3b90q0/zRCnz1gQ=;
        b=yQHwZOwiLTSu24wt9+PED1v3hweTkB3Keuh6taUrSb98kszSmFh7vQMYgDA9c88lVc
         8SomardDSt+3xtIBN0OxHOQwypTqZPQV1LHBinFZligJDJj3L90nFIjXA0EJZ6/sG9Bg
         cKqigGqod9pvk99AlWYjXa/XXKh4S9Kd03/BrZa3IEIeZx48JQEZSh4RWZPyDiMfJvt6
         XvLFEdtwL6zbp7qTTtJgbaHhAXTPsxvSPieYok02I8Xr5UgMQESqsNtV2fxHf6/tevJ8
         0FzKU5hHnU09JJE7lq7ZV4oA0vv3bdpOv9vnt1asOtZUO68c0cahX300ImLm8H5lUao1
         65ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658754; x=1735263554;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0bgCVLlKE2bsIas/97mE7OWeLqD3b90q0/zRCnz1gQ=;
        b=sEeSDKmm2GgkS8k6DYPAtrcv/3ENIGn1IpC95QbgyhemeDIhVq84gAFyxDu61e91wo
         obadaOzHBaW9CuzXJqqLghgXbO9j4+/5CJXkJ93MGVTHQUjpnXHpqV06HdsyL7uhgCAY
         7JiNV0UkzeWTg5MiyrTLSkVxJpEysmujVrB35BhiCWCoNyVeoYZyj41AtFvAySbw6pTO
         4hD2l+zbSUsUft4sxg3hR7PP9scz+jeK0Dhqw3zkOMAqdoZor8hBLupPeW49/fykmTuh
         6FSVG7/ZQXPxaZ1bETuuo1gy6YZogKeVjSDvvzabfjNHEt8W/clm4eeK+Vul5q3JmOzR
         S9pA==
X-Forwarded-Encrypted: i=1; AJvYcCUHyvJwxwLLVLy74Ug8wf8QNkzTVzZvbyHeDlwPXmTSDL7nE+KoCiWVH5x0hrhSTG7a59EpFHzPtB7w7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCWx8SMJ51s6C9PUThhjmE3iPt7nOfAEd+9cikxSvW1TDpu52g
	wG5tFEHJ2mNuPOwgSMl43u9PB9mnEqZsCW6R6LqjBj+9pcnPIQb5X+zkC/MsgOlZPBNjgdqulEO
	cxg==
X-Google-Smtp-Source: AGHT+IEnCf3mHfBvLfwshZ15Q9EpX1HZcjdF08kZ2lrJwSlTx89Hx0AQSr2Fy6V/QWuDYbh+JhZtgEK5cgY=
X-Received: from pfbbd38.prod.google.com ([2002:a05:6a00:27a6:b0:725:ccfc:fd85])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1942:b0:725:cfa3:bc6b
 with SMTP id d2e1a72fcca58-72abde404b0mr1283201b3a.3.1734658753719; Thu, 19
 Dec 2024 17:39:13 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:01 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-4-seanjc@google.com>
Subject: [PATCH 3/8] KVM: selftests: Assert that __vm_get_stat() actually
 finds a stat
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173915_295529_D0147DD2 
X-CRM114-Status: UNSURE (   9.60  )
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

Fail the test if it attempts to read a stat that doesn't exist, e.g. due
to a typo, or because the test tried to get a stat for the wrong scope.
As is, there's no indiciation of failure and @data is left untouched,
e.g. holds '0' or random stack data in most cases.

Fixes: 8448ec5993be ("KVM: selftests: Add NX huge pages test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9138801ecb60..21b5a6261106 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2238,9 +2238,10 @@ void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 
 		read_stat_data(vm->stats_fd, &vm->stats_header, desc,
 			       data, max_elements);
-
-		break;
+		return;
 	}
+
+	TEST_FAIL("Unabled to find stat '%s'", stat_name);
 }
 
 __weak void kvm_arch_vm_post_create(struct kvm_vm *vm)
-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
