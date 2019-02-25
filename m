Return-Path: <SRS0=l2EX=RA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D95C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Feb 2019 21:10:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7ABD20842
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Feb 2019 21:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8+/nbFd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZECPZYlC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7ABD20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uwBdnUytD7PdAsJoB1geTUP7S/Azc1eDvMnWHVtxWUo=; b=f8+/nbFdVtYgiL
	4ykFN60ZZY8tBLvwYEV0Vum7c7Kop3Qv2uBHgMokCssNopQWGeWMX7BwB3OZsqI8eYcXuxRi5VMUX
	BSSz220JLTTTsgXOGF7JrNwDUtv07VdbGFA8HV2LDQj+gOwV6fEK/klkfqUHwT9PnD5iOMSMLqP6y
	GSE9WZE5YagpwUuqz+da3pfeP/3xjOVeZXSYBoXcD3wMSsTx2HgKA5mgPmRSUuJFXpT/GfBH8WfQa
	nEmEhzhj8DJnoGxJssW3cLHsDVetYq+8EeUAsiyYrPv+45+o6+5oka9Zi+1cvp1eh8ml8igvcCe+s
	UvujV3vKjGi5DlxPgRWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyNWQ-00014E-52; Mon, 25 Feb 2019 21:10:46 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyNWN-00013t-Vh
 for linux-riscv@bombadil.infradead.org; Mon, 25 Feb 2019 21:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZSxQE4/2QNpabhVEG2mIIDEhEuEwdxMsncM5Qr1jX0k=; b=ZECPZYlCL+Ps4oClSnYEaJwYFJ
 G77syEU9YBiTQsOiCuw1NbGUlboOTNTXhToL6pUiaUF9SIeNSioxKUcEr2aHQlketkEOvd8HshWS2
 hOzV1ddK8QZb79NWfwJy1z3q6Msp5+c5AERBuwtwUYnQ9EB3thOf10OcGEFy2ox68UCXRU+ULhCla
 TA0/vQwjCPwEf+h9Xh6fbCGVMBXgIuh6jGP2iPbp6p23hwrmx2ZrfIYYqbnXjehQk483nkEZhC+Ic
 gQONcPzEwtKrjStA94PBlrLH01TEvoLrX4/s7tPe27GMur4FPn7486T8MoCQ3/bDEx9xbNJdItqxP
 P0zEz7hQ==;
