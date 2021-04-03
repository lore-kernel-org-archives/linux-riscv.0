Return-Path: <SRS0=xqXW=JA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04685C433ED
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Apr 2021 18:40:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E2E66128E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Apr 2021 18:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E2E66128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1tWevg9CZXiMyF/jlC5CXjnCaXe4eJ74XkT2JYWtq8Y=; b=qwJqueH4ccbUOs5qrOpX9cqNCu
	zqJFtMT6Wa+lITfqDvO7YOiMXbUXzK5fq75DCWja85tCJxfPsZ+j3bTW3VLFTymtRKq77Ss3xl6FZ
	p/d3BNe9xgNTBjcsmtc+XpsrJI6NaXxQfr2OqJoAYT+CvLeZnsjDB/pJYhbuwxh/bOBZAMfVxuuev
	tZVMcDtgkrxudRbtmtIo1RHQoSqW7aqHGTlkNXQRscxio2sznUI+Ifb4OUyTuKGCgukW9ON0tPYN2
	nnyduAFnDmEhZX35KJE44QKDo7G/eZFA8ZFEQXpEbPDPMq2FSKDk9UN6YlPTUN3xChrwLw9jClIPz
	xi/ECkWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSlBP-00Ewg9-PU; Sat, 03 Apr 2021 18:39:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSlBM-00EwfR-7C
 for linux-riscv@lists.infradead.org; Sat, 03 Apr 2021 18:39:42 +0000
Received: by mail-pf1-x431.google.com with SMTP id l123so4087748pfl.8
 for <linux-riscv@lists.infradead.org>; Sat, 03 Apr 2021 11:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=zD8wauqUMw0TlD45wfByZ3K32WygFAL1fLRSXJC1e/Q=;
 b=DWtISbdUdqv4RGLKQXay9ogRu8c8kArSRreQHu3wGJN29oVK7gGAh6ZsRaBjBAlrRD
 hRxuu7SJh1RXBk5l1+KYE1SJM5PMb1p2sJY887Muf0U3Sc15NLKYxCdngd/nD31X6ssG
 UM4qbRNFBRy4JUbHVrQUGTaTBYGcdzGalcw7JYt0nGm4FeCD0YFYfK2itFljE38TT2p8
 w8RQD7YTbsJtMwIQwl00Kwn9j+449bx0U0wK6j0oy3YWvkrzSLbPz3NF9rxNt6txc5ew
 IB9S+CJ5nfRJt/5uhbrfePQ3zHdxJ/JVSilQlbLJTCbGmEYOVm02+wf8YcBYYQewmrYd
 9Omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=zD8wauqUMw0TlD45wfByZ3K32WygFAL1fLRSXJC1e/Q=;
 b=eVrx/YFQ9eGqByqRPih9wuVPlJ/yKO55Yqh7h5j/xQlhDljhAgzTdKsPiyzGCOmbm2
 gMf373whwNwM3IAZlLJtAHKjMvtrulkvGP7PNksUomYg2EuH9M7EZOJjy/lzmZpBZvVh
 C8wdVpMAFoyD36va7W88WDsw4RGQn+cTYmIUB96+1FYyg1Je3VxfaSyi4dmxZu4KygoW
 rWgkj8CtrAmNJ7ZCxqRkM/13pCSTNHLuZ5/H9ihJHoRSw1uW1etAfH/I4Nm1n7r+CQI7
 dec7MEZvPswboA4aY4p3plb4l/QjqxwjnQZIEjxKYn4/CUyoRE5jwWnpwscuKSlnneLz
 bA5A==
X-Gm-Message-State: AOAM533FdXmQrvKapRNow9Xl1tO3+UIksuRMUPtENzM1tt6fvTZF0kf0
 xV4AyHoBBqB0et1jUD2YrxF33tW7+9izSg==
X-Google-Smtp-Source: ABdhPJzBgIekprwFPtdRSoK+vU59Ehl7CiAQGJdsf3oqCIHFklsg0IAQJYMY70GDCXtJ3hwAlsq6lg==
X-Received: by 2002:a63:181c:: with SMTP id y28mr17174906pgl.175.1617475177611; 
 Sat, 03 Apr 2021 11:39:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v134sm11473034pfc.182.2021.04.03.11.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Apr 2021 11:39:36 -0700 (PDT)
Date: Sat, 03 Apr 2021 11:39:36 -0700 (PDT)
X-Google-Original-Date: Sat, 03 Apr 2021 11:39:28 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.12-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-7c342428-c3ce-4ed5-b311-cd79458c2f32@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210403_193940_422378_9DB140A8 
X-CRM114-Status: GOOD (  10.33  )
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

The following changes since commit a5e13c6df0e41702d2b2c77c8ad41677ebb065b3:

  Linux 5.12-rc5 (2021-03-28 15:48:16 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.12-rc6

for you to fetch changes up to 1adbc2941eee8acbe3c7dc6b51cdbc5a9bf19565:

  riscv: Make NUMA depend on MMU (2021-04-01 21:37:08 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.12-rc6

I have a handful of fixes for 5.12:

* A fix for a stack tracing regression related to "const register asm"
  variables, which have unexpected behavior.
* A fix to put_user() that ensures the value to be written is evaluated
  before enabling access to userspace memory..
* A fix to align the exception vector table correctly, so we don't rely
  on the firmware's handling of unaligned accesses.
* A build fix to make NUMA depend on MMU, which triggers some
  randconfigs.

----------------------------------------------------------------
Ben Dooks (1):
      riscv: evaluate put_user() arg before enabling user access

Kefeng Wang (2):
      riscv: Drop const annotation for sp
      riscv: Make NUMA depend on MMU

Yang Li (1):
      riscv: remove unneeded semicolon

Zihao Yu (1):
      riscv,entry: fix misaligned base for excp_vect_table

 arch/riscv/Kconfig               | 2 +-
 arch/riscv/include/asm/uaccess.h | 7 +++++--
 arch/riscv/kernel/entry.S        | 1 +
 arch/riscv/kernel/stacktrace.c   | 2 +-
 arch/riscv/mm/kasan_init.c       | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
