Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B0AC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 11:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Gx907hN2X39i9QxJ60yXhLjpC87X77IGU5+xPmd5vA=; b=jFfjpLMIjUEEs/
	d8icjkx9P8bXPw2cyP2Bwf3IhqsWYCHKY6SnZByLmHiV1SDtz1koiaQ8dA2yEvViTq8ZLyjZLweNX
	o7Hy3effDxIqCSs/C+D2oEanhZpO8jDi3zDYDXL7k0hRHgQTPHtUgPMXxEIuuo1yJfJnfk5g0g4Ho
	xHxJmpLF10/fztdhzWjTCxn5VFD8p4PrsGdahSZs0vUT2gDXuSAop6mV+z0Ls2F2bqJA+5bIBImeb
	+7O2dblXkcQjnY4lrzB36crS/RjofCx9PsQdcOXuXlx/caXf7nCMXIAA/Ngad1Byb5CssdavEm6cC
	nb+hLLxuSjz+Z7ACrU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o930t-009Jvv-PK; Wed, 06 Jul 2022 11:16:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91hS-007xYP-3O
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 09:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657101122; x=1688637122;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hIrJs9ihsTLQ0p0bXK5jE65wktLVv5IEhLVWqw8Slew=;
  b=AqiBkMEuN1z59bWs+x8KVcCwee3AZ4ACuGDjwiG9wFg/eUCJW/7avWS0
   X8/tK2OpOg/VRQjmYyRsPLpZ5Pb45z0JZR0aHmq/Zt9lT+ROrTHaXLqWv
   PdclW9jrUITqDkuHRSrlN1AfjRV4slDE9CpbnpAZzMX8gRL5cJJHghQ6t
   69OTb2/BHWkPTYc38dRqQCzfDX8phNlpCmLirIiAOujgTIac/Be7ryT3+
   UlixYKlXOhmbqm16bTkj0Rx4nEg0CJ7AAC2NPKVf/F9A2HZr2PdlOtIE4
   Rb8o4dACzcIa5/5YgkiYwUykxAD/6g1wk5bnkbnEHvd3vO/w9ThbIMx0o
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="163537819"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 02:51:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 02:51:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 02:51:50 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [net-next PATCH v3 0/5] PolarFire SoC macb reset support
Date: Wed, 6 Jul 2022 10:51:24 +0100
Message-ID: <20220706095129.828253-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_025202_247029_F8554D94 
X-CRM114-Status: UNSURE (   8.49  )
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

Changes since v2:
- Fix a commit message typo

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
