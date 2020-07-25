Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEB4C433E1
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 18:31:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073BD206D7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 18:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2FuuBYN4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="xqchFIz3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 073BD206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WxHav+wHhogaNqKaACqtcwx8uazzQrPuMWRaRYjGiDw=; b=2FuuBYN4goKWUWygDYuSbpfbnW
	tnRFTuqlViXQyHa/UIwkGHQvPKze3+9ZcW2K0ccQJJ4MxDKqq5IXtKYbiXJCl+RJMQ3ydbICRxjj+
	O7oyBX2KVru55CXfuU2w8rlwPV2Qk3LFqEmcVjwSHtzv+CNgPcsFUDCRXawJEznF1A1HjtmsnwRcH
	/shJ682b4pA+U3U5p6I8p3meOrE3PVq69rCFWizJfkQFf9mzoZ4yzY/YOP6YOoXfhQbH4GbrruZDV
	+O/AW6gwNgkB8Ody2ao/HD0sLy2CJbwUphXlDQ4NfoiZRrvwQPmLdRkOdJMwKBePaBc6yVZNXTMML
	G47o0s2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzOwm-0002bt-BQ; Sat, 25 Jul 2020 18:31:00 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzOwj-0002aB-K2
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 18:30:58 +0000
Received: by mail-pg1-x543.google.com with SMTP id m22so7153167pgv.9
 for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2020 11:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=RpLA+fP+DoLvbUEvg6utInkVa5lt66wslkma7Mkucds=;
 b=xqchFIz3EfC5rjOlPK5SwVCU2Hutak9YpYOb4GS4j6KEy8w82eIBqWXUjJJl0vra0x
 jFtrQzf50jI+hRpAQo6UreFtU1A2Y2A5IHDPuxl6BuBOVzXt8jckw6w4BkMrdrRsBOEl
 XRrD+de4uODky1/HBnJjoaMcTJEbVSuTwGgi06M7IUeKdTNfXVGYISY0F4pSS+nsNn0h
 pVsBgDhzVlMOikrsFsi3XK+RgoI0EvzP2OTKhEL11N3YTXDoGz5lVWBcOzu48WpDBf8Q
 xBmEwTOJ1nXSliKHw9kpDyYIHH0pNKkw2XBDYjbCo9pxvzcvyLdDOGff1O74u9pBzFqd
 eQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=RpLA+fP+DoLvbUEvg6utInkVa5lt66wslkma7Mkucds=;
 b=tYnjAm6KQY2bTwQtio2Dy9le/T8Pt3Hkxxre/xb8CsRJccBX5iEah3fAKzfZN2S4T7
 kHcoCrwr795ENLDWvAdl/dm510oXgmqAHHadXrl7oMeSbDX6qbCY4SnY+uS0XJ0CCz4e
 wZQZhxsFo2Z0udjhsyqJn6HNKuCWsqCnuSdkvXf9DsYRijolJU3D/Esdz4+ZWf/upD0Q
 l+A8MKrVwwo6rwkoPFcNYllWrls05UCGQXqm6zX2W9qxOyqbFSLjWB9U/yAD12SPHBi5
 IyQ8t0UCJN9VYU+kLLqCDNnFHSlJF1UvnkVyw3FAos1+yvl5xlSsowxUfmbuTzk8ySOg
 VHAg==
X-Gm-Message-State: AOAM532oIG3VhQXM0XMBFjCVICKQNGHP+cdGjrQf5IdWyPjiTfCOM04n
 KsBUycj21XWEGETD6fJVXMclfxLrNbk=
X-Google-Smtp-Source: ABdhPJzkcgAw5QaTaebC9kG4nrkATQ3qDp2O73dkpdQpImjpzDubCoAEBaBw4g8NzSFaCp5LppMGGw==
X-Received: by 2002:a62:b409:: with SMTP id h9mr13600700pfn.305.1595701854895; 
 Sat, 25 Jul 2020 11:30:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u8sm9276274pjn.24.2020.07.25.11.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 11:30:54 -0700 (PDT)
Date: Sat, 25 Jul 2020 11:30:54 -0700 (PDT)
X-Google-Original-Date: Sat, 25 Jul 2020 11:29:26 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.8-rc7
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f2bb3f7e-e2d6-48e5-a8f6-5e47edf5441e@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_143057_681746_24281707 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit ba47d845d715a010f7b51f6f89bae32845e6acb7:

  Linux 5.8-rc6 (2020-07-19 15:41:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-rc7

for you to fetch changes up to fa5a198359053c8e21dcc2b39c0e13871059bc9f:

  riscv: Parse all memory blocks to remove unusable memory (2020-07-24 22:08:25 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.8-rc7

I have a few more fixes this week:

* A fix to avoid using SBI calls during kasan initialization, as the SBI calls
  themselves have not been probed yet.
* Three fixes related to systems with multiple memory regions.

----------------------------------------------------------------
Atish Patra (3):
      RISC-V: Set maximum number of mapped pages correctly
      RISC-V: Do not rely on initrd_start/end computed during early dt parsing
      riscv: Parse all memory blocks to remove unusable memory

Vincent Chen (1):
      riscv: kasan: use local_tlb_flush_all() to avoid uninitialized __sbi_rfence

 arch/riscv/mm/init.c       | 66 +++++++++++++++++++++++++++++++---------------
 arch/riscv/mm/kasan_init.c |  4 +--
 2 files changed, 47 insertions(+), 23 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
