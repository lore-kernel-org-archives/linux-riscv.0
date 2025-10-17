Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8247CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:Message-ID:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CZXE5hvm7I0hlPrR1w6XGQieKPhGzDAVBVzu4Sprlf0=; b=IrkRrR45J7wCyU
	rFVoIpdSH8m+6GQXNE/8s90yHn6tMrx6DjxiLNPxshDgoxr2R95ZjfOk8JPh0RWgNCJkIFnDt6qnz
	S5dw9zqxJbmQ0ohm4798P7gMg9WEx7TgxdY7MSjqw+cV+BmKVgA8AN5c3kcDNZwKBqRw2JjvTo/OK
	cSPx+vDy17HXrEXu0wUeqktHd0BAYimX7CYBE7h9cf8XJT/1bJtKwDJc6jBkqJAH8Fo8c83lvA+EN
	SbDdxNqNXUAby9xRT2F7JlBMlvbPjVhgtSiEagJX/3+cPaAE/nRl4kM+2syk2Mlt+c5vA+gnHoV8T
	1qP44JgRia9bOh0Hnj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9f1n-00000006yec-1PSR;
	Fri, 17 Oct 2025 07:37:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9f1k-00000006yd3-21Qt
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 07:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95E3642B83;
	Fri, 17 Oct 2025 07:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AF2C4CEFE;
	Fri, 17 Oct 2025 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760686647;
	bh=dBK7cPC9iAHNs3jlccSM11qLIpnf+7WOuhUQ8BMgHQs=;
	h=Date:From:To:cc:Subject:From;
	b=LBrnVN+Gd6VvuVc6t6TIPDtQ4Sp0ej1culVBROwY7WjRDE9wsJoYKHzEo6PoUrcry
	 pQKR1IvYWJWSle5t10+itRAKZ3C0Z25YJzQmplbh2ERno/She+H87eQCgZWux0BEst
	 Q2XtNO3K8HxNm48vLcyIUVhqrjN0ya3WRbZMVK00a3W02NCh5+FTQgm68ra7StjTAE
	 5eViJzh3/xHw+xOcu8lhnVFP0dVtcdUTZNVZyGqW/LYeJoB7oJvBaZJL3BRzzKpt9k
	 u5+73XmXDZ563R689OZ8P26ToB8591LoS3cmolkyEWGKllTiF0RJ4EkYWv5wVDwps9
	 EzhFf4n4VKiMA==
Date: Fri, 17 Oct 2025 01:37:24 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v6.18-rc2
Message-ID: <f21ca0d7-dd9f-3dc9-34ca-c1444702370a@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1986118873-1760686615=:2568925"
Content-ID: <780db4b4-8477-116f-ab35-9f9db1c1abcd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_003728_560525_8FA75917 
X-CRM114-Status: GOOD (  10.63  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1986118873-1760686615=:2568925
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <ba9789f0-4c79-f1c3-ad3a-3b198d8dd505@kernel.org>

Linus,

The following changes since commit 5472d60c129f75282d94ae5ad072ee6dfb7c7246:

  Merge tag 'trace-v6.18-2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace (2025-10-09 12:18:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linux-6.18-rc2

for you to fetch changes up to 852947be66b826c3d0ba328e19a3559fdf7ac726:

  riscv: kprobes: convert one final __ASSEMBLY__ to __ASSEMBLER__ (2025-10-10 16:04:25 -0600)

----------------------------------------------------------------
RISC-V updates for v6.18-rc2

Some RISC-V fixes for v6.18-rc2, including changes to:

- Disable CFI with Rust for any platform other than x86 and ARM64

- Keep task mm_cpumasks up-to-date to avoid triggering M-mode firmware
  warnings if the kernel tries to send an IPI to an offline CPU

- Improve kprobe address validation performance and avoid desyncs
  (following x86)

- Avoid duplicate device probes by avoiding DT hardware probing when
  ACPI is enabled in early boot

- Use the correct set of dependencies for CONFIG_ARCH_HAS_ELF_CORE_EFLAGS,
  avoiding an allnoconfig warning

- Fix a few other minor issues

----------------------------------------------------------------
Conor Dooley (1):
      rust: cfi: only 64-bit arm and x86 support CFI_CLANG

Danil Skrebenkov (1):
      RISC-V: clear hot-unplugged cores from all task mm_cpumasks to avoid rfence errors

Fabian Vogt (1):
      riscv: kprobes: Fix probe address validation

Florian Schmaus (1):
      riscv: entry: fix typo in comment 'instruciton' -> 'instruction'

Han Gao (1):
      riscv: acpi: avoid errors caused by probing DT devices when ACPI is used

Miquel SabatÈ Sol‡ (1):
      riscv: kgdb: Ensure that BUFMAX > NUMREGBYTES

Paul Walmsley (1):
      riscv: kprobes: convert one final __ASSEMBLY__ to __ASSEMBLER__

Thomas Weiﬂschuh (1):
      riscv: Respect dependencies of ARCH_HAS_ELF_CORE_EFLAGS

 arch/Kconfig                                   |  1 +
 arch/riscv/Kconfig                             |  2 +-
 arch/riscv/include/asm/kgdb.h                  |  9 +++++++--
 arch/riscv/kernel/cpu-hotplug.c                |  1 +
 arch/riscv/kernel/entry.S                      |  2 +-
 arch/riscv/kernel/probes/kprobes.c             | 13 +++++++++----
 arch/riscv/kernel/setup.c                      |  7 +++++--
 arch/riscv/kernel/tests/kprobes/test-kprobes.h |  4 ++--
 8 files changed, 27 insertions(+), 12 deletions(-)

text data bss dec hex filename           
  +8    .   .  +8  +8 vmlinux.rv64       
  +4    .   .  +4  +4 vmlinux.rv64_nosmp 
   .    .   .   .   . vmlinux.rv32       
   .    .   .   .   . vmlinux.rv32_nosmp 
   .    .   .   .   . vmlinux.nommu_virt 
   .    .   .   .   . vmlinux.allnoconfig
   x    x   x   x   x vmlinux.allmodconfig
--8323329-1986118873-1760686615=:2568925
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1986118873-1760686615=:2568925--

