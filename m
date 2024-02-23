Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C14C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkVPJ8h4QinVRQlG0dIzLDbuP1E92VVLy9cUDMVIPNU=; b=TsV4Cohz0qPxNx
	jURG+VxzR39GaxmjUTld84BScGjuOjJtYIQ09V/0KqIpqnqLKTdXN9OwnDOAsCegHB5RMBIayH7TE
	f7LC3mjXxAo95AWxmC1X2Dk8cfTHNHDxDOLvqnZ5IFm2Y3JA/lM8EHsHyroCEGSbwOhBDpr/wP08z
	+2E5qySzoZw39k/vbv+B0uz0DBEE6tDBRN5PB8AZrmZirTRAChUM6C8Ypex0W+ZVRzFSXy3u73Wki
	H2QYRiA/fMK9NRUIvvnIoEUEa2RUibToOARDAioYQZWSsNKAgvH+05YFA1gjKyDn5ZWgcr3pYXHxo
	Snnygr/sIC5QWdrQedeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJj8-00000007G3O-3SSh;
	Fri, 23 Feb 2024 00:47:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJfq-00000007ELB-0xRA
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 Feb 2024 00:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eb0yDEaAWass5g0hMAU4JrW6cOWG3HVfWM81wBHq82s=; b=pGJ5leWFV428cw9Ymp6uLbINy5
	WHc6zbNp2SLbJSEqMK7vnuHIVI+DU3f+n1yaKMQ7HH/2yXBkAtDQx2wDQeybP49PQgoGFi6AiLKN3
	vslHTB1w8K07zLaW4iowRK/xnaKpLROKE11yHmCI4oUmgVB7NJtl/4pKHfVN9hk6YiibxSEjqyzEN
	6c//uLyxlo7R1qhIDlQjzTkmLQmQWyVYPyOu5HQG3XXjVC5J/pXgK35epVzppfFzyTIylgCg+hZA9
	XkpBLmAgSc81zvdSPBKlZZ7/klmRbiRGMfjP3S2mwVV60Bt/jJHAaGr92cr7zj5FcfHatfr1rz5k3
	guw7Y01g==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJfl-00000005DSn-3470
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:44:21 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dcd94cc48a1so511347276.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 16:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708648991; x=1709253791; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eb0yDEaAWass5g0hMAU4JrW6cOWG3HVfWM81wBHq82s=;
        b=FOA1bp52oowO0XY/95+gA8p12/pQX3+47v0zF20zxj5yVHlybeUpGt36WuEVs3VaNt
         VqW2sl3gXICNcRyLpeVaAkCraz7HQRQQ5GtmTvyP3dRABme4SqiH7NoTKp8wwpoNFFOO
         WdN1vYpvwx2tC23/DldiZnRWvZFE1qdAq7JptVh3Lz3TXugDB6D0ubZ4rQHt33uBdq9y
         Ik+esJ7SWOstTwtTRGksCFtV04Ki7xIVB/9azt4mz3mhQIEuHsN07xge1kwDAb6a+DYh
         RClTcFlDLBKaEBWzNMhvffgxKO8GcwEcOlbdA1t+f6ngCg6kOhUizIUNHslPYyYtFvlz
         SgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708648991; x=1709253791;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb0yDEaAWass5g0hMAU4JrW6cOWG3HVfWM81wBHq82s=;
        b=DAGU0iyykMxPxk3+MngUbrCgcWJDuTcdrTZ4bvofxe/S8AK8Rh5TaB1PJb2zz12WXQ
         rgwq1xbO9WIA0iPTQ7CSGYO3O8dOZd3jqURLjX2sgK4sSSfuhFKzR/hIYcTTf0/zSHTF
         dVuHg2VbJ3kuEHDA8V00/PpWhzbCDlQ7TPZczn6QC6Q1CcjN1QAvI7Y7NidFo2IUPYU0
         yTnlrEfgNv1HchXur+eOdYpejPtGrC/0+VipQwG3fqeHVL6AoBjKGH/MuB2GQ7PYPwKU
         uQFegvXRGSRz0R4bgh/IeaaP5vB+bUK81zpohxRQ5oCM4PK3FXazK50HHDhSU9j1zKpd
         7NPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaIxUHqNa3CataqL32FJRLvrG24Tmfa/4TwcEaK8Tmv6jNykB9MX8gJM+FUYqPdTDlac5dwWBuiVoc+WUaheNo7/ZGR2UiiXh2MihRvQKx
