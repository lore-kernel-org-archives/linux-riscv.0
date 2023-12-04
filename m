Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ABBC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cwfcfoaYyE9LN+eclMIVuPE+wlpeYYilwqN5FEq31kc=; b=LlqnEoY2b1zcBN
	Jm8148z4CsxILehPnXv5cM59dlKu1xT5TOEHt8nr06boi/hav+b1B0pBcS5hRgdjW5LqusXPTrVeP
	pZZWECic0wCPvYjF3V8RZ+u6hIhD1cpjC9HDJ/jSbV7kPKNIlGNvUD02fruSRnZMSl8ihhLTx6nJB
	GCtkkDbbbsIC1WLVzpDZCi1i0tW8WENK5rwh1us9IiHQvitJq4Ed79ca4hm27FUD3gC11snCb43sY
	DxhhwiRepwpaxEDqRuFYBXfFtSeSs5hK4KTNgTJ0qf6yUGcZfsmOXrrcyXLop+lPTfxIc0hI6mct/
	WyfORHj2B2N0jwRzChYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA89O-0044Ac-0d;
	Mon, 04 Dec 2023 12:34:14 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA89K-0043dB-29
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 12:34:12 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 00B9481BB;
	Mon,  4 Dec 2023 20:33:17 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:17 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:16 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Keith Zhao <keith.zhao@starfivetech.com>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <william.qiu@starfivetech.com>,
	<xingyu.wu@starfivetech.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <p.zabel@pengutronix.de>,
	<shengyang.chen@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<changhuang.liang@starfivetech.com>, <maarten.lankhorst@linux.intel.com>,
	<suijingfeng@loongson.cn>
Subject: [v3 0/6] DRM driver for verisilicon
Date: Mon, 4 Dec 2023 20:33:09 +0800
Message-ID: <20231204123315.28456-1-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_043411_044111_90C4589E 
X-CRM114-Status: GOOD (  14.17  )
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

This patch is a drm driver for Starfive Soc JH7110,
I am sending Drm driver part and HDMI driver part.

We used GEM framework for buffer management,
and for buffer allocation,we use DMA APIs.

the Starfive HDMI servers as interface between a LCD Controller 
and a HDMI bus. 
A HDMI TX consists of one HDMI transmitter controller 
and one HDMI transmitter PHY.
(Sound support is not include in this patch)

This patchset should be applied on next branch.

V1:
Changes since v1:
- Further standardize the yaml file.
- Dts naming convention improved.
- Fix the problem of compiling and loading ko files.
- Use drm new api to automatically manage resources.
- Drop vs_crtc_funcs&vs_plane_funcs, subdivide the plane's help interface.
- Reduce the modifiers unused.
- Optimize the hdmi driver code

V2:
Changes since v2:
- fix the error about checking the yaml file.
- match drm driver GEM DMA API.
- Delete the custom crtc property .
- hdmi use drmm_ new api to automatically manage resources.
- update the modifiers comments.
- enabling KASAN, fix the error during removing module 

V3:
Changes since v3:
- Delete the custom plane property.
- Delete the custom fourcc modifiers.
- Adjust the calculation mode of hdmi pixclock.
- Add match data for dc8200 driver.
- Adjust some magic values.
- Add a simple encoder for dsi output.

Keith Zhao (6):
  dt-bindings: display: Add yamls for JH7110 display system
  riscv: dts: starfive: jh7110: display subsystem
  drm/vs: Register DRM device
  drm/vs: Add KMS crtc&plane
  drm/vs: Add hdmi driver
  drm/vs: simple encoder

 .../starfive/starfive,display-subsystem.yaml  |  104 ++
 .../starfive/starfive,dsi-encoder.yaml        |   92 ++
 .../starfive/starfive,jh7110-dc8200.yaml      |  113 ++
 .../starfive/starfive,jh7110-inno-hdmi.yaml   |   82 ++
 .../soc/starfive/starfive,jh7110-syscon.yaml  |    1 +
 MAINTAINERS                                   |    8 +
 .../jh7110-starfive-visionfive-2.dtsi         |  134 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   49 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/verisilicon/Kconfig           |   21 +
 drivers/gpu/drm/verisilicon/Makefile          |   12 +
 drivers/gpu/drm/verisilicon/starfive_hdmi.c   |  849 ++++++++++++
 drivers/gpu/drm/verisilicon/starfive_hdmi.h   |  304 +++++
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  208 +++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |   42 +
 drivers/gpu/drm/verisilicon/vs_dc.c           | 1192 +++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h           |   67 +
 drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 1022 ++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  580 ++++++++
 drivers/gpu/drm/verisilicon/vs_drv.c          |  323 +++++
 drivers/gpu/drm/verisilicon/vs_drv.h          |   46 +
 drivers/gpu/drm/verisilicon/vs_modeset.c      |   39 +
 drivers/gpu/drm/verisilicon/vs_modeset.h      |   10 +
 drivers/gpu/drm/verisilicon/vs_plane.c        |  301 +++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |   39 +
 drivers/gpu/drm/verisilicon/vs_simple_enc.c   |  195 +++
 drivers/gpu/drm/verisilicon/vs_simple_enc.h   |   23 +
 drivers/gpu/drm/verisilicon/vs_type.h         |   69 +
 29 files changed, 5928 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
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
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
