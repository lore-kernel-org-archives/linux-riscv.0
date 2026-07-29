Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E60C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D8vvxnRTcTqxj/2BtH0tFFZF41wOxyciDAY4XXwBGyE=; b=dj+kF2NN5/vGJ2
	uQExDMwHjt9eBBYzJAsAoRDpDPfRhnIxqcs79gX5eN0AAU6Vr3G9bbTUIZLXWphOto67G6LlJCYn8
	vL7vmJXc9Hvsmf9L8LlM26mhmYqCtgCrdhkedPNbyK2CYSixjZXZltZ5KTslRv+ReqWkneKNiJ3wf
	VPBYH9b9VsD//ZwOAdHQsXPVuWCsY7QKXXmKnzLuorZKMER1WVAJWqub/DhAi4BAiN80LIN1KE+ck
	uuynjz8kQKX7VhdqP9OZjtCwfZ7hHJO/vo2LZb9Hpjg+VpIHVGv7freYyHbAvgFrQ2bUDO5tKss2m
	AP9NACnIU3RhPaGlG0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6pD-00000008V2x-1GKL;
	Wed, 29 Jul 2026 16:08:07 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6pB-00000008V1k-1Wp0
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=kEYN0QMMZAZNvNGBzYRPVawrZjSXRyQ+6BY1Mqg/Qag=; b=sXMS2VzwmwLUcta9X2ViZD0F56
	vicu9NBfItF0YCPV/V5slUmaab7dv6wI2YLDVlxKFNJtwKbj6ZLFjs2xn4AF3F70gx/3Pu7sV2khW
	BHEkiw9gTnfplw/m0u5CwwGolXNJ8nW0KeOpVhDoEtmKMJhmeHECxOothSx3r/6ZQ9I90FOE4DGzi
	JNjJ/vc4mrZG7mzy7WmeHkVBXrw99D4GAI2wDNidc7alUO5SHP9dIJHrLk1t1VgDCZlpxoHApgCMJ
	TWn2MfJh7P/mcmEXvtMcUdo8IZCW4pCODPhMAycJSsKWm+E7fFWAqLios01BcztRQHs7GVSv0g0iw
	L0ZzkV8w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp6p7-00000002huJ-4C5i;
	Wed, 29 Jul 2026 18:08:02 +0200
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
Subject: [PATCH v2 0/4] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter 
Date: Wed, 29 Jul 2026 18:00:27 +0200
Message-ID: <20260729160749.1621415-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_090805_405910_99DCA084 
X-CRM114-Status: UNSURE (   9.95  )
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

Changes v1 -> v2:
 - Collect Reviewed-by tag for patch 1
 - Fix copyright in patch 2
 - Use a different compatible for the M1 board

Aurelien Jarno (4):
  riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
  riscv: dts: spacemit: Add a common board dtsi for Milk-V Jupiter
    boards
  dt-bindings: riscv: spacemit: add Milk-V Jupiter M1 compatible
  riscv: dts: spacemit: Add Milk-V Jupiter board (M1)

 .../devicetree/bindings/riscv/spacemit.yaml   |   1 +
 arch/riscv/boot/dts/spacemit/Makefile         |   1 +
 .../dts/spacemit/k1-milkv-jupiter-common.dtsi | 468 ++++++++++++++++++
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 430 +---------------
 .../boot/dts/spacemit/m1-milkv-jupiter.dts    |  16 +
 arch/riscv/boot/dts/spacemit/m1-opp.dtsi      | 117 +++++
 6 files changed, 606 insertions(+), 427 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter-common.dtsi
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-milkv-jupiter.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/m1-opp.dtsi

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
