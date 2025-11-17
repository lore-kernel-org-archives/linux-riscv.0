Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E303CEBF92
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 14:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZpNqMg22ah+ek7P+5spScrV8/Dw5UdMBHxHEJ8u/UvI=; b=tD1S+8btDaCBBu
	FUT19bwupa/OcBdLx8XWoCSjECY10zOqVqpz6kFfxDMOdWGYPywR4WLoGw2MStq++2nDy7o1Ry44Z
	JSY0ab9xEo4KHndLOdzLyTx/aEZJxfD0/KUBB3f4sEiiFjSvFTcJvoLxNE9s6R+LtM4P8qaKpJU5N
	J+2oL0HZ9bo2esbZdezjVvkWHwG0LnmcEdwGLjKdlyzcjJhz4yyP4U7VHpdQFgwgvr+/5RYtlLI01
	fH71MT3vHj9xLpBBdiTosIZOtgrbaFvuFmunSnxw6e67YsNmWjkIncjSG30fw09TuvwOO1vaodVKA
	K0yoC8cSeGlDT6rxm5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL06p-0000000GFYI-2j5u;
	Mon, 17 Nov 2025 14:21:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL06o-0000000GFYA-25cC
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 14:21:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A702A60207;
	Mon, 17 Nov 2025 14:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C9CC113D0;
	Mon, 17 Nov 2025 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763389293;
	bh=AmI6IljA9+P3I17TSYilirLOxEtpVOIbeLKzrLuc13g=;
	h=From:To:Cc:Subject:Date:From;
	b=CKB/K+QG84jt1fsMM1a7f7FTIaZga0+0X5YUN7TOMmWCUeCgugd5k8oJFZkGS/Jh2
	 KPiKRuvVwwd/yRF7RTnZQElmkkt9wJQL5sPtz7Z6GTJ+nLcBpdlqaPX5MsOvO3lJyR
	 AH/RWvbuMZ8labZ5EjKRtDK3AznI0ourJM+C2Dw1x5C6yzmQNvf2oNM0NEPsdFrkH/
	 kDTyxO2tf3dgC0AuDsD21EdVJNmPQ8jXClgqyLj2Ddc/TDVQ8G2IdQkCD6lCdJaRoo
	 vJVF11yrTNaNq0RWIHQYqEmcOo3rEZl2ONDpOA6Inl0vNGh+gHHYrw0/39ZXO6OrM4
	 U1oUGwz7rAQ0Q==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] pic64gx soc driver/binding changes
Date: Mon, 17 Nov 2025 14:21:19 +0000
Message-ID: <20251117-mashing-cursor-6e965a77ce6a@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=/pke3GKZ8uFIcCycTH1DCjROHWMVePhJQeiAe5cDM9E=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnS+rEG66alnzt7mUvdpWqrktWeS+yPCvSfCmSUOO1ze tnuMM+/o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABP5/IKRYZL4lNM/ikU8fv/Y /bt7cnS6cbibb4e8kepN/0/qBxakP2BkWGb0YJlXzIUZe+rDk+X4neo/pPx4tTvj7aIF/+/+cl4 gwQYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

Mostly this is stuff that PH did last year, but rebased on top of
current work.

CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Conor Dooley (1):
  dt-bindings: soc: microchip: add compatible for the mss-top-sysreg on
    pic64gx

Pierre-Henry Moussay (2):
  dt-bindings: soc: microchip: mpfs-sys-controller: Add pic64gx
    compatibility
  soc: microchip: mpfs-sys-controller: add support for pic64gx

 .../microchip,mpfs-mss-top-sysreg.yaml        | 14 +++-
 .../microchip,mpfs-sys-controller.yaml        |  4 +-
 drivers/soc/microchip/mpfs-sys-controller.c   | 74 ++++++++++++++-----
 3 files changed, 67 insertions(+), 25 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
