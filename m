Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE698CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 07:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KNK6C630+se93h+XYJaiAAVx+wjs4y0LUmp0Ja31KnI=; b=HTSb0gTEmfvARr
	/rHJgk1Mt6O1LYidn7DJetNaqwuqoE0SbNRbdfz4Xam38FRDvspY+pZBE28QTZJjzQ69BW21TlE89
	ultWGC8uJVrwFAfWS9C40saZOEZW4C9h+aQDZokPnoNzYZ4byDCaeSAB9P8srOkyoXBlvAa1rcqyU
	X+daFFXh0n05tbgEJJa1TWLQoFVQ5HiwJw/f+agVsm+gDL6GxsI6qFm5Z21M3BoNt7C31cBZQPiRE
	BHF8ozWd7dxwMfBdJkkkJXxxo31Whjqd80oI2KawhfQ7/OTnKzzDqG3PoYKlkJzQlO4Fs0Ac0Bmth
	Ytc2AJjf1RgouJgEj0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEiW-00000000SoH-2vcK;
	Tue, 19 May 2026 07:18:16 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEiT-00000000Sng-12zt
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 07:18:15 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-133466cf955so11998587c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 00:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779175092; x=1779779892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7y0FJyTHq8D7gcxyr7jUIMKaRAyJaeBHi7Q0uKpFT8=;
        b=e0shMO5BsgYpFy2JH2yLAQybD2aUhFyy1W9bltuigvtnENSZBEXOSbhM+69JlMs4gd
         NbPy6BQoTJVwssTI2Ra/+Y6e4CMhI+pDR13g5bFQ+Zi5Mmo6ZGrRQTQsuX4hH3lklNrE
         ofpSYR+K4bgj0vrxqs1VP+kU6PsstUo4I+ECOP25NkdSZ5f2mV7VovJoJP16YN7qZbkU
         h62znesAPikyKZwrO2/hIN9PJEQQLGwXc84L7KCdvB7CIYGJo9DhnmyqeCWMtlD40oab
         lyJ+GPGUBjYeDcvijZQNKIwv4dk5oykaZS6Q8jhNEfnwo6FrD7PFU/RePxU//cIFOGXD
         gEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175092; x=1779779892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7y0FJyTHq8D7gcxyr7jUIMKaRAyJaeBHi7Q0uKpFT8=;
        b=DQ68rb6xZRQIKo+Gje1ksdykz8/JBuTYQ6Nu9gOBNbNWH/+uh93SvOn+cvp0hzPAS2
         vRz/sdr7CRmUj2TyMm67oCziiUBfbfW7SU+JMGgn1HSJxU4sgDYJoYJEvQhmdKO0vvgb
         lT4DDr6wGWFksaKCLYlMPw9KMQB45s9+T9wFzvV8jlp9V8E5NcIIeT2a3ez83Q/sLRqS
         Ev2KcyUF2rEbSJFERMQV+GYvvMG3MTJeQFTTp4mOxq7kuc3i76sNQEjfC1q7IZZ0ZvKi
         9M+I3XakFdtB2KMo6igJHvDZIY92e0SrxBktzpz98+Y1mAClsKWJRSa3fMIOTO4I+b93
         HgkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/JAQ22tb2x2hFJNj5yCvAEjBtpr2HJO5ZGMMUzgf38vDsXRo4KW8n44ff0APkpOsgalf6pe0TewOQlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YywkeTf4yBzogMQK/m5Q9Na5naR+/Wogbr7FTIj1Dc18o9Q1wGU
	jUlerSY8iqNmhCni8LIHNSeyZoA6obuvpZx0uFU8kBU8wFvxwxhyXHW9VHF2XCQhMotqXPvb/Z5
	uyGXcRK25JA==
X-Gm-Gg: Acq92OGGAgU5xhmrnWzGbzkonUKrSxeUGYoSlz/QTI8HrpnLpIm/dqSv60/ZFmcFfM0
	cZj+KpF538K3JKz26kmSmjlDorCILhTbU6q4gIA6lJehKAz/ODyvE/PDxD2Ycug4yH5gBXrOT6t
	IDHcS7L4B4rrhntyMVtXB4Cav431RyqhoiVHpXKSiljnwF+wFhkNau2ODqAa/V+EGszZG8kcBgH
	QSGUSgeLcdRBGbbAWhUS9J7/bUnoSpZsQ9A3m2o34TsfjWr+8MkrilzafbnXcanCNWv6eleGuGA
	nugfL6PnL1Hb8Xiiy3fQwuQMgpA/zK1BqwBlEY0UM42aVvGg4EZbnHSLXnOGSG2pm6hRmHzMTlS
	V6o7AmsdLmrrn4kIjbr8OKAtvmmmf1lDP+W8FuXz+fmkjv86HdtI5OpZv1R6vxHVfqxe8qt9djV
	k99auHPM3Z5u+h7aBAjdGvN+sVsQc0mckOOiTtDxvdVM1KrA==
X-Received: by 2002:a05:7022:43a4:b0:134:a701:de8 with SMTP id a92af1059eb24-1350441871fmr8092871c88.5.1779175092219;
        Tue, 19 May 2026 00:18:12 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm23368188c88.3.2026.05.19.00.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:18:11 -0700 (PDT)
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
Subject: [PATCH v5] riscv: cif: reduce shadow stack size limit from 4GB to 512MB
Date: Tue, 19 May 2026 00:18:09 -0700
Message-ID: <20260519071809.3823470-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_001813_294753_6322F383 
X-CRM114-Status: GOOD (  13.63  )
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

Changed in v4:
- Fix wrong subject. It is 512MB instead of 2GB

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
