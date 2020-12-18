Return-Path: <SRS0=XAcR=FW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8864AC4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 03:11:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD16239EB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 03:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD16239EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aKpbU+3JuZZvig4g/9GhNi9Uqm+czNnwwwefMzCtz9I=; b=G21Pmxs6qucAG7q2LCOfqDKSir
	IM/xaMDZZl8Gxs5VDA9Q+tzYXSzL3BGDKOQr4+h64brZQuG02S+hBbI7jdfdInplbHjm+62JIDhy8
	YqqXASvIbg5Le7hHB1ytNeQyzYu7MlNKr9OGNlHOuTXJELMNirMQD7bkuBLHxR+ZjEm/emxU02axR
	VnZdUnHWzpD/epSl55KzbORg7ZDANXbCv4NTFXUlsQQ/rNS1cytLmJUtkA4NTZ4yadm1JOqgYc+er
	2sajYkNLdkYXnmHVnFEqDb0b1JzfZJ4/adRd/D7jSvvkFO6TGQyw+bDwmCl1pro09vt4eZRE54h53
	X1rkYFIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq6AT-0002jv-E1; Fri, 18 Dec 2020 03:10:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq6AP-0002jC-Vk
 for linux-riscv@lists.infradead.org; Fri, 18 Dec 2020 03:10:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id y8so640694plp.8
 for <linux-riscv@lists.infradead.org>; Thu, 17 Dec 2020 19:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=6r+rwvnvoTRYwgFoEYoaymOS5INCCnce7UgFQ4WFGVY=;
 b=cw2avKYalGd12U43Lb4GYObHOfOWJfqJ2dpP7Bq6OLfSe6w0RoM1QmSdgZL32TWO9i
 FPKp67E3RsGTuSfibl62w4MvgHaC5IdvC/063seoAJcKPZo14yNFz8f8s5+dshUP1odg
 16gAZSW33yR5eNRjbxwfdwlcbvXnWM8xhuswuX3L/D+LSN3En9T68PzBLAtCirMCVK53
 5EsZoHLwDaW9gzajnNsdYE79RM+ydoIo45zrO9BGvoLAYv7vUgzkGJy7xOVgY2oNb5ra
 LI7wqttDwZfe0Bz+bU/VnRF3P0N+N8HBqgbzsWJKXcxD4v/RIaPkcdYSPv+K+7y9jpeg
 lUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=6r+rwvnvoTRYwgFoEYoaymOS5INCCnce7UgFQ4WFGVY=;
 b=bAoLnEIy/gu/l+EFXCFETUi2LddzmSWAdg/XkaTe1sBSi90KM4si/gNZ5Zu8A4r9yc
 R+yDcdZgsGHtHmky1GlRCpNJAKwRHH2UHCA9jihNK0lEKiG5EJ2vZ1qMY6QUG+IQl/sN
 amYlIkMbelizdzyW5HLmkS0O4hcHxjpRVlE95FqG15d9sXOV6ykpUdC9e2nWi2Yo4Dt/
 A5MBcrA4XYzIgs/0zrj4XFjHSDoFZAqU7oea3wtD5sI3y+zsjru5RRfcNl3nq8OyQVeB
 a3qVwTu46AIcl8ifNSgpLLcgprbWLWL76gEtH8A6LPTfjcUEaslO8QaNnjRktifVbmBk
 Ae2A==
X-Gm-Message-State: AOAM532+rLOwvubkOfPJJZ7hcu/r449yc3H7CV4a/i2P9+JnbbyUxYZS
 wB/xU3f48jlPpopWJb03ovvyTlYybtc0JwGq
X-Google-Smtp-Source: ABdhPJz1bXIxgl6WIpo/fjz/232QIrEPoGOunsXqY0VyemuWfpl4RGNRx78FXAxE0RyE92u9/0GUDw==
X-Received: by 2002:a17:902:6b87:b029:da:79a5:26f0 with SMTP id
 p7-20020a1709026b87b02900da79a526f0mr1985097plk.81.1608261051394; 
 Thu, 17 Dec 2020 19:10:51 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e5sm7052054pfc.76.2020.12.17.19.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 19:10:50 -0800 (PST)
Date: Thu, 17 Dec 2020 19:10:50 -0800 (PST)
X-Google-Original-Date: Thu, 17 Dec 2020 19:10:48 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 5.11 Merge Window, Part 1
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-9bb2f707-7aac-4141-8e3b-edc1b463fcd6@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_221054_160335_71926B95 
X-CRM114-Status: GOOD (  21.47  )
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

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-mw0

for you to fetch changes up to 7d95a88f9254b711a3a95106fc73f6a3a9866a40:

  Add and use a generic version of devmem_is_allowed() (2020-12-11 12:30:26 -0800)

----------------------------------------------------------------
RISC-V Patches for the 5.11 Merge Window, Part 1

