Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71522CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qayh7I7YHpseQEhlAvSlYGUjAI3ytpcgfpqwWhehZfg=; b=GXbE7G/8eNlT04
	1Xs6v69126PlGQUGHTrI/U46BlBDH0uDfEqlaNNaOIB3B66Ws0CZBKZP2NF50wcUKpw4HSpg/qaZW
	eknE0DJ+lUIFa807H4fCJIAI3M1VteyBkeYyN/SRCMcTK0juHrow617M1Hu/3eQHWo2u95pSR15o5
	sxnAZZwCT/Kz+TUNIq5FDefmQlx+SNxZXLec3aoaMnLZqWVk37ZhMSSNXbIeysWMBo6QfQdjR4JFx
	iNOsEW+p+N2D63Tzu5vzzvlMqJhFlIQHz7xWYuip01qvvpq2ejr5S6wFBZNeekh1urz5tcxCnVQrW
	KzeCXQNofjcdLEY5kF7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Gr-0000000GKmY-03iT;
	Mon, 17 Nov 2025 15:36:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Go-0000000GKm8-3WRP
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 15:36:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A9C644526;
	Mon, 17 Nov 2025 15:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD228C19421;
	Mon, 17 Nov 2025 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393758;
	bh=sejSOYyPsY96chKjq2zJmBet1FKv5XOfuLIhGQCdLVk=;
	h=From:To:Cc:Subject:Date:From;
	b=R34oquFrUzx9JyuG4r4Lr2LC4ZNyQWLDyvC7Gs0UG47r76j1acd2AeGaGvhhQKbU4
	 mzDkcjA5ehcw+UJTf5qy1s4LCSvcKwogghRx3d/sLGHdaT52HOCaNQnaPYYEnDN5pZ
	 raVP2WIHx5uaiLvLM/zKn+I61CsqpXac0enNr9FsXTC0Yq8C1b0Sw7GfMjPCa1+ztI
	 b6ktixMcKrBi2WWeZ5e7mUZG4LfXKPGECm7TcRFd43XvuCpPCrZ2BGh+IezfnPN2IU
	 dBnESC8gai2vrvX2wS/nfI1FurX0s7kTGli1lBKqwFcnUzDmcDLxonb0A7clnNYUtX
	 SRBYndIoOKRyg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v1 0/3] pic64gx clk kconfig/binding changes
Date: Mon, 17 Nov 2025 15:35:17 +0000
Message-ID: <20251117-shadow-police-56aba5d855a3@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=RzKPgfFKX1yPkSXhio0ERqXCdNZjWR+nMBI/96gcawQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSDltyMnrjt4SzLpAXdTo3xZzF0e6a04su4bs7W8os1 gVPFv/ZUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlcfsnI8NRqzz/ODNcFPZFb Nd9lP05KSV90OGX5a0Hvre86Zj48ZcrIMOONQdMt3hl+1/UfznB9d2dX8SxhvoROvvAMRm+V+0+ dWQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_073558_900514_E0456019 
X-CRM114-Status: UNSURE (   6.14  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Mostly this is stuff that PH did last year, but rebased on top of
current work, now that the clock driver rework patches have been
applied.

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

 .../bindings/clock/microchip,mpfs-ccc.yaml        |  6 +++++-
 .../bindings/clock/microchip,mpfs-clkcfg.yaml     | 15 ++++++++++++++-
 drivers/clk/microchip/Kconfig                     |  4 ++--
 3 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
