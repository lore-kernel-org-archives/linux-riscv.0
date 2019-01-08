Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22335C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 17:53:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E043D2183F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 17:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="spC0H1Xc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BMeyR0/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E043D2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:Subject:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qARunH2oRT23NODqh5sKNQK600tRDMBY3asCmuBajNo=; b=spC0H1XcxBG8oV
	ITLeEUWDtz+52QZAUUgvEKbrZLXkZFX4vHwiRkn3K7wE0iiRecDA76zj9+A/ZEugQOdZj3g5o6S0e
	7F4y1xciM158Q6gv5V+JMTsOW5Sxd0A8+mQ8nqEOn2blZQFDl0KAyzSpWOqx7w+rDTPTzrR8jg/Pr
	it5WklZx7Y1adIiN5bEqc8DI/zuyePFVYg6Ruyu/QXRnZHi5I/TM3vzrUZSrR6IXy/7qpelv29HGF
	5vKiq/fMV5jJ2gD2I5gLDxN9jk+kfmpn47R1Ccs4sa/7jy6vuqD9DvlqpHro17sQl/PFcxI5xIGRl
	kX7JOC3HM6q0dyWkvyiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggvYs-0004HE-Of; Tue, 08 Jan 2019 17:53:10 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggvYq-0004Gm-6a
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 17:53:09 +0000
Received: by mail-pl1-x644.google.com with SMTP id w4so2245708plz.1
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 09:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id;
 bh=+zI9x3ZtOFPI4F9t4szUF/3rU09OuJHK8YvR3LIRIrE=;
 b=BMeyR0/aK2jjJCkOLkyoQg5bqv34arIg5pLppxQUkx1Oo5OhGIk/E08WuRW/1mGZ/8
 uQYKJpK0IX+UugbJzWv7zO8QHOrYhzTR/mSnEj24YxX+KP29Gr9v1ATQk4nNO83TN1NG
 8QFguXFoRn9vHc/mNE10ZDi5UGwzHRs6Qvqv2kufVemB10AAanOy7mTCWRtsG1EEs/ud
 gjNJ+uqWLEG+QHS1Qq5jZB/6Jqz1kvM0n/wg0fsZlBYZA8Aaqr5LbvWTezOrB9+tY7iq
 N5HEb8taArfAF/fdxFXm5NfsKiqcDLno9NhmmibwVyEq2XFwo/HCEjP47ZLtLRTitO+a
 oSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id;
 bh=+zI9x3ZtOFPI4F9t4szUF/3rU09OuJHK8YvR3LIRIrE=;
 b=BBcLZFDH7cJoVpKR3z8n/xAu/4U99H4XTw9eEfqf3qlZ9lak9rhBradsZXXETfyQDc
 +Dmj3JN1vP/pCGXfich3hw4ca1Hmi8hdQMT/bnwmQE3KMoJI2K+Vu7Mo84nJiICt9N1q
 D900A6LQmmwZrfwRVSLFDekFbLe6qmDdJOm//WUjpn09zVXwiz/o8K3YMzZpxAGbFSe2
 0Pu2ddDpH0hhvv7cCMdzx7mn6kvDL0tl0rHdQeFV+CneCU7tnWsUR/m6cNnkRiBvnDDU
 v9twQeaajM0uj0rpmcyKcztLyhi5Z7tqLMVauRgNA56huPskgKikdC0qrdTfryB1+ZqQ
 Iwaw==
X-Gm-Message-State: AJcUukf5YM2x+1Pa8z0qncMxNEhhMaRKu+iE/Bz7CBz9fW9E+SZydzec
 i/V0FoJ7aEUgGKm+eKYEBO6TrgDVlhk=
X-Google-Smtp-Source: ALg8bN4e7lhiAKky5cDfLS1MYXKW0OAT997oMjhwH4OrhX4C8K+442himFOPYKz3LalrwRSHQQUgmQ==
X-Received: by 2002:a17:902:5ac7:: with SMTP id
 g7mr2761215plm.212.1546969986607; 
 Tue, 08 Jan 2019 09:53:06 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id n78sm54010532pfk.19.2019.01.08.09.53.05
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Jan 2019 09:53:05 -0800 (PST)
Date: Tue, 08 Jan 2019 09:53:05 -0800 (PST)
X-Google-Original-Date: Tue, 08 Jan 2019 09:53:03 PST (-0800)
Subject: [PULL RFC] RISC-V Updates for 4.21-rc2
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-c1a58f9d-cb8d-4c16-8f2b-1d2857244f8e@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_095308_274560_25D11696 
X-CRM114-Status: GOOD (  15.07  )
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

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.21-rc2

for you to fetch changes up to 801009424e05cf110f016d7fac7fcf20ef94941a:

  Fix a handful of audit-related issue (2019-01-07 08:45:47 -0800)

----------------------------------------------------------------
RISC-V Updates for 4.21-rc2

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

As usual, I've tested this by booting a Fedora-based image on a recent
QEMU (this time just whatever I had lying around).

----------------------------------------------------------------
Andreas Schwab (1):
      riscv: don't stop itself in smp_send_stop

Anup Patel (1):
      RISC-V: Make BSS section as the last section in vmlinux.lds.S

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
 include/uapi/linux/audit.h                      |  2 ++
 tools/arch/riscv/include/uapi/asm/bitsperlong.h | 25 ++++++++++++++
 tools/include/uapi/asm/bitsperlong.h            |  2 ++
 16 files changed, 148 insertions(+), 42 deletions(-)
 create mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
