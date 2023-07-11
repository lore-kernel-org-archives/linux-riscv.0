Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DEEEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TmZIrsXSQbRrTTWxmfb2KTbzNHbQwW5efjlb26wir9Y=; b=OTRIiPRMcZLyYS
	IVPirPPRVwPj0+ZY/BItGWVTcpWdFhbxpSaT7k/rSvW/0QCxkNN11sEcoprMKPp2UChsRx6eIBp+x
	HdlD/Kdli1EzlFgMS+gELvxObHelO49AkG1hykGa9G11J5+maBivhDyoHzzkngV/QD6rwcw6VAqsE
	uIYP7D2o8tsRRuhA4it++lSL4bj7XN3vfROpl/TBTl3q10/GAYVuz6hBn7qayYD2X6D7zBm2x+6m1
	vRu0ComS9KEMI4NgufIv8vuqKPwuE2N+okShppGdsrq9TvpiFqneuVmVTbz9xdglhxqjxtJBV8oRp
	SGa9Pv6scXAspUz4QwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJD6X-00ExJQ-1u;
	Tue, 11 Jul 2023 13:08:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJD6U-00ExJ0-2E
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 13:08:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B969C614AC;
	Tue, 11 Jul 2023 13:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0ECC433C8;
	Tue, 11 Jul 2023 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689080909;
	bh=LUcJB0cq3kg6328TLZnO/4L83pKi9KtIC1j5JsNOlE8=;
	h=From:To:Cc:Subject:Date:From;
	b=gI8w4Ex9LIcrKsCI1HWYPC+akmsCgpovuc87W7bVuf9+xEyO7s29XnpujGm9IHQ/F
	 iXg0ykha7MCPbDzVdvvbV3nWbggu5BQN/3V4lfJShrQ3bdP/vCEXsEdP60ZkBAz2yA
	 wQO6Eic4WPZgm/ZcZH4rQNehffXS8kEMPfEciRznJpcz2UM/Fxo2moBLNF7gRBAjkK
	 NNQ7dRYhscaMbYNU/KC+//Ef2M0GPHj/xRMBHClMCFMrxLnjN7W4bTWu9bIO8Flg64
	 AZIqh6xIlgxowZWGKrnkyTNcXGXHyC65zCrrS0X+1PoSoGUDRaQmDXItO0JHdRqCyp
	 +ML9YhD7XnYpw==
From: Greg Ungerer <gerg@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com,
	viro@zeniv.linux.org.uk,
	ebiederm@xmission.com,
	keescook@chromium.org,
	brauner@kernel.org,
	Greg Ungerer <gerg@kernel.org>
Subject: [PATCH v2 0/2] riscv: support ELF format binaries in nommu mode
Date: Tue, 11 Jul 2023 23:07:52 +1000
Message-Id: <20230711130754.481209-1-gerg@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_060830_767194_41D25F86 
X-CRM114-Status: GOOD (  13.00  )
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
v1->v2: rebase onto 6.5-rc1

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
