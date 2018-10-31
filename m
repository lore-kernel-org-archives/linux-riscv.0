Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4D0ECDE46
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 23:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95FF520664
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 23:07:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R5EEKuXK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HUSUWcyO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95FF520664
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R6Bh29C8x8TqImieZRExqYgumNTN4h4GRItTlGRnF+c=; b=R5EEKuXKjn02Y1
	lAL7B1ucUVxkgnTzG4jChhm6rDErN428oR/iqe0dk3aM/lfY6lYp20Us/mzsQa10ZvQ5rGIUHNZL5
	o1ax6iC24ns13KDFCRlxkjTM0oD3XYwBL0hVqY6G+tCzUsXnDDBSyd7kKHExDkz5/CkxX9w9pBmzQ
	ljhNYUIIwgsbvhu1IoDJ7+APX38YI533AsP6sPaO8StSbgypFkzjYwHecTEfwbTVmel/litV2T5TA
	GS1STDdtHyKDQGpqaRCGcAyq+5sQiuugj8L7u159othns3YfJiYDgYiDqphLlIvqSIxp9H9ECH8yo
	DXoiKU+FCwqFfNXhAnbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHzaB-0002dc-Ho; Wed, 31 Oct 2018 23:07:27 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHza9-0002as-KF
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 23:07:27 +0000
Received: by mail-pg1-x541.google.com with SMTP id c10-v6so8084855pgq.4
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 16:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=taxbZLCJehS6KXdYbTRFCpaWx1QA6noR3r+ATRV96No=;
 b=HUSUWcyOf2qeYvt+325vt07Zwer09etmhSbPJMZSfHPLyT0xlH9O7VAEALUOh434PP
 /Zco+y8vehgkxNfxWt+ob9s2mZgMGbNszzjULekfLRxEo6E6xPiiNXp3LCW196TRQ4kO
 BmfZ4og379Huq91AE42k9jZEGJiHeZlhfMnjVKwOp31BgMwXbZHDDSftsg4HHosdmo6/
 GwKDzCGWfCs6vft3J15qfNBceG2EHc+NHCnEbnZimZcUXcl3RdhZOElhRFgRqCUZFq65
 0lUtpmZxGu4tiwA+bLWwpnLmx7FKR2Oe3K+R6hV76A1FGF5IEGSuG1OFzq5h5LL48O1D
 fpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=taxbZLCJehS6KXdYbTRFCpaWx1QA6noR3r+ATRV96No=;
 b=aRHqPnyngWkTYOkl83w7lrjL5LRw5eAemIAkFE1mzwvtdkSbjlyLCjOnaM5hf15I5m
 3vQe4ou1w1sAo5dch3aQwJXDan8McNAZCETdEHUrMerzMD9n52oi5UcSN7k+Pi393Leq
 tP2vcRRU/zg1/wG5GMhLavrCZQxEXWBdd0BrvMHoPU9djoTUg9LxwWhaXPQI6Dc8CoiQ
 7vjgPel21F1wi1J3t0VkC9Dau1NJ6YPhR9ZiPjpx+8HXSrFgHmfwayx/XUHuTc6yg5RF
 1anXLpYAhTWscA0ikLHjOpUdPUvf7VjtqGwiRnp0XdIh3UZtQkiJugz4KoejJZVWbWpt
 X6pw==
X-Gm-Message-State: AGRZ1gIBzV7GRfHzRUOQQBWTehcejSC4l62xtprLGuhHZ0thWN6KALhx
 sMt7qbr0oPfA/g1/bALBxpafhIOiNko=
X-Google-Smtp-Source: AJdET5cKmvN85ghIyrTumOyLVVuMKVBpw0c7DIdYFPoggROTIlRu5yLG5k86he6l0hI/CYdKHzdGtw==
X-Received: by 2002:a62:dbc6:: with SMTP id
 f189-v6mr5330004pfg.130.1541027234241; 
 Wed, 31 Oct 2018 16:07:14 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id o195-v6sm12075490pfg.112.2018.10.31.16.07.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Oct 2018 16:07:13 -0700 (PDT)
Date: Wed, 31 Oct 2018 16:07:13 -0700 (PDT)
X-Google-Original-Date: Wed, 31 Oct 2018 16:07:06 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 2 v2
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-ddfcf75a-ffa5-43b1-a785-23da232023ad@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_160725_676861_53A99E60 
X-CRM114-Status: GOOD (  17.29  )
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
Message-ID: <20181031230713.jJNeS3ZZDrVlwrj-jtM1vQbqSM91e_w4lNGdd9k_zqg@z>

The following changes since commit d26c4bbf992463c043fdee4b3e5efa3f08990862:

  RISC-V: SMP cleanup and new features (2018-10-22 17:41:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-mw2

for you to fetch changes up to ef70696a63c773280ef46f5764a6cda39ef2f383:

  lib: Remove umoddi3 and udivmoddi4 (2018-10-31 12:13:54 -0700)

----------------------------------------------------------------
RISC-V Patches for the 4.20 Merge Window, Part 2 v2

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

I don't anticipate any more patch sets for the merge window.

Changes since v1:

* Use a consistent base to merge from so the history isn't a mess.

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
