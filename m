Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4092C53210
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eDm7Lwdj8++Vnl2ZriFypK4usrPoIu6hxK0zrWIBo0k=; b=iJwHs3Nk49QaYx
	mxsx5ZBs4Ch/o8BvwyFhzlyTtOPyz2gmb18mTaXhxmUkIHuWhwPNt15mqGXw4YAKQhBrk4z7/tyYR
	wSh0c6C94YBAFVyTCZQ9I14I1TJ34TUgA+yD6FkPQI0uEE5XpMgWXXxD3jeMi1TGdcy+GK9wSKHfG
	c5OtusQzM6hCB7yAbG5ZuChMBhL3twB3E6l5itqTvnoAJfv/yLiN+3YFNHfE9cdsUvidynjjZYzhK
	q6XgF2ZiWyEGFN1FrWTTOuhKFSWd9KtEhs9k1GL4hvCl3AJmcsrYz4CyrsTj21wOFxMEttLy8hn/e
	VDrcl+gTRPHyr0Crr/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEYcz-00EMX1-1f; Sun, 08 Jan 2023 16:34:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEYcv-00EMUi-F3
	for linux-riscv@lists.infradead.org; Sun, 08 Jan 2023 16:34:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20D2A60C58;
	Sun,  8 Jan 2023 16:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF18C433EF;
	Sun,  8 Jan 2023 16:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673195663;
	bh=eT7awcktzU35cetJ5n21UxbLIvsBTnwG+SBKRT7SwDQ=;
	h=From:To:Cc:Subject:Date:From;
	b=oxjWc6KGkogGNqE+RBw4/AAjivL302XTx7GUy0oHRVngjy/i8lATwQ8jxGy9v5FUX
	 USGesp/+V1KMHZYlecJqshNG3sxbd/1IUQBP+REb7nfMPR9Ly2SmZPhVLhMd9PZ+/N
	 U+eW4xWcbfFuSNfE79WckzF0SYQ/eY4sJLB+ZQdT8ivQQlIaRIkXXTyOZSmYJ2hUar
	 5ZJYs5hANOFhAZAUV92CDFW+tgXu0dqGyAX/dyFmTXWL0jRhKWJwmnjyjEQk7b2c1q
	 aER2tzSRtO4HGNqbLqq8xXZ31MUSHJjPuG8DhsAhK95dov18ZAlqP34cez38UpCUj9
	 765el3YB0+eqQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] Remove toolchain dependencies for Zicbom
Date: Sun,  8 Jan 2023 16:33:53 +0000
Message-Id: <20230108163356.3063839-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_083429_581309_764070DD 
X-CRM114-Status: GOOD (  12.65  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,

I've yoinked patch 1 from Drew's series adding support for Zicboz &
attached two more patches here that remove the need for, and then drop
the toolchain support checks for Zicbom. The goal is to remove the need
for checking the presence of toolchain Zicbom support in the work being
done to support non instruction based CMOs [1].

I've tested compliation on a number of different configurations with
the Zicbom config option enabled. The important ones to call out I
guess are:
- clang/llvm 14 w/ LLVM=1 which doesn't support Zicbom atm.
- gcc 11 w/ binutils 2.37 which doesn't support Zicbom atm either.
- clang/llvm 15 w/ LLVM=1 BUT with binutils 2.37's ld. This is the
  configuration that prompted adding the LD checks as cc/as supports
  Zicbom, but ld doesn't [2].
- gcc 12 w/ binutils 2.39 & clang 15 w/ LLVM=1, both of these supported
  Zicbom before and still do.

I also checked building the THEAD errata etc with
CONFIG_RISCV_ISA_ZICBOM disabled, and there were no build issues there
either.

Drew - I took the liberty of dropping the cbo.zero addition from your
patch.

Thanks,
Conor.

1 - https://lore.kernel.org/linux-riscv/fb3b34ae-e35e-4dc2-a8f4-19984a2f58a8@app.fastmail.com/
2 - https://lore.kernel.org/linux-riscv/20221006173520.1785507-1-conor@kernel.org/

CC: Arnd Bergmann <arnd@arndb.de>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Guo Ren <guoren@kernel.org>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: linux-riscv@lists.infradead.org
CC: linux-riscv@lists.infradead.org

Andrew Jones (1):
  RISC-V: insn-def: Add I-type insn-def

Conor Dooley (2):
  RISC-V: replace cbom instructions with an insn-def
  RISC-V: remove toolchain version checks for Zicbom

 arch/riscv/Kconfig                   |  8 ----
 arch/riscv/Makefile                  |  3 --
 arch/riscv/include/asm/errata_list.h |  3 +-
 arch/riscv/include/asm/insn-def.h    | 58 ++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 12 deletions(-)

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
