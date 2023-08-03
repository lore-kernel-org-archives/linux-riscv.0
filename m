Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21BBEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 04:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OO7PahjcsaTIzUG1FBiHhp1pTiCvE7RpDMEcDfa/zDs=; b=T77/exyWzwg4kj
	L+6S19+EqKYg03Ehw5eQVb1/+SSZ0hfWXvBGxC5ii8iNKu30RqxlxRLpYKDP6irfBFCweN8GgscXp
	vQHOQII2Lhoz9QZcSPlGnmfuikuJzdA2+MjLUXgkFpCqEWP+8QmqZfkcHzlNmmgLHqgrgsAozc5ta
	Z+kWkaMULzQjgZIa5ZAi3UtD6NHrRQsOO5BHHDeT1NQ2T6A96z39Rja7Fx0//jL5h0/eCG1lDlF15
	yEI2BeDzz1mGINHeHjtUwr5MCjdLERgATK1Z5OBWBg3wlMy9TgYEVj59QVTlaP7FECzBCksu6uLIp
	iPS+2RI9rlqtA9LhOJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPX0-006aeq-2D;
	Thu, 03 Aug 2023 04:01:46 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPWx-006aeL-1x
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 04:01:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-991c786369cso62341066b.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 21:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691035302; x=1691640102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEjxagX1ha9UkBtXsYKg8a/M1LhAYSchZkCQVHioNKw=;
        b=L6MckNBosanRieexx3Ken0o7OsS27m/H15wUVvReQA0XEvY1kk//LcvLGjQMnMN+/T
         UiCK5U3Vub3KKXvySUk/G354nHszOKE20wKyeZMcnc9Nlmp8RfOlqzD7V9X4F5+1obC0
         nuo+IO3m9MK39HUnN4cwnlT0nkE4ZfsiSMWWBZSvNQ1wbmTXUfpDo3GYupUUnTMdLW+E
         TUoEWxtE8TZDnRIJCzGCWbZ9lSQYiUF05dtO2MLPE5gEZaconQdfyR3H+dQRXiOJFhQG
         1wcx/EDSXwuj+Qb9SGQxjPaqj2lvW6rC+J7EXMszcmEFW1kmvSMovN449LKjdyWbZSOl
         0XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691035302; x=1691640102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEjxagX1ha9UkBtXsYKg8a/M1LhAYSchZkCQVHioNKw=;
        b=XO3ccKw+Une4cHMuyse+CnkC6PznpFz5jgI4enRRHGHKplBU/4wvqhoqh3ClccLEAZ
         KI0YiK2M22Bl6r42pLbAyjlyfwjI9QRxjmlrkoWCqPQqihvNJlZE/VNIb51C6LLOvZDe
         KxBMit3rR4P/aKmVJZR2RunfyfmszJagTG3G4U7y1mNFJukDiETQcem/d0HGZo2FSHkF
         picHtU4zogDwfHv7rxoZhfi5SQ2Lp9gANBQJdcwYY9V+sTOFEemS/lkbExHztwhTcz75
         XKR1MB0oJadJxPdPBGS14w+E4oUMUtoUy6LyrHiPj4HTOvJQDH/7xtE4AWIyL6qF5Gks
         2//Q==
X-Gm-Message-State: ABy/qLYJne6I3fqEvR4/wyL2IWpdN+EfIrnaxi0kRiCQjLaSJty9Bazz
	/gTjMkI3u5XLfY9w74jPjUg=
X-Google-Smtp-Source: APBJJlErJQNEoLPOnJ89zXgzBb6SuF73dvEG2kCU9/luu3iAoGcPo7AdNAHOk463+WRJXksbGRwuVA==
X-Received: by 2002:a17:906:7682:b0:993:ec0b:1a24 with SMTP id o2-20020a170906768200b00993ec0b1a24mr6401251ejm.7.1691035301466;
        Wed, 02 Aug 2023 21:01:41 -0700 (PDT)
Received: from andrea.. (host-82-57-177-142.retail.telecomitalia.it. [82.57.177.142])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709060dc900b0099bc038eb2bsm9851388eji.58.2023.08.02.21.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 21:01:40 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [RFC PATCH] membarrier: riscv: Provide core serializing command
Date: Thu,  3 Aug 2023 06:01:11 +0200
Message-Id: <20230803040111.5101-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_210143_669492_24D08354 
X-CRM114-Status: GOOD (  15.22  )
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

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
---
For the MEMBARRIER maintainers:  RISC-V does not have "core serializing
instructions", meaning that there is no occurence of such a term in the
RISC-V ISA.  The discussion and git history about the SYNC_CORE command
suggested the implementation below: a FENCE.I instruction "synchronizes
the instruction and data streams" [1] on a CPU; in litmus parlance,

  (single-hart test)

  CPU0

  UPDATE text   ;
  FENCE.I       ;
  EXECUTE text  ;  /* <-- will execute the updated/new text */


  (message-passing test)

  CPU0             CPU1

  UPDATE text   |  IF (flag) {     ;
  WMB           |    FENCE.I       ;
  SET flag      |    EXECUTE text  ;  /* execute the new text */
                |  }               ;


  (and many others, including "maybe"s!  ;-) )

How do these remarks resonate with the semantics of "a core serializing
instruction" (to be issued before returning to user-space)?

RISCV maintainers, I'm missing some paths to user-space? (besides xRET)

  Andrea

[1] https://github.com/riscv/riscv-isa-manual/blob/main/src/zifencei.adoc


 .../sched/membarrier-sync-core/arch-support.txt   |  2 +-
 arch/riscv/Kconfig                                |  2 ++
 arch/riscv/include/asm/sync_core.h                | 15 +++++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/sync_core.h

diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
index 23260ca449468..a17117d76e6d8 100644
--- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
+++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
@@ -44,7 +44,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c867..ed7ddaedc692e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -27,6 +27,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API
@@ -35,6 +36,7 @@ config RISCV
 	select ARCH_HAS_SET_MEMORY if MMU
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
+	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_VDSO_DATA
diff --git a/arch/riscv/include/asm/sync_core.h b/arch/riscv/include/asm/sync_core.h
new file mode 100644
index 0000000000000..d3ec6ac47ac9b
--- /dev/null
+++ b/arch/riscv/include/asm/sync_core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_SYNC_CORE_H
+#define _ASM_RISCV_SYNC_CORE_H
+
+/*
+ * Ensure that a core serializing instruction is issued before returning
+ * to user-mode.  RISC-V implements return to user-space through an xRET
+ * instruction, which is not core serializing.
+ */
+static inline void sync_core_before_usermode(void)
+{
+	asm volatile ("fence.i" ::: "memory");
+}
+
+#endif /* _ASM_RISCV_SYNC_CORE_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
