Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3132C606B78F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TSg/EKaf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFjufWC0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qDxazm00/x/Im5xkfQlBHO38C6Fqmv+PayKYHogMcIc=; b=TSg/EKaf4F+f4i52Vv+H78oG5n
	dcfb7r6HetjTT/4Hg/+ynLllCv50lZRJaQx9D64P2TI3E1tfwAI9VNI2Som9dS1LlQfCJhQ3E8BpT
	Zz3XWhUT/r08v3wlVH8IDHVnfpo3FqnQdq0yK/8V7pS4lKKDOgLbSsNP541poEz+X/09whTEzHbUD
	gmgJ/V9I71k0nEZfBCZ2I5hCUo4NXlx+CAOQlzNJTV3xWKVGVgDmCbJjnZSflK7SL3h6jJQD/54Yo
	SpX3plEmwZvg9eXxotasKIG7/gDwTudNkfjljNjSj6VT/IANt3z9AtNVk9dcT9Kl+1m/OQPur3NGe
	BKl/SN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpx-0000000EhiY-1Z6t;
	Fri, 13 Nov 2026 22:33:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpv-0000000EhhZ-2G3E;
	Fri, 13 Nov 2026 22:33:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ADA343ECB;
	Fri, 13 Nov 2026 22:33:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609215;
	b=1OPYZyE8caBFivrYtMkD4nzP7NuGhRuK2EweDM3YpIru1HWJu+CP3awlHOazwOAK4LyA
	 tAySkDXBhQZH6LlKMHXdZ7g8Fq+Wv2Rmz4W8Fhvb81KCqXEc94zTmkxlSu7v7NiPeZNo4
	 clDZhzEOSULj+kyUpCEGvi5lIMdlf4BrxhHCs+FJsGcDm8rRE5qxh3dwwBNgJOhKsDfH0
	 /YGT3LPXwKazvZwhZMU6EtZzFMv/wwzi3y3ze3pfHFME5IhMdAF24eTaYzCPs++quhKyE
	 XrrLOQlioW5fMgkifYYXpjWecnbL/CW1a9Y/02Sqh2uC9YDhgkfe/hEz1fjZPW8QXwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609215;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=SQQrvJEnntU7dPPkOy25mdbgZFfdEX5zExLpn6ZSO3c=;
	b=SSkcdGb2yI3r5vcPhx3JI82lJ+/DaAdusrHZlQgmWRxSsvmUAVHOYCKKMI18bcm5KgFQ
	 xIDyhGshA7Krwft+b48Qzimu62Zvw4+JeYg7gBPHENXRV5bKF15dw7A81X78rBhDvC2Af
	 TOCmfiwbUzlD7ph7tVOtAxQabbQHiosUi+ZEITh0Vd3q0OJ4qcnDr3s7+MUs2kafQuW9W
	 htPQaDnTnagO6nMnPeClzSh40R3DEFYBbuQL/+144gjogejWnVf3rGScyDxm/7kib81ar
	 lSlYabMtwsNj1T7d2zSHuNwIVosWfGKJAVAGCo8MFYgB7dc/pyooo5L41Vl0h/Ab8Gg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3293C1F000C6;
	Fri, 13 Nov 2026 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609215;
	bh=SQQrvJEnntU7dPPkOy25mdbgZFfdEX5zExLpn6ZSO3c=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=WFjufWC00GV8Rk9GHoHIZc7S0ORg+JUc+DacNPe0e2sMxrN6q7HwxExy5SWdFnU4+
	 j38QzFrHZLIcDIHzcrQLB0iyWKyeVNsoMReRhct+hFr1IUCjl6zff8ryk/G2tqFz8V
	 Ac7gXVoGFKtboCBdkg4UTcZyyrD6JxB/E5so8m9yqEf1sHdxAXprOnLkYkVHIlPUIv
	 onoKxoIPtHqAEbo5cZm0It10KgjFhu30xH5TXJ6CIcP+kZlzxUDfjH8WAFBSB8r3aZ
	 76ghY9FV6V1PBMAA51dj0QG/O7mfFSgfgfbEJcFLGXp9oRrVRBgkfEkthQrAKAui9X
	 3NLSTQtnf52kw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 844A449B54;
	Fri, 13 Nov 2026 22:33:32 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH 00/19] riscv: add initial support for the Allwinner V861
 and Avaota F2
