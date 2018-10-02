Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCE0C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA54120878
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q25Z1TND";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGQb+sm4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA54120878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=q/SDdnbRlxkYtw+lG1fIcwDmxj01ebKmLpDlAoJGRDA=; b=Q25
	Z1TNDGPSYhMLAkYsQEAyEI7nRpaMORdiDlNr6rHLn39bDlbYP82k4ZFlMlAb1d33skLK0uLr2kbfb
	NFJZVezZTJiP2em7249UoYTOMzz5VFp4/xi09UfrWLVX7v0LrT5yp7pnZtI8HhAbaCq+JlcYf5/FP
	kJ8LJB9jjbCiLvEjDOCbwdpWaQFjRB6iKaidcushqPnd7R4EFENndBUcgbdQYOpLQnShH83cnlY//
	g5U97NE9usx/mz7M8ceuXoNOpBQvnqX8vEeN4yA91yBRnlyWT6Bz/hMq6vkl6+iOwEGS8JwjW9QyR
	Zgw4xuL//erdEI1oak1wQARZos2y1PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7GX8-000429-Qm; Tue, 02 Oct 2018 08:59:58 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7GWj-0003mD-Be
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 08:59:39 +0000
Received: by mail-pl1-x641.google.com with SMTP id y15-v6so656833plr.12
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=v2+8hzeFLHCSUeaT2K3yvYs8N+huBEIjdrPtfM8YYWY=;
 b=kGQb+sm4XHD+/epLssdxgd1XkmMS2/2/O+YcaBwfhU00HT4g5XUq3D2uCOHdn2qIvT
 a/sg9Px9WLNqszjL1X6zz26ETgo/dIgZ6rEw7TgQSZTC8k+7f0QnAKesMxpaH6vDEBoJ
 QZjZyuKQuox0cu3EFX84khPeeeVQfwFRHub/XxmQwnLWeTJlo9Pj/tC5YIhRHC24FZUs
 ag7WAt3HqO8OOD0HDupvmYcjhoLppK9PlXkzXniGsoXRPwFXSN2B8J4kPrxZGzpCzBx6
 2f2chlWPGWa/ZDxOxSslU/LjsVWJsFWjGLoXHfe9Ov+fiDnTzGeo2jZhuyWf+MxKhi9k
 jNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=v2+8hzeFLHCSUeaT2K3yvYs8N+huBEIjdrPtfM8YYWY=;
 b=gXnIDzcuizibhtm2dXMuQ1EHhclFdV++fZ8GZfjgSmnkc9k6b0F0mX928Hm7SeT/ca
 v0fuVOCLKqAz01mVPjvuD3YkYJ1O38k7JgL0/QMxIfsjHCwEC/5bf4v1SAhHziPrM6IE
 +ne3BQvLm9RiCOeZo20tz277DgI8dEhSGP0w9E0Xk2t3bXqjRoLcAAjho6oUMSJbJQJY
 sKeeBsXK9em74b/NmakIGZQbIf7fKUmWnHoM376Cf+yLXPtNYvf0Q2lkBsIcwXIscZhp
 idG42pxAcsXScKM56oQWVv/J+Ja/IGIbdgifH2wcEdQblfaiHUFxQ0kTWQTYfHr23G37
 7wBw==
X-Gm-Message-State: ABuFfohvnSFL0j6aB8LJyqJ56P8vvzt1GuOz9vhIMq4OP5nWDgdx1D7s
 iixH0+zJUDHYp/7KapUvJYU=
X-Google-Smtp-Source: ACcGV628VDBqJqaUuX9jA+nCw06oyh4oWndKWFzmrNIwVnS6tgdzbemIfnsQK28A0oL2D46u/AwtgQ==
X-Received: by 2002:a63:cf0e:: with SMTP id
 j14-v6mr13367379pgg.195.1538470761959; 
 Tue, 02 Oct 2018 01:59:21 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id 62-v6sm5057927pgc.58.2018.10.02.01.59.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 01:59:21 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v3 0/5] Fix some bugs on RV32 build fail and issue
Date: Tue,  2 Oct 2018 16:52:26 +0800
Message-Id: <cover.1538387524.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_015933_523509_C823E26A 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002085226.Vzxrc7KluAUulSdPa2pgeIJLFG5SlRqS8R7A054jPG8@z>

This patches contain the modificaion as follows:
1. Fix up the building fail on RV32.
2. Add umoddi3 and udivmoddi4 functions for RV32.
3. Fix ioremap problem on RV32.

Changes in v3:
 - Change the copyright notices to GPLv2 from  gcc 4.2.1.

Changes in v2:
 - Retain the copyright notices from libgcc in umoddi3.c and udivmoddi4.c.

Vincent Chen (1):
  RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap

Zong Li (4):
  RISC-V: Build tishift only on 64-bit
  RISC-V: Use swiotlb on RV64 only
  lib: Add umoddi3 and udivmoddi4 of GCC library routines
  RISC-V: Select GENERIC_LIB_UMODDI3 on RV32

 arch/riscv/Kconfig        |   1 +
 arch/riscv/kernel/setup.c |   3 +
 arch/riscv/lib/Makefile   |   3 +-
 arch/riscv/mm/ioremap.c   |   2 +-
 lib/Kconfig               |   3 +
 lib/Makefile              |   1 +
 lib/udivmoddi4.c          | 310 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/umoddi3.c             |  32 +++++
 8 files changed, 353 insertions(+), 2 deletions(-)
 create mode 100644 lib/udivmoddi4.c
 create mode 100644 lib/umoddi3.c

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
