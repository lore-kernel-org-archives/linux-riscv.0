Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4517EC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 00:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuY+C/pgWYZUp1C4Rq0qqME2xPpM2uO8MlS1h4j/XAk=; b=NJS/fxK+Bj4E9d
	acUW0v/HX+8qo6abL6hX62snAJdvSxeN2owIwD3NY+VN60mT1RCKapv4m4YytX/ANdjdIEjGWyjpc
	FePH0AmXAHPo0ae+GKbjEP8upNR4JNU4D4tFuZNdAsL7aSXsvZhWGDFCX1Qvgh/JoYx6j/jQAgAM5
	NF9I9Fbyaqj6wwnLl82hekHHqhimA3sK6zC1wRjoIff+vExZkaId5486k1PTsEpo/d3OoMB2iShwq
	46NUnoKjcAcpRtfic6npZ8MvSBBnEmkvhQsaVHi3PDDrZ7GwMg1uLqBp5Y4c2mzS6pqABEIwH2IUX
	6LAg9f4wJfpK4RvZ2kaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3bY-0000000Dt0x-0uMi;
	Sat, 03 Feb 2024 00:09:56 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3bB-0000000Dsef-3GEO
	for linux-riscv@lists.infradead.org;
	Sat, 03 Feb 2024 00:09:42 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1d45d23910aso26054265ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 16:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706918973; x=1707523773; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uGdQAEk26j5OxpYXu3PaMK7EeL8Au0IOP5m2/Y3bZT0=;
        b=jbKIHrNELs1Stup0gIoJTcgb4oZ5puxaW5v/6aQeVWgm82ib+seW44F+wSqAaNjOGV
         8sl00SSzFRz3ehG304DcsihpT9qNgCvm0OfcZ8BxDt8EAUKSrHDnGD/ge9Z2628DO0f9
         0YAfn212ydwCqBj+n0HpjjLdGNiDK0lFEsGzB//nLMZLR21ZkjNi1lRL6TKs3TvKIDwe
         CGfcT8gxQQbLaqXVL7HlC8b8xIYv5XfMwm3D8G7lWY+5Vb7bLMNtxV4RUx2HsZWBrM8T
         dsQ7lMbV/Pad4CdKRHYp/b+01RqH+39lVe7UXcr+GhwEKt/umdLAyEnElbZuMvDUHNRI
         aB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706918973; x=1707523773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGdQAEk26j5OxpYXu3PaMK7EeL8Au0IOP5m2/Y3bZT0=;
        b=g+3fCY//K8z3lvtGi9Ds1YFD98qjetaIg2juJzEBHqvcqbTsVjf5xMQsBxrNzfONiu
         NRmxKZdVvQ1k6VjCf38hECjBVSN87VwY+flTmAYQ4TdevtNuqzaDu9q+8M2y6R/7GR/+
         gYjdvgb8V/VIeZpwXW9UvcNqnLMZf+yqX7eLGVUN/ep4hTaKd3VD0I4LE6XIKt/abDDU
         YpBqm/q0/uJgCq6X3V/l0CwKPYzXStiOuk0hpAG20ziUSwljab5IetB36SeUE25npaxo
         QQRwIrd9BjsbPbUZMBzB2rnuCuw9Vrh0WMypRB8XkFSox3juERlz5CvhquAgnpj24d0W
         e1Rg==
X-Gm-Message-State: AOJu0YxEqkcbRt2TlyPW0ZJgdUjPqU/6r29TubgVX4YQwu40wsY87cm6
	qqcvS9GngGqDkismpiM0L8gawBxFSHMyXYf68yCPAzNF5/+2VaGGn28FXRVXrpxKUxXCliDfBBi
	1Jg==
X-Google-Smtp-Source: AGHT+IFjC15kDw5iExzgefryGqdvDfKmWm4cQaCALbm/PwXRZkCDFthW43qe2jb3I/GBr57667GkOb1b5Sk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e80c:b0:1d9:855b:629f with SMTP id
 u12-20020a170902e80c00b001d9855b629fmr3990plg.11.1706918972726; Fri, 02 Feb
 2024 16:09:32 -0800 (PST)
Date: Fri,  2 Feb 2024 16:09:12 -0800
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240203000917.376631-1-seanjc@google.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
Message-ID: <20240203000917.376631-7-seanjc@google.com>
Subject: [PATCH v8 06/10] KVM: selftests: Explicitly ucall pool from shared memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Peter Gonda <pgonda@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_160934_160903_8EE6B3F6 
X-CRM114-Status: UNSURE (   7.87  )
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

From: Peter Gonda <pgonda@google.com>

Allocate the common ucall pool using vm_vaddr_alloc_shared() so that the
ucall structures will be placed in shared (unencrypted) memory for VMs
with support for protected (encrypted) memory, e.g. x86's SEV.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerly Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/ucall_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 816a3fa109bf..f5af65a41c29 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -29,7 +29,8 @@ void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 	vm_vaddr_t vaddr;
 	int i;
 
-	vaddr = __vm_vaddr_alloc(vm, sizeof(*hdr), KVM_UTIL_MIN_VADDR, MEM_REGION_DATA);
+	vaddr = vm_vaddr_alloc_shared(vm, sizeof(*hdr), KVM_UTIL_MIN_VADDR,
+				      MEM_REGION_DATA);
 	hdr = (struct ucall_header *)addr_gva2hva(vm, vaddr);
 	memset(hdr, 0, sizeof(*hdr));
 
-- 
2.43.0.594.gd9cf4e227d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
