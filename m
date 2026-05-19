Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72964CD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5UYGGEk25RtrXwTVD7uBz0mip8JAJ4mOl8xDGzrPqD0=; b=ihOL38lHAHUdYn
	w+WHmV1NEjgl7jzaIS5n+YwXmIQwMchUyD5FuO2TM22DPbq5XE8019FQAI49UuGcZhIPXrf/2F6sh
	a4cZHH67O+cR5Bt6hXuCsur9a400XhdUv2VH5OBF+Dm/+DUYRR4nT94UGM3bB0R6k+hA0XRpWXDBI
	m77R2kj87Zt3oJFYF0i/FpwFFa0NE7qqeCuxaTLBz+HFRkzBxqudrBapkPNNtPax4hsS0HefciKIE
	T9bkElJ9V1RVBZHcVDJGjFvl5tO9c4AtyFn4XU5tOSC/LF9VFIP8PNiaROFL6CecuW/s6677iZhvV
	ZdGSRUmLTFrg7X5xsWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEe3-00000000S0Z-3Qs7;
	Tue, 19 May 2026 07:13:39 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEe1-00000000Rzw-0093
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 07:13:38 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2c156c4a9efso4123953eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 00:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779174816; x=1779779616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/v832jg02T0+h3BQvkKwAzJW+pkS6A9rgEMY10zaHwM=;
        b=jtgZSoq24hvQr6e5oVlM6a8A/wP/KtEWEp4yUwdgD3kZZYP6NWHQLuNnGce9O+aFoF
         gQlfZFV/HqqEeitc5E0jT1pK1OlKsfJc9srqzGaAH01auGQI4CITWwfFREntRLwTluJM
         K8JEyjCLiGGWCTsx1FZIuBTTKQZKQHRVUdGnEw6zEQaLGFwl9rNKNrbepD5ePsvZH08O
         pDaRo46hwawMKqNfXmtKllk+EELTi/v2sW90edNUPG0vupKPWwAV9bfCphkG9APSO38x
         1Go16SMibnYqHOVBalMI/bg1KThUA7NgId2zn0ng/Jk6lEJ5wINAeyWlWLxe+msoGDpQ
         dzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174816; x=1779779616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v832jg02T0+h3BQvkKwAzJW+pkS6A9rgEMY10zaHwM=;
        b=E5bYzauf9aQTyyEbBrIUj0aj6YQ/bHrfS9JArCQcBdOsNHk2hvrDHKRnU2G0na1aIc
         uck8HC/2lBfPdC2FVcqZ1BesaPW05N/j/qvucjvy7da56fXwSLjxYl+VToUrSRBoKy0j
         dh11wnzkpdcGhrzQ6HxHnMEmLaT4m4X46/C94kmGFbcvzIkGjAVi1G2pCWGXSQVV0DGV
         WEmxDNxP1/Hvk5+nIOs7g+cZGXiCYjOi3gNw7w0TPpb2Omso5EJQxka2VkhCgFsmaKUB
         MtNwxTnsp6TwPAm06xvpLfav6xQeLhqlrCWwH066hJju445bnlgMbtVFGK2CfFfIjEDk
         tNXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9adKzQ9GAfxR2AUmDYmOdzWXxA/302zp9rDd6ulPg+CfUkOSXEYdAZ6o7vW4n8YOlNhvwt1jgkZrnfRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc1j2+gDoLmR7DENMtR1bJgVWKNUpaGga9CnqKc2SqJx92ayZx
	H+jtmF7yslsWSTx4DNvSS7Ob3rb+K3Bcv7axHVEiSgiRh+LijfsmAIKaI3w0Q4xtPKQ=
X-Gm-Gg: Acq92OFBVfcOqJjwgCuNCLj10Yoi6+U5MIh0PGN4TNUFKEPYlI1WyIruuyNWC+Q2QHX
	M+qFGy9Msf4dbbf1uWG8m01TPozL6XaV8OdjmAQaSPNHjjptcNbZv62iov8k887Pea+VapFDf9Q
	5NjALPmiZX70N8/qUHz3RjMDsR3K9lecIsuqskraVgUtO3KJ8PKbzxYitqA817a3M9VJ0OH69XK
	QHjz6xKWBZKBH4MgQuBPSBfwTZPB7tJu0Q/BXHn3QuvYO8hpfRemQ1MC4wyk3Mapv5z+vF80ub4
	8UpBZ84tVaATqrQBd/liWua5wslWQGsQ6G7gkax94w8pRXue7fnbAJ5rNxW/XzlMMnO3WOJdNLN
	5/JkHj4kB2gR7FTN8WyKaPQukQVw0qVAmu8NvEO/YMxuJtXBoB5IoK+er3HB9/7EwMPJI2KhDtU
	qCASHxMHJ17KXoJhXDx4owvEQaWH7qDbWDNl68EQV2W+cBTg==
X-Received: by 2002:a05:7300:2152:b0:2f2:b544:2fca with SMTP id 5a478bee46e88-303986950a4mr8945348eec.33.1779174816039;
        Tue, 19 May 2026 00:13:36 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302977a9474sm15631673eec.25.2026.05.19.00.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:13:35 -0700 (PDT)
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
Date: Tue, 19 May 2026 00:13:33 -0700
Message-ID: <20260519071333.3820429-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_001337_040510_470EFA38 
X-CRM114-Status: GOOD (  13.29  )
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

Rationale:

1. Shadow stacks only store return addresses (8 bytes per entry), not
   local variables, function parameters, or saved registers. A 512MB
   shadow stack is far more than sufficient for any practical
   application, even with extremely deep recursion. This size
   maintains adequate while being more resource-efficient margin

2. On memory-constrained systems (e.g., platforms with only 4GB of
   physical memory, which is a common configuration), allocating 4GB
   of virtual address space for shadow stack per process/thread can
   lead to virtual memory allocation failures when the overcommit mode
   is set to OVERCOMMIT_GUESS or OVERCOMMIT_NEVER:
   Error: "__vm_enough_memory: not enough memory for the allocation"

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---

Changed in v3:
- Remove max(). PAGE_ALIGN() already rounds up
- Change stack size to RLIMIT_STACK/8 with SZ_512M cap. Suggested by David Laight

Changed in v2:
- Add max() in case RLIMIT_STACK is smaller than PAGE_SIZE. Suggested by
  Paul Walmsley and Sashiko

Changed in v1:
- Use min() instead of min_t(). Suggested by David Laight

 arch/riscv/kernel/usercfi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 6eaa0d94fdfe..2036918a77db 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -109,15 +109,15 @@ void set_indir_lp_lock(struct task_struct *task, bool lock)
 	task->thread_info.user_cfi_state.ufcfi_locked = lock;
 }
 /*
- * If size is 0, then to be compatible with regular stack we want it to be as big as
- * regular stack. Else PAGE_ALIGN it and return back
+ * The shadow stack only stores the return address and not any variables
+ * 512M should be more than sufficient for most applications.
  */
 static unsigned long calc_shstk_size(unsigned long size)
 {
 	if (size)
 		return PAGE_ALIGN(size);
 
-	return PAGE_ALIGN(min_t(unsigned long long, rlimit(RLIMIT_STACK), SZ_4G));
+	return PAGE_ALIGN(min(rlimit(RLIMIT_STACK) / 8, SZ_512M));
 }
 
 /*
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
