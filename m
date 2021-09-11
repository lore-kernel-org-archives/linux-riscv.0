Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C1EC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 17:44:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9939060FA0
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 17:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9939060FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PyG6k+0OGdlQ9xF21qYslVNWzFLJbAI7h/UgHcrWNbY=; b=Ac8Fov/SpFrc9o
	wXMnO03AvVGYAbdrw7XTMLUcz582Y0YJgfp2RAYcwuTK8nKdfrAEkAT1jxYUv6586jYa2XdfV+GRc
	Caq5Dxf2o7IAVcQZtLPSNvshw93h5DyyF+ss5jIEpCm4eBRXYveysUR63TNwr+PZPQOkk7NmVA0Ap
	CkPg11jTsno1QGvNm24ND0X4IAaH40fJWtA0/Z4CVQG339iE8uQoLZTtyt30pTJzwG5Vv8qLhDlLk
	D/YoeND7aTVJt73ceFxq0hgdNFkzaF0QozFZBpQbUUWo9hEvnh3ysqXqFCWHJDuzPIxJCnhQ7X5b4
	vc8nhE98LYKKqUbwfcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mP72k-00FJMY-IY; Sat, 11 Sep 2021 17:43:58 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mP72h-00FJLm-46
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 17:43:56 +0000
Received: by mail-pg1-x52f.google.com with SMTP id n18so5024771pgm.12
 for <linux-riscv@lists.infradead.org>; Sat, 11 Sep 2021 10:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=3NAUD4pLhng5e+omesoYDFR9m1AaPpbXzzageJG9Ma8=;
 b=0SizikyDizbpPDgx6+o5KlEfv5fyR4MEubK6B4qO7bCy/F4VpuVzG4JFQTenJQwGLn
 iI/Kz/CcST+B1m273BpXw/Th9t00b2zfl5EYpVgxe6iGmURyhYxE3hnpdXA7DGMN5SA0
 WkeS2Fq0c7oAO45s+zyvOMtAMXDSsyTyukZGUvFtXx30eiLjgelv7Uyr1Ov5IvbQHZRp
 b0oLG3zxrR6dRhnF6qUfcQTEevKdjtGyiKxqNL4Gr1i7SHVwvK3R5FBBQXZwR2Q+uqGR
 Fj0EFLjwI6PaujO5SHEDsawic4sJaf/QoBd8BtM+1g0vIe6WQWCENCYupCLSB3UYXuBO
 wzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=3NAUD4pLhng5e+omesoYDFR9m1AaPpbXzzageJG9Ma8=;
 b=C3CfNPYhOW6wTS/4SDhoDNp+gtteaPUwZR0hQl0M1yE4RPnMZiRmlaq/kjcnjYzxTe
 5hQjPoR1s6U/NqzQCyYXSwQcDuh5xsoCFI3YxGfA+6LETr+v8sM5IOjNjEdcgJKLTh60
 vNmIpTMsnk2oxKq3j1vt+70lyH1A+qo2ceTpIYBDLJ/yG2pznFCc4PLlwAg+unk0uiuA
 qvDWvPQ6w9L4zM9brPcmPEMAC+OpQvL5BbNOTFd/pl0htGFJV/eSJEUGHnpg2qxiHabJ
 Hs0k/tgmAAbAkkp+nP8yo6Q3Cf+8l2Xu8vUlu8szRj7aMbk2Wsg1ewDGl6uhghurlXLh
 f7Zw==
X-Gm-Message-State: AOAM533aZITu8rpVKMDe30oVzu0/CoQzIrH9fspl82asBXF5voS6bP2k
 iUHD1MdJuOdgxGaG3OKrcck9sS1o0hC6qsIo
X-Google-Smtp-Source: ABdhPJyZRmww7urXa4w267bTP9i2mnmfwpoW9SrScImCH4DhJlXpz9zAOMEg6zKyIBCWz6ekuhe44w==
X-Received: by 2002:a63:e613:: with SMTP id g19mr3394586pgh.12.1631382228143; 
 Sat, 11 Sep 2021 10:43:48 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y4sm2226561pjw.57.2021.09.11.10.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 10:43:47 -0700 (PDT)
Date: Sat, 11 Sep 2021 10:43:47 -0700 (PDT)
X-Google-Original-Date: Sat, 11 Sep 2021 10:43:37 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.15 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-b2b622b6-e788-4923-8cf2-ada90a2a095f@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_104355_211225_A6105A6F 
X-CRM114-Status: GOOD (  10.49  )
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

merged tag 'riscv-for-linus-5.15-mw0'
The following changes since commit 063df71a574b88e94391a3a719cf66d1b46df884:

  Merge tag 'riscv-for-linus-5.15-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2021-09-05 11:31:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-mw1

for you to fetch changes up to 6f55ab36bef505b449723300a5a445ddc76a94d7:

  riscv: Move EXCEPTION_TABLE to RO_DATA segment (2021-09-10 23:59:48 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.15 Merge Window, Part 2

* A pair of defconfig additions, for NVMe and the EFI filesystem
  localization options.
* A larger address space for stack randomization.
* A cleanup to our install rules.
* A DTS update for the Microchip Icicle board, to fix the serial
  console.
* Support for build-time table sorting, which allows us to have
  __ex_table read-only.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      riscv: dts: microchip: mpfs-icicle: Fix serial console

Heinrich Schuchardt (2):
      riscv: defconfig: enable BLK_DEV_NVME
      riscv: defconfig: enable NLS_CODEPAGE_437, NLS_ISO8859_1

Jisheng Zhang (2):
      riscv: Enable BUILDTIME_TABLE_SORT
      riscv: Move EXCEPTION_TABLE to RO_DATA segment

Kefeng Wang (1):
      riscv: Improve stack randomisation on RV64

Masahiro Yamada (1):
      riscv: move the (z)install rules to arch/riscv/Makefile

 Documentation/features/vm/ELF-ASLR/arch-support.txt         | 2 +-
 arch/riscv/Kconfig                                          | 1 +
 arch/riscv/Makefile                                         | 7 +++++--
 arch/riscv/boot/Makefile                                    | 8 --------
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 6 +++++-
 arch/riscv/configs/defconfig                                | 4 ++++
 arch/riscv/include/asm/elf.h                                | 3 +++
 arch/riscv/kernel/vmlinux-xip.lds.S                         | 1 -
 arch/riscv/kernel/vmlinux.lds.S                             | 4 ++--
 scripts/sorttable.c                                         | 1 +
 10 files changed, 22 insertions(+), 15 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
