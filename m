Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B87C388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 07:41:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A3EB206A1
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 07:41:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pG8RtFrb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="AJYIQmr+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A3EB206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Dm81wrRVuAsnCqJvyHLxdqDsCrOPN9ipu4fgIWShkQ=; b=pG8RtFrbmkU+rTysYXY5f5z8kq
	kc2x70veHs0IBIrKuZOTCOfm/oCdbkyslZyEXHCf0raX1CfTDO4IImnzlAP274LMk0ASUluHAm7s7
	CmFNzbmPL/g5mnLpM7NvPk2EVg49Y3owEHKwKk2UsFzhJf1MW3LrCKEtmIaX4v59pn+IrM6Kda5vo
	jmBJefGvRofXx0JkhqahxYy/U4oVeFaGH04ZJvs+LFrB4BtuUf12icjFzDHIdY9n6U+shPkgpsdJn
	hELBXNwfnfr2NsPT46fib5iW8o6e6hMP5RLliBxUHOzrbloo5rPUDwqQxkv0/xFTdRc9x1Ue1lPhw
	Kv7i5pcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbIqa-0006eP-2s; Sat, 07 Nov 2020 07:41:16 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbIqX-0006dp-Jm
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 07:41:14 +0000
Received: by mail-pj1-x1043.google.com with SMTP id w7so572651pjy.1
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 23:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=Aj52fNi+6qkhS7kowQN13Bo7Tv7SK9o+ZxNTLM9lCXM=;
 b=AJYIQmr+DjHlfx85x8SwEqe9jZibSh8Q4nTZ2gU2RisyBQzJCtfaUCSEGrsE6YXF+T
 Li1apuSs+Pyg+Y8pjyNCvUgUTXckI9QjmiCnrhc0Lkk4EKQ08FufNLRecan+nUBsuLpO
 AapxciKiwfPXBUnW7kirqen7sm5S8LR2aaSjn+wc0Febdg2iI9kuO3R78r8Y9udvB9f/
 +ahCAyQiE5R2MkGAyE9fT+BxbTh9kPAxuMwq2HnSK2ZpmvQ/81ogWpjahCxs9g0IkxOK
 +HxOTqaWS+GXHalZp8en/BiOtueK5WTU5E2qxwe/M+jBDKcnOwBZ3WKEZLnQ80cBmbT+
 RLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=Aj52fNi+6qkhS7kowQN13Bo7Tv7SK9o+ZxNTLM9lCXM=;
 b=eLMFXmUY7+BZP7+iMLyQCu86PgZ1+az4zHp/jA1yUJf/V7wHG75BTl1RvijrVo836E
 x3/w6ZziSIdiRiS5So3rtgDbpvT3bJmryIOLJ7YLM1vehfpwCl2aY57iGTASgAYW8wYe
 dpu0t3B/M3vOXiCXj6xHqAsw0Nv2aita6gqtCZEpMHHCUOe++I0yFqorj/9y93jjOrsV
 g9wpHNBlO1QTGXdgGljFOkFszN0lIPbbEcyr2+SOzOg183k2H3+KGu8yOgUE+JQTL+Ny
 X4gsEPDCjyz2hIYpLdFyHaK97A806luXYagmj0g4c1NtfCGQokWk7hwIYUIZ9pF2u7k1
 g9OQ==
X-Gm-Message-State: AOAM53070PFYvwjIPYR7koWtkFfrxe5sDnNcaS6nBcFD58trLM8r9o+m
 np1cAcV3zsgfOn/J9RlEeaR/YjIVFVCsDg==
X-Google-Smtp-Source: ABdhPJyO7FhNpvfOl8UtSFGhcRQbIwhjpnT16iiwvxMvOsq87oRipgIWzN6N8NJlf41nOC4LHNbVXQ==
X-Received: by 2002:a17:90a:ca91:: with SMTP id
 y17mr3154280pjt.205.1604734869258; 
 Fri, 06 Nov 2020 23:41:09 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v24sm4739929pjh.19.2020.11.06.23.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 23:41:08 -0800 (PST)
Date: Fri, 06 Nov 2020 23:41:08 -0800 (PST)
X-Google-Original-Date: Fri, 06 Nov 2020 23:41:04 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.10-rc3
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-3492671f-a069-445d-a6d8-89363714a1fb@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_024113_785126_9688DCE7 
X-CRM114-Status: GOOD (  13.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-rc3

for you to fetch changes up to c2c81bb2f69138f902e1a58d3bef6ad97fb8a92c:

  RISC-V: Fix the VDSO symbol generaton for binutils-2.35+ (2020-11-06 00:03:48 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.10-rc3

* An SPDX comment style fix.
* A fix to ignore memory that is unusable.
* A fix to avoid setting a kernel text offset for the !MMU kernels, where
  skipping the first page of memory is both unnecessary and costly.
* A fix to avoid passing the flag bits in satp to pfn_to_virt().
* A fix to __put_kernel_nofault, where we had the arguments to
  __put_user_nocheck reversed.
* A workaround for a bug in the FU540 to avoid triggering PMP issues during
  early boot.
* A change to how we pull symbols out of the vDSO.  The old mechanism was
  removed from binutils-2.35 (and has been backported to Debian's 2.34).

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Use non-PGD mappings for early DTB access

Atish Patra (1):
      RISC-V: Remove any memblock representing unusable memory area

Changbin Du (1):
      riscv: uaccess: fix __put_kernel_nofault()

Liu Shaohua (1):
      riscv: fix pfn_to_virt err in do_page_fault().

Palmer Dabbelt (1):
      RISC-V: Fix the VDSO symbol generaton for binutils-2.35+

Ryan Kosta (1):
      risc-v: kernel: ftrace: Fixes improper SPDX comment style

Sean Anderson (1):
      riscv: Set text_offset correctly for M-Mode

 arch/riscv/include/asm/uaccess.h  |  2 +-
 arch/riscv/kernel/ftrace.c        |  2 +-
 arch/riscv/kernel/head.S          |  5 +++++
 arch/riscv/kernel/vdso/.gitignore |  1 +
 arch/riscv/kernel/vdso/Makefile   | 18 +++++++++---------
 arch/riscv/kernel/vdso/so2s.sh    |  6 ++++++
 arch/riscv/mm/fault.c             |  4 +++-
 arch/riscv/mm/init.c              | 32 +++++++++++++++++++++-----------
 8 files changed, 47 insertions(+), 23 deletions(-)
 create mode 100755 arch/riscv/kernel/vdso/so2s.sh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
