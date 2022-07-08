Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D2EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6LvbBEVepnEmV67wGsG258tGpypHqmzmCj4dWr4k3JY=; b=XKSV4XrYv5fddh
	UTL4yIz6dj7m6MJyMQJuOfaFz5zJ+xul5KFnK2WQ7Mx4zylppM/xfHhO//y8D0J+6NXl/q0cObfEx
	dhQ0kdBe1Xev1RNtcjF3KgnYznVZoCR+FSeyHEWDEAoeZouRzvBVu/QWHIu4G9xYYrnRsL8Ecc70F
	K6kIn3CgsbnipNsPF8lPcAE+S1rPv4GbktpHpgjum/uXvj/EopFblZWaPMC0z69ueNvJ3TtQ0QN4R
	1xCluuhYyGTGELBVSKvpXLK09r3FQqhYfdFdA45x6XabZeodWyI/CeTBCuBvNU2HKC+fZQqS1A1Ue
	J9V8w2aJIZyud7+FVabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ozl-0049Gt-OU; Fri, 08 Jul 2022 14:30:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ozi-0049Ee-EM
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 14:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657290610; x=1688826610;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vCfRMAR4q2AJjmu3oHG/GAe7cYHZVXN1npd6sTs+EHc=;
  b=ytLqy8AuxAgHB/uJ2U/sHTOVLt9JPbh330PNN60oXZw8O1Z0FryymQiW
   SiLkK/9gJ6BV5rsX+9DeMD+mSXz5xXgwzz/yQmzxf8Z2r6BVaOHhJIjJZ
   /HclTgpLLWoEYrzk+7RzeqfhdTqIbmg8TqSDCL5KR4sQti1zgutYau6o/
   HMKzxhIBWTf/q5KqeCvIK81ziq+CM0jE056Zc1Q+ADIu4OrbOjRR/JHr2
   gSR6t81Q4BhNrmd9BJnooFKY6PX3N3suqfrFlNVhkEvqTIxI5czFDGaLM
   5+x5MqkPayDRxDpavMyqTMdXA8+5GQj5PajI2XPwcpXaRqyQkSyCrgGbn
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="171609663"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 07:30:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 07:30:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Jul 2022 07:30:01 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 0/4] Microchip soft ip corePWM driver
Date: Fri, 8 Jul 2022 15:29:34 +0100
Message-ID: <20220708142937.1120121-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_073010_508928_BD66331E 
X-CRM114-Status: GOOD (  17.18  )
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

Hey Uwe, all,

Added some extra patches so I have a cover letter this time.
You pointed out that I was overriding npwmcells in the driver and I 
realised that the dt & binding were not correct so I have added two
simple patches to deal with that. The dts patch I will take in my tree
once the binding is applied.

For the maintainers entry, I mentioned before that I have several
changes in-flight for it. We are late(ish) in the cycle so I doubt
you'll be applying this for v5.20, but in the off chance you do - I
would be happy to send it (with your Ack) alongside an i2c addition
that is "deferred".

In your review of v3, you had a lot of comments about the period and
duty cycle calculations, so I have had another run at them. I converted
the period calculation to "search" from the bottom up for the suitable
prescale value. The duty cycle calculation has been fixed - the problem
was exactly what I suspected in my replies to your review. I had to block
the use of a 0xFF period_steps register value (which I think should be
covered by the updated comment and limitation #2).

Beyond that, I have rebased on -next and converted to the devm_ stuff
in probe that was recently added & dropped remove() - as requested.
I added locking to protect the period racing, changed the #defines and
switched to returning -EINVAL when the period is locked to a value
greater than that requested.

Thanks,
Conor.

Conor Dooley (4):
  dt-bindings: pwm: fix microchip corePWM's pwm-cells
  riscv: dts: fix the icicle's #pwm-cells
  pwm: add microchip soft ip corePWM driver
  MAINTAINERS: add pwm to PolarFire SoC entry

 .../bindings/pwm/microchip,corepwm.yaml       |   4 +-
 MAINTAINERS                                   |   1 +
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |   2 +-
 .../dts/microchip/mpfs-tysom-m-fabric.dtsi    |  18 +
 .../riscv/boot/dts/microchip/mpfs-tysom-m.dts | 185 +++++++++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-microchip-core.c              | 355 ++++++++++++++++++
 8 files changed, 574 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
 create mode 100644 drivers/pwm/pwm-microchip-core.c


base-commit: 088b9c375534d905a4d337c78db3b3bfbb52c4a0
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
