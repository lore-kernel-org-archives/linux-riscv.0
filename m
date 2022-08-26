Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4212FECAAD4
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5JO2EYpmQwG+OfsERM47Cdd0ZV2eHrK6KtVWogGBC+Q=; b=zTNhiDLYcr8j5H
	tHNZLbiRegz7wx+0683eiQK/NBbXYubkQAG92v81ZvM/uMAfnCxUFQQaDqGavu6q8EhuBryr5d+UL
	4ruXWNry7ln3pi+mcmfZGHZHTJTm3/G1NCOytWG3JSZzYybk8KiusdGs7j73/Pd5PTSuFLTSTT5cr
	e1lfs4svrjMkoRcQsvG141nOhgoSiSNyu/Jkzv2iwMzEk1DrgsAjw8biIuyzybvhOyhmj0CDDUsB3
	PYOixKebCTHSnL5mbIy8XqlqtI7hAGNZOO00ZsYxGDUXAbVkwwRqMXqohalmpF1O8ZOzdTxDQLWyA
	16q7g6IEv5VIcgOqsszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRbm3-007WiT-42; Fri, 26 Aug 2022 16:01:35 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRbm0-007WHx-3H
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 16:01:33 +0000
Received: by mail-pg1-x536.google.com with SMTP id r22so1763946pgm.5
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc;
        bh=3q1mT4Zy/pS2V313QrcC7m04gHYm6T7l/MWl4Feqxmg=;
        b=URFDI939EmBa3SgnOxIChmOhkGfBhEfWzwvuZB4Ycp0skW/8zGQKscbKZTHwOjcXcD
         ecyI8To4SmSS6i03Kaw68b+0ixpJqAcCY0BUaOZ9ZrpyNvQZmTD/lNuCmWxZ566mXpUo
         6QhZNImwvVrJpjrG5w185yEoG5AFLalPCJ7vV3IwcraQCOi16c5u8qOyimESMNdHs6vD
         VriRouFqGOPy9sJNYjoxmaTK80lbOuYsd9KrHGbWnAwRksYlcGAANxD6s+Vx8QRygOjy
         2uB60UvN2GNb7qdq2VvnF5ZPv71gS5XQoW6JR34615rctNzClhzHtJ/CBFqdPR10dUpY
         qWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc;
        bh=3q1mT4Zy/pS2V313QrcC7m04gHYm6T7l/MWl4Feqxmg=;
        b=eRzW6ScSocxlKQiy+10IMtB9GfnuNuvowqJ4IjNDa/miFpNWiuVYBlkjLDLVOqqsLe
         N8CptWb5gz3oU2TaNl1n5OBhObFxOeVwKBmZuYrV0GxLxKkxl8BQPE0GTkBG6S778OwQ
         0c5dd+nri39XS8jwfB4pRXIt86OpZdMas146msLcZ6cp0ablQFHq3Y8J53cRyjpxvrCc
         QEy0WNouZSuULhY6tIlEVGya+Aitxgp42aCJITk55lsGi++4xWE89+3Eku+wgQR7LNTN
         Dw1mLyRNOzIIVsTQkCHZ9NBnkevpNY+aLjCnFPfBTqGSy5061fm6aa7zl0zpL4YMM4n5
         ns6Q==
X-Gm-Message-State: ACgBeo0C0odNYJWAurxZwUMzj1TaTRxCbvDUz29nsaEf1qijW0T7Jrsk
	Uc+L0ZGH5frAdGFgCTCshSypCU8RSCluGQ==
X-Google-Smtp-Source: AA6agR5njmhZtIgm9xXzOQGOvZyrR3JhJAMUHehXwOk95RIGfGWL/+uMX5MZOlMDNszbIWDDrmqI7Q==
X-Received: by 2002:a65:68cd:0:b0:42b:4214:27 with SMTP id k13-20020a6568cd000000b0042b42140027mr3747290pgt.102.1661529689248;
        Fri, 26 Aug 2022 09:01:29 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id p22-20020a1709028a9600b00172d0040b89sm1757675plo.132.2022.08.26.09.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 09:01:28 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:01:28 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Aug 2022 09:01:18 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.0-rc3
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-b5674eda-e816-4e5a-aea2-22f8dc6617fd@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_090132_363466_D9F146A7 
X-CRM114-Status: UNSURE (   7.09  )
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

The following changes since commit 96264230a6817bcd4a7ae0fc30c60bfb46499f68:

  perf: riscv legacy: fix kerneldoc comment warning (2022-08-18 14:19:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc3

for you to fetch changes up to 1709c70c31e05e6e87b2ffa0a2b4cc0da4b2c513:

  Merge branch 'riscv-variable_fixes_without_kvm' of git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git into fixes (2022-08-25 16:38:01 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.0-rc3

* A handful of fixes for the Microchip device trees.
* A pair of fixes to eliminate build warnings.

----------------------------------------------------------------
Conor Dooley (6):
      riscv: signal: fix missing prototype warning
      riscv: traps: add missing prototype
      riscv: dts: microchip: mpfs: fix incorrect pcie child node name
      riscv: dts: microchip: mpfs: remove ti,fifo-depth property
      riscv: dts: microchip: mpfs: remove bogus card-detect-delay
      riscv: dts: microchip: mpfs: remove pci axi address translation property

Heinrich Schuchardt (1):
      riscv: dts: microchip: correct L2 cache interrupts

Palmer Dabbelt (2):
      Merge tag 'dt-fixes-for-palmer-6.0-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git into fixes
      Merge branch 'riscv-variable_fixes_without_kvm' of git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git into fixes

 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts |  3 ---
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts |  3 ---
 arch/riscv/boot/dts/microchip/mpfs.dtsi           |  5 ++---
 arch/riscv/include/asm/signal.h                   | 12 ++++++++++++
 arch/riscv/include/asm/thread_info.h              |  2 ++
 arch/riscv/kernel/signal.c                        |  1 +
 arch/riscv/kernel/traps.c                         |  3 ++-
 7 files changed, 19 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/include/asm/signal.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
