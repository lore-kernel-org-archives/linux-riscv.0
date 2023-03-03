Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA113C678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oGlK72kT12ENOye+S45l7cwZCcekfHb3kCCbtp84eMg=; b=x2k
	RsQrvkzMtl1ZVMeBE4Z3vg4gfGcKyoojvs/N0vkB5R8k+BmLoFD7hmisDJAEgsyqh84Tnl+DtG1pa
	tGV0gS2hH+jIv6cipF3FP7gst+iDeg+a0rdPycP5MWH9f9U5OIVnVh1G5Z1BC2FtCzPeb693DMq74
	C9GR1ubIv3mjmlftZpSQPxsIlsat/VsnMvtsbrxtNAjlI6dyI48iJYIVZLX+wXvBbgoAxUYv7xMPo
	o/Xti/iZch9zjbplrlleEl5atf9GYGwoj1zHAhyoEWeCMRgtXqmlJmIZKwNnNNq5oKcNknYcUr6OT
	p6aEAraaEe2eYOhZ6+8EalWkpUICVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1kA-005kmz-EH; Fri, 03 Mar 2023 09:30:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY1cH-005eiF-33
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 09:22:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id a2so2084138plm.4
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 01:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677835331;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gstt+n0gCQKeffrpPBhAfFrZ9VxfVRPA9JoQZ/jtG04=;
        b=HdZXRHvCHR/TSxGMJITFUNA38SEYISysqtDu4UIgHaR/cs8nUNFGt00X/+Z+ta4AXh
         gFJZCJuS12ddakhhY8CN+GtMfSQ/KOgzPhye8iMY8YjwNBvv/WS9LP9nJEhi2SzxVeSQ
         ucAnFUtAn9StuyWkFs3bd7ortPHgzsnsKoc8Vhlm1JT3Lv3XrWqS21/SZKdiqWGDCTUK
         K6dqqltPo6S2lRXNx8CFcnttt0o+Gp0/g7FdFwtZC0bogyNTN0TZ0JHp10FLVx4FspFq
         k02dY+JMsBJBrC1aS6ZMP9oNEHjFHidIabzkZZlRiKN+LTiJ85IUCzJ+Zfqfq0ZMppQM
         JYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677835331;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gstt+n0gCQKeffrpPBhAfFrZ9VxfVRPA9JoQZ/jtG04=;
        b=YpKbuywl4ywTOoCJoPImGE02WP/4dwQcdKv7ad5K/RDvW7SUVcLbYqg+i0vZT/rlOy
         G6r6lku6nibUaVP5A0PAqlayBNzheQ5Yd4L4u3Rum01mQPqFxalvg/ow/XIpSnZtgykh
         2DVaimDpZSP4u8LGEoXmU0w1xxl8Sx8xizGvsZlowDMTzwnk3Pqxj4myyKcW2dEXGVum
         NqUi3g0bQwHP2K+uyWiPDCTCkvUUaekxEv55O16AXcmKcmpXpmBYIoRn4dGibG9aBCmc
         agsa1sXPG0FhyHOnSPQ5s5d5r7fDJagdr2NigvVZoyEljq1cKc0cTE5zpR929EGmNSm+
         CQhw==
X-Gm-Message-State: AO0yUKUlzp1DI4g/9TydEgkSQFd3ws9/y1dJqh75eaUbi2sm+xdsM9Xz
	fpfQWEGRLCUIuIa8yzi5uo8pb+9BWxwlvr8n
X-Google-Smtp-Source: AK7set/aSyGLKdJb8hYj08rU2sX4fP4u4hiIcjstljxBqnQReD/ETGqE+QcTJ80syGSpbfNj+ErJYA==
X-Received: by 2002:a17:90b:3b4f:b0:237:5dc6:ce14 with SMTP id ot15-20020a17090b3b4f00b002375dc6ce14mr1001648pjb.7.1677835331485;
        Fri, 03 Mar 2023 01:22:11 -0800 (PST)
Received: from localhost ([135.180.224.71])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090ad38900b00233ebcb52a6sm2929885pju.36.2023.03.03.01.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 01:22:11 -0800 (PST)
Date: Fri, 03 Mar 2023 01:22:11 -0800 (PST)
X-Google-Original-Date: Fri, 03 Mar 2023 01:21:35 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 6.3 Merge Window, Part 2
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-030bb7f3-2a9b-4061-8f41-e3e20c9b1671@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_012217_179897_793D6607 
X-CRM114-Status: GOOD (  11.17  )
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
Content-Type: multipart/mixed; boundary="===============5183324020398616245=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5183324020398616245==
Content-Type: text/plain

merged tag 'riscv-for-linus-6.3-mw1'
The following changes since commit 01687e7c935ef70eca69ea2d468020bc93e898dc:

  Merge tag 'riscv-for-linus-6.3-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2023-02-25 11:14:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-mw2

for you to fetch changes up to 61fc1ee8be26bc192d691932b0a67eabee45d12f:

  riscv: Bump COMMAND_LINE_SIZE value to 1024 (2023-03-01 18:35:43 -0800)

----------------------------------------------------------------
RISC-V Patches for the 6.3 Merge Window, Part 2

* Some cleanups and fixes for the Zbb-optimized string routines.
* Support for custom (vendor or implementation defined) perf events.
* COMMAND_LINE_SIZE has been increased to 1024.

----------------------------------------------------------------
This is very small for a second week's merge window for me.  That's actually
been a goal of mine for a while now.  I'd love to say it's because everything
went smoothly, but it's actually because the bigger bits I tried to pick up
this week was sufficiently broken that it just didn't come together.  Maybe
that's because we've got a lot more testing and review these days, or maybe
it's because there's enough other stuff going on that things just couldn't get
fixed up in time.

Either way, this should make for a pleasantly calm Friday in RISC-V land.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Bump COMMAND_LINE_SIZE value to 1024

Björn Töpel (1):
      riscv, lib: Fix Zbb strncmp

Heiko Stuebner (1):
      RISC-V: improve string-function assembly

Mayuresh Chitale (1):
      drivers/perf: RISC-V: Allow programming custom firmware events

 arch/riscv/include/uapi/asm/setup.h |  8 ++++++++
 arch/riscv/lib/strcmp.S             |  6 ++++--
 arch/riscv/lib/strlen.S             | 10 +++++-----
 arch/riscv/lib/strncmp.S            | 20 ++++++++++----------
 drivers/perf/riscv_pmu_sbi.c        |  7 ++-----
 5 files changed, 29 insertions(+), 22 deletions(-)
 create mode 100644 arch/riscv/include/uapi/asm/setup.h


--===============5183324020398616245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5183324020398616245==--
