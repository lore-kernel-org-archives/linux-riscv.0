Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0650C001CC
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 06:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7mo1XSpU3K+LNGwRWp7Qjxbp1T+By4FWB/q/41mGwxk=; b=cz8MCZVJbyzeH9
	g3H31lx+AJnfg0va5mIOpja4e3z/5N/uOfSLEuzYAYa4OfpTjEYxOzDY7QH4955447Qr872n446LY
	PI+yLRVU8ZTsXjkNRLscPEghsQeHAa9jqlKhbWBjbB7nFzFK5HFW4BggqmE9cGQAZiiUonfxvl35f
	ulSnMz4A2WoPmSJcv9fadgjJ4Phtp2bPcxCA+nF54R0exRxy3EhhX4gFYjkSKEdvp4IjRH2kR8JqB
	Alsye0/Lk8du9JP1AFWWpNDJpEAsEwItF2IExIjh15uqx6AE1qEVeEDNlgMru0aoDklzfCM4hN0lh
	/hJwLvLYprPms81ZSgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzAg-0000000Ev6p-4BTz;
	Wed, 17 Apr 2024 06:53:31 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzAa-0000000Ev4b-3OdF
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 06:53:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29DE9240002;
	Wed, 17 Apr 2024 06:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713336800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k4gIZmybBrju70DPLEq+oe0QXPixlYrgsqSL525Ap1c=;
	b=pi/Rrz4qun5ukuBeoqhKIt4kJ5jIH/ktZLgSGM/UkyPGw4umf7bgRaMAzoYwLQo/4/klW+
	ELcPScxG2t8byYjhUJM2qRQzDZFoen/0s0Ivtnce2mMAEpP2CNdZOxDKQtcPdbvPH52Vk6
	i5jZCfcrFsIzsYCVtFM4Zn6P2Pew7y9CUVmPNbRlNEpiAIoe2z6migvcLBxtELwQHKzODL
	hfGqGUZzd5OlVIMDSJ9J5Ac201y4qNJtZ7Lj+hL2u1nK2h/EpfMQnq7+DW6SNnOjcLrnNI
	ojG6JkBvd54MW3ywU5z+O8CNEtBzF/wINqcbkHZTFahUYPfAMR47fZUg6W1uzQ==
From: michael.opdenacker@bootlin.com
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/2] add initial Milk-V Duo S board support
Date: Wed, 17 Apr 2024 08:53:09 +0200
Message-Id: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_235325_024168_D8934076 
X-CRM114-Status: GOOD (  10.79  )
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

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This adds an initial device tree for the Milk-V Duo S board.
Last tested on linux-next on April 17, 2024.

- Changes in V5
  - Fix the commit message describing the board DTS.
    MMC is not supported yet.

- Changes in V4
  - Remove mmc device (&sdhci0) as not working yet with linux-next
  - Use "sophgo,cv1812h" compatible as on the Huashan Pi board.
    Should I call the DTS cv1812h-milkv-duos.dts instead
    of sg2000-milkv-duos.dts?

- Changes in V3
  - Fix enum in devicetree/bindings/riscv/sophgo.yaml

- Changes in V2:
  - Add a first patch to register the new compatible string
    for this board.
  - Use a correct SoC compatible string
  - Add "disable-wp" (disable write protect) property
    to enable write access to the external SD card.

Michael Opdenacker (2):
  dt-bindings: riscv: add Milk-V Duo S board compatibles
  riscv: dts: sophgo: add initial Milk-V Duo S board support

 .../devicetree/bindings/riscv/sophgo.yaml     |  1 +
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duos.dts     | 34 +++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
