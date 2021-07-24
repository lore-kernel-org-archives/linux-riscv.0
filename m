Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDAAC4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 20:44:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE9E060E8C
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 20:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE9E060E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CBYOQVmH2kbqz1Loouh1GzaoFsK8FNu5QH7zkVhh8M=; b=ElBmEEVXo8UpAk
	l+Z34bGzb/8CLZsY76/mADkG4eDiosn2pGgBeo0fN4Di/gAnkIad3653PNdAmRgY44kd+ozPkOjpV
	McD2F6LuCfoU7hAh7vv9o5LzSgl5+lscUcQxbRr8qOGosBRdWbBrUiYKNGCAg8djgp9gH7ehfBlem
	YCVAy2fiV7n9bOHnLuHMooNBV3tPisTl6DAXV5B2kq0cRlXavdI5ocOpuuUCLzRcb9mfXWNqrdgiN
	f5/7B0BOWjg2xFtLVuUw2PPh0Osdq8P9IPnyGyXoKHKuWuVFjBTCbWQTiYSxA8h2S6F/EUeO1IOtW
	f6Ld6xgGyZg/TU8EzmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7OVD-007oEP-5C; Sat, 24 Jul 2021 20:44:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7OVA-007oE6-74
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 20:44:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id u8so7291498plr.1
 for <linux-riscv@lists.infradead.org>; Sat, 24 Jul 2021 13:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=fHIy9lbXbq0EmnYScsYc3vFgkMSvcm99KjgBrTvkyn0=;
 b=H3CGoVuCtjdwfAW606o7bV2y2BhORwoA13jObogqQSfUDRtr5fwzf/E+TmEpIIIgRZ
 ra3maKZ2KdoWHuQ57W3xIdeMipuGk27jYJz34mIkmZ/g7riZCHCYIEWg5K+2DKoF+o5T
 QvozPGtsBbJFY5zHfphpELhtamu0wkNyPHvMu+WgDPDo0HKrecpU/HQjIH8DYHpOmk2u
 dTJfNnYMusS3I7pasRuG/tcxgJl68WYjDmkkPKZjSw9Z8kKe1qHbv36xDnWyDQNQtXGd
 TGlo8zNCSXwX9FY2Hu+FQPPRRXp6nF5X104oficHDKMphOm7L9PQhNbJAyp190DKS/+M
 IgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=fHIy9lbXbq0EmnYScsYc3vFgkMSvcm99KjgBrTvkyn0=;
 b=uDuvvZeymF+LRFxjkQC+lcxfadb8jYozynkNhdaTwwgfeZgLAli2/FZOM8i8aDvPj3
 ZNmUd067gimjKBmVK5oHWimxknapgXeqqgbBaEMj2SNXAaSlysO/g/hdCwyOmNa+F5JE
 ZB+osbxmOgHaKEltSXTyfNYmsPr+aOvd+tkWUtAtkBWqyWQDY3LNmxcym1+tjTLISJ3D
 aiC2UAnzlqPOt9JWaWBh34wvPMC3sqXfheJnQgBUER7O6nWd1t39XKIZ/m4C/jOWpxP9
 uzbhFfK9AJoAk3EXvJwyUuX9IJ5ps5CYoOuf4Xz9pfvC5M05gyEFS/0w+WOL2U94OeHI
 BpBw==
X-Gm-Message-State: AOAM532GPaO+vGCTjzJxRckkYY/GC0tz/eDdYHoWHd6TyoHAfP5mMol3
 aO+W0zmXAMmPiRuNK8FFz5xbnWIn1gdBCQ==
X-Google-Smtp-Source: ABdhPJxkRP8dTyMihWOc+yCMatwPIuV/OqQ1vH8UmPqXdst02KAcWYVEld4KGK6M5R87WuR98uUuHg==
X-Received: by 2002:a17:90a:de11:: with SMTP id
 m17mr9949261pjv.5.1627159442791; 
 Sat, 24 Jul 2021 13:44:02 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d9sm30976770pgm.89.2021.07.24.13.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 13:44:02 -0700 (PDT)
Date: Sat, 24 Jul 2021 13:44:02 -0700 (PDT)
X-Google-Original-Date: Sat, 24 Jul 2021 13:43:59 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.13-rc3
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5cd676be-7ed7-48de-b740-0e809ae67a56@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_134404_296656_4FC75CA0 
X-CRM114-Status: GOOD (  14.44  )
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

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc3

for you to fetch changes up to ea196c548c0ac407afd31d142712b6da8bd00244:

  riscv: __asm_copy_to-from_user: Fix: Typos in comments (2021-07-23 17:49:12 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.13-rc3

* A fix to properly set the memory size, which fixes 32-bit systems.
* A fix to allow the initrd to load anywhere in memory, rather that
  restricting it to the first 256MiB.
* A fix for the mem= parameter on 64-bit systems, to properly account
  for the maximum supported memory now that the kernel is outside the
  linear map.
* A fix to avoid installing mappings into the last 4KiB of memory, which
  conflicts with error values.
* A fix to avoid the stack from being freed while it is being walked.
* A handful of fixes to the new copy to/from user routines.
---
There is one particularly odd bit in the history here: the fix for the 32-bit
boot failure is based on an older release, because a recent feature addition
also fixed the bug.  I wanted to take that patch so it could be backported to
stable, but it's erased by its own merge.  Not sure if there's a better way to
do this, but I figured this was saner than reverting the feature and then
bringing it back.

----------------------------------------------------------------
Akira Tsukamoto (4):
      riscv: __asm_copy_to-from_user: Fix: overrun copy
      riscv: __asm_copy_to-from_user: Fix: fail on RV32
      riscv: __asm_copy_to-from_user: Remove unnecessary size check
      riscv: __asm_copy_to-from_user: Fix: Typos in comments

Alexandre Ghiti (3):
      riscv: Fix memory_limit for 64-bit kernel
      riscv: Make sure the linear mapping does not use the kernel mapping
      riscv: Make sure the kernel mapping does not overlap with IS_ERR_VALUE

Bin Meng (1):
      riscv: Fix 32-bit RISC-V boot failure

Heinrich Schuchardt (1):
      RISC-V: load initrd wherever it fits into memory

Jisheng Zhang (1):
      riscv: stacktrace: pin the task's stack in get_wchan

Palmer Dabbelt (1):
      Merge remote-tracking branch 'riscv/riscv-fix-32bit' into fixes

 arch/riscv/include/asm/efi.h   |  4 ++--
 arch/riscv/kernel/stacktrace.c |  6 +++++-
 arch/riscv/lib/uaccess.S       | 27 +++++++++++++--------------
 arch/riscv/mm/init.c           | 32 ++++++++++++++++++++++++++++----
 4 files changed, 48 insertions(+), 21 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