X-Gm-Message-State: AOJu0YyMTF5sqLf+wSovqvIjQgX++BDihCy0taviiiPNSE4RQ0TRbmlA
	/PJRRywcDICCfXDQIoWVpTNDpo1HWwbI0PwmgXgedMfIt7rDTp9IcS3Ky9l4FUYY/OYm7EMhlT2
	5bg==
X-Google-Smtp-Source: AGHT+IEvW2bccUqWBEeaPsTnJwBxNY/mUnw/8/lv9jsw5DgwqMPifxEtIyNZjQiEUvn62uClAIUzEpQ2hsE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1007:b0:dc7:48ce:d17f with SMTP id
 w7-20020a056902100700b00dc748ced17fmr187858ybt.10.1708648991200; Thu, 22 Feb
 2024 16:43:11 -0800 (PST)
Date: Thu, 22 Feb 2024 16:42:52 -0800
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223004258.3104051-6-seanjc@google.com>
Subject: [PATCH v9 05/11] KVM: selftests: Add support for protected vm_vaddr_* allocations
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
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_004417_821777_B132B145 
X-CRM114-Status: UNSURE (   9.38  )
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

From: Michael Roth <michael.roth@amd.com>

Test programs may wish to allocate shared vaddrs for things like
sharing memory with the guest. Since protected vms will have their
memory encrypted by default an interface is needed to explicitly
request shared pages.

Implement this by splitting the common code out from vm_vaddr_alloc()
and introducing a new vm_vaddr_alloc_shared().

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerly Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  3 +++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 26 +++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index a82149305349..cb3159af6db3 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -590,6 +590,9 @@ vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_mi
 vm_vaddr_t vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
 vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
 			    enum kvm_mem_region_type type);
+vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
+				 vm_vaddr_t vaddr_min,
+				 enum kvm_mem_region_type type);
 vm_vaddr_t vm_vaddr_alloc_pages(struct kvm_vm *vm, int nr_pages);
 vm_vaddr_t __vm_vaddr_alloc_page(struct kvm_vm *vm,
 				 enum kvm_mem_region_type type);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index ea677aa019ef..e7f4f84f2e68 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1431,15 +1431,17 @@ vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz,
 	return pgidx_start * vm->page_size;
 }
 
-vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
-			    enum kvm_mem_region_type type)
+static vm_vaddr_t ____vm_vaddr_alloc(struct kvm_vm *vm, size_t sz,
+				     vm_vaddr_t vaddr_min,
+				     enum kvm_mem_region_type type,
+				     bool protected)
 {
 	uint64_t pages = (sz >> vm->page_shift) + ((sz % vm->page_size) != 0);
 
 	virt_pgd_alloc(vm);
-	vm_paddr_t paddr = vm_phy_pages_alloc(vm, pages,
-					      KVM_UTIL_MIN_PFN * vm->page_size,
-					      vm->memslots[type]);
+	vm_paddr_t paddr = __vm_phy_pages_alloc(vm, pages,
+						KVM_UTIL_MIN_PFN * vm->page_size,
+						vm->memslots[type], protected);
 
 	/*
 	 * Find an unused range of virtual page addresses of at least
@@ -1459,6 +1461,20 @@ vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
 	return vaddr_start;
 }
 
+vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
+			    enum kvm_mem_region_type type)
+{
+	return ____vm_vaddr_alloc(vm, sz, vaddr_min, type,
+				  vm_arch_has_protected_memory(vm));
+}
+
+vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
+				 vm_vaddr_t vaddr_min,
+				 enum kvm_mem_region_type type)
+{
+	return ____vm_vaddr_alloc(vm, sz, vaddr_min, type, false);
+}
+
 /*
  * VM Virtual Address Allocate
  *
-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
