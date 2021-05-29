Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F590C47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 17:22:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2437161132
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 17:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2437161132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xq09f5mEoftrW0JpqEt1oVQhtpUPng0MPlgXjNW2ZH0=; b=vNUQOLii0l3N8p
	A2NOPcvNcmtZSceMO/+AGsssQ19J448WAV2gfvrzyqB0a5gPpnjG6PWU469N7NTmNNtXWCgOFZxhE
	vgmhR+5gns3Vz4cRElGo7uZABQNkfKmIpHY+cNgmSWqEkCcyJyF3Avn/3SFlGQojhdoQcnr3unhES
	wS1Ria1hhpmjRChKgR8/sv0NKAC51VlVI89Zr9dK1gdJ49E8LVzNAa/oxXzvMhMp6MOm24//V53oY
	7L/0cQyc45h0v/cdhelKXHOAs/aJT+sCjyzCL4aEs5gi/tL9EZegR73jSYKfp/VdFBnUwTnFlb0vu
	rWCbSnz6tpYNDXeYSFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln2fG-007wbO-70; Sat, 29 May 2021 17:22:22 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln2fD-007was-4I
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 17:22:20 +0000
Received: by mail-pg1-x534.google.com with SMTP id r1so4998372pgk.8
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 10:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=q7CQNv9swkDWDrp6f04EPlU0B7np7rtJnJeA30IsokY=;
 b=q9ks+3gK/79CxIQZkGEG1LdX/QZTFKQv6gJ/NxUGtvJ3/pEfw1+jEFA6xjq0sGY3vV
 zDCAwdQPY1/oM23fx++24Rtd0PCcThCSsKdYj29kLsuwmA/7s/X4MOPskzBhzCtse2Xj
 knuGj/MoTvdrqC5lQzH+iujg9wQskBFOoLGnyCELdiDDCkiZujb0h/vLN3IQbmYlh5QA
 5m0ImddDDPDNkBkmbJhq3uobU26COhakeowL06bfyDoiv8W1VBqT/2i432b+KFf0+Aum
 /EghMK2FTlh2NmYNlsdijdJKt2KXgAHs6WTjlPKyn4HtOTskop7qdEm4Znh3na/T8JhY
 ZkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=q7CQNv9swkDWDrp6f04EPlU0B7np7rtJnJeA30IsokY=;
 b=p1m7Y+PsdqT6TUwsiLI0x43otpCWWs4eouYdqQUfo4tMUr31BaophuzlYsBEd22PHJ
 z/gnoIlt1ihyGhkMECYmCoNomLTacHucOqdVbEumagJ3gpvfvEbDEXoA1fbBhT8vGu15
 TGAFGPfcikyVWQS9sqYnV22mdAH5GiGDWAZq6nIyJr7kVgtbU02RVVM2Y9iE3F08UGDa
 Dc24DqGffjfWE+OzaSMphnHArJPxgh9pmL+HuvIEOuF+EZnl7qc9aIuvTbG9532POYWd
 g719voyLpiKGglc06J5Zabs+mvp+oKV/eL3tufB7/3kgJGScTHarCMLqRIuxfvSB6bVj
 Sfow==
X-Gm-Message-State: AOAM532VlZ0O5EQRvjGQvAwoHkBh3jY6coAk5v3NE/VVlWvQxv4Im/Dg
 cTEdWTDiBQoQWK55q9Ny0kRfIbDT54Bdiw==
X-Google-Smtp-Source: ABdhPJx3GspxyNsmPK29EQJJUBo6PPEaUQO+Az3IKbXmlReqj00gD62kDcuYmQzeVh9JBSYYmn7XZg==
X-Received: by 2002:a63:1906:: with SMTP id z6mr14538726pgl.173.1622308936937; 
 Sat, 29 May 2021 10:22:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e188sm2174595pfe.23.2021.05.29.10.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 10:22:16 -0700 (PDT)
Date: Sat, 29 May 2021 10:22:16 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 10:22:13 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.13-rc4
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5051d261-3f3c-405c-a9a0-68fb70aa7c71@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_102219_248948_75D1FE24 
X-CRM114-Status: UNSURE (   9.71  )
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

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-rc4

for you to fetch changes up to bab0d47c0ebb50ae0bcfa4e84986a60113bf7d6b:

  riscv: kexec: Fix W=1 build warnings (2021-05-22 22:05:30 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.13-rc4

I have a handful of RISC-V related fixes:

* A fix to avoid errors when the stack tracing code is tracing itself.
* A fix to resurrect the memtest= kernel command line argument on
  RISC-V, which was briefly enabled during the merge window before a
  refactoring disabled it.
* A build fix and some warning cleanups.

----------------------------------------------------------------
Chen Huang (1):
      riscv: stacktrace: fix the riscv stacktrace when CONFIG_FRAME_POINTER enabled

Jisheng Zhang (2):
      riscv: kprobes: Fix build error when MMU=n
      riscv: kexec: Fix W=1 build warnings

Kefeng Wang (1):
      riscv: Select ARCH_USE_MEMTEST

 arch/riscv/Kconfig                 |  1 +
 arch/riscv/include/asm/kexec.h     |  4 ++--
 arch/riscv/kernel/machine_kexec.c  | 11 ++++++-----
 arch/riscv/kernel/probes/kprobes.c |  2 ++
 arch/riscv/kernel/stacktrace.c     | 14 +++++++-------
 5 files changed, 18 insertions(+), 14 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
