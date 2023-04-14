Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF8BC77B72
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+BIHhGU0THgYPLrFJm+lE/0l/wOTn40SzCcZikLL/Ok=; b=r8Tr+Wlr5Xato9
	nZHpRAXArRWb4U0YeDOAVcPoEpWazonWyNVchH8Wslrdd+ObcoK8c1pIKzo/TXV4jRyWcva/w4cR0
	pB2DOy/eyOqQjNpwS5hvZl/Umqd0QzblF1D965gEENGUPzcWBLvz7lbk/VGpm4KOVOpvWGi++4giW
	gnFxghadwcFfm+TnjSGDma3iHuMD/YmCYdJRoS3bU1D2jeYoVshXWjVoGarkZyqksj6RLzibRtGGM
	V3/KTQJfHhpACfuQw+Vbq3iK378e7fmp8Y640XhOYFUnU4nma7/R5BA+PUGHHnFiUDjfCXBPG13Me
	P9y48N0ZO6s35ePuqcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnKi7-009roQ-00;
	Fri, 14 Apr 2023 14:47:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnKi1-009rnj-1e
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 14:47:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id c3so19462780pjg.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681483648; x=1684075648;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZbO6NJvOaVKStbJdlSYehHBXU3D/5oXOhDJfErNUXU=;
        b=B2OR8p6sMCHYYYNwmlX2klbKphFqo/sC0AVIJ8XuBRD7NXow4x7Pa6OoQaWnDubodt
         aKFeUXCKIXaWRFDkkz8ccltI1xXH0EwRonQ3sBao8ytBQ8QYwnVvOPwYSJIy1D2xf6S/
         7lOIIEVtHPKu1K920NXEmXQMzUkXdvIvMbEv+DVsG4Ix8UOww65npZVdjfqP70qHHAae
         JOzAK8/AVBT5l1QgtCYPU1wf8AqCc0P57bmF7Cjp3DonXZGPRAVc3aFM9P8FOkiFIAiB
         wzUeAOUnD8QEYtzoP0wyX/QL11RXxSQkpbb5f+AJ98elhvMVgNYZvXM6BbkGqXBL+S97
         xR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681483648; x=1684075648;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZbO6NJvOaVKStbJdlSYehHBXU3D/5oXOhDJfErNUXU=;
        b=HN9UYS+O2BFDgsNBCMsflnvqtWLG6CK4cWqWQ+8ZFR9hw/z+sGdOiJErA00C5fco7s
         P94eUko8JzF/iL+LTqP2yP0K0jkPMh6fVHMlNTYiOHnCfDxNf+p0fEQaNTgJOE5E4K2m
         WawaCAjWwj1Gb3ccPg/gCSwylFmEh3GBC8AefpT4vaF+nWsTJoz5a1rsRaub79CL1myP
         pRWj8OHHgevrOmOjXzHLQO2XVaJ/XV448HcVayRvz488U/J0gVa67yJHOR4DdBoVqmTJ
         +1VmbGOAOiyVzQoJN3KO6Aj9+JBHBxcFe5FKMlaRICreKJJ9iP27A69tIEOBA9sirG5X
         rAnQ==
X-Gm-Message-State: AAQBX9c1PMcrKzYj7sUnWuQ/lConoShp1dO5Ubaw0kCgPi+Bp6pQIOWZ
	4/r7UWI49OhdlamrrS9eYUEq58HODJvlQ0FOIE0=
X-Google-Smtp-Source: AKy350YmRtd9NZMIKh9Bj3HvlXdM2jGfwYuKLX51qEHSQC0AHcCDL/gTNhbRnWCQZnk7w1S/VOOgLA==
X-Received: by 2002:a05:6a20:748b:b0:ee:a720:c721 with SMTP id p11-20020a056a20748b00b000eea720c721mr153368pzd.16.1681483647731;
        Fri, 14 Apr 2023 07:47:27 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id u13-20020aa7848d000000b0063b212638bdsm3111076pfn.220.2023.04.14.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 07:47:26 -0700 (PDT)
Date: Fri, 14 Apr 2023 07:47:26 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Apr 2023 07:45:54 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.3-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f47ee915-bbee-4c49-92ea-1d598355a0f3@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_074729_767506_195401C6 
X-CRM114-Status: UNSURE (   6.92  )
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

The following changes since commit 4622f159098e098611f393cccf73d52b007e70bc:

  Merge patch series "RISC-V: Fixes for riscv_has_extension[un]likely()'s alternative dependency" (2023-03-29 12:23:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc7

for you to fetch changes up to 1b50f956c8fe9082bdee4a9cfd798149c52f7043:

  riscv: No need to relocate the dtb as it lies in the fixmap region (2023-04-13 18:14:40 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.3-rc7

* A fix for a missing fence when generating the NOMMU sigreturn
  trampoline.
* A set of fixes for early DTB handling of reserved memory nodes.

----------------------------------------------------------------
Alexandre Ghiti (3):
      riscv: Move early dtb mapping into the fixmap region
      riscv: Do not set initial_boot_params to the linear address of the dtb
      riscv: No need to relocate the dtb as it lies in the fixmap region

Mathis Salmen (1):
      riscv: add icache flush for nommu sigreturn trampoline

 Documentation/riscv/vm-layout.rst |  6 +--
 arch/riscv/include/asm/fixmap.h   |  8 ++++
 arch/riscv/include/asm/pgtable.h  |  8 +++-
 arch/riscv/kernel/setup.c         |  6 +--
 arch/riscv/kernel/signal.c        |  9 ++++-
 arch/riscv/mm/init.c              | 82 +++++++++++++++++----------------------
 6 files changed, 62 insertions(+), 57 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
