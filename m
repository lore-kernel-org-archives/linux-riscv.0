Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B5BECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 11:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8LKwjeOs7haA3helzbcGrj5NOYg1KAVozzdnm5qVsIA=; b=jSt2RI/AU34ubL
	I00CGdxRDoFf1xfHHIl9p7tTlQUcZrDGm3mP0A6jY8cyQC4ZEcRNaNomkOa5e9OafF5O0krvhW7d+
	rzxz9DedyFGJ8oOxALTsMylfdh9T63AdFVnZnxkKZ1xFXLD3PEOtETx0D9DO6Q0ylTaCUyMjLhSk6
	olCfFdTpbjgO+dlurCspVL1ndWJp3h5lKh+u48B1OkorKSmasctdFZ6vN5paBx+iVBpWg+DM5VnmL
	dZkj6n1oE0ZB9f2cgWtm041jluO8fGx664706rmEJkER3Ar1zsavV0HBZBbF/O7s1nqPHHIBLchTv
	S7e/HTDj4CI+lqPrxjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgmL-003vGb-OP; Fri, 23 Sep 2022 11:23:33 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgmJ-003vFo-Jh
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 11:23:32 +0000
Received: by mail-pf1-x42b.google.com with SMTP id u132so12118160pfc.6
        for <linux-riscv@lists.infradead.org>; Fri, 23 Sep 2022 04:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date;
        bh=REIOUlOZuR2Dd03PbSB7cFdrr86vzDy5is9HvQVwqOc=;
        b=KcgfRfVYGauuLgvui7owu3BU/Z7+CTtWQcE+Z60T6syawS10cHJ6WhG7LXHJNWDgwg
         eCa/OnHa3JwTrCdhZqkZUgtLpai2yUEh6sVG9sfGL46TNy378yMCoM1xdUcsQwOSROTU
         h45aPVLMjWRJJk0x5G5TRxVvJ7s8Sg3hD4Wh/v+T7Vj6zIDbBVTs1dN6fCJ0jUuXYdr8
         8wB1oI892OnaII7BNrGvL9XtRrMrt9m42aeXx7rSACgihwREAZN1y8iyya8ocwCA+8af
         /AFr5BrufxrnEreBcOdnl33LugE2l817Fp1KaRAWbL4S9tqf0dNHXvKWu1h70OTbJS1t
         JFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=REIOUlOZuR2Dd03PbSB7cFdrr86vzDy5is9HvQVwqOc=;
        b=1fT5gD8Q69nY26hjdoZxQx5tKylGVjr/VQUCmT7Lg/mwEMpE/ptWufEps5GxctTWf8
         m+c5f9zxnO9pn9XBVZhsMziyu3YvgqjBu/eD6/wKHczjUu5HCqj3QddEABwvviBfKSHY
         c59RAFeli7bObhcl3UHpqzpUMpzs1SfE7mwazdiUwh/kG+HYdRALfHkrU3UDaxxooioK
         Q3LixCkSAiNdAjA4IyiIj2VCO3+8HfXjqcNPt6dKgorP9Va9nruHZxXfgibsQ6TOLMUV
         EVhwSBmS/7KTKoSNXm9kmsJDLyIVmBZJRxCCLictg2pVLEC9p6mJCH9zup7hmJvIc0DH
         BGvg==
X-Gm-Message-State: ACrzQf0bWM+pK0v73L5zvZ7vVwm4rTvsji+Rjuc4WfeMCHGXQSkd+3PU
	/3E2Ji93W//zVxo9YZxg022jzDzvd4LXZGh4JSQ=
X-Google-Smtp-Source: AMsMyM7CmXeYHzs1yO8Rgy5zY3tySOuksEOeoUcxlJVMX6JPTm1TD0jUQF3NlmOdxcQ/TWXggYzC3Q==
X-Received: by 2002:a05:6a00:2488:b0:540:e5e5:ba48 with SMTP id c8-20020a056a00248800b00540e5e5ba48mr8677357pfv.51.1663932209555;
        Fri, 23 Sep 2022 04:23:29 -0700 (PDT)
Received: from localhost ([88.128.88.52])
        by smtp.gmail.com with ESMTPSA id r9-20020aa79629000000b00537eb0084f9sm6068167pfg.83.2022.09.23.04.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 04:23:28 -0700 (PDT)
Date: Fri, 23 Sep 2022 04:23:28 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Sep 2022 04:22:45 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.0-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-d96d9461-4a76-47d6-8a6c-fe0890247b0b@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_042331_665623_3922D4D9 
X-CRM114-Status: UNSURE (   9.76  )
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

The following changes since commit 20e0fbab16003ae23a9e86a64bcb93e3121587ca:

  perf: RISC-V: fix access beyond allocated array (2022-09-08 13:50:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc7

for you to fetch changes up to c589e3ca27c9f608004b155d3acb2fab6f7a9f26:

  RISC-V: Avoid coupling the T-Head CMOs and Zicbom (2022-09-17 01:48:24 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.0-rc7

* A handful of build fixes for the T-Head errata, including some
  functional issues the compilers found.
* A fix for a nasty sigreturn bug.

----------------------------------------------------------------
Sorry in advance if something else has gone off the rails on this one, I had a
bit of an unplanned vacation this week and it's shaping up to be more tiring
than the conferences.  This is just what was there last week (without the
deadlock), I figured it'd be best to avoid delaying those any longer.

With any luck I'll be home tomorrow, so things should return to sanity
soon-ish.

----------------------------------------------------------------
Al Viro (1):
      riscv: fix a nasty sigreturn bug...

Heiko Stuebner (1):
      riscv: make t-head erratas depend on MMU

Palmer Dabbelt (2):
      RISC-V: Clean up the Zicbom block size probing
      RISC-V: Avoid coupling the T-Head CMOs and Zicbom

Randy Dunlap (1):
      riscv: fix RISCV_ISA_SVPBMT kconfig dependency warning

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/Kconfig.erratas          |  4 ++--
 arch/riscv/errata/thead/errata.c    |  1 +
 arch/riscv/include/asm/cacheflush.h |  5 +++++
 arch/riscv/kernel/setup.c           |  2 +-
 arch/riscv/kernel/signal.c          |  2 ++
 arch/riscv/mm/dma-noncoherent.c     | 23 +++++++++++++----------
 7 files changed, 25 insertions(+), 13 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
