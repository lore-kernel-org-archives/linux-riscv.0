Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1209FCD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 07:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0sUSkZQ0AtSJ/3yE8iradDYcOXem4pd9hmkHBfOp0hs=; b=Ibe9KZwq+BqgeE
	ofg0err0jvaYhcxnrJOs5Eoz3a7S6O+Duew4Fb9L5Hmg482Hm1lhcYLjCV7Oa4SMQauTPNHUdkQWU
	gQY3aqwSiQ5PzAmwCSfsduWe7jfWiQ8WmRYn7xamnARcxIZM9KAMOPt426p6YOWAfhlfPas4hpmVp
	UmBfGibDzQC1pwFITjrgrGiO0Kvk2PfITalOoJoeyJCU4FS0jIMoW/02JrqnUiQuTpQ/DTbSsXhPE
	UuVhRvD35H1lH6O2R2wtZQsUflV9ZNCZWRhJUbaC/jNKHKuZJShAz5gSY7zdRru6v0C7NSHEW/A47
	oWMXCQdESp1KD5f7JN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQqB-00000004rqB-1Je9;
	Thu, 14 May 2026 07:50:43 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQq8-00000004rpT-3w2l
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 07:50:42 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2f7020a928eso10730389eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 00:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778745040; x=1779349840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDKYjZJg/Bo3EjMAid7K8WutRS/dE3g6XX4B3GZEcbo=;
        b=UUNMowA4AFaWys0pRj8ulRg/pe30TeUdvwBf2j4rjSt1v/D/DjnH7U6RtSJlFxa3tb
         9DfxBBMd0K0fCZzcOsh7vOZQMR9xPJ9p9s8GcnbqctvuGyXaWwYd64IWuq3CqfZLF0zx
         X2ZDv1kObCy3lunTQn29YkGK7ENv77r6enutdqH6uYtvrWB89SvePuVXcV1qRyBV8cYC
         Nqfvsv8pHBJxNOkZIJbgu7o1G/DfGM1MxMs4Obqln439Cv0MTHZHy8bLDVROA4F0VkX5
         Tp6RkV7xaRoMx7UuvCPcd+AzUmOTjURcIO1E2j+xo06tC+N6SUw2377Y1FWIAs5CxxwX
         iK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778745040; x=1779349840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDKYjZJg/Bo3EjMAid7K8WutRS/dE3g6XX4B3GZEcbo=;
        b=BFulaLhwinPf07JI5DHu+VNJvZzj9ZULFaEEbKJMNPY2KJQaQAqFkU7YGyu3mxK0N2
         rIYN/k1mYMRd7KImXpCMYTVNJCKf5yhjpjbQs9L/GSmnZaMWC6leruyb0FPghit4UEfu
         fLQVECP4LW5zF0mMVEomK8cqNOklN7LdYKV83XVATBJf25yKcWInaW+YHj/LHubNTzSG
         CrMzqWmuJ6VpFvTjEmxTC1P8qOIaNMUKN83K0axwMv/E1zlqhWw/0AnwaaKVAv04V2ti
         vBeTfByNGFzfpRDCbvlN1noEaiFlE6GMfbrpq0CtJJdyAwbxYpVWAWsMMcQyJlHkt5PG
         HKNg==
X-Forwarded-Encrypted: i=1; AFNElJ/8AMWIn933hDlOcYgvRv8/sP7L2ph+PDvwqqvS6MWVpEBYDYu9bigxdeG1tQH9X/oR9qBigQUexp88Ow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxg/37o2hUOLZpfzRc1jq3mcKxH/O8rcdCc/U8vm+hiZ8OPnnb
	4EePG2V298sftkEapN39E5d4QtKLUhcOYXafkMuwwN0uEt7zQLzOiutJNoMQBsTwOt0=
