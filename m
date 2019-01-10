Return-Path: <SRS0=4zRh=PS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9974C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 16:46:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DCF206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 16:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P1wqz4pb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SC6Xzstb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DCF206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ebGV/FPe1RdA9KCclnkjTLe1lsYwDk30+BXyjIJ2Zbg=; b=P1wqz4pb1HD673
	WA2xT14OZRgkZNr0kzEQrH3lSUbZx9Mm1XqJzV8Tdpb+tGWqBxzC7YNJ/bbLJcjh7xqjH/pl7aHcM
	SMQtbfBzQBSsc8Ga6gj+8nJu5ik30ma1MCyc8ZSESoGz38rGz5dKRnaRwjyuvLxJIfGbYx3ULxfU/
	1dtv+eEDn4+kthn6t1KsiZAaO2UWdQfkcP5AxweesB7pmlItb4rXM9Kviiiof4WM0leOm1wqlbSXq
	ihbo3rUg52bRx2cue8i5GPiqZ0pvhQ5Z92Q72X5vEmwYQsanX50SPkiK2VWJrGxIgBmO1CVkbFovY
	wj7vt7ftnhqbWd8/nMPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghdTZ-0000fp-B7; Thu, 10 Jan 2019 16:46:37 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghdTX-0000fN-19
 for linux-riscv@lists.infradead.org; Thu, 10 Jan 2019 16:46:36 +0000
Received: by mail-pf1-x441.google.com with SMTP id y126so5565071pfb.4
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jan 2019 08:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=nAt7h+HkxsLi04OrpWsTkEa0YzQ248q+qSEZJ1YtAU0=;
 b=SC6XzstbmOsoBT5IkpeounRbA5WHqZzBmRrULyRxINfJ43jd7P6Y0Xtbm/4catqtrJ
 Qc63Zj6LZmPA72djv88P7jMNSXwNceYCcqBOKViohWvo6BbLDu9nyG78hpYhu/wZLkLC
 YCGacDK20edSus1D8OmeZWevJUJfjgeiY4691ieQK2LPPOMsyzseUqfgMsiwyWy58mfj
 h1WKWFdSiZ7L34TQZHaUsUTSoKMjWUQJPQxWi/YpZCVIwY73E9fW2K+UkZD/U5l1XXcR
 A6hX8qq6OlZVljfEtKdcYelE/6ZnKMjnJAs89SYQYJnkRd1cHsAeVahefa8DVrNpdHrB
 YYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=nAt7h+HkxsLi04OrpWsTkEa0YzQ248q+qSEZJ1YtAU0=;
 b=IRhm6JoOt7bCwiBV090Ou1z10M5P0QwTSaBTl/rgqsdbsfNMfBCjKeza+2z5oMttbX
 dxvExDT5iilztsG2AKEjjABVp2arvjRJ9maZKVONlAB7xdXippUw9ZSy5ppONRGKR4R7
 w9VgPkgCVJAGVbksdYz73UCSeN0BgWJ9aSeCUPknYYSwqfjG3gruVdzSsy4BDS5jLvbe
 fyzA6FD/UaJ8VsX078k4cuO6gxJnCg+VHwollzSwPESgEjPwoauY9srTYh7qjXH0y1da
 CV004bBFS3WQ4GgC1aK21LNT5kZWv6MSz5xQjzwrRp8osP4InUnkZa8tpDSYC1xBd0hp
 KTYg==
X-Gm-Message-State: AJcUukccGbeddIViEv6E71xg+tiCr1Xj6+4igrkyi4RgsZbqGFAYT+7j
 jYRAyEl9WD7e8RLNNOlDo01nlY9uIqM=
X-Google-Smtp-Source: ALg8bN4RsOAOy6/qnF0Ca32AuP6rzw8LSa4m5ykErAANCskBm02DWRtut5ULESkBBSYmP0pzJOfG1w==
X-Received: by 2002:a63:4c5:: with SMTP id 188mr10125149pge.391.1547138793764; 
 Thu, 10 Jan 2019 08:46:33 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x2sm107086416pfx.78.2019.01.10.08.46.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jan 2019 08:46:32 -0800 (PST)
