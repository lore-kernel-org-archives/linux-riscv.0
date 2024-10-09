Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175C8CEE326
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlierwfQZkEwi6pcot84/vJrpuPWfOvoop79xlg1k3w=; b=qi0KyIrPh5eqJh
	dwstOz9J1xI46m4IhJ6JC85Ek1PdBYjJ5Dk4/KSmCXEFGRikKlSFD7F3oX7x6orVNUCrq1/+wZryq
	KLpE6u0UJ5A+gGLz22wAXivPJBFmiOTEkaPj+fh4imRQMI01m1IS/Hq5fEqGFF1GuRN7sO44UCrqT
	MZ8joJIGjbtD1ABGAMQrDfAXwGrnjGP1JRCSZc6/A9UBakyAC6Tb60x8QM41er9twBZcG3Ymn5xl8
	OofSfXJhf21NwXFK+0QJMgmwge0IL2lj/EkoFhhBx5d+zmXbf3SxjAJnIoyd5QsejmTcCjBLkddWE
	xs8dDBiENRObrXrGZqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZGN-00000009szz-3T1V;
	Wed, 09 Oct 2024 16:10:11 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYxE-00000009oFn-1mOi
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:25 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7e9b2d75d6dso5319268a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489023; x=1729093823; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EGuxTu/doK/WQ641h0uZhH1HM6LHjGgjZS75tNbw6SU=;
        b=iwb9EdFFySSuLf0USm+3X7FdBCzO6t4jXcJaBkkls/dV3S+trgbQ/zCwbS+SfkQzXR
         nceGp18l6xNVFjwEZxQ8/CXEjdd+sqgfAOb6kaAxUUJrrVMMJqD5gQ4a7A7X1R6tsNHW
         TWJSC8N4mHR8ImpIvEwquskOCHp4d2B0MmBAh2YiZyBVPOblXpbGErVlNk2oImq64VTe
         zyIQBoyvmwyXCawjEqTHtKX7fUfQSwWk01bKwhLZSxhrUYKMw2yxFw5VAIpRJbyUQZHo
         ol45pxlnBQ/go/frGovgtcuvBNB4Gj9SAEYuZd9q6dswyw09sd9mExF8wvOVF+KSamj7
         Z9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489023; x=1729093823;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGuxTu/doK/WQ641h0uZhH1HM6LHjGgjZS75tNbw6SU=;
        b=ETsvI8+ofHC7GlNZ/hYAPtgfYnmngCZ5VmsB0eIhWmiaafz8NgpQkKlCj/Z2aXl0eh
         Jgj4WyfDMgGXXXrnTyXialDdtc/SYZDgUERBMXSPR6HobB2aoEzCeGEyCy4GxO/t07CA
         SKvcFjyQCviRFEDYmEe/aV5Qsb+WbUA3J3xuySm8fpnOHFbLX1sjfj4L+WniwtukIvHm
         Tmh4ckvAteJjG+0ET6GfC3Rkmva9e4eYB3gm6a7wJ3+rXu+ulXPJBNnFmjN1dO70LC+Q
         Be1cD5m5nsyy3xC0+s40lJ2dLpSWuq3YEFGXhUva4jGpnpYB8g3uLdCTKkogUX2MSRzc
         mWIA==
X-Forwarded-Encrypted: i=1; AJvYcCXGK8GNjlj5FBkZPSFZxO++WLgV1YOwTqQgPlz75wlQonW44yyx21el9EbQqvL7w9c3vNVHVCCvAnthYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBp08SNYEvukX9YuEyuuWjgwc6C6tv88W9RO6Sy7dh3r6ko4wS
	Aob4IaMTDzgvoLbaF0OEyjiVMAR3Zz0Aitv3RBb4ZlGA16DJYWMGW5qwUHeNWc8RPAD2LpVpDCN
	/rQ==
X-Google-Smtp-Source: AGHT+IG8czWnoykzOejAJo4GJw9hcMcaR/sDDZx+5vRUFyaEmI5qH9Oe9i56gZjLIllNwEPwjpmEWoICf38=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:704c:0:b0:7cd:8363:9f29 with SMTP id
 41be03b00d2f7-7ea320345ffmr3164a12.2.1728489022361; Wed, 09 Oct 2024 08:50:22
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:52 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-14-seanjc@google.com>
Subject: [PATCH v3 13/14] KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085024_526555_2B2695E5 
X-CRM114-Status: GOOD (  10.53  )
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

Add a third phase of mmu_stress_test to verify that mprotect()ing guest
memory to make it read-only doesn't cause explosions, e.g. to verify KVM
correctly handles the resulting mmu_notifier invalidations.

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index c6bf18cb7c89..0918fade9267 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -28,6 +28,10 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 		GUEST_SYNC(i);
 	}
 
+	for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
+		*((volatile uint64_t *)gpa);
+	GUEST_SYNC(2);
+
 	GUEST_ASSERT(0);
 }
 
@@ -95,6 +99,10 @@ static void *vcpu_worker(void *data)
 	run_vcpu(vcpu, 1);
 	rendezvous_with_boss();
 
+	/* Stage 2, read all of guest memory, which is now read-only. */
+	run_vcpu(vcpu, 2);
+	rendezvous_with_boss();
+
 	return NULL;
 }
 
@@ -175,7 +183,7 @@ int main(int argc, char *argv[])
 	const uint64_t start_gpa = SZ_4G;
 	const int first_slot = 1;
 
-	struct timespec time_start, time_run1, time_reset, time_run2;
+	struct timespec time_start, time_run1, time_reset, time_run2, time_ro;
 	uint64_t max_gpa, gpa, slot_size, max_mem, i;
 	int max_slots, slot, opt, fd;
 	bool hugepages = false;
@@ -279,14 +287,20 @@ int main(int argc, char *argv[])
 	rendezvous_with_vcpus(&time_reset, "reset");
 	rendezvous_with_vcpus(&time_run2, "run 2");
 
+	mprotect(mem, slot_size, PROT_READ);
+	rendezvous_with_vcpus(&time_ro, "mprotect RO");
+
+	time_ro    = timespec_sub(time_ro,     time_run2);
 	time_run2  = timespec_sub(time_run2,   time_reset);
-	time_reset = timespec_sub(time_reset, time_run1);
+	time_reset = timespec_sub(time_reset,  time_run1);
 	time_run1  = timespec_sub(time_run1,   time_start);
 
-	pr_info("run1 = %ld.%.9lds, reset = %ld.%.9lds, run2 =  %ld.%.9lds\n",
+	pr_info("run1 = %ld.%.9lds, reset = %ld.%.9lds, run2 = %ld.%.9lds, "
+		"ro = %ld.%.9lds\n",
 		time_run1.tv_sec, time_run1.tv_nsec,
 		time_reset.tv_sec, time_reset.tv_nsec,
-		time_run2.tv_sec, time_run2.tv_nsec);
+		time_run2.tv_sec, time_run2.tv_nsec,
+		time_ro.tv_sec, time_ro.tv_nsec);
 
 	/*
 	 * Delete even numbered slots (arbitrary) and unmap the first half of
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
