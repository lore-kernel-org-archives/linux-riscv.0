Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F88E77184
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 01:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vnBescrLubjcRPYc3epmChiAW0s6bG0tBhV9UPfb/Q=; b=HQdQTZaKyq4ryH
	eXQcGZFphdFLiyD87B8GcR9CkOq6+ciFFl4phqC26+MZPDmBAlfxcwDdv+puy4XE/rVhvMhrnD+9e
	rQ6e0dVJ0MVTGzifZgfxB4ded3Us93jMxb+KeEtKpmnro05RRhwQx/m0MADosu2DvqDIHIppcySCn
	6Ac+5sv38/8RL6PCd3uBpvAOpjfWadkgfFPJ5hwyNW67mtEFKwISvdx2xfi6Smg0nGofrlUleJRGC
	JDLR/ZC7nGjZBfoDt9teq4IV2Xgpz8u0XYpmZWoXvEN1kK9UTBpnAIJg6kpY1v1AggjtMHzTPx7RH
	1jBIVnSC9kA8LTyr/hvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS5h-00000003f5k-3kxv;
	Fri, 20 Dec 2024 01:46:09 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORz6-00000003d1k-0Q2M
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:21 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-725e3c6ad0dso1981450b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2024 17:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658759; x=1735263559; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=;
        b=Q0NYNkhVl8uJafBlK5AwmQ/zoSH3tzP5RV7UEAqrkWuTOyk9vpEIsBRT6ydbUhRlgq
         7F0Rsu66y/CVxt0ICQSosYlEbi9FdcYNPZJzsz8Zkjcb7QbrOvJvonA4k8hC4pLUDgK8
         tXtyctYQVRYuqnchCVY+V+pv5z+mLVVeGSsnsJwRKjc5okI/wyc9GL9wcAyoFGmPaN1t
         DyVJ0yBfRplSt8jEjJKXuViQnrtTvUC+9jp6hL3VeUADcRF21+F4GjcP/Lc+gZ64FCP8
         WDuOuBEgkaId2uAAx1w2GJdI8600vExiC3qgx6DJTLQz4KgxVFiTBObxJQC6qPtU2cOO
         kIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658759; x=1735263559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9d0sb2aXj7DAHSi3NyOXr17347erebt+0rHoY2hViJM=;
        b=DPm3mfwWny3BVmaCYwnOSML/nyUHAvezmc3zwCkBiWRYFs5NUe8QQvZ2rSt/WcGdGZ
         8hsYgAgoSLxAYf6o336iVq7EQci95BDPu8O87tBWVn3rfBre3tjT+WflLbV/cusPPp4D
         2hyvSU5NeHEXmm/0zDdVbopSXfr9qOpP9IXhq3IO6S3JW26Kt269DFZgKZJ/6iOIjNum
         VNud9aDi1d2jDhZUwXKbnQaVMgnAG2muz1ZPG/l24/2G87TAMVjM+dDpkmNJ72Ko6BoI
         rESx2LADA2au4Et3lr0yoek2I3AGtEhvjOgnbhXuUaY1n0dhL9xiJGbvL4LFFzUBPZmy
         yLmA==
X-Forwarded-Encrypted: i=1; AJvYcCV15+I/dRnjg5i9uab/Zdkyx/waR5pSfNpfFzSfahJp/OXGmSzZaoQrevHirufX6Nu0LwPGHXuZo+wwWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMDJfxGEyY3CyoYZa34dCPYKXKvfaYkk7XV5S6r/psLl0PsmL4
	vMOdwSNE3x3htdIWuukPjTWPH5cXpB0BN6Qw8BVXDiUYv0aVCkj5GqxlAkpMqoyLvVj70Qccfnp
	EHA==
X-Google-Smtp-Source: AGHT+IFCVSOEBNw3Lv/7iuAoV97N3pDi0VWzw4l+AQLpoLja8FzKhTyc8mSa5fPmEkzN6L6pcIM/EKjTQ3o=
X-Received: from pfbby5.prod.google.com ([2002:a05:6a00:4005:b0:725:e39e:1055])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc2:b0:71e:4cff:2654
 with SMTP id d2e1a72fcca58-72abdd6eb8cmr1219933b3a.6.1734658759224; Thu, 19
 Dec 2024 17:39:19 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:04 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-7-seanjc@google.com>
Subject: [PATCH 6/8] KVM: selftests: Get VM's binary stats FD when opening VM
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
X-CRM114-CacheID: sfid-20241219_173920_137778_AF37036C 
X-CRM114-Status: GOOD (  11.47  )
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

Get and cache a VM's binary stats FD when the VM is opened, as opposed to
waiting until the stats are first used.  Opening the stats FD outside of
__vm_get_stat() will allow converting it to a scope-agnostic helper.

Note, this doesn't interfere with kvm_binary_stats_test's testcase that
verifies a stats FD can be used after its own VM's FD is closed, as the
cached FD is also closed during kvm_vm_free().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index c88f5e7871f7..16ee03e76d66 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -196,6 +196,11 @@ static void vm_open(struct kvm_vm *vm)
 
 	vm->fd = __kvm_ioctl(vm->kvm_fd, KVM_CREATE_VM, (void *)vm->type);
 	TEST_ASSERT(vm->fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm->fd));
+
+	if (kvm_has_cap(KVM_CAP_BINARY_STATS_FD))
+		vm->stats.fd = vm_get_stats_fd(vm);
+	else
+		vm->stats.fd = -1;
 }
 
 const char *vm_guest_mode_string(uint32_t i)
@@ -661,14 +666,17 @@ static void kvm_stats_release(struct kvm_binary_stats *stats)
 {
 	int ret;
 
-	if (!stats->desc)
+	if (stats->fd < 0)
 		return;
 
-	free(stats->desc);
-	stats->desc = NULL;
+	if (stats->desc) {
+		free(stats->desc);
+		stats->desc = NULL;
+	}
 
 	ret = close(stats->fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+	stats->fd = -1;
 }
 
 __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
@@ -2231,7 +2239,6 @@ void __vm_get_stat(struct kvm_vm *vm, const char *name, uint64_t *data,
 	int i;
 
 	if (!stats->desc) {
-		stats->fd = vm_get_stats_fd(vm);
 		read_stats_header(stats->fd, &stats->header);
 		stats->desc = read_stats_descriptors(stats->fd, &stats->header);
 	}
-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