Date: Thu, 10 Jan 2019 08:46:32 -0800 (PST)
X-Google-Original-Date: Thu, 10 Jan 2019 08:46:30 PST (-0800)
Subject: [GIT PULL] RISC-V Updates for 4.21-rc2 v2
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-9baec91e-8232-465c-9417-a7c9e50ccfc2@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_084635_103192_57823B0C 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.21-rc2-v2

for you to fetch changes up to 27de1f541f1f911bc2242ae68ef7375247b36c7d:

  tty/serial: Add RISC-V SBI earlycon support (2019-01-09 14:59:57 -0800)

----------------------------------------------------------------
RISC-V Updates for 4.21-rc2 v2

This tag contains a handful of updates that slipped through the cracks
during the merge window due to the holidays.  The fixes are mostly
independent, with the exception of one larger audit-related branch.
There's more information about the audit branch in that merge, the rest
are:

* The BSS has been moved, which shrinks flat images.
* A fix to test-bpf so it compiles on RV64I-based systems.
* A fix to respect the kernel commandline when there is no device tree.
* A fix to prevent CPUs from trying to put themselves to sleep when
  bringing down the system.
* Support for MODULE_SECTIONS on RV32I-based systems.
* [new in v2] The addition of an SBI earlycon driver.  This is
  definately a new feature, but I'd like to include it now because I
  dropped this patch when submitting the merge window PR that removed our
  EARLY_PRINTK support.

As usual, I've tested this by booting a Fedora-based image on a recent
QEMU (this time just whatever I had lying around).

---

Just a note: I did find when testing that the generic PCI controller hangs
boots on QEMU.  Everything is unstable (rc1 kernel, QEMU in merge window, and
I've never tried this specific PCI controller before) so it's probably not a
regression, but it's definately a bug.

----------------------------------------------------------------
Andreas Schwab (1):
      riscv: don't stop itself in smp_send_stop

Anup Patel (2):
      RISC-V: Make BSS section as the last section in vmlinux.lds.S
      tty/serial: Add RISC-V SBI earlycon support

Aurelien Jarno (1):
      tools uapi: fix RISC-V 64-bit support

David Abdurachmanov (6):
      riscv: add audit support
      riscv: audit: add audit hook in do_syscall_trace_enter/exit()
      riscv: define NR_syscalls in unistd.h
      riscv: define CREATE_TRACE_POINTS in ptrace.c
      riscv: fix trace_sys_exit hook
      riscv: add HAVE_SYSCALL_TRACEPOINTS to Kconfig

Palmer Dabbelt (1):
      Fix a handful of audit-related issue

Paul Walmsley (3):
      arch: riscv: support kernel command line forcing when no DTB passed
      MAINTAINERS: SiFive drivers: change the git tree to a SiFive git tree
      MAINTAINERS: SiFive drivers: add myself as a SiFive driver maintainer

Zong Li (1):
      RISC-V: Support MODULE_SECTIONS mechanism on RV32

 MAINTAINERS                                     |  3 +-
 arch/riscv/Kconfig                              |  4 ++-
 arch/riscv/include/asm/module.h                 | 28 ++++++++--------
 arch/riscv/include/asm/ptrace.h                 |  5 +++
 arch/riscv/include/asm/syscall.h                | 10 ++++++
 arch/riscv/include/asm/thread_info.h            |  6 ++++
 arch/riscv/include/asm/unistd.h                 |  2 ++
 arch/riscv/kernel/entry.S                       |  4 +--
 arch/riscv/kernel/module-sections.c             | 30 +++++++++--------
 arch/riscv/kernel/ptrace.c                      |  9 +++++-
 arch/riscv/kernel/setup.c                       |  9 +++++-
 arch/riscv/kernel/smp.c                         | 43 +++++++++++++++++++++----
 arch/riscv/kernel/vmlinux.lds.S                 |  8 +++--
 drivers/tty/serial/Kconfig                      | 12 +++++++
 drivers/tty/serial/Makefile                     |  1 +
 drivers/tty/serial/earlycon-riscv-sbi.c         | 28 ++++++++++++++++
 include/uapi/linux/audit.h                      |  2 ++
 tools/arch/riscv/include/uapi/asm/bitsperlong.h | 25 ++++++++++++++
 tools/include/uapi/asm/bitsperlong.h            |  2 ++
 19 files changed, 189 insertions(+), 42 deletions(-)
 create mode 100644 drivers/tty/serial/earlycon-riscv-sbi.c
 create mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
