Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C21C54F56
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OX1CePT9LUGSE1eTq/3u/ECkAS6ul1oSSgFUGiGgmmg=; b=4wMg7rGUXcn6BR
	iO3B7EGeBWE9QHgz8vSLbYHHppLs6GqcsDHelYTZgahozmdUnqJ3LLnAHl3OdokphbJg0XVskMda5
	kVxgaSV44MDsSRIZvXGU9zhPjWJ81jCWD9/p0SmQgxfBbYsW8z9mB3cqwVsDbug3pGZXj+Vsvoi5y
	RgyTUbZA9TStP3gZ4I0WT8frEqUGWbrwo9ehJVzX3LEI8DO48w0TGemBRFPHy4/EV1qT0qizqBbQR
	jZxHKUtwm3QbgHWef7vxvVj6i0wLgq2Ai/FwGtvbLkT1xmAWHAR6zuOOP8sVdrPCPl/jzFIip/n9l
	Og1OXzr/VvPoH44A17xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop4f-00000006HIB-2hUW;
	Tue, 28 Jul 2026 21:10:53 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wop4Z-00000006H1A-07Tg
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 21:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=TXhqo12SdAHNMxE8AMJ+oh/lXzA6j5PNy0D6aKIdi/0=; b=nD6uQ6r9XW+Ls0Sj0/9UHEj9Aq
	XN0gcjcvlOcsoarn0XMRUNytrZOM2pLBwlKdKWKzFrhd1tx806em6RjKcsg61/shf/ZA4zHSPLHBz
	MlqSsWlkCg0z/GuiwPBjpJd16zWfA1w0OwEUlVdiifxqoEeuLF06V+HT4A3Kbdpxl4cZSE3ARU6vW
	2XYdDCR9N+OeF0y6RhafVhYxOnC7Y21c4kGMoiec0xkt84z2sgIJMC/g4hwDOWuwDyKYnW8giKwU2
	4jkcDEKsQ6Rpcg7XasNGmhIiyxzoThi9TYcaEUJgXkvyjTFIPf7nWQIEhdP3n2MaBqdl2pyHdEU/r
	fr5yBYZQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wop4O-00000001a4I-2XGt;
	Tue, 28 Jul 2026 23:10:36 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
Date: Tue, 28 Jul 2026 23:05:05 +0200
Message-ID: <20260728211020.1248676-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_141047_093792_19DAF6B1 
X-CRM114-Status: UNSURE (   9.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds cpu scaling support for the Milk-V Jupiter boards.

The first commit adds it to the existing "Milk-V Jupiter (K1)" board.

The two following commits add a "Milk-V Jupiter (M1)" board, by moving
the common part, i.e. everything but the model name and the operating
point tables, in a shared DTSI file. This file is then included for both
K1 and M1 variants.

CPU frequency scaling was verified up to 1.8 GHz on the M1 board.

Aurelien Jarno (3):
  riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
  riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter
    boards
  riscv: dts: spacemit: Add Milk-V Jupiter board (M1)

 arch/riscv/boot/dts/spacemit/Makefile         |   1 +
 .../dts/spacemit/k1-milkv-jupiter-common.dtsi | 469 ++++++++++++++++++
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 433 +---------------
 .../boot/dts/spacemit/m1-milkv-jupiter.dts    |  11 +
 arch/riscv/boot/dts/spacemit/m1-opp.dtsi      | 117 +++++
 5 files changed, 601 insertions(+), 430 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-opp.dtsi

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
