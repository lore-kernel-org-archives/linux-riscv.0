Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA22C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 23:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E2D2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 23:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Aflx/yBR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I0XBvPyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E2D2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:Subject:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ubeb4EM/+1YkWmfkAOY/e/RrUzQZQqC9D4IhnZg8JAs=; b=Aflx/yBRcV1xSu
	pJGtzjl/iQ1WX68kg+Kxl8G61DwaGHEwUk3WL+6dxMnBNab8A4kqTiT8r3ObYNMVQwb/cLpnPAM15
	dp/VVAhIbU0cZ+t+HOrRdJp3cFmDZQlrBd6DjZ4ou+lLVr1M2H791GYFdfpTNn2hXdx7rQt93doTU
	DG5C/fSWz17UQjzGo12oqPmalXiX9dsaPHZnmTPPNwnBpoU+67anSIUEyEUkDDw+v2wjC3Ohqxemp
	orM2T5LuxURzjZliVCz02rrILRak7jD1CWVgVqaTdA/75HVmjXnDRR8cPr1nWsUsL4rAA98CYM5IO
	x1JyjV4uHEl5/zKLs3UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHH7h-0007RI-9z; Mon, 29 Oct 2018 23:39:05 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHH7e-0007Qe-7U
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 23:39:03 +0000
Received: by mail-pl1-x643.google.com with SMTP id b5-v6so3952141pla.6
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 16:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id;
 bh=nZNkvQHIA868EkqOwx8U00gJefkBwV+3Go/e0SP1PpA=;
 b=I0XBvPyiyaiI18wM5WUDnC94+80d0vI8ZI396RkiLsaEmcI8QWLfv1R/ET6JRJ5FPw
 3T4m5wm97R36Iav2/v65cFpP1fZLf3d9xsCoc6pdoPlNn02eQe5NQ0kHsB9dJg5WHEYE
 Y+Z6sF72630hleWaF52Z36y16Vt4LRnG9T4dAXW42UtL7mnGcn4586vrR77qTXe8+tt7
 MO9RVLVebcHHA7DEwn4MpL55fAA3V6xsrdz5v91CvPfx2rKTRXssVJ427XnaVz4gTOsK
 kIQIT5NyMkE4uKHx1DQq27snebXkXZVc6N2cE6Hq2CPKXMukk1CQ5mNYdONjg5Yu9TVE
 Bpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id;
 bh=nZNkvQHIA868EkqOwx8U00gJefkBwV+3Go/e0SP1PpA=;
 b=qcGqcyMxYjIYQWkQG5745z2AJtvEHv/Iw+0HLLJvBBnjd2cLEE8Ld0ipF+dPoDiY/l
 FMgv4YJM4CWLsTXRfJ8ipW/aPInkLadVdeAjo9f6j2etvywbdWfnqZeS06tdLJUgh2Yb
 A77FkDfqKMZhGXcA9u1sjqcL6oTZGhWh+O68C14F2hQEakzyLPeMeL/aj9NkX2dXTlDx
 XKKtfb0kXiwQvxXC569c+Lpn3te0PeUDfUTVJ9RJwZLMvr4AHNd9+H/ZqIEgaZSWZWWc
 OyDX+k9iBmKLd5SRSRar45Sp4ECoyUbw2jt23APwhb167/Di43vMMk/7p+kVswlh62PO
 7QXQ==
X-Gm-Message-State: AGRZ1gIf48Epr/DDbv+MF8++Hp+mrKJBlZu3waudITWn6/Sm1aY5NOhO
 NaPUnMdhO5GSksZJSCe8iDESNvfHWAE=
X-Google-Smtp-Source: AJdET5fACjyMEdt+ufr/Wgifitu6sAE5A51ujXo2/fdw8RCWeqH+XsvUJDTodBd6mUdZcJwF1MZmIw==
X-Received: by 2002:a17:902:1122:: with SMTP id
 d31-v6mr14528365pla.259.1540856329697; 
 Mon, 29 Oct 2018 16:38:49 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y1-v6sm24189991pfy.89.2018.10.29.16.38.48
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Oct 2018 16:38:48 -0700 (PDT)
Date: Mon, 29 Oct 2018 16:38:48 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Oct 2018 16:38:46 PDT (-0700)
Subject: [PULL RFC] RISC-V Patches for the 4.20 Merge Window, Part 2
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-f2fd2f52-b083-43bf-9a83-0555b3cc587a@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_163902_279072_79C65687 
X-CRM114-Status: GOOD (  16.59  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029233848.-uphFMJjRHIyFl_j29Rqsi3FVYdTN46S-KVNtBEQnqw@z>

The following changes since commit 044ee890286153a1aefb40cb8b6659921aecb38b:

  HID: input: simplify/fix high-res scroll event handling (2018-10-29 11:25:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-mw1

for you to fetch changes up to 64f2e02ac123769a104f0040949450607f017951:

  lib: Remove umoddi3 and udivmoddi4 (2018-10-29 15:42:07 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.20 Merge Window, Part 2

This tag contains the follow-on patches I'd like to target for the 4.20
merge window.  I'm being somewhat conservative here, as while there are
a few patches on the mailing list that were posted early in the merge
window I'd like to let those bake for another round -- this was a fairly
big release as far as RISC-V is concerened, and we need to walk before
we can run.

As far as the patches that made it go:

* A patch to ignore offline CPUs when calculating AT_HWCAP.  This should
  fix GDB on the HiFive unleashed, which has an embedded core for hart
  0 which is exposed to Linux as an offline CPU.
* A move of EM_RISCV to elf-em.h, which is where it should have been to
  begin with.
* I've also removed the 64-bit divide routines.  I know I'm not really
  playing by my own rules here because I posted the patches this
  morning, but since they shouldn't be in the kernel I think it's better
  to err on the side of going too fast here.

I don't anticipate any more patch sets for the merge window,

----------------------------------------------------------------
Andreas Schwab (1):
      RISC-V: properly determine hardware caps

Palmer Dabbelt (4):
      Revert "RISC-V: Select GENERIC_LIB_UMODDI3 on RV32"
      Revert "lib: Add umoddi3 and udivmoddi4 of GCC library routines"
      Move EM_RISCV into elf-em.h
      lib: Remove umoddi3 and udivmoddi4

 arch/riscv/Kconfig             |   1 -
 arch/riscv/include/asm/elf.h   |   3 -
 arch/riscv/kernel/cpufeature.c |   8 +-
 include/uapi/linux/elf-em.h    |   1 +
 lib/Kconfig                    |   3 -
 lib/Makefile                   |   1 -
 lib/udivmoddi4.c               | 310 -----------------------------------------
 lib/umoddi3.c                  |  32 -----
 8 files changed, 6 insertions(+), 353 deletions(-)
 delete mode 100644 lib/udivmoddi4.c
 delete mode 100644 lib/umoddi3.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