Received: from mail-qk1-f193.google.com ([209.85.222.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyMUC-0000Bu-7s
 for linux-riscv@lists.infradead.org; Mon, 25 Feb 2019 20:04:25 +0000
Received: by mail-qk1-f193.google.com with SMTP id p15so6139321qkl.5
 for <linux-riscv@lists.infradead.org>; Mon, 25 Feb 2019 12:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZSxQE4/2QNpabhVEG2mIIDEhEuEwdxMsncM5Qr1jX0k=;
 b=nZEj+JQJunt1+QjSIqkx2woAyAO95+VKB0OANi0qQv7I39GTcYHQPh3qgBspdMA8eC
 eeyunGrRI65xNb7PwBSdjlgQJ6MIGzM83mHUAXKomj5/KNrPnAYZswN7EbL3OqhS+cv3
 Xrbe4Op5u/yR47WXl8WEIKF49O0IgFByQWCpyL5KlpY5VM8LBa3rYwtLb8qK9Rn180JT
 TVrE2gYJ4jpwWsNeBpKs1ep5Cly5MBVaP4kL/NhMegdwndC2qVHaF/M2kxcQOVgX3HM7
 0Ee0ePlvPRBqs/Ub/lfLNhVnxLe9HmiZFAiEJdixlikAqRxQhRgCpHW2y+ukhdsVZMWD
 PN9g==
X-Gm-Message-State: AHQUAuZqjvDVbMYXLZmLQ1MeVMtZyzN/DobER/mSJTPjl6JKcrow6aFw
 lc7ZS/v+6fUTTQUyJs2TYuvjwANwwHdD3FqQlnc=
X-Google-Smtp-Source: AHgI3IblkfCFtb396nkfXi7Y5HTrdw60jicFKYXo8zDyfoe4Sn1fdzpwS8iMIzdW1Y78pIqnz8Oshxgtd72ddKGUpUc=
X-Received: by 2002:a37:7cf:: with SMTP id 198mr14261456qkh.173.1551124996030; 
 Mon, 25 Feb 2019 12:03:16 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Feb 2019 21:03:00 +0100
Message-ID: <CAK8P3a1ZZkBu0zhfATv12OeCtyE5hjSpqt=BOLqkh75U18Z0aA@mail.gmail.com>
Subject: [GIT PULL] y2038: additional syscall ABI cleanup
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_150424_303965_8435FB0B 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Linux API <linux-api@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 48166e6ea47d23984f0b481ca199250e1ce0730a:

  y2038: add 64-bit time_t syscalls to all 32-bit architectures
(2019-02-07 00:13:28 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git
tags/y2038-syscall-abi

for you to fetch changes up to d4c08b9776b392e20efc6198ebe1bc8ec1911d9b:

  riscv: Use latest system call ABI (2019-02-25 20:53:52 +0100)

----------------------------------------------------------------
y2038: additional syscall ABI cleanup

This is a follow-up to the y2038 syscall patches already merged in the tip
tree.  As the final 32-bit RISC-V syscall ABI is still being decided on,
this is the last chance to make a few corrections to leave out interfaces
based on 32-bit time_t along with the old off_t and rlimit types.

The series achieves this in a few steps:

- A couple of bug fixes for minor regressions I introduced
  in the original series

- A couple of older patches from Yury Norov that I had never
  merged in the past, these fix up the openat/open_by_handle_at and
  getrlimit/setrlimit syscalls to disallow the old versions of off_t
  and rlimit.

- Hiding the deprecated system calls behind an #ifdef in
  include/uapi/asm-generic/unistd.h

- Change arch/riscv to drop all these ABIs.

Originally, the plan was to also leave these out on C-Sky, but that now
has a glibc port that uses the older interfaces, so we need to leave
them in place.

----------------------------------------------------------------

Arnd Bergmann (4):
      asm-generic: Make time32 syscall numbers optional
      unicore32: Fix __ARCH_WANT_STAT64 definition
      checksyscalls: fix up mq_timedreceive and stat exceptions
      riscv: Use latest system call ABI

Yury Norov (3):
      compat ABI: use non-compat openat and open_by_handle_at variants
      32-bit userspace ABI: introduce ARCH_32BIT_OFF_T config option
      asm-generic: Drop getrlimit and setrlimit syscalls from default list

 arch/Kconfig                             | 10 ++++++++++
 arch/arc/Kconfig                         |  1 +
 arch/arc/include/uapi/asm/unistd.h       |  2 ++
 arch/arm/Kconfig                         |  1 +
 arch/arm64/include/uapi/asm/unistd.h     |  2 ++
 arch/c6x/Kconfig                         |  1 +
 arch/c6x/include/uapi/asm/unistd.h       |  2 ++
 arch/csky/Kconfig                        |  1 +
 arch/csky/include/uapi/asm/unistd.h      |  2 ++
 arch/h8300/Kconfig                       |  1 +
 arch/h8300/include/uapi/asm/unistd.h     |  2 ++
 arch/hexagon/Kconfig                     |  1 +
 arch/hexagon/include/uapi/asm/unistd.h   |  2 ++
 arch/m68k/Kconfig                        |  1 +
 arch/microblaze/Kconfig                  |  1 +
 arch/mips/Kconfig                        |  1 +
 arch/nds32/Kconfig                       |  1 +
 arch/nds32/include/uapi/asm/unistd.h     |  2 ++
 arch/nios2/Kconfig                       |  1 +
 arch/nios2/include/uapi/asm/unistd.h     |  2 ++
 arch/openrisc/Kconfig                    |  1 +
 arch/openrisc/include/uapi/asm/unistd.h  |  2 ++
 arch/parisc/Kconfig                      |  1 +
 arch/powerpc/Kconfig                     |  1 +
 arch/riscv/include/uapi/asm/unistd.h     |  1 +
 arch/riscv/kernel/vdso/Makefile          |  2 ++
 arch/sh/Kconfig                          |  1 +
 arch/sparc/Kconfig                       |  1 +
 arch/unicore32/Kconfig                   |  1 +
 arch/unicore32/include/uapi/asm/unistd.h |  4 +++-
 arch/x86/Kconfig                         |  1 +
 arch/x86/um/Kconfig                      |  1 +
 arch/xtensa/Kconfig                      |  1 +
 include/linux/fcntl.h                    |  2 +-
 include/uapi/asm-generic/unistd.h        | 46
+++++++++++++++++++++++++++++++++++++++++++---
 scripts/checksyscalls.sh                 | 15 ++++++++++++---
 36 files changed, 110 insertions(+), 8 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
