Return-Path: <SRS0=rRaS=NZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3E8C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 22:36:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD19208E7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 22:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHfVaEm6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DBOPArhy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DD19208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L1IhlibTqqGmuVQXhyhNcjUyAxZhvpNpFwgPql90S2o=; b=IHfVaEm6Xhy2fg
	AR3yDcaqZSbUUXB5Y9Lu4/CJ7XUcJVIY28VEB2OC4VXOkeH9Li6BJHLNURY7OntoZPMibFkct6Qcm
	T+jbvzjRjleIwPIsJycERefGQGuzFB9j7AbcI9r269F8xxjeEkb4DP+ImhUJEUWJkh5hE2SFDrHze
	iUY7GbwFIvKCHefj+NmXcJpomUjBoAsRSOshAyKIlhdOqVL3WLifHCAnhd4CwjVdF3o23Q/BjzE5z
	JzK8ts97y6wU/eKbiqvV8RVYNdtWls/iqP3BISn+x0s6PBgmAWMCWjxt4rjiPfFOajR0RN5LwEdZ+
	oDCJf1yxCQw6Q7X2zLEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gN3lZ-0000AM-0l; Wed, 14 Nov 2018 22:36:09 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN3lW-00008z-CD
 for linux-riscv@lists.infradead.org; Wed, 14 Nov 2018 22:36:07 +0000
Received: by mail-pf1-x442.google.com with SMTP id e22-v6so8618644pfn.8
 for <linux-riscv@lists.infradead.org>; Wed, 14 Nov 2018 14:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=9Dp7WGU2YOFNh5xvbP6+9+Ra/pBeP8yaU+pKqramhNI=;
 b=DBOPArhyPSaJhy2iJ6bAn+MMW2bXNb2HFXrlV5zB/aws8Uym4xvSpZmINA9HWSInMK
 k3oX5b4Lvc/Ro5A82JdHigmeHli6Uxp+pYgswjSTkUsph1ATPVb2boSvUi4x+9SD3z+0
 iXKY9robdGWxntYLIUk0UTl1UXgBDSUETw0bjuPV6pYYNwCGD8VHOu2CZUtRxt4M1fga
 lZf3PBtmwnmJkhHyk3DObzgnjvpjP8PSt5UC8zGLVkxf5h0MIplBzJ+qdFLEh/EwPbTT
 paHWzOFCsqFdGtys6Md4oMee7qe13g3W0tlJTm6vxHQre9M4skZC0u91qtrqIymJmP7D
 MY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=9Dp7WGU2YOFNh5xvbP6+9+Ra/pBeP8yaU+pKqramhNI=;
 b=DwZkpAhe65/EJ6j5jWuwTWYNiv/gOl2Hxlj4ansOdOWKO2NQV4pjVDKjB/QAgrt4io
 HJKSCia7cF4G5NUb1VJb8eJ01quiIV+1A3RwmETv/5Lskkkc/O7uTkNhtdahshg0rP62
 UvXmdnR4Oi0sR0jFymqpGqRYRb3CUqLpHpnRWVnh6iiIdy4kGGe1hXjjfRRquGONJ43I
 psJCxmNThVReIe6Zpu//hRCqvAuTbLUunrOQEZBqJ7TW3vnkYcg3VZXxyI8hTr4AC6HL
 iJnow73cCUkdPFd9ltXAqEPPJ/3+VFLko7EDGS79HB2FB8CT36q4CHagEW9kX88Y4rA1
 AOKA==
X-Gm-Message-State: AGRZ1gK5uYoGhSKeqyRRfK21GgLtuci6TD+m969Ti9jLNkKpnq66V59+
 fscaMljY0BxboRMUzVUBal4DmXDya6hLoQ==
X-Google-Smtp-Source: AJdET5fy1q78lo1m59VihoFp762iThHb9oY4kw4v7ey3cniQkkjmDQBFnamO5Sl9Y0tP4iC9AaT80w==
X-Received: by 2002:a65:434d:: with SMTP id k13mr3493264pgq.269.1542234955220; 
 Wed, 14 Nov 2018 14:35:55 -0800 (PST)
Received: from localhost ([64.114.255.97])
 by smtp.gmail.com with ESMTPSA id h10sm23549852pgn.11.2018.11.14.14.35.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Nov 2018 14:35:54 -0800 (PST)
Date: Wed, 14 Nov 2018 14:35:54 -0800 (PST)
X-Google-Original-Date: Wed, 14 Nov 2018 14:35:38 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for 4.20-rc2
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-abc25686-4eaa-4d2a-bb97-2306b418b9fe@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181114_143606_465987_AF3E260C 
X-CRM114-Status: GOOD (  12.11  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181114223554.TizWgjmiuu5ejbedIgN255mNFAKUo3zuNG_V7JAg-Gg@z>

The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-rc2

for you to fetch changes up to ef3a61406618291c46da168ff91acaa28d85944c:

  RISC-V: Silence some module warnings on 32-bit (2018-11-12 18:12:24 -0800)

----------------------------------------------------------------
RISC-V Patches for 4.20-rc2

This pull request contains a for unrelated patches that fix various
issues in the RISC-V port:

* A patch that enables printk timestamps in the RISC-V defconfig.
* A whitespace fix to "struct pt_regs".
* A patch that adds a "vdso_install" target for RISC-V.
* A pair of build fixes: one to fix a typo in our makefile, and one to
  clean up some warnings.

There will probably be more patches from us for 4.20, but I don't have
anything that's ready to go right now so I'm going to hold off a bit.
Right now the only concrete thing I know I want to make sure gets sorted
out is our 32-bit stat interface, which I don't want sitting in limbo
for another cycle as we have to get RV32I glibc done.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: defconfig: Enable printk timestamps

David Abdurachmanov (2):
      riscv: fix spacing in struct pt_regs
      riscv: add missing vdso_install target

Olof Johansson (2):
      RISC-V: lib: Fix build error for 64-bit
      RISC-V: Silence some module warnings on 32-bit

 arch/riscv/Makefile             |  4 ++++
 arch/riscv/configs/defconfig    |  1 +
 arch/riscv/include/asm/ptrace.h |  4 ++--
 arch/riscv/kernel/module.c      | 12 ++++++------
 arch/riscv/lib/Makefile         |  2 +-
 5 files changed, 14 insertions(+), 9 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
