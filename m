Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C1BC2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 16:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jQKVgoIiqlkru4MLxuGSiKA6YMyWIj32yTAa3ICqnYY=; b=NxUHDcjOB/OG2i
	oc6aSt3wnoEN5I5uQuN1w7/A//DEiLOa5yEIF2LmS0oJsmniasAUD22bQI0KF4gmPdYPylqC/9Jdo
	4UtrJ3lMZBXAUAJ/miGq+ZfED1CNFXLENXppPmnEO4NjvFrkS/07sdhiFmb/Hk79V6NihsmbBwY6l
	BYwHPDy8Lrzq4VFuH4OB/zzuXm9j2T3vDChFWOOoIJ3HDAOpjODuhFSTFQWml2K5XjlVQkBm2qxF1
	kqt5+SrW+DWCNswaAmfrHxO31AOGbNedt8VnRbWv92jVLm8o+Ul4h/DqWq0elw9YQWKVJEMaZXP99
	W6D27j9SVIwoK6lTgk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNERB-0000000ELZJ-1DiE;
	Fri, 28 Jun 2024 16:27:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNER8-0000000ELYl-1NDr
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 16:26:59 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-706627ff48dso624181b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719592017; x=1720196817; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brRQ/jaSotneML2IT6EImsPLrw/XqO202b78nOa1wkU=;
        b=d/3FULYONmRC8Sc6mzMcWL1CIs7U0kUB0KtpBoWSemRKmEJpu05M/izGTJcS0cTHq0
         gOWEFeXFLgNHaVd0++aL6ILFR87ywScb4geycy6YfuJ3XIaL+xvwV3E2nifgweu+B1dU
         Iib58I+elbPQtigfpNCPdwW3FnevrtemWq5vT4H5wlARw8S7lvvhQLBiQjrC3WI1kR25
         3wj+P37/awFpMkiJ6Fc9I3U/eMGzfE+uXr6nt/PYtbANrX6OhFZbRrudC5tUMgAe54vt
         RAG8CFZEoz2gRbWdObe6zSjwgop/slHxAAO9r6NXV38pHTh66H92Xtp0bDFirZbPwUo9
         u/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719592017; x=1720196817;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brRQ/jaSotneML2IT6EImsPLrw/XqO202b78nOa1wkU=;
        b=kiYRXJUle105TMcbWRtjvkSYRAMS5Yu7dGTCS1gSAA0kQG5roLVRhJXWTDwu0GFKPU
         aUwh72Dqm2+RvGKMa84H0wrXo3Y+13b+lUkw8gKe2bY7Kt6dKhQRnFCE/y3XHHU3r4ho
         vG/lNVaRZhTBSkGIAX4j5NqY8HuW4GoOHTq5oPZcLsQnhGakBvVuQpt5UPra36+yPDGW
         6PVk4cHGa6vKp3ga+tAscA0CPhw/y3gv7fNJnxwuQGPHM0Ma8rJugUcYUeWVDaq8T+B4
         B5vB9Rc1Q+FuB9xOC7tLWJ0MkIIC2vA0Ghlpb7BbYvGNWZHdGaYrT4fLnCo9b9caFC40
         YnlA==
X-Gm-Message-State: AOJu0Yy9BqgEOTHtzhO3dJoPKpyoou7Qy9RNJJTQzLp3PMDCFgs6L+UE
	HfBBAjQC8RPIJg/bgt6Lzw59LmDmOqAWXkArjMKY+HzWCgcKl7HY4whTf5dyu4+k5g1rbRT9xco
	C
X-Google-Smtp-Source: AGHT+IEf8FuUY5fwtTIh0sCAujV/7yZT+yOZ0P5CdUNlMqj9i8bgimZ5q3CMytDBPOraVn0kGdHdvQ==
X-Received: by 2002:a05:6a00:3d43:b0:704:2563:5079 with SMTP id d2e1a72fcca58-706746f6a10mr24303576b3a.27.1719592016718;
        Fri, 28 Jun 2024 09:26:56 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080205c688sm1810627b3a.5.2024.06.28.09.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 09:26:56 -0700 (PDT)
Date: Fri, 28 Jun 2024 09:26:56 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Jun 2024 09:26:40 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.10-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e131a037-69c8-423a-929d-e2f03e979ed2@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_092658_545741_1AE5D24C 
X-CRM114-Status: UNSURE (   6.71  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit f2661062f16b2de5d7b6a5c42a9a5c96326b8454:

  Linux 6.10-rc5 (2024-06-23 17:08:54 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc6

for you to fetch changes up to cc2c169e34b4215f73c66a34bd292e9e1fcaa3c9:

  Merge patch "riscv: stacktrace: convert arch_stack_walk() to noinstr" (2024-06-26 07:38:02 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.10-rc6

* A fix for vector load/store instruction decoding, which could result
  in reserved vector element length encodings decoding as valid vector
  instructions.
* Instruction patching now aggressively flushes the local instruction
  cache, to avoid situations where patching functions on the flush path
  results in torn instructions being fetched.
* A fix to prevent the stack walker from showing up as part of traces.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: patch: Flush the icache right after patching to avoid illegal insns

Andy Chiu (1):
      riscv: stacktrace: convert arch_stack_walk() to noinstr

Jesse Taube (1):
      RISC-V: fix vector insn load/store width mask

Palmer Dabbelt (1):
      Merge patch "riscv: stacktrace: convert arch_stack_walk() to noinstr"

 arch/riscv/include/asm/insn.h  |  2 +-
 arch/riscv/kernel/ftrace.c     |  7 ++-----
 arch/riscv/kernel/patch.c      | 26 ++++++++++++++++++--------
 arch/riscv/kernel/stacktrace.c |  2 +-
 4 files changed, 22 insertions(+), 15 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
