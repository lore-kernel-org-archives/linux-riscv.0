Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F19EE57D7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 22:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e10Tpx9Oe51gvTm+B6+8eSkZNiDwt0ZNwKGhtmpzIhM=; b=0da55xqzzNyVmp
	AIYGY5I7/8EUOvy77gLMq7I/1mklLkRD7+JVlr9FsimMq9GAaJEZtiWJ4D3hQ2+NtBj7EN9QIHWLW
	zoAOKY5ATBWfdUmsehxxweRx1CEqkod2lYkfpTbdBMzwrXaD9EiTcKi7l3jHyre2Y3mngPYEZL2+T
	m4O8wnM61r5Sv6A6odLEynYQHaPje7Tl5qvZBUzDxsb3VPvbPBAQzvcMX2/PXpfDtpZf3Qlhh2UUh
	/WaLjQ8HXzfCiec9C0i0rtNyvJ+o2pKT7AOApCYKM9V3jTwAAnKrLgBDnRLVBNe1UGqiW+q3p864s
	INS4Lri4Nc73NdUaopQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soVOF-0000000B8A8-3hsP;
	Wed, 11 Sep 2024 22:00:43 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soUAo-0000000AxAE-2r45
	for linux-riscv@lists.infradead.org;
	Wed, 11 Sep 2024 20:42:47 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-20535259f94so6635425ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726087365; x=1726692165; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hqBHipBEc9VIgDpl6wbsMWiAPCMzGAxUDsb/VQrQ1Fg=;
        b=cvyiUClLR6a2YfgILlF2MkVXWBh8Lylz2C1hprv2fgPW1TgUBt106yKIrWQ3cr3FLm
         3tfTXjvFeMDtKLRN/BYe7jFmu/kbvtgvlETq7mj5+9tlXHAtB3JxDUxaf/CuAb5Bx710
         /fTkJL838wjYDvXByxZv1G+eEkOA762NvowNW0Eacdwoq1g5gP5SyXlnpb9egb1839Gj
         faBSp5CVkBGKkqfpJIF4ZY4A+ujXOF1jzeuXFXH+5wBTZmuC3cyhXb13Mzkiz6h0//0l
         tJpU3zJUckrC0UKXbXGwsFLiZytdFiOPW0QijTWDQye1n2mAQ0zqzx2HhxSaQmYJEafn
         EfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726087365; x=1726692165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqBHipBEc9VIgDpl6wbsMWiAPCMzGAxUDsb/VQrQ1Fg=;
        b=wsCXtaLZkynYgprKvKMlZiGhmqKzV0gtDggzZebvfHp6NpqNMuOwlJPAdTs2VbyoSJ
         PIrbTe+DJ1xeShHUs1+2K6tpG3c35rYgqiy0Y5Uw3Q+hZincjOJU5PI6faHyZGz+R9CO
         NmSQvfjW1yacjYPkUdYI/4hVv57QbMd0SOYf2JETaUpEb6/L0UEydJtyQebupAdRgK4U
         mpQOe5Tuw0i85MDJ+kXXPxlQZ6TlnGAMO+zZJ+3FWj5R0tt0m+y30nJbDKOOEu9CBkZ0
         gYSDb0CwZONyLx9y07pPqopqfg3L126HThUvOgev9TAz0Hn7CxFpYw7ZraF9lJmHht5K
         IBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Q2KS6Umq3Oab3hAwQ79J7fJN9kwWGut2lwdlWqcpccB8rbIjSP1d+eR6huBWM6o2MhDS0mGXNxyOpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCIa3R9m2y0yiyQM1RxQedvfGxsRytZu8E1uKrkPju9v3dCwyi
	DNyly6Dgu2z6hJbdZvhoAJ8prcH0K8fWq1MmOtXXduJeG9GaZWzfmqG92BnB089o4g9f7l2l4k8
	fAA==
X-Google-Smtp-Source: AGHT+IGFL4zTHrWHCMVM8aBCteHxHmYI7HhRHME2L0vYSDU/f35eVCRnBetmKBLszuGgfMu2jElNurnmeFg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f90b:b0:205:937f:3acb with SMTP id
 d9443c01a7336-2076e4768d5mr74435ad.10.1726087365359; Wed, 11 Sep 2024
 13:42:45 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:41:57 -0700
In-Reply-To: <20240911204158.2034295-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911204158.2034295-13-seanjc@google.com>
Subject: [PATCH v2 12/13] KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_134246_758972_696DF6E6 
X-CRM114-Status: GOOD (  10.47  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 9573ed0e696d..50c3a17418c4 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -27,6 +27,10 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 		GUEST_SYNC(i);
 	}
 
+	for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
+		*((volatile uint64_t *)gpa);
+	GUEST_SYNC(2);
+
 	GUEST_ASSERT(0);
 }
 
@@ -94,6 +98,10 @@ static void *vcpu_worker(void *data)
 	run_vcpu(vcpu, 1);
 	rendezvous_with_boss();
 
+	/* Stage 2, read all of guest memory, which is now read-only. */
+	run_vcpu(vcpu, 2);
+	rendezvous_with_boss();
+
 	return NULL;
 }
 
@@ -174,7 +182,7 @@ int main(int argc, char *argv[])
 	const uint64_t start_gpa = SZ_4G;
 	const int first_slot = 1;
 
-	struct timespec time_start, time_run1, time_reset, time_run2;
+	struct timespec time_start, time_run1, time_reset, time_run2, time_ro;
 	uint64_t max_gpa, gpa, slot_size, max_mem, i;
 	int max_slots, slot, opt, fd;
 	bool hugepages = false;
@@ -278,14 +286,20 @@ int main(int argc, char *argv[])
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
2.46.0.598.g6f2099f65c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
