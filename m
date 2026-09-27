Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F2DC9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NBsavs6kZJcKf/J15s0jWGea/2Sjzz/dDWsf68FJ8Fc=; b=igArrF8J/eVJE5
	0iqrx3B4XyL8rRZuE4r8sWL63rKggeoJKuIurvg4BSBPt3mXqDZ5n6SAM5MJgs6Uphj7U19esh5qm
	ulXGEQ28kaR+9Ud64DiWiF7Jg9BEIjNFxp4LjqNb4BKTZGpAmJeiSTib67PqnmubC2/nILKUJ0WiP
	OMkouy5EyC0jTm1Z0VExK8IXBTf+zwFIdhhASNUoUEvUoJQtp+WQW/O3nmRg+P1truQgPcRWGkYrc
	rk5K5YTfSy6v+J+5G8SSbYjG9xWFvu7Ohg5AkOYd8QIPmBmqMqbt9vzpDvsNrN5NmlWJiCW8eRhrO
	aaRo1iAfs2GcQaP8ekEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFL-0000000GFMS-3nBD;
	Sun, 27 Sep 2026 11:40:43 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnFH-0000000GFJc-2Bho
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 11:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509208;
	bh=CPmOq6BK13Nsbhu5OP9qNR730qQVIiIlNJukZT/cixU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=JJl4NTrzCD46gKlTAePEURfB4drhzK0BoRzqikDGm4gbGyiNGHM0sDyjyilU8Gjut
	 iT6zE0vzd4qbYWK4DcURST0V4/faFTPL+c4t44sVk5Im3x8OhsdfuOxY+DpSTZlIJs
	 aN0LMw71t2lyO96vdLIm9/vhA+naIln/2PosGatU=
X-QQ-mid: esmtpgz12t1790509207t267bbc4c
X-QQ-Originating-IP: 8WJQsZz/cgYOM4aQokZMFQH4bIW5uHOxAEzhvAcRm+w=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 279318126302960146
EX-QQ-RecipientCnt: 22
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: [PATCH v3 0/8] Add SpacemiT K1 USB2.0 controllers support
Date: Sun, 27 Sep 2026 19:40:02 +0800
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJIAuWoC/33NzQ6CMAzA8VchO1uyFZDhyfcwHsbYpFE+sgHBE
 N7dQWK8EI//pv11Yd44Mp5dooU5M5Gnrg2RnCKma9U+DFAVmiHHM5cCoUzB90qbhgZ4Chh9iVD
 kqrIaZVJlkoXL3hlL867e7qFr8kPn3vuTSWzT/94kgINFqS0WJkMsry9qxzn+Lsa6a9gGT/jDC
 i6PMdwwnicpWqt4Jg6xdV0/nJ/o2AwBAAA=
