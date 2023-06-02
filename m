Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3ACC7EE33
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 07:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C7KuazsztS8d5LoXXXpTjLvGSwsPIwLPGYIVhSeomoI=; b=WzSFoGYprzDwSI
	hhLhWd+iFe5cinYuVun4COlAcQdlyHWmXRzoFEGPiDjt2d2K0xLa3JZyR2TWnW7oyPICFjHztgMN0
	HdYecQCvBCrGYkfsQQ5EAmxBBSWxLIljfcNxnUzTAtjrCc95/McBqtu2eQe+ZDhbgJkaTu9XYlgYo
	KDOLBhuKwIinv/3+l2/Qx1U7mj/c5xS1+L4WD0M5gQPaCVOh22DHxr1ph+2nmVb4+Wr09uOpdD/Fr
	2kSkzj41qhxaSz988nAKflaXaHAd/i3umLsXieIaYMP8WFm6EBj3eyHHk4y9+7C9CVlRamQhANbXy
	gtYM177q9uk7yI3PnZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4zPo-0062Po-05;
	Fri, 02 Jun 2023 07:41:40 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4zPl-0062G1-0S
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 07:41:38 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 546D280E2;
	Fri,  2 Jun 2023 15:40:47 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:47 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:46 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki
	<jagan@edgeble.ai>, Chris Morgan <macromorgan@hotmail.com>, Keith Zhao
	<keith.zhao@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
	Shengyang Chen <shengyang.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>
Subject: [PATCH 0/9] Add DRM driver for StarFive SoC JH7110
Date: Fri, 2 Jun 2023 15:40:34 +0800
Message-ID: <20230602074043.33872-1-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_004137_498634_1DC22C26 
X-CRM114-Status: GOOD (  12.82  )
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

Hi,

This series is a DRM driver for StarFive SoC JH7110, which includes a
display controller driver for Verisilicon DC8200 and an HMDI driver.

We use GEM framework for buffer management and allocate memory by 
using DMA APIs.

The JH7110 display subsystem includes a display controller Verisilicon
DC8200 and an HDMI transmitter. The HDMI TX IP is designed for transmitting 
video and audio data from DC8200 to a display device. The HDMI TX IP 
consists of  the digital controller and the physical layer.

This series does not support HDMI audio driver.

Keith Zhao (9):
  dt-bindings: display: Add yamls for JH7110 display subsystem
  riscv: dts: starfive: jh7110: add dc&hdmi controller node
  drm/verisilicon: Add basic drm driver
  drm/verisilicon: Add gem driver for JH7110 SoC
  drm/verisilicon: Add mode config funcs
  drm/verisilicon: Add drm crtc funcs
  drm/verisilicon: Add drm plane funcs
  drm/verisilicon: Add verisilicon dc controller driver
  drm/verisilicon: Add starfive hdmi driver

 .../display/verisilicon/starfive-hdmi.yaml    |   93 +
 .../display/verisilicon/verisilicon-dc.yaml   |  110 +
 .../display/verisilicon/verisilicon-drm.yaml  |   42 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    9 +
 .../jh7110-starfive-visionfive-2.dtsi         |   87 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   46 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/verisilicon/Kconfig           |   24 +
 drivers/gpu/drm/verisilicon/Makefile          |   13 +
 drivers/gpu/drm/verisilicon/starfive_hdmi.c   |  928 ++++++++
 drivers/gpu/drm/verisilicon/starfive_hdmi.h   |  296 +++
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  388 ++++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |   74 +
 drivers/gpu/drm/verisilicon/vs_dc.c           | 1040 +++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h           |   62 +
 drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 2008 +++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  496 ++++
 drivers/gpu/drm/verisilicon/vs_drv.c          |  301 +++
 drivers/gpu/drm/verisilicon/vs_drv.h          |   52 +
 drivers/gpu/drm/verisilicon/vs_fb.c           |  181 ++
 drivers/gpu/drm/verisilicon/vs_fb.h           |   15 +
 drivers/gpu/drm/verisilicon/vs_gem.c          |  372 +++
 drivers/gpu/drm/verisilicon/vs_gem.h          |   72 +
 drivers/gpu/drm/verisilicon/vs_plane.c        |  440 ++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |   74 +
 drivers/gpu/drm/verisilicon/vs_type.h         |   72 +
 include/uapi/drm/drm_fourcc.h                 |   83 +
 include/uapi/drm/vs_drm.h                     |   50 +
 30 files changed, 7433 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon/starfive-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon/verisilicon-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon/verisilicon-drm.yaml
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
 create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
 create mode 100644 include/uapi/drm/vs_drm.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
