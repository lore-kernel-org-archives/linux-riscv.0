Return-Path: <SRS0=/fWr=LN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67615C2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 15:43:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F9B1610CC
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 15:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F9B1610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tMuaad74WK9XDGSeY+t4GvXY5QvLeY0UZCx1mRAnAN4=; b=j2SfP/7Xs/4JQn
	uXsvlYu88h+r27721E/FeA6YSU1YaT1X2EM4bHluan6GjbGYHmqFJGJjBRIO43wVZqTtUkpkr20j1
	S+hXBV7PyTQrZcjsih42ctTCHwq2RPJZy7wxmaSu4SOdxp7e2UL5EVd0ptbvIviBMFoXOq26lu4wK
	AUAEP3UJ9A293y6ZNlu+GXV3Y5wpyoLTS0i6r44HW6wzlU3sK5/f9w15SxydiQfm3v4nXzLeDbfFl
	IDw8TH5GFydETbLH2Zln0fzNkuOxoyZZlB64sf+N/w2BHGNZ7aYcTrIgivtxGjaruoq1Ih4lTs4hK
	AAmotwT//0lzVhB3WrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lud7f-00HDfm-J5; Sat, 19 Jun 2021 15:43:03 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lud7c-00HDfO-U9
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 15:43:02 +0000
Received: by mail-pg1-x530.google.com with SMTP id v7so10411405pgl.2
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jun 2021 08:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=WLt1aypUZFf0uLl5W0e4Cbr/bbAeIOctJoAlWFkvXzE=;
 b=gRPyoOYcDOFA7sfIDglnW7bevnFKWvhANMc+VSUN47ht8jV5axsiaZLo3NeGx74sT5
 xO7oezOz14Ryt2FjqAcHB0y3hr0Lw5VORWn8EN1AcKdTju2hatrFenYVglOPvyu0sS7X
 HKPqxcARMBYSqc6H+PpG6/TNGM0UAcbAoLPBkOVU6kBc3AL5vadpN0QOLxBkPNAwdcM5
 bZeqOUE57M6dZ80NjlS5aqGNZWpRdYukOZ2i75zJV85TAP0W/zmL9XmS93BDnEcZxGK0
 oGOr7hH6v9lDHTKmdiXpvAt6GNf/LSLPHCDiIn+/uAV55UNUXzl3v//8xqeyOOJuwLyu
 EgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=WLt1aypUZFf0uLl5W0e4Cbr/bbAeIOctJoAlWFkvXzE=;
 b=GKOdIKAWcQ3I8yBUer11wo77/Ddj+3sx82JpaZ3Em0f2fBue4f2YN70QNBFtRViog1
 SCexYrBFi1Vc8sJO+Y4JcPMvYX6bnxeP+H5CF/no+8EjXaLtd2qIpfvg2//LOQ4FDDeO
 Ujbhi0TQJye5rZq9XJ8lmh0KDHqzQ0GLkQBEVhMHQhs5qNTBLO2OXrO0IlGvooYP0PT8
 THic+ptpgJDhX0UztCFx6E9Q3e3BvK8Eg08/UOF2kNrNvF12ci6kS2r5SgD6f6TMpVgF
 65tACM6fjSd5+iZUUZsxPNAeqDGmbT8wC80uYwC4ENJK0vVrVovDxjvaGEjxRcCvvHlX
 EfxA==
X-Gm-Message-State: AOAM533OXRtTKaoSgeyA9S1gqQdsa2dQkToC/qf8sNZjM8H3SUTRGCaX
 JVyyUrBACUA+MmBfwB9fAEe3XeQ8ISy8NY8n
X-Google-Smtp-Source: ABdhPJxA5FqeHFXUxAEAo2KZ9LrRDtalHguaHloHVDHAy7YM08UWIt6KnFzONUH5FP+Bje9Tkgga3Q==
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr11021738pfh.73.1624117379725; 
 Sat, 19 Jun 2021 08:42:59 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 10sm8352494pfh.174.2021.06.19.08.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 08:42:59 -0700 (PDT)
Date: Sat, 19 Jun 2021 08:42:59 -0700 (PDT)
X-Google-Original-Date: Sat, 19 Jun 2021 08:42:55 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.13-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-768bd541-d21a-4a3e-9c92-da08277ab3ba@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_084301_067109_9A2F2ABC 
X-CRM114-Status: GOOD (  10.58  )
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

The following changes since commit 0ddd7eaffa644baa78e247bbd220ab7195b1eed6:

  riscv: Fix BUILTIN_DTB for sifive and microchip soc (2021-06-11 21:07:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-rc7

for you to fetch changes up to 7ede12b01b59dc67bef2e2035297dd2da5bfe427:

  riscv: dts: fu740: fix cache-controller interrupts (2021-06-19 00:11:53 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.13-rc7

* A build fix to always build modules with the medany code model, as
  the module loader doesn't support medlow.
* A Kconfig warning fix for the SiFive errata.
* A pair of fixes that for regressions to the recent memory layout
  changes.
* A fix for the FU740 device tree.

----------------------------------------------------------------
David Abdurachmanov (1):
      riscv: dts: fu740: fix cache-controller interrupts

Jisheng Zhang (2):
      riscv: kasan: Fix MODULES_VADDR evaluation due to local variables' name
      riscv: Ensure BPF_JIT_REGION_START aligned with PMD size

Khem Raj (1):
      riscv32: Use medany C model for modules

Randy Dunlap (1):
      riscv: sifive: fix Kconfig errata warning

 Documentation/riscv/vm-layout.rst          |  4 ++--
 arch/riscv/Kconfig.socs                    |  1 +
 arch/riscv/Makefile                        |  2 +-
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi |  2 +-
 arch/riscv/include/asm/pgtable.h           |  5 ++---
 arch/riscv/mm/kasan_init.c                 | 10 +++++-----
 6 files changed, 12 insertions(+), 12 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
