Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21927D10367
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 04:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VVvVbUpy1j1UFDq7NuMSOxhvV0j/vK0S0N3kSIjmTgs=; b=cj3i9yg8HvqiJj
	EFpNV9SPQwmb6JkGBJ1INafMMIt8QyCpD6Be2tjDzZQmCj4LKnheoUhXECPXFsXzhpkbKiZe5MINx
	it++1wKuQVZ+sLYOa/uaNvtXKKu8w94H8tYiV1HNl2frFRnc3DI5J6rMsoHieotsT1T+mX3/eBi4D
	O+Em5BiZcU/NmS3EDBe+MzuYfcHn8HknnCd0XsoLIurnqrQWVATbN2zrV8AEZCOLzs0cz0lZ9zF0x
	g59BteKiP+0l2A4bAGnKYtuXP5pdyFIxZPuyR3v/v4TMHDJ5y0gYdk7CnWH9i04Qe85YJqtRPfnBp
	0T0/kY+hudckkhAozVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO7Wf-0000000EMOh-1YDx;
	Wed, 26 Nov 2025 04:53:09 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO7Wa-0000000EMN5-3HJL
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 04:53:08 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.155])
	by APP-05 (Coremail) with SMTP id zQCowADn4mOUhyZpi2gbAg--.38374S2;
	Wed, 26 Nov 2025 12:52:38 +0800 (CST)
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
Subject: [PATCH RESEND v3 0/9] Verisilicon DC8200 driver (and adaption to TH1520)
Date: Wed, 26 Nov 2025 12:52:24 +0800
Message-ID: <20251126045233.218286-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn4mOUhyZpi2gbAg--.38374S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Aw18Cw1UArykGr13tw1UJrb_yoW7Zr13pF
	47AFWFyFyDAa1aqrZ7tF10gay3Aas7JFWfWr47XwnxZ39FyFy5Zr98Ary5JFWDJr17AryI
	vF4vkr42kr12yF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUv5l8UUUUU
X-Originating-IP: [112.94.101.155]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_205305_192047_A1137E72 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: devicetree@vger.kernel.org, Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Icenowy Zheng <uwu@icenowy.me>

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

Resent for switching the sending email to ISCAS one -- the password
keeping problem is solved thanks to git-credential-libsecret .

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
 .../bindings/display/verisilicon,dc.yaml      | 146 ++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  25 ++
 arch/riscv/boot/dts/thead/th1520.dtsi         |  70 ++++
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c       | 173 +++++++++
 drivers/gpu/drm/verisilicon/Kconfig           |  15 +
 drivers/gpu/drm/verisilicon/Makefile          |   5 +
 drivers/gpu/drm/verisilicon/vs_bridge.c       | 330 ++++++++++++++++++
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
 31 files changed, 2348 insertions(+)
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
