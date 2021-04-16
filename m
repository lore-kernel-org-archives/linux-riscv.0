Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8B0C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 16:58:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 854F160FF1
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 16:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 854F160FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qtsed2iZoJF4mlkz2O5ofcNGVURVk3cafrkzpuscJw4=; b=EQreeFVrS+gBzbURlTWDmPzOrj
	TERlLD2H4goON9FVL3+4PXCBAAmJiMDuMQVE+uiOe33wgbH8i0RYyABRCBnSmauS1D3Brz/vZ3+B4
	V/ijpbCAdTvHvkL7nK/iqry/jHCL/qWAyhN24hhJbqPzqZrq6ZCJJ5MNeZx03wLFAZoQqzviRT6iU
	U9Mr7KNPymVExQHkTGpmhzlexXM4+yoG7L6jsWiyUcdZL1nPar/6Uaqmiy5l5klFUcnQICUhoQchs
	UiFtHgk3maliJYelPVWrq1BYfbb4qllVfyOQHtYxDgZcLGmB13Y8AWdk0lLa+O3JwmQhnd/z6TZIz
	oS6OaZKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRn9-002snB-Er; Fri, 16 Apr 2021 16:58:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRn5-002smS-Sh
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 16:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:To:From:CC:Subject:Date:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=jlnVYfogtWdbo39k5goD819EtNYgqDDkFjjf5oM8VYo=; b=SuDfyeWXfwGVYo7aoidtWBHCYo
 N6Qu/SY3FjptSUx4PqD/yn+tk2m3psokM4jyFLsY4zoiZJobiMxlqFq8HHOOuoNlfBHVgxMlcnVuc
 in4y6Rp/fiaNurOt7d3nHt7jndKZmoHc8F9Eq87g404u43TtUQbtbZ/UXfS7dKkXBvyGBRDaeVneu
 zsxvFV8CUU7BSx8IQo1viCAJlWenM7iPBXLdATuEKC35p8xkxaWUBOrKtQ9iYfRVKwPGGSZwgvd7E
 sW35pdo6DnNOlOndMz0V34Gs8R6HcCvG8gkKYXF6ipcDcqtyE5xuk8Uk0J8+pf5X4RsbLXynV3lww
 U7mRgw+g==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRn0-009ZjG-Ap
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 16:57:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id c17so18738915pfn.6
 for <linux-riscv@lists.infradead.org>; Fri, 16 Apr 2021 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=jlnVYfogtWdbo39k5goD819EtNYgqDDkFjjf5oM8VYo=;
 b=Gft+H4TMqR1sH3N7TVJvohelrIifIsea+I17CuojrRcKktIh8GSxyk1b5g4+B8YEfs
 encgAqcZpdiXdYRvdSIQETgjJ7W6NE/4UEIX8jhwXJtqpPexgz0TDHJcAEIqflcr4U1V
 lVO+UL6DvR8Rm+kDG9gmo3Jr+nQ1qJqQd9t4dvSqQ8HgYXwbMGh8v+jL/xgzhxAJTLev
 6FyJtUdeDrRLbWIlEJleai4HSP/iu5ZAeouUHnVLkLI1DuzqMZQPM1MMt7pX4M1F8ivT
 TY2x3Cvu34gEENMrdUGfZDGII53Ie21r0vwWSUaOcqHNlBLPHC+9yQypNcF+et7rMp5f
 ar4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=jlnVYfogtWdbo39k5goD819EtNYgqDDkFjjf5oM8VYo=;
 b=lkmdQR76LttKu2XmavFtpgHF4hKCC6ckHzHgjrz9N+C/x9nCretoyDgrDWs3bA/SaX
 G0NcAWg0M89N9Ah37lVOP5o4EYpUQM4jIewVa30lzQCUbPJmZv64057jyA7rkEne+d7v
 mWdxON1NtenyqyINNyuvWYsd98JsJOxsky+Hn/4XWD9E+Gja1yq2CYZwVVNGb/SW9Yop
 gZaNhsoUp70OzyONbSV7EbORw72aDeLkMAFQzjwK4qdpUyTGkfM5U0r8vlnT5IzYoI77
 FT2Cx09Ru64AjG+JJczzp+JBGWEUmnaKo5XetJMzrmxuCOYmkHTHUSKOQTUiT1XrsIo/
 6d+A==
X-Gm-Message-State: AOAM533TWs1JN/FShLxiaxD24Ztq+v4LEXtsWg3WKv4BbBTAJ3l2giXU
 kCgN0GGMf9NLfQ8QtFdhlKUI7oVLgYaDpQ==
X-Google-Smtp-Source: ABdhPJwmHO0ap9Gb3O05B6W0Ze6a5pBvOka+XXKNfMCVq576k+Kb7TtJ8ufNe5ECT9C7jYf8NAYMbg==
X-Received: by 2002:a63:f258:: with SMTP id d24mr68955pgk.174.1618592273169;
 Fri, 16 Apr 2021 09:57:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e10sm5066020pfv.196.2021.04.16.09.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 09:57:52 -0700 (PDT)
Date: Fri, 16 Apr 2021 09:57:52 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Apr 2021 09:57:47 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.12-rc8 (or 5.12)
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-769b7cf7-7dfb-455a-9bb3-99f5cd952dbe@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_095754_388933_DDC99B25 
X-CRM114-Status: GOOD (  10.27  )
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

The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:

  Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.12-rc8

for you to fetch changes up to 7ae11635ec90072083503c6b6485cdffe46203b3:

  riscv: keep interrupts disabled for BREAKPOINT exception (2021-04-15 21:32:40 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.12-rc8 (or 5.12)

I have a handful of fixes that I'd like to target for 5.12, regardless
of whether there's an rc8 or not:

* A fix to properly select SPARSEMEM_STATIC on rv32.
* A handful of fixes to kprobes.

I don't generally like sending stuff this late, but these all seem
pretty safe.

----------------------------------------------------------------
Jisheng Zhang (3):
      riscv: add do_page_fault and do_trap_break into the kprobes blacklist
      riscv: kprobes/ftrace: Add recursion protection to the ftrace callback
      riscv: keep interrupts disabled for BREAKPOINT exception

Kefeng Wang (1):
      riscv: Fix spelling mistake "SPARSEMEM" to "SPARSMEM"

 arch/riscv/Kconfig                |  2 +-
 arch/riscv/kernel/entry.S         |  3 +++
 arch/riscv/kernel/probes/ftrace.c | 11 ++++++++++-
 arch/riscv/kernel/traps.c         |  1 +
 arch/riscv/mm/fault.c             |  1 +
 5 files changed, 16 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
