Return-Path: <SRS0=dJHb=C5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED692C43465
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2020 17:26:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9190A2085B
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2020 17:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qPKlTsNN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Vmic1KSX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9190A2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NGG0mLQyTSOJXg0QZD7DwR3CHCCDayyFrifyAbYnmxg=; b=qPKlTsNNBQH42AyT5fiYut+6Y3
	nvKfpdhF18gvZjJcMMHkWDCIgbh9LQuvncCd4/9H5hgFrgr8Kcq7aZ71sEEXIad/H7vCWwlTSyapi
	ykLTnZjvOYWArf+EPjIQm0AMK7yf3d2zzaY1BY2hnFZKvdmEYc3OA4XbyEm3lJAv3yMkOI/FWsk45
	EWrw7lW3uXi0RUArrq1GiZRNShGAAguHhXKCnbiy5zopOnE5Si8Wik+7NUdyEk7NGjtA+fE6b9hEs
	HPb0HPRrfWdUFCrlrhhA5SXmyyv6ySo3A0YaRB9kF96RNpt6WAew+2pMt3NCYRAAWxsQM9AaxjZA8
	RxiOqoFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kK36o-0006sT-5e; Sun, 20 Sep 2020 17:26:42 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kK36k-0006rj-Hx
 for linux-riscv@lists.infradead.org; Sun, 20 Sep 2020 17:26:39 +0000
Received: by mail-pj1-x1041.google.com with SMTP id mm21so5986265pjb.4
 for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2020 10:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=f6WUrne5G/egCmCZ7ogiV0QMC8iAaMZgFNcbf5/4Ujw=;
 b=Vmic1KSX74jNaSc9Du9HzVIcCqMbcK0h2JQ1oBsDRRZvvGPHbZQXCL44PqCO0+U/YK
 CsK06YWsjouTFRyXMbtdjZ5VB2Pn0/XHHP4lcUU51QVkffPX5/GlwDnmU/QVM86DUZgI
 hpUjCknE9sCwOEd+gDVNhimnH1W4qvjRKI+WNc0SGRrVzEFh8NIkUXSeTYDAt9ss71cw
 HFQpJ5mE+heycLVNNHAtZzJS1k58/Ent+L0SXiAMNow6AntWRuaMRuUiyD62CkMczPwx
 cNNGkkocXY5Up8IdWpXEfLRrvipsDMe06L8r0+LWBPoYvAXRQD2W7my5zAAALhXJfXVe
 U/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=f6WUrne5G/egCmCZ7ogiV0QMC8iAaMZgFNcbf5/4Ujw=;
 b=b1G6TNkLHNbPDb2btxkYp16vIBMOgUMJJXnECd5SlzF0PT9AL1C0X8tisOwJFLRtIS
 wnZHJy640f+XlXkm4HIsUQEEhIBAHmnevUVIaL1WHvGzXhZbC+TZWdYKZuDU4oRBngM4
 tD2NUyZ9BBG+2+EJWE0E9Q0v/FCHFlgcC9C0BUMgC/qZl5c62/u6d1lQ7nkVxj+9uJAU
 B73ovaFivchcXRNZhdsCKmGlqmKSrLZjqO4DDvTAduzhQw4SntQunrfejVRMtvr88bBO
 ySUcgb9CrKZvuqs0MLJRxn8oXYda2GlP6bMlXW0U9d0UuucLqvYQj0f+yIb0IiQ3W0+T
 G53w==
X-Gm-Message-State: AOAM533ZEqYcz6UvnAZeuEth6GxdHt24c8vcS0fwzTrND2ti2R/QULjX
 wzY1abZv0cZa4wazhLhUZDfkWjTwH7K4moUq
X-Google-Smtp-Source: ABdhPJwuBS0WNmzJTbC8EwiQ9YOL1Yy6M1qk6O6KGUy7jpLpiDx1uTVAqOx1Db6LwEyQB+zk1v49MA==
X-Received: by 2002:a17:902:a50b:b029:d1:e5e7:bdd2 with SMTP id
 s11-20020a170902a50bb02900d1e5e7bdd2mr23969524plq.50.1600622794774; 
 Sun, 20 Sep 2020 10:26:34 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 131sm9652013pfy.5.2020.09.20.10.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 10:26:34 -0700 (PDT)
Date: Sun, 20 Sep 2020 10:26:34 -0700 (PDT)
X-Google-Original-Date: Sun, 20 Sep 2020 10:26:29 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.9-rc6 (or shortly after)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-a3f22c5c-7980-4ed9-b198-da86bf6d1162@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_132638_720789_8C7ACA12 
X-CRM114-Status: GOOD (  12.52  )
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

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-rc6

for you to fetch changes up to d5be89a8d118a8e8d09cd74a921a808f17fbdd09:

  RISC-V: Resurrect the MMIO timer implementation for M-mode systems (2020-09-19 13:21:11 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.9-rc6 (or shortly after)

* A fix for a lockdep issue to avoid an asserting triggering during early boot.
  There shouldn't be any incorrect behavior as the system isn't concurrent at
  the time.
* The addition of a missing fence when installing early fixmap mappings.
* A corretion to the K210 device tree's interrupt map.
* A fix for M-mode timer handling on the K210.

I know it's a it of an odd time, so if these don't make rc6 it's not a big
deal, but I thought I'd just send it out now rather that waiting as these are
ready to go.

----------------------------------------------------------------
Damien Le Moal (1):
      riscv: Fix Kendryte K210 device tree

Greentime Hu (1):
      riscv: Add sfence.vma after early page table changes

Palmer Dabbelt (2):
      RISC-V: Take text_mutex in ftrace_init_nop()
      RISC-V: Resurrect the MMIO timer implementation for M-mode systems

 arch/riscv/Kconfig                     |  1 +
 arch/riscv/boot/dts/kendryte/k210.dtsi |  6 ++++--
 arch/riscv/include/asm/clint.h         | 26 ++++++++++++++++++++++++++
 arch/riscv/include/asm/ftrace.h        |  7 +++++++
 arch/riscv/include/asm/timex.h         | 27 +++++++++++++++++++++++++++
 arch/riscv/kernel/ftrace.c             | 19 +++++++++++++++++++
 arch/riscv/mm/init.c                   |  7 +++----
 drivers/clocksource/timer-clint.c      | 17 +++++++++++++++++
 8 files changed, 104 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/clint.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
