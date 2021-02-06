Return-Path: <SRS0=2LT1=HI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9DFC433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 19:39:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EDAD64E64
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 19:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EDAD64E64
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VUIs+qep+LgsLFgewdpSdFh7NNjjdHB6Ftm5Mx9LDcQ=; b=l/mL48N0TylcGJSjY9DA2az/h1
	IWP9gxJbuvpJGZul3kSPWljBIO514Rdnk4EHUQM5ERmppHfiawCKTWZ18CaOmgu6WRGr+g8lRNDiC
	KlpETXcuURdzP86sCLtJz6cLt8GIzc4YwehItEY0NgKNU0T1Ns3dRS7zgbqGAIGYJzfmOcqsXqh/z
	dzsfM/uMXdIwKrUPdrWHwchH41l5Zk3/agIvuPLa4O1SkhwUGjXoCA/SZUDIVFEu6WLehq4yhGzyJ
	6sg8afJzsrssorQrHMRiH4qV50LmWTiXhzZOvaRIKhSXscGS1PBk3eBSFtduum+wb5MnZDn3VZFUH
	K+b9puLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8TQ9-00070j-8H; Sat, 06 Feb 2021 19:39:05 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8TQ5-00070C-SY
 for linux-riscv@lists.infradead.org; Sat, 06 Feb 2021 19:39:03 +0000
Received: by mail-pj1-x1031.google.com with SMTP id fa16so4992104pjb.1
 for <linux-riscv@lists.infradead.org>; Sat, 06 Feb 2021 11:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=7BXX/4Me98TVm3aHXjBwYhyDEkhhQPgOFfGzdq2Cjnw=;
 b=bfkdVqO+z3QvLShD/21Y6pJq9xJSVPH2xzVgSYj91jQKpRuzBtLYp4ESeqreJyBknz
 InprVmPcxuVBCTQa2Z6JzOXr/j4O8qI/9a2JhUNuRXMt3TiT+xUYIxeAWGVhoSGvvTY8
 bxHkFAA7vA/SqOXswoZ8rFG8A6hPpa8pKzJs58mo0dnttP7scHCcFGcoqlxfeXjbXdlU
 8PcaVaDZMEbQlyY/yq+pVpbJdKXt3MOqcjsY33tV6Ww8lWLCz8vQ1aaLYvMQW7zc8VDX
 m0lp3YCq/h+OtzKImSnm65KA99o0Q8coDOfBFSwkskVz+cVBMfOSceQmZbNgeshvJJ5R
 hg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=7BXX/4Me98TVm3aHXjBwYhyDEkhhQPgOFfGzdq2Cjnw=;
 b=tuTLY+awI+Qxno5MlsdiZC+g4OlUjPdTNamLJ9RN5p+F7yXH16R6N4c59t0R3r023c
 y+n2+MgpOB/m6YN45kTMYRrTJDQWhXkVTU46Y9B4FoGmLwiKpWS4j2rj2wORKcwAAvAm
 j64mr+FoED3LbQmtXadd2Irh2fS1HOflvQDOtz1V46SIncY0EbwrVZxYJFhnl7FMuM0S
 +jelFvrp1eFdLYWNm+NNSA+7ZRaaotDsGdoazW5lnvi/4lqKbFWgF96pE91LXu2WHb8j
 /KubAw7yrTNrue1qsufNGd/ILcfYhnAUfO3GyBOSYpaH8MDDmLVhb8vvFn0Revs4P3zl
 5Yxw==
X-Gm-Message-State: AOAM532lddl+GFUxkiIcXAazMsSb/cwcFXrh5vKRGXGmjAZi8GtC+IPC
 Z5Ws4ppLKFIOJZddHXMtjv6+/0Pgs7vYviwc
X-Google-Smtp-Source: ABdhPJzDZLgMtoCGtXSeAZLnBcH3G2E+Ut6kGcPFeE5r3t7vnlVQ339UdIHjwojZKx8Tgy+HxpTkaw==
X-Received: by 2002:a17:902:47:b029:de:c58e:8257 with SMTP id
 65-20020a1709020047b02900dec58e8257mr9617476pla.61.1612640337480; 
 Sat, 06 Feb 2021 11:38:57 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b17sm14295662pfp.167.2021.02.06.11.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 11:38:56 -0800 (PST)
Date: Sat, 06 Feb 2021 11:38:56 -0800 (PST)
X-Google-Original-Date: Sat, 06 Feb 2021 11:38:54 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.11-rc7
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-7c050ab0-3c41-4b21-b011-47b64a4b713e@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_143902_038280_834991CE 
X-CRM114-Status: GOOD (  12.51  )
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

The following changes since commit 1048ba83fb1c00cd24172e23e8263972f6b5d9ac:

  Linux 5.11-rc6 (2021-01-31 13:50:09 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc7

for you to fetch changes up to de5f4b8f634beacf667e6eff334522601dd03b59:

  RISC-V: Define MAXPHYSMEM_1GB only for RV32 (2021-02-02 18:36:42 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.11-rc7

I have a handful of fixes for this week:

* A fix to avoid evalating the VA twice in virt_addr_valid, which fixes
  some WARNs under DEBUG_VIRTUAL.
* Two fixes related to STRICT_KERNEL_RWX: one that fixes some
  permissions when strict is disabled, and one to fix some alignment
  issues when strict is enabled.
* A fix to disallow the selection of MAXPHYSMEM_2GB on RV32, which isn't
  valid any more but may still show up in some oldconfigs.

We still have the HiFive Unleashed ethernet phy reset regression, so
there will likely be something coming next week.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: virt_addr_valid must check the address belongs to linear mapping

Atish Patra (2):
      RISC-V: Fix .init section permission update
      RISC-V: Define MAXPHYSMEM_1GB only for RV32

Sebastien Van Cauwenberghe (1):
      riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX

 arch/riscv/Kconfig                  | 2 ++
 arch/riscv/include/asm/page.h       | 5 ++++-
 arch/riscv/include/asm/set_memory.h | 6 +++---
 arch/riscv/kernel/setup.c           | 4 +++-
 4 files changed, 12 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