X-Gm-Gg: Acq92OH5S6cGo6zEiLJOWjch3HzOYDeZnuYrsOEe/iWYo80E5tyuPHl2HpwknDkbwzW
	5FE/pKOWsyUKTUa49KmaOrSV7vEokqmSsBTYYya0YHRaKhuGOvGgVWfXn7Jx6jqN9pv1NLjb1wR
	yK7F26GV0cgmYvsMjn2sq1bvvrDgaVBhkhLB85PZ787lKJltmnFU4PLWQ24Q968d4SbPFaPar3R
	+4EXCSRbyyP4WQKvHv9EfB41njblwkOSqATdp4vIDVwCGKFyCx5NA4NbUPdQ6i0ye+3/b/XpGIN
	Ikjxn+HEj/s8UIVZHaP83NxFyU1jPB9Y8mY5dHLVnr94jtJP4/BpMPgodGDQY3n+SKHHRlusQ9B
	7qw1ZKGnJaQMccMEt8yjgAX5P5zd/8eznY2cJMPvYjYMJDQKLYJitq6N/LleAgQ7JtitBxrjq3c
	VaxVcfQrHTt99FT6d+/Tu2LEDzoodR1GTcSVsMdtEV2CUBGQ==
X-Received: by 2002:a05:7301:2901:b0:2f1:496c:94d4 with SMTP id 5a478bee46e88-30117c736aemr3622831eec.4.1778745039815;
        Thu, 14 May 2026 00:50:39 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea78sm2090985eec.6.2026.05.14.00.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 00:50:39 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
Date: Thu, 14 May 2026 00:50:35 -0700
Message-ID: <20260514075036.1432352-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_005041_078923_85A7DB30 
X-CRM114-Status: GOOD (  12.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Follow the ARM64 GCS (Guarded Control Stack) implementation approach
by reducing the shadow stack size allocation from min(RLIMIT_STACK, 4GB)
to min(RLIMIT_STACK/2, 2GB). see commit '506496bcbb42 "arm64/gcs: Ensure
that new threads have a GCS")'

Rationale:

1. Shadow stacks only store return addresses (8 bytes per entry), not
   local variables, function parameters, or saved registers. A 2GB
   shadow stack is far more than sufficient for any practical
   application, even with extremely deep recursion. Using half the size
   maintains adequate while being more resource-efficient margin

2. On memory-constrained systems (e.g., platforms with only 4GB of
   physical memory, which is a common configuration), allocating 4GB
   of virtual address space for shadow stack per process/thread can
   lead to virtual memory allocation failures when the overcommit mode
   is set to OVERCOMMIT_GUESS or OVERCOMMIT_NEVER:
   Error: "__vm_enough_memory: not enough memory for the allocation"

This reduces virtual address space consumption by 50% while maintaining
more than adequate space for return address storage.

Additionally, add max(PAGE_SIZE, size) constraint, which covers the
case where RLIMIT_STACK is smaller than PAGE_SIZE.

Signed-off-by: Zong Li <zong.li@sifive.com>
---

Changed in v2:
- Add max() in case RLIMIT_STACK is smaller than PAGE_SIZE. Suggested by
  Paul Walmsley and Sashiko

Changed in v1:
- Use min() instead of min_t(). Suggested by David Laight

 arch/riscv/kernel/usercfi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 6eaa0d94fdfe..0f75e8f5d0ec 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -109,15 +109,17 @@ void set_indir_lp_lock(struct task_struct *task, bool lock)
 	task->thread_info.user_cfi_state.ufcfi_locked = lock;
 }
 /*
- * If size is 0, then to be compatible with regular stack we want it to be as big as
- * regular stack. Else PAGE_ALIGN it and return back
+ * The shadow stack only stores the return address and not any variables
+ * 2G should be more than sufficient for most applications.
  */
 static unsigned long calc_shstk_size(unsigned long size)
 {
 	if (size)
 		return PAGE_ALIGN(size);
 
-	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G));
+	size = PAGE_ALIGN(min(rlimit(RLIMIT_STACK) / 2, SZ_2G));
+
+	return max(PAGE_SIZE, size);
 }
 
 /*
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