Date: Sat, 14 Nov 2026 06:33:26 +0800
Message-Id: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MT3TILM0NdA8M082RjizTLFINUJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tADdhXRdoAAAA
X-Change-ID: 20261114-v861-01f7c38f9d0e
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=3323;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=CeY384JrxATDFoc7gV7puzQwq1JBdWH8kbQQH867CU0=;
 b=b8L/R+6anOOByRDUdqRS0Wkwcagw75RMfi0v9/Yxy08unknBX7nd0LHSn54eIFdYaCTWXFt8j
 F48RaAVTvDSDBgP/XQ8HyGipQCS3f4sPLQM4ui6JwIl4yG0vLFZ6QnC
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Allwinner V861 is a camera SoC with two XuanTie C907 harts. This
series adds the clock and pin controllers, the RTC clocks and the
device trees needed to boot the YuzukiHD Avaota F2 board to a serial
console.

Tested on the Avaota F2.

---
Han Gao (19):
      riscv: sunxi: describe the wider Allwinner SoC family
      dt-bindings: riscv: cpus: add the XuanTie C907
      dt-bindings: interrupt-controller: add the Allwinner V861 PLIC
      dt-bindings: timer: add the Allwinner V861 CLINT
      dt-bindings: clock: sunxi-ng: document the Allwinner V861 CCUs
      clk: sunxi-ng: add support for the Allwinner V861 CCU
      clk: sunxi-ng: add support for the Allwinner V861 PRCM CCU
      dt-bindings: rtc: sun6i: add the Allwinner V861 RTC
      clk: sunxi-ng: sun6i-rtc: allow variants without a 32k fanout mux
      clk: sunxi-ng: sun6i-rtc: allow another 24 MHz to 32k divider ratio
      clk: sunxi-ng: sun6i-rtc: add Allwinner V861 support
      dt-bindings: pinctrl: add the Allwinner V861 pin controllers
      pinctrl: sunxi: allow a per-controller IRQ register base
      pinctrl: sunxi: add support for the Allwinner V861 PIO
      pinctrl: sunxi: add support for the Allwinner V861 R-PIO
      riscv: dts: allwinner: add the Allwinner V861 SoC
      dt-bindings: riscv: sunxi: add the YuzukiHD Avaota F2
      riscv: dts: allwinner: add the YuzukiHD Avaota F2 board
      MAINTAINERS: add an entry for the Allwinner V861 SoC

 .../bindings/clock/allwinner,sun252i-v861-ccu.yaml |   99 ++
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
 .../pinctrl/allwinner,sun55i-a523-pinctrl.yaml     |   31 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |    1 +
 Documentation/devicetree/bindings/riscv/sunxi.yaml |    5 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |    1 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 MAINTAINERS                                        |   12 +
 arch/riscv/Kconfig.socs                            |    6 +-
 arch/riscv/boot/dts/allwinner/Makefile             |    1 +
 .../boot/dts/allwinner/sun252i-v861-avaota-f2.dts  |   43 +
 arch/riscv/boot/dts/allwinner/sun252i-v861.dtsi    |  272 +++++
 drivers/clk/sunxi-ng/Kconfig                       |   20 +
 drivers/clk/sunxi-ng/Makefile                      |    4 +
 drivers/clk/sunxi-ng/ccu-sun252i-v861-r.c          |  110 ++
 drivers/clk/sunxi-ng/ccu-sun252i-v861.c            | 1117 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               |   31 +-
 drivers/pinctrl/sunxi/Kconfig                      |   20 +
 drivers/pinctrl/sunxi/Makefile                     |    2 +
 drivers/pinctrl/sunxi/pinctrl-sun252i-v861-r.c     |   48 +
 drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c       |   49 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |    7 +-
 include/dt-bindings/clock/sun252i-v861-ccu.h       |  127 +++
 include/dt-bindings/clock/sun252i-v861-r-ccu.h     |   14 +
 include/dt-bindings/reset/sun252i-v861-ccu.h       |   55 +
 include/dt-bindings/reset/sun252i-v861-r-ccu.h     |   12 +
 26 files changed, 2080 insertions(+), 9 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261114-v861-01f7c38f9d0e

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
