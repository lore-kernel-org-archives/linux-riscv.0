Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A29BC4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 21:41:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E4723B42
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 21:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02E4723B42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BX+OjQdc6T++/68cZ/0BsPgCik8tltI2aGAL5Ahvgss=; b=GxjHyyvWg54KUHsK9gaqyHsnl8
	8LjGZLXoagCl+mHXAM2myWA6XP8SPp/iifB9JXrZ7Xz2mbEbs5VcwJTMnlcHZ2E+8/l7so7QH5QGu
	OJaMI99nXvUIb1QezvPeHgtyS03aP3zeuu0GTAPD/o3KSIJa/EZyDQ6snXYfI830oPjs3rvFNz0ye
	MrWeCMsorfHjg84B8pAbIHlcK0Re8LOocfsuAnOr9gn49zxedI8edAs87o9PN3TSsY8RSu6E2Cfbn
	2lSOlK0h96x7ziRU8AbZA3EP0/7e2Gg+lBdBrZ9fZURfiFTNUWvnOr8mH2RUpOq44M+MZXVPgkVVz
	6LCxW8MQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knqAh-0007iY-2d; Fri, 11 Dec 2020 21:41:51 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knqAd-0007i3-VP
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 21:41:49 +0000
Received: by mail-pl1-x643.google.com with SMTP id v3so5237195plz.13
 for <linux-riscv@lists.infradead.org>; Fri, 11 Dec 2020 13:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=OqjIcjsaSVYgyvXXV3i2mpONbBYJYWxTgql2pHHuIgk=;
 b=uIrN2MGJP0BtkwPzQ73wbsoyKLwaQ21sAZy/zPeBXzOSytiRI9k5Y9Bmbs5iRJyYil
 8buLeAu/qp5cIPxjE1Y81AQ+tFE/jJYaLz6lTerCZWu6pZuGpF2KUynnAycyiFVdcBZ6
 rgh2dd9DzrJHZYp1QIcV/EEgghQrPzMRETA//9FV9f9ylThijp8ThYKmF5QYOFrOpE6o
 Zdndu3j84YSnGAie9EWquGMYQJKq8zhyiAymikpcOgo0LOz/0PmsiWLJMaGJfaOBWUKC
 LWfVbWTo5oBO2XQEiaPApt0sGA7WPb/k3rB3bQjjYUX25HqQMdsf0t7mbINkgi1rfMan
 8gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=OqjIcjsaSVYgyvXXV3i2mpONbBYJYWxTgql2pHHuIgk=;
 b=G/TB7HrWgmcr6oig6Hj8NNbuV6AbnSzGwsJHuoSPpXqc5MbMDb31r+E99gxXI2f4m+
 J+FaPlwfMyL2RjpDmjfLfkzZvLjnZiAXVX8XHnAGrPgEKhMnBGpxkaHE3lKJ6iaVzyLm
 VMEWFPhHAM5bUOh1I0Ceo8OqHd2xBML6B7ixtdDQEMnM82CUeoWTgjomKE/SXtVQdyhm
 Ynt9E6y6M6OvQETYmzdgMdXdRlXQ+z1qe576FvHOapWkb/35JkHtdOXNNV3Nmfu093lI
 6nqGx+JI3vdu2VjN/Aar3sq2znRZey6wIr02h34nmASs7hpwtbktHLc4/C4rAHfGDysv
 +sIg==
X-Gm-Message-State: AOAM530F8wb03oN0RJdFPqquMDFFL8pd123mCDYSnOF5eweOu2KH64ZO
 0ea2DdcpBe1GjHBgTRRX6X4hoPgqGR2RY+GA98c=
X-Google-Smtp-Source: ABdhPJwQu1ifve1Ve6v4KZb1RslVL+vY0LZn8c4Gq3ZfjULHarWsue0KMY8MhO/9J8gGbC+FIeEu2A==
X-Received: by 2002:a17:90a:8a82:: with SMTP id
 x2mr14772502pjn.107.1607722904525; 
 Fri, 11 Dec 2020 13:41:44 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b10sm12121192pgh.15.2020.12.11.13.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 13:41:44 -0800 (PST)
Date: Fri, 11 Dec 2020 13:41:44 -0800 (PST)
X-Google-Original-Date: Fri, 11 Dec 2020 13:41:41 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.10 (unless there's an rc8)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5e629583-5ff4-4523-bfdf-c4254276d95e@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_164148_166072_D1FD9856 
X-CRM114-Status: GOOD (  11.30  )
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

The following changes since commit 30aca1bacb398dec6c1ed5eeca33f355bd7b6203:

  RISC-V: fix barrier() use in <vdso/processor.h> (2020-11-25 09:44:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-rc8

for you to fetch changes up to ccbbfd1cbf365b38d014351d1482fedd26282041:

  RISC-V: Define get_cycles64() regardless of M-mode (2020-12-10 17:39:43 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.10 (unless there's an rc8)

I've just got one fix.  It's nothing critical, just a randconfig that
wasn't building.  That said, it does seem pretty safe and is technically
a regression so I'm sending it along for 5.10:

* Define get_cycles64() all the time, as it's used by most
  configurations.

----------------------------------------------------------------
Palmer Dabbelt (1):
      RISC-V: Define get_cycles64() regardless of M-mode

 arch/riscv/include/asm/timex.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
