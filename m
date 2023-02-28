Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F2BC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oJtXGEGTH4y7dKKokWW90BKCqtbLhpkf8FOZd0KItyU=; b=DlsWoZ5rfHyvzz
	QmuljpTn830wnwnXt1qXTck1XQzTr0P5WV90IRD9p/N5IZUr0sDMp+uKnziDaTLvSiPzsfE2vbKks
	+NeANjvi+nczvhPdXf371UloSJ4DtXJzqjjo8qZtmKW9CUHYzCitETeSICsL27rfdg472gUrlaxm8
	eIFt1ybZ5MYpZpcKdgvNoET8PETYliCjmvyo8tywqY5MiM2qEbdHGQJFXclW01gLa4GsLwWsoOq1N
	nXg0S1UW7QQgTW0iahdUFXShjvDlx4IsfTlPglNOEwBQZaNYNjb85XTFPPo5IjK+mP8Z8vcniQvVf
	mmuJCFS5DGb7NKLGyVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX0Oy-00DL5j-L4; Tue, 28 Feb 2023 13:52:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX0Ov-00DL4o-Tt
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 13:52:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD7886109E;
	Tue, 28 Feb 2023 13:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19DDFC433EF;
	Tue, 28 Feb 2023 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677592336;
	bh=NuoO5o1gNzybHzjaUYtQJpYqsA4sxJZdGNvF28deojY=;
	h=From:To:Cc:Subject:Date:From;
	b=l0lI1LdQ8gtTTq8qLsQ0PsPf6PqJCDkaxV9zreuOwD3zbiPhsoGRdj88ow6Yljai6
	 xKkerNJrlCHn6oPTd/Bunuu/dwStOEYKq9naSMwYxvEB092FF6cBVlu2nJWOc081KX
	 RU5OT7SSrZ8UUzqPszx9Y18ZJYZU9xAiFgAahSv0l+tqTCwLlCOC5scTWN9Yb6h09Z
	 PbVblg76VLZRKuPInEcuEj2mUNzMP3leYsWSuJw4r+/fSzmnACm2mMUICu+rKoRBsa
	 Sio1vgDn1tRu7jAVSOsdPn/KfCMHgD3xTO6TMzOpLeFVt1EIAXxEHdlrjx3TJvzol/
	 9HjOHwO4ysRLA==
From: Greg Ungerer <gerg@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Greg Ungerer <gerg@kernel.org>
Subject: [PATCH 0/2] riscv: support ELF format binaries in nommu mode
Date: Tue, 28 Feb 2023 23:51:24 +1000
Message-Id: <20230228135126.1686427-1-gerg@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_055218_039453_BB1B9014 
X-CRM114-Status: GOOD (  13.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes add the ability to run ELF format binaries when
running RISC-V in nommu mode. That support is actually part of the
ELF-FDPIC loader, so these changes are all about making that work on
RISC-V.

The first issue to deal with is making the ELF-FDPIC loader capable of
handling 64-bit ELF files. As coded right now it only supports 32-bit
ELF files.

Secondly some changes are required to enable and compile the ELF-FDPIC
loader on RISC-V and to pass the ELF-FDPIC mapping addresses through to
user space when execing the new program.

These changes have not been used to run actual ELF-FDPIC binaries.
It is used to load and run normal ELF - compiled -pie format. Though the
underlying changes are expected to work with full ELF-FDPIC binaries if
or when that is supported on RISC-V in gcc.

To avoid needing changes to the C-library (tested with uClibc-ng
currently) there is a simple runtime dynamic loader (interpreter)
available to do the final relocations, https://github.com/gregungerer/uldso.
The nice thing about doing it this way is that the same program
binary can also be loaded with the usual ELF loader in MMU linux.

The motivation here is to provide an easy to use alternative to the
flat format binaries normally used for RISC-V nommu based systems.

Signed-off-by: Greg Ungerer <gerg@kernel.org>
---

 arch/riscv/include/asm/elf.h         |   11 +++++++++-
 arch/riscv/include/asm/mmu.h         |    4 +++
 arch/riscv/include/uapi/asm/ptrace.h |    5 ++++
 fs/Kconfig.binfmt                    |    2 -
 fs/binfmt_elf_fdpic.c                |   38 +++++++++++++++++------------------
 include/linux/elf-fdpic.h            |   14 +++++++++++-
 include/uapi/linux/elf-fdpic.h       |   15 +++++++++++++
 7 files changed, 67 insertions(+), 22 deletions(-)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
