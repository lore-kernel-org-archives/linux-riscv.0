Return-Path: <SRS0=HnHo=DJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E210BC4363C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 16:07:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4C3206FA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 16:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S3pQ8LP+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="uqFzlyET"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B4C3206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cdup5i5FHm+rXV1SYIYEfI2BbmMVG53+8UtyjOt6bfI=; b=S3pQ8LP+bLcUUxKknRnQ5gshgn
	HclHs5uIXdPaP05CkR7c02kXbQOlb8dTkAkGKaRP6FnnLshPGss20zePlkbVlM5DAMHBBKUwvlTkf
	Uk6nG/Ha6jwfzWGIPgwgj8Rlx3CTLdDw1u2EY+R2+4em4jG8GgFE3yRsZoYERruSy4XORzToz9hFI
	Xk5hWU9IFbcm3NSxxrVvte7qS5eMkvYyHiLQmyz187g6oTk48kugSQt7c77eK3mcjFOFTYZ3UPsZF
	1d0jrYeYmQ6OIwsuzE6FfSoRGa4o8QcE1aRRj1VAo8Nmb2BAmJ9TpGU9Le8UgaPVP5Jdr9hAsV4G/
	ydJq3uhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kONao-0000O2-13; Fri, 02 Oct 2020 16:07:34 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kONam-0000Mv-3X
 for linux-riscv@lists.infradead.org; Fri, 02 Oct 2020 16:07:33 +0000
Received: by mail-pg1-x541.google.com with SMTP id h6so381704pgk.4
 for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2020 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=4Sz1W2DE52gFF7nh9iGez9EPsakiNmf6sgNxs58KPjg=;
 b=uqFzlyETyZWAlKABRaH2ZoC+2wUipo9m3xecCVDzW3QIAhTPHpXdD4pBWai1mIhXm+
 Zs1Kde1/uhLirxFK2YFhjJErv/MOmocqeAWgav39GoLidcFUx2BIh1xVs+ccJspy+aYu
 dtFpKTbdVecOIjKKDU5zrgEVU95h67yO4qphXcU3kZ917H65Omj44ujuNB+67Xcmy4+i
 OiJ73SG8ilWxzrAR0HwKgrVwLpBTDcdzD7DEZjMOs1SG7vsOsORmlSSfffI6xaBcZtmz
 w+sDYwygnj28kDhwnJzCZicAmGbz97LTVFPzVjSCyxWyCIf6mdHM710mLrOfVa9tCEeX
 Y9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=4Sz1W2DE52gFF7nh9iGez9EPsakiNmf6sgNxs58KPjg=;
 b=WGLPoThkrVKb0YQ9iIWSOfsMtJ4pcYWTO2zVkmkTwi+wmnXa4Hk56DtErcz4CayaD3
 tDoqPeEg89khnPBwAsQLZwxeh/GKBbh+aLNqFCPx8/IQbzfcLytDTkg2Yh6YXoQ+Uj0F
 jbKDAxElUKVx83T2qsn67SU8ObXGT8gR7k68w+/moRzZaPIw9zsow463oCARMXFAmB0Q
 RFh3NaEut0BHgLOBE43E+A0DoihBgca9RWx7VOhAxrRmxRADG5FRHh0DzGUy0Ksb2SbY
 Xy3Xo3pz5LekXVOPkocVWLO24Rn65wHTU6ilO2RsczK9eIjhBb7ISpfQGPdkMggiJ9fu
 FMsA==
X-Gm-Message-State: AOAM531n9EaJubOk37rpekcnPgiZQiwkTDseUW9goSLRYZisDVd05NXG
 eIT/XyUDpi7i8gB6pkMFZzDv77QW+dj1zRE2
X-Google-Smtp-Source: ABdhPJzMfI9KBJJtkfT/opMngWA3qRt/UEd1r4XCkaD48LwLVcxqR2/P1HZGbuwpWMsa1ETyPFHpVg==
X-Received: by 2002:a62:d44d:0:b029:152:ebc:77f8 with SMTP id
 u13-20020a62d44d0000b02901520ebc77f8mr3634165pfl.14.1601654847806; 
 Fri, 02 Oct 2020 09:07:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m5sm1934679pjn.19.2020.10.02.09.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 09:07:27 -0700 (PDT)
Date: Fri, 02 Oct 2020 09:07:27 -0700 (PDT)
X-Google-Original-Date: Fri, 02 Oct 2020 09:06:52 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.9
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c32d6fbf-32dd-45ed-90f1-ffbb7e455aaa@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_120732_163788_10F99023 
X-CRM114-Status: UNSURE (   9.94  )
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

The following changes since commit a1b8638ba1320e6684aa98233c15255eb803fac7:

  Linux 5.9-rc7 (2020-09-27 14:38:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-rc8

for you to fetch changes up to aa9887608e77b835d51f05a54940380391cd4e21:

  RISC-V: Check clint_time_val before use (2020-09-30 11:05:14 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.9

I have two fixes for this week:

* The addition of a symbol export for clint_time_val, which has been inlined
  into some timex functions and can be used by drivers.
* A fix to avoid calling get_cycles() before the timers have been probed.

These both only effect !MMU systems.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Check clint_time_val before use

Palmer Dabbelt (1):
      clocksource: clint: Export clint_time_val for modules

 arch/riscv/include/asm/stackprotector.h |  4 ----
 arch/riscv/include/asm/timex.h          | 13 +++++++++++++
 drivers/clocksource/timer-clint.c       |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
