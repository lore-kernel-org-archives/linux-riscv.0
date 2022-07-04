Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E69C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iIpmhGCPy18kgLwj4T+JsTqeTbj6Q98h7S6L5d5hjbw=; b=3GH0xqVn4LjALL
	ztRdO1bejYytBS7B982corwmC/34lGUbku+LAEw6bCtdf68ChRuH6vAkXoqbrd0Cu92ikiBUX77co
	KFnamnN1OV3Tb2ClBHu1fDLWCPY6A3EyDz+zw47D92Fs1FHegcds4olUC6nype7I5u+fHJ0EYoaGT
	gQzGn46q+Dzlq4Xte7epcdFQ6fDINRfJX/hHmPOIG0xr6eM6m7usUyWbbY2I788jmIHSgC0DfrD+Y
	sBY664hW/FZcxJ4yRWwAFmOHDoYhY299e6zjlIlD/D5EDJagkq4datiU8HFPbuWDXR44qh6iPzdTa
	qNeYZEtZKhmn8HDtCX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KbG-0087CF-4y; Mon, 04 Jul 2022 11:50:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KWl-0081Ee-Tc
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 11:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656935167; x=1688471167;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bSictZZlQk8kvD6FBfESakih6SXoepE+d4RIMig+lpo=;
  b=TXV9/IcSdsYWVMDSOVbJBLPJjwND5qWlc8qUTw/MQdxrVdi5ZTjWnRUl
   M3LzcfRZ39sGCanjqDnumM9ZhkI0WKJH5JzAldcfG4r5I6frngR2q+B9p
   vZ7LRZ4/HPtiIG0UUUCPsVloaAjMFmscHBNmbblg5Iu9TFS3wAyO8/M0W
   uOnSgiiqeJ65yfACJKqqZglhkra3nI50+C1qeQICUmf4aBnvNLqTn3bY7
   8rhF32aMICXzam1OkiB6H8/KvjR5tV2NgbSyPHSxIiaAvneFX+4yVctYQ
   HP4w9dkJ/GN+Fk5uDgN9f9G2sDCa4hsrkKgA5aY8GDgjjzwFbp7NPzCbZ
   A==;
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="102905894"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Jul 2022 04:46:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Jul 2022 04:46:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Jul 2022 04:46:00 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [net-next PATCH v2 0/5] PolarFire SoC macb reset support
Date: Mon, 4 Jul 2022 12:45:07 +0100
Message-ID: <20220704114511.1892332-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_044608_091744_FE223D65 
X-CRM114-Status: UNSURE (   8.57  )
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

Hey all,
Jakub requested that these patches be split off from the series
adding the reset controller itself that I sent ~yesterday~ last
week [0].

The Cadence MACBs on PolarFire SoC (MPFS) have reset capability and are
compatible with the zynqmp's init function. I have removed the zynqmp
specific comments from that function & renamed it to reflect what it
does, since it is no longer zynqmp only.

MPFS's MACB had previously used the generic binding, so I also added
the required specific binding.

For v2, I noticed some low hanging cleanup fruit so there are extra
patches added for that:
moving the init function out of the config structs, aligning the
alignment of the zynqmp & default config structs with the other dozen
or so structs & simplifing the error paths to use dev_err_probe().

Feel free to apply as many or as few of those as you like.

Thanks,
Conor.

Changes since v1:
- added the 3 aforementioned cleanup patches
- fixed two stylistic complaints from Claudiu

Conor Dooley (5):
  dt-bindings: net: cdns,macb: document polarfire soc's macb
  net: macb: add polarfire soc reset support
  net: macb: unify macb_config alignment style
  net: macb: simplify error paths in init_reset_optional()
  net: macb: sort init_reset_optional() with other init()s

 .../devicetree/bindings/net/cdns,macb.yaml    |   1 +
 drivers/net/ethernet/cadence/macb_main.c      | 106 +++++++++---------
 2 files changed, 56 insertions(+), 51 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