X-Change-ID: 20260812-b4-spacemit-k1-usb2-97adfc283d58
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Ze Huang <huang.ze@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=2184;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=asa+MsEEaghr825AnlVjPpirbKiYu35emIZXmfiDU9Y=;
 b=J3/1Pg17aEWHWzQleu4/UIshWwK06TGX4QOp6HooZr0as6nhOi3Jh3Ax8XAvUDSAdY4I95e7G
 tZmf0IbRfhEDZ6vrgGW8bRhI/PRZqsOiaR1HXoVBZ8zGI7KUFfxbR2F
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: M3xlU5+6KERV8T1FpzQDQgcb2nRgOmPz/rID42RDQCRK7G1EgrmVgcu+
	geSLF2GsjaO3wJO8iP49Ogzp8MBIXCETL7vwRYJMklDgnin161t5D+vu9rQXFS7bzL6mQpS
	6z0kvAbH9LkDa8+d1mXKTKhvj4K9IW4g+WIAMpo3FGsfXYRNfk1IZRP+wGG30rvO5tqpILr
	VZGegvrcHnsfjjy2gjPEGGKramgWHOlrh5hl5gR5L97rQ945JR1WQW/Jvd5H4UrmxK5U+9E
	bgvZ6tbZwJdtH2Tqd8SgXAuMMbL6NkGJ0wCHlAn50Th8ITO2ZuoV1NeK+GD6aD9YtWA0bnB
	qSBzQb+vYVBzoaVxmJR1UjwsvkXjTWRHNjDgCzVdB0VtY2g+GiX3vVpeR/NipVq1CqT6etn
	+32K0uNMoK4heoCE6wNrTJR9dH1HAfcvZTMusYEk4XmzsT1JW0x+yXI3QBYFDdghwyXUgKx
	zE7BeZlRjT3DVhw9y9PGB4vDs5hgKs7q+4SszHdOEX3TAes0Ampp0Gm3kbMmih7/8HYI1Hc
	zod40IZUaT6aoa3Pz3UaCFT7t3EOqhkw0bpTynhqsMIZBhGHwWO72jd5GH52cJkFtp7azEM
	BDEbp+t2YmznfOdODecEzANd3oR8urpvsP7Kp6Z5odVQtACerSRybzYTtB27ireZxVqrmV6
	SnWQ5Cydrzo9tsRSBnIUbEiwvCkVRHSBEIKN2DDlrl8Fe1oeBt3R0CP7Pt+b4FqYEUIIMRD
	7oh1Xyl07x2LLzQMfqBizLn9CXEZRKnGjH1PQ5d/MA6qoAc3PaYKLvnc4v6tEYb+w6ql8mG
	5he0dKDBhWBh8R3IKF31HnSXs5KLKF9jaH+HEkBrerZTmmDZzKPLKlFOpBQeEsiRsq3EsOp
	8aH5NS9qKz+SwP98CdnWkLeMtkIUe3BgPpRaa9boPt8IxIYLrEyPgTp+ZQJhtorD+knReud
	8Q2KI7aPSX58vQB2gj2cjnfeyWqttZxv7VpRVU7Hsjy9ZMugL/pZSB6mTiuBbTKEsFhwbPa
	1jvpDXixNNTUlpp+wgRc6bTqbz+Fxms1X6Oncw7XgOw5jKYXznYVuDqRs/7cQrecUpU/PUq
	FSRu2phKku3RxLBI9W6fgpwJHSCXaT4Fbx5EBjXw/OXyY/pRI7vrjuoecLPsnrwscO4CBXj
	X8l6ZHJdj4IprXyPzP5Zdz99EZI4oJLzZwtshRBiN6+PQT+Gc1TjGOIPlA==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044040_189819_AECA1C38 
X-CRM114-Status: UNSURE (   9.51  )
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

The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
support, but the hardware has no internal OTG registers, the other is
Host only. These controllers are compatible with Chipidea USB2 driver
with some flags set and reset control support.

This series is based on 7.3-rc1 and has been tested on Banana Pi F3
development board.

A self-powered USB device/hub is needed to test the host function of the
dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
cellular module e.g.) is needed to test the host only controller.

---
Changes in v3:
- collect tags
- merge the two dt-binding commits
- use local variables when acquiring devm managed clock/reset
- drop manual clk_disable_unprepare() from the remove path
- enable related drivers as modules in defconfig
- Link to v2: https://lore.kernel.org/r/20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

---
Junzhong Pan (8):
      dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
      usb: chipidea: usb2: use devm_clk_get_optional_enabled()
      usb: chipidea: usb2: add optional reset support
      usb: chipidea: usb2: add SpacemiT K1 support
      riscv: dts: spacemit: add USB2.0 controller nodes for K1
      riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
      riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
      riscv: defconfig: enable ChipIdea USB controller support

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 28 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
 arch/riscv/configs/defconfig                       |  4 +++
 drivers/usb/chipidea/ci_hdrc_usb2.c                | 35 +++++++++++--------
 6 files changed, 123 insertions(+), 15 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58

Best regards,
-- 
Junzhong Pan <panjunzhong@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
