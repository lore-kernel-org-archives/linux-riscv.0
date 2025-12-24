Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F08E7545C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dl1+x4ZqD7lxfkigovVnMsz4c34w06ExXRV2UoIeO70=; b=xpAFvgdP6NGEOa
	aqXMNnLLPQrRgjwhrKl/5WElNOWTNGNNT7KLskzkm+LAe1kLsd91w4ZGMh/IzfuX5ud4aeWJgzKjp
	hV0sp0Gk38QkS/pYUqMtNToBGP+eAglm/x3gicYxk5PFqRA6rTocgmnC9BzrLwNJniphlHVdcpOmN
	Ake8gr/6iCxXI7pVxMwPeQK45WMULXTXZYsqdm6sfKjQdHclk2R4R7biYFgVi1s81HSIpbSS+eYCJ
	MijvhwFwAqSKYZfXDg0254bN0BetPy1eZN6fL/BSMBOrcVeJE4HioNvoBJiGdjgCYdZ0mUtxPef1z
	AY66aZlAArZjdyk43uaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRTg-0000000HCqy-3FYg;
	Wed, 24 Dec 2025 16:12:44 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRTb-0000000HCoF-0RDZ
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 16:12:43 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.54])
	by APP-05 (Coremail) with SMTP id zQCowAA3yw7WEExpgGPNAQ--.14041S2;
	Thu, 25 Dec 2025 00:12:09 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v4 0/9] Verisilicon DC8200 driver (and adaption to TH1520)
Date: Thu, 25 Dec 2025 00:11:56 +0800
Message-ID: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3yw7WEExpgGPNAQ--.14041S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Aw18Cw1UArykGr1fAw18Zrb_yoW7AFWxpF
	47AFWFyFyDAa1aqrZ7tF10gay3Aas7JFWfWr47XwnxZ3yqyFy5Zr98AFy5JFWDJr17AryI
	vF4vkr42kr12yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRWv3bUUUUU=
X-Originating-IP: [112.94.100.54]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_081239_545554_A2169CF4 
X-CRM114-Status: GOOD (  15.81  )
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

This patchset tries to add a driver for Verisilicon DC8200 driver, and
demonstrates the driver on T-Head TH1520 with its HDMI output.

This display controller IP is used on StarFive JH7110 too, but as the
HDMI controller used there isn't as common as the DesignWare one, I
choose to use TH1520 in this patchset.

The DC driver is written with other DC-series (mainly DC8000, which is
known to be used on Eswin EIC7700 SoC) display controllers in mind, and
uses the identification registers available on all Vivante branded IPs.
A known exception is DCNano display controller, which is unlikely to be
supported by this driver because of totally different register map and
no known identification registers. (P.S. the in-tree loongson DRM driver
seems to be for some DCNano instances based on the register map.)

The HDMI controller seems to come with some common PHY by Synopsys, the
DesignWare HDMI TX 2.0 PHY. By searching a few register names from the
BSP driver of that PHY, that PHY seems to be used by a in-tree dw-hdmi
glue, rcar_dw_hdmi -- an updated downstream version of rcar_dw_hdmi
contains all 6 registers set here in the th1520-dw-hdmi driver. Some
more suprising thing is that RK3288 uses the same PHY too, but the
in-tree dw_hdmi-rockchip driver writes the configuration data array in a
weird way to reuse the HDMI 3D TX PHY configuring function. It might be
valuable to add common configuring function and configuration data
definition for this HDMI 2.0 PHY too, but the current driver in this
patchset simply duplicated most configuration logic from rcar_dw_hdmi
driver (but with 3 extra configuration registers configured).

Icenowy Zheng (9):
  dt-bindings: vendor-prefixes: add verisilicon
  dt-bindings: display: add verisilicon,dc
  drm: verisilicon: add a driver for Verisilicon display controllers
  dt-bindings: display/bridge: add binding for TH1520 HDMI controller
  drm/bridge: add a driver for T-Head TH1520 HDMI controller
  riscv: dts: thead: add DPU and HDMI device tree nodes
  riscv: dts: thead: lichee-pi-4a: enable HDMI
  MAINTAINERS: assign myself as maintainer for verisilicon DC driver
  mailmap: map all Icenowy Zheng's mail addresses

 .mailmap                                      |   4 +
 .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 +++++++
 .../bindings/display/verisilicon,dc.yaml      | 144 ++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  26 +-
 arch/riscv/boot/dts/thead/th1520.dtsi         |  70 ++++
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c       | 173 +++++++++
 drivers/gpu/drm/verisilicon/Kconfig           |  15 +
 drivers/gpu/drm/verisilicon/Makefile          |   5 +
 drivers/gpu/drm/verisilicon/vs_bridge.c       | 331 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_bridge.h       |  40 +++
 drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  54 +++
 drivers/gpu/drm/verisilicon/vs_crtc.c         | 217 ++++++++++++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |  29 ++
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 ++++
 drivers/gpu/drm/verisilicon/vs_dc.c           | 205 +++++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h           |  39 +++
 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
 drivers/gpu/drm/verisilicon/vs_drm.c          | 177 ++++++++++
 drivers/gpu/drm/verisilicon/vs_drm.h          |  29 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 ++++++++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
 drivers/gpu/drm/verisilicon/vs_plane.c        | 102 ++++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |  68 ++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    | 157 +++++++++
 .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
 31 files changed, 2347 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
 create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