We have a handful of new kernel features for 5.11:

* Support for the contiguous memory allocator.
* Support for IRQ Time Accounting
* Support for stack tracing
* Support for strict /dev/mem
* Support for kernel section protection

I'm being a bit conservative on the cutoff for this round due to the
timing, so this is all the new development I'm going to take for this
cycle (even if some of it probably normally would have been OK).  There
are, however, some fixes on the list that I will likely be sending along
either later this week or early next week.

There is one issue in here: one of my test configurations
(PREEMPT{,_DEBUG}=y) fails to boot on QEMU 5.0.0 (from April) as of the
.text.init alignment patch.  With any luck we'll sort out the issue, but
given how many bugs get fixed all over the place and how unrelated those
features seem my guess is that we're just running into something that's
been lurking for a while and has already been fixed in the newer QEMU
(though I wouldn't be surprised if it's one of these implicit
assumptions we have in the boot flow).  If it was hardware I'd be
strongly inclined to look more closely, but given that users can upgrade
their simulators I'm less worried about it.

There are two merge conflicts, both in build files.  They're both a bit
clunky: arch/riscv/Kconfig is out of order (I have a script that's
supposed to keep them in order, I'll fix it) and lib/Makefile is out of
order (though GENERIC_LIB here doesn't mean quite what it does above).

----------------------------------------------------------------
Atish Patra (4):
      RISC-V: Initialize SBI early
      RISC-V: Align the .init.text section
      RISC-V: Protect all kernel sections including init early
      RISC-V: Move dynamic relocation section under __init

Kefeng Wang (9):
      riscv: Fix compressed Image formats build
      riscv: Clean up boot dir
      riscv: Ignore Image.* and loader.bin
      riscv: Enable CMA support
      riscv: Add HAVE_IRQ_TIME_ACCOUNTING
      riscv: Cleanup stacktrace
      riscv: Make stack walk callback consistent with generic code
      riscv: Enable ARCH_STACKWALK
      riscv: kernel: Drop unused clean rule

Nick Kossifidis (1):
      RISC-V: Add kernel image sections to the resource tree

Nylon Chen (1):
      riscv: provide memmove implementation

Palmer Dabbelt (5):
      lib: Add a generic version of devmem_is_allowed()
      RISC-V: Use the new generic devmem_is_allowed()
      arm: Use the generic devmem_is_allowed()
      arm64: Use the generic devmem_is_allowed()
      Add and use a generic version of devmem_is_allowed()

Souptick Joarder (1):
      riscv: Fixed kernel test robot warning

 .../features/time/irq-time-acct/arch-support.txt   |   2 +-
 arch/arm/Kconfig                                   |   2 +-
 arch/arm/include/asm/io.h                          |   1 -
 arch/arm/mm/mmap.c                                 |  22 ---
 arch/arm64/Kconfig                                 |   2 +-
 arch/arm64/include/asm/io.h                        |   2 -
 arch/arm64/mm/mmap.c                               |  21 ---
 arch/riscv/Kconfig                                 |   3 +
 arch/riscv/Makefile                                |   6 +
 arch/riscv/boot/.gitignore                         |   3 +-
 arch/riscv/boot/Makefile                           |   2 +-
 arch/riscv/include/asm/sections.h                  |   2 +
 arch/riscv/include/asm/set_memory.h                |   4 +
 arch/riscv/include/asm/stacktrace.h                |  17 ++
 arch/riscv/include/asm/string.h                    |   8 +-
 arch/riscv/kernel/Makefile                         |   2 -
 arch/riscv/kernel/asm-offsets.c                    |   2 +
 arch/riscv/kernel/head.S                           |   1 -
 arch/riscv/kernel/perf_callchain.c                 |  10 +-
 arch/riscv/kernel/riscv_ksyms.c                    |   2 +
 arch/riscv/kernel/setup.c                          | 179 ++++++++++++++++++++-
 arch/riscv/kernel/stacktrace.c                     |  62 ++-----
 arch/riscv/kernel/vmlinux.lds.S                    |  63 +++++---
 arch/riscv/lib/Makefile                            |   1 +
 arch/riscv/lib/memmove.S                           |  64 ++++++++
 arch/riscv/mm/init.c                               |  52 +++---
 arch/riscv/mm/pageattr.c                           |   6 +
 include/asm-generic/io.h                           |   4 +
 lib/Kconfig                                        |   3 +
 lib/Kconfig.debug                                  |   2 +-
 lib/Makefile                                       |   2 +
 lib/devmem_is_allowed.c                            |  27 ++++
 32 files changed, 402 insertions(+), 177 deletions(-)
 create mode 100644 arch/riscv/include/asm/stacktrace.h
 create mode 100644 arch/riscv/lib/memmove.S
 create mode 100644 lib/devmem_is_allowed.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
