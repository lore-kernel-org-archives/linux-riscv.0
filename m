Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E134CFC27C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bmsrIoL6OTb1hUScw5HCQc938z15jQfwUDN0StDKytU=; b=mXd3hNJSm5dXRt
	OCjuKllRepRPrzFPxtTdmIkn7WxQV//GPGqNwXYKFaEyIIWaXFsl2v55UIpfSAmfEhw53rtMdA1zG
	hc1L6oVC+4LDLxJ54cEy0jpOKoit76tMvLVIQcgYK7Et58YQKW0nRx5mRGun5GveYjBZRWo9PT1Cn
	+3O03JRXSoO4jS89YxfwzGxz21saqJ1gGQj5YPQNjdDfwkPzw8uhJHDD5LWAANZE/KNY5mB5dbtG8
	isnXbyCy45UtxYGs3NxM9Scf7kE596F0nKWEKMQhcmaP3b6cqJ1NIgmZge89Pe2okiPsauF/KcNSB
	xHezrofn1xguhqu8moIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRQo-00000008R4O-0SBa;
	Fri, 21 Nov 2025 13:44:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRQm-00000008R4B-3uiy
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 13:44:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF7EC602C8;
	Fri, 21 Nov 2025 13:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D7AC4CEF1;
	Fri, 21 Nov 2025 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763732647;
	bh=lDsrtShU/VO8T6WYHAXOOSTPA+dCTONGeNGt9vcVGcs=;
	h=From:To:Cc:Subject:Date:From;
	b=T7HOUL5s9/0wAmJmOEo9qbvoVqOWdFk77C3ZmCZkMRXfOlUmk7t+PPh5HYvrBNJji
	 esB2Z5m0Bfai2gE6vqsEuMOCTXMXpOrKdCa7sQpiYDk3tb3qATRwIVUKV6Co3dEPY+
	 Is544oytnwcAMPZn5OJDZm7+IbEOFpYunkBGMWuHIOGyGYO0yW0JaTj6/b4O38pHnR
	 cKZIbpRvqMpZhlV3tZKI9DqedLGHeupWgqYCqYf41FOg63qUrQ3qhvNNufYgEQOGqt
	 HbmKUoTi3c3yrZnbP3zijZ3USvHzcDacJs/YdgxfmO5RXVcfxpePQGVX6uqbixQ3sf
	 4FjDgq66IiQKg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] pic64gx clk kconfig/binding changes
Date: Fri, 21 Nov 2025 13:43:59 +0000
Message-ID: <20251121-tartar-drew-ba31c5ec9192@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dil/skRvfu+XgxPfnqEG3kkSoF73rVq/CS0DNDKKvCg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkKOfPmxgvvPcewwm6J7IvYRVvurNZff6B6y/d/C7vPK W6Tm+04v6OUhUGMi0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQAT6RJmZLhq7SjFdbYhqWC1 1JRQ3y31c+srnj7f8i555d19237UL77NyPCBIdTGW+gw6xv1m/mmh/wlyyrY9fiXxPLN/5kjXT3 tOTcA
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
current work, now that the clock driver rework patches have been
applied.

v2: fix the binding, d'oh

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org

Conor Dooley (1):
  clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE

Pierre-Henry Moussay (2):
  dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
  dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility

 .../bindings/clock/microchip,mpfs-ccc.yaml       |  6 +++++-
 .../bindings/clock/microchip,mpfs-clkcfg.yaml    | 16 +++++++++++++++-
 drivers/clk/microchip/Kconfig                    |  4 ++--
 3 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
