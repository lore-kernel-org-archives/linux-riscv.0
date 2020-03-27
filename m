Return-Path: <SRS0=JvIR=5M=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E37C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2020 17:53:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED49D2071B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2020 17:53:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VwRljlVr";
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="gQqx9TCD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED49D2071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mkw52LsZ6nlRtEJ4Q5T/LK/F7/IwJaCpYdC0S/qED7M=; b=VwRljlVrXS6dXZi69nbRqwgsjk
	cXNaNrIY5/sutH8qfif97egjfWC8duLt/4rDm+/KBivHzB2e7zMBn5zJ2lpne2qeoTozWE+E/xIQf
	zurRQIna6xUr8mIGGjTsXQKD28OddGf8emCt700Emyfm7PqaqYcSIBW+/178UOtD0h3xWzFNWZ+uN
	mNKL+L7phsjnlONQ7i3MENTduj+NEZpI63MCeDt1rFaEXuAPgsqGlKosX2Px0Urkha/f8dAsO7Q0N
	EAkevqcguzHa2VGAL/7tSyMYXYjOpS3m9B8UeLnFOxUS6WtI7Em9DO2x8A5Hep1k8oQ8L0Ej+Qaur
	xfFReycw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHtAd-0002lo-Ik; Fri, 27 Mar 2020 17:53:27 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHtAY-0002dI-JL
 for linux-riscv@lists.infradead.org; Fri, 27 Mar 2020 17:53:26 +0000
Received: by mail-pj1-x1042.google.com with SMTP id ng8so4177843pjb.2
 for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2020 10:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=Mkw52LsZ6nlRtEJ4Q5T/LK/F7/IwJaCpYdC0S/qED7M=;
 b=gQqx9TCDA3CS4l5CXZeRA7PlcZd2Fhx1miA/bBkPZi1g4bcF+GRzy7QwsdaAxAOJoy
 MQsz07VWidxMup4R1X2YJ7+kZM/OZZ7pSkuaY8+0gE1fPuPMjxMOV9Io64MYcIxvVwLH
 jpOgmIO9zZ8vBtNpwRQdPOL0/yomu7/lbA71RxL5GD6RmEQua2puGLTfTkfJ3+vV504p
 7+TgWTZcUVQmpWsExjo91TS3MG9aUg9OtVy45s2GVytXkHcKWEi1pQ4dleuFrOy9SmNj
 nC5AgC+YcFZ8XJb8qLC/jzMrStdD7lSrIT/gcghDgb1UQ9O/BCnNZwlP26emYc35Fggb
 w6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=Mkw52LsZ6nlRtEJ4Q5T/LK/F7/IwJaCpYdC0S/qED7M=;
 b=lbgil+mXnrlqdZEDuhvYhJ8IH0QQ1y665xSJqV/BpIVMAjmSYSiPLnHHf5C0zhWIH6
 aEba7zuYWYxrUho/8gsKQkkl7Ie3zewwIiq7BwIxePn3Kbptmrv/3CzHlJ+LWCpVDa2s
 GMfqSlRqo4cKjo1x5+WLayE3cTb+D3Xta6yXCW2Wpny9ejS5MHZjkIh8crM9+j4LSgxc
 CTgJhF/YcL2b7E57whEc7o4x8LxJwLq2DeQGT4AIhZ4sxenJGhQp2GYlxj7WEj56LImT
 C8gY+EgwkVumBRGXc8owfiGg4Qh/F0wXBPikSdbYFm+k7S6n7S6ppzMRUWmLi9x/2yWc
 N0tw==
X-Gm-Message-State: ANhLgQ1fWN6R0sjRWCOZxe9jX0x22hSyj/qncgnX1H0kD2mynqMsmXkK
 JjAzyf+TktqKPdazqUoABi/jI3PYwx0=
X-Google-Smtp-Source: ADFU+vvIc6Wjf8WOqjm9jzVUju2DkpVUYn57NK9O8ZTO+11p6gf0eYMgun2tKb/kqam7mst7Q8jYqg==
X-Received: by 2002:a17:902:9889:: with SMTP id
 s9mr222750plp.252.1585331598822; 
 Fri, 27 Mar 2020 10:53:18 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id m9sm4545957pff.93.2020.03.27.10.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 10:53:16 -0700 (PDT)
Date: Fri, 27 Mar 2020 10:53:16 -0700 (PDT)
X-Google-Original-Date: Fri, 27 Mar 2020 10:52:27 PDT (-0700)
Subject: [GIT PULL] Last Minute RISC-V Patches for 5.6
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-06e46f55-fd4f-48ab-b741-cf487976999b@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_105322_693240_8A3859A5 
X-CRM114-Status: GOOD (  11.69  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit fb33c6510d5595144d585aa194d377cf74d31911:

  Linux 5.6-rc6 (2020-03-15 15:01:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.6

for you to fetch changes up to 2191b4f298fa360f2d1d967c2c7db565bea2c32e:

  RISC-V: Move all address space definition macros to one place (2020-03-26 19:26:11 -0700)

----------------------------------------------------------------
Last Minute RISC-V Patches for 5.6

Sorry for the last minute patches, but a few things fell through the cracks
recently.  I was on the fence about sending a late PR just for the M-mode
fixes, as we don't really have any users, but the last patch fixes the build
for Fedora which I consider pretty important.  Given that the M-mode fixes
should be very low risk, I figured it's worth sending them along as well.

This passes my standard "boot in QEMU" test.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Only select essential drivers for SOC_VIRT config

Atish Patra (1):
      RISC-V: Move all address space definition macros to one place

Greentime Hu (2):
      riscv: uaccess should be used in nommu mode
      riscv: fix the IPI missing issue in nommu mode

 arch/riscv/Kconfig                |  1 -
 arch/riscv/Kconfig.socs           | 14 -------
 arch/riscv/configs/defconfig      | 16 +++++++-
 arch/riscv/configs/rv32_defconfig | 16 +++++++-
 arch/riscv/include/asm/clint.h    |  8 ++--
 arch/riscv/include/asm/pgtable.h  | 78 ++++++++++++++++++++-------------------
 arch/riscv/include/asm/uaccess.h  | 36 +++++++++---------
 arch/riscv/kernel/smp.c           |  2 +-
 arch/riscv/lib/Makefile           |  2 +-
 9 files changed, 95 insertions(+), 78 deletions(-)

