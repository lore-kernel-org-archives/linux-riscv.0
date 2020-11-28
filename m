Return-Path: <SRS0=R+Zt=FC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C825BC63777
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2020 23:01:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F137A20809
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2020 23:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VCC+U6XK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="dLnnhRRr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F137A20809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PRRvzD9IudumuRajL4ufev8I0PGOSCOwK8ez5SX54Eg=; b=VCC+U6XKr7akE7zd0SWZblB63N
	TLDh+gtQkV3mi9vDvbj4vo2JITNEHvyqHN4TRL42fjxrKS34ajak81V7XEmGqlM0gQ8x2MJErsPJN
	AiDIc2hWLbnWf6SQrK0z2CLH9kd5BkO/axwSiKzRO+n3MqHWrmFoioQuVyW5a6Iw0xfMbN8yXpbWy
	6rs+AJ3j9LUSVHUv64oMmtfABA4vwdjABVzx/Ei2IegXcDnMj0/b8OCoTKcjWE095IY1TWlRFIFxN
	W4N4JeZ8axfva4r1AYItr575Bb+w+yqYTA5mnS6BMIvYd7IEYAvbPs5NM2AI9505HCK4z2beO6WyY
	sJwKFfXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj9DB-0003VJ-H0; Sat, 28 Nov 2020 23:01:01 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj9D6-0003Up-Gb
 for linux-riscv@lists.infradead.org; Sat, 28 Nov 2020 23:00:58 +0000
Received: by mail-pl1-x642.google.com with SMTP id t18so4446251plo.0
 for <linux-riscv@lists.infradead.org>; Sat, 28 Nov 2020 15:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=bYGsECF90NImwkerygnoxQ6S7S+NIVHNiaB71IEALrI=;
 b=dLnnhRRrnb2fDKTKpUfA/12JuXtrM/C1zinrFTvi2DII2tNex1zZ6Y2bII5zhyPI8v
 U99DCa11cDzk7RASpv7aqa1170YvejEcV5gbygzdDq246Z8ya62JyjMWMNVsY3US2o1d
 DE8Oy1MFisSTaH++EQC/zSg18ARRhKCtsOIS2deh2mV4W1u47JirnT+DVsakH/UXIkgH
 wy4fZaSt821xjrViOJQl4gcPqkTOwFpx8ZBPt4fExavMQxp3RTSmarT6aWt1m5GNJDGw
 gMKTfTd7eV2wPij0OEhCuAhyxGmhZyupTmi62WhAbw6izy9vGUxC7ycdq/5JRwvcZHiL
 gTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=bYGsECF90NImwkerygnoxQ6S7S+NIVHNiaB71IEALrI=;
 b=XjnKDlawfYq+uMuC0FSa1Gz6/VVVL6WWEbbEFJdM8MRjcF3PW9BqTU/axm3RqqRi1H
 mkcLVyeoUhZ79rbw9/rokd1N9pwFZzYzzPqsj7dEyj1sP9k/b7p1Pt8xk2leQS4f3v7f
 V8LT6FAKlPIc8VTjLOhUGfR+PkiGtjeC6atrEoE2wKloZq05O/90T0jWzNksh8DDIfhw
 1TxdtJDcPDFVpkcvTZafwLAqnZqf6TwHysuUZoYvgY9rmCOKY0P0wqP5vYMU+0dgBTBF
 weX7ieeQ1Je4kyCGjndkQpDk1ur3o+k2G9dxHH8SWzKbrMgPijLHGH9thXBq3d/0kfnj
 v1Eg==
X-Gm-Message-State: AOAM533+mzVGB/RvGAxlEPQNAsFd/TcxXlctY5oO/xZv35cvjUTlObK/
 Sw3hgltvesVuE+rfuI6FnlQgsEZprORSLSEA
X-Google-Smtp-Source: ABdhPJyE/PRMJZpe9/YTUcQ9LwvZQrK/TOgHvGU7WipqPz6+HJ4UDhQxgUlWK1BXM/0c1dml/q9lLA==
X-Received: by 2002:a17:902:7b90:b029:d6:ad06:d4c0 with SMTP id
 w16-20020a1709027b90b02900d6ad06d4c0mr12822055pll.35.1606604447877; 
 Sat, 28 Nov 2020 15:00:47 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m3sm9666826pgh.5.2020.11.28.15.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 15:00:47 -0800 (PST)
Date: Sat, 28 Nov 2020 15:00:47 -0800 (PST)
X-Google-Original-Date: Sat, 28 Nov 2020 15:00:45 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.10-rc6
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-a86b7c3c-7719-48e7-b6b3-5d7ec6b8933d@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_180056_753488_9CD19F69 
X-CRM114-Status: GOOD (  13.88  )
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

The following changes since commit 418baf2c28f3473039f2f7377760bd8f6897ae18:

  Linux 5.10-rc5 (2020-11-22 15:36:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-rc6

for you to fetch changes up to 30aca1bacb398dec6c1ed5eeca33f355bd7b6203:

  RISC-V: fix barrier() use in <vdso/processor.h> (2020-11-25 09:44:27 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.10-rc6

I've collected a handful of fixes over the past few weeks:

* A fix to un-break the build-id argument to the vDSO build, which is necessary
  for the LLVM linker.
* A fix to initialize the jump label subsystem, without which it (and all the
  stuff that uses it) doesn't actually function.
* A fix to include <asm/barrier.h> from <vdso/processor.h>, without which some
  drivers won't compile.

I know it's the holidays, but I had some hiccups getting this tested earlier
this week so it's just going out now.  None of these are tremendously urgent,
so if they don't make rc6 it's not a big deal.  I'll have some more fixes
coming next week either way.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Add missing jump label initialization

Nathan Chancellor (1):
      riscv: Explicitly specify the build id style in vDSO Makefile again

Randy Dunlap (1):
      RISC-V: fix barrier() use in <vdso/processor.h>

 arch/riscv/include/asm/vdso/processor.h | 2 ++
 arch/riscv/kernel/setup.c               | 1 +
 arch/riscv/kernel/vdso/Makefile         | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
