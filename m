Return-Path: <SRS0=CPyr=A5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A44C433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2020 17:36:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E6920724
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2020 17:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hOFsKCek";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="F/LJ87qm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E6920724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFSLu2XDDrgoUOfUnNbrQ7w0zxNCHVmaHaY3n74HVdU=; b=hOFsKCek6PVHERaUDFBF6PiadI
	nDFagpb+gnqaV86sl/rjyOrhnTsPQLwkYDsMQ5HBT5i63dnwee1D6aC+3jtVCqT5kGDpk8vz2PPgK
	OfFWFKv7kDqZ2mYXSuY8VgFWbTtBrpAA4DQzxTyAm5amJdj9g8xpqjBFOaqyqecacCcCinPspDunn
	cBu1c2TnPNWXDwGqh9qKkVNFDmes3m0FUShzKl3FNnWtrvigrlfjABqk3msjTcz6fvB6DEUp/jeCz
	ljNoE8VSgn8CNMlAQY48OG2zUNBpsRyirp9dyLU4iQ7y/hONxNMa+hHChR4YI1rTmnuRZr63mOnJT
	6LWp/gaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwqkd-0002fA-TE; Sat, 18 Jul 2020 17:35:55 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwqkb-0002eB-Eg
 for linux-riscv@lists.infradead.org; Sat, 18 Jul 2020 17:35:54 +0000
Received: by mail-pj1-x1043.google.com with SMTP id k71so8007735pje.0
 for <linux-riscv@lists.infradead.org>; Sat, 18 Jul 2020 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=l2FZ7oR0iH+dV0VFe8SLUNQFAZ2SW0iIFMXf/4eW8nY=;
 b=F/LJ87qmPPTO72ZK++07I1iiJQOdrA97yTEzY7B88gKPqBo30ZJ0PWT57aqxfrYGW3
 QpUdY9qGjazdDiSZUuOR7+cSDDULQWid4lWd8vtlnuPDo729B8HJnSRu0L80cGUUJHvx
 ah4gkAEuIRYw9IT9e1Kzv/0xxnOOxBnaQ3m/Pr2LXckuCjCWFgEoXI67GZv5mBail87k
 k6pZShvqHbbg1d1HQtNbZ1Q63nqYQKgAeZP46r9TFlFaIYXFfZvsB4zbS66O5f8x5iMA
 tY1V9rmShtaQ92XJrALN73cVrgebvm+3zmlm5UUN14e/lQtdqMfvVhQ0KrjmrdBDXrCA
 0+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=l2FZ7oR0iH+dV0VFe8SLUNQFAZ2SW0iIFMXf/4eW8nY=;
 b=Kmdp+LkqNIH/R2elge10qlX1yeuOC03pKemIhKk70E5wjuMwgfO4V/HEEtfgIcc8bF
 PlGmeJ3tk4/bwZrX1fF963yi06CCP/lXPPK/zBgv9rPr8eanKW6yfYskv+aehZTWjBp8
 xA1Tv1Yper1rGZUlOh53pDeMZ5za9iDjS97OSH+OKde5qIT8bxhitH47QHk7rAXN0DXj
 LT1NfASSi6HMEEm8LrzqAxAL7MFrsV2d8UYNrIqaqtzJx+7/86oBJAIuYaaTR1u/kbYA
 YdAA1KBRzj7Q3TXy7WR5iJ6hL25hfKg3Cnj2tepFdrGGf7FOyeNAqT8lNzqH2+NfnFA7
 RF6A==
X-Gm-Message-State: AOAM533xj2rN4lv12GIwexJjqFuXXf8LETXj6AM1EDrFN46FKL6wOBId
 wGjZ6VbZdUi+3XGfsLcicwe3m/iu7+Q=
X-Google-Smtp-Source: ABdhPJyM+7tjQzDyzZwemOxPVfXva4sA20bASkMza4n2t3bzqdHihtcvvhJf6uB4UNbxcHgdnz0ydA==
X-Received: by 2002:a17:902:7b90:: with SMTP id
 w16mr11167369pll.253.1595093748890; 
 Sat, 18 Jul 2020 10:35:48 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r25sm6434604pgv.88.2020.07.18.10.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 10:35:48 -0700 (PDT)
Date: Sat, 18 Jul 2020 10:35:48 -0700 (PDT)
X-Google-Original-Date: Sat, 18 Jul 2020 10:35:45 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.8-rc6
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-8419056a-6b67-4a07-b5a2-6ca837bb9b9d@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_133553_501826_DAD361D5 
X-CRM114-Status: UNSURE (   8.23  )
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

The following changes since commit 11ba468877bb23f28956a35e896356252d63c983:

  Linux 5.8-rc5 (2020-07-12 16:34:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-rc6

for you to fetch changes up to 38b7c2a3ffb1fce8358ddc6006cfe5c038ff9963:

  RISC-V: Upgrade smp_mb__after_spinlock() to iorw,iorw (2020-07-17 09:28:35 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.8-rc6

I have two fixes:

* 16KiB kernel stacks on rv64, which fixes a lot of crashes.
* Rolling an mmiowb() into the scheduled, which when combined with Will's fix
  to the mmiowb()-on-spinlock should fix the PREEMPT issues we've been seeing.

----------------------------------------------------------------
Andreas Schwab (1):
      riscv: use 16KB kernel stack on 64-bit

Palmer Dabbelt (1):
      RISC-V: Upgrade smp_mb__after_spinlock() to iorw,iorw

 arch/riscv/include/asm/barrier.h     | 10 +++++++++-
 arch/riscv/include/asm/thread_info.h |  4 ++++
 2 files changed, 13 insertions(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
