Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0278DC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BIJfnQp5ATfYr6AODA3IFbZMYzk5SNNoMExTCENYY8=; b=cZdTYBH+b021zh
	qmsXwecJM/EozhoAa3telrl6Az4jN3xPAYSrGkZYvDsEcZL+vohzkru7HDauKW4w8YGG+v4Tf93H0
	2dY6v9D5SXchyEQImzwrb8j5WPlD4/cPEBm3bFVPs+2X3ZndL8VgQRMFIrIu6QepZnX88mDnvCo4m
	jOJZCg28GASX1vrYoenfInFimYPgiWKtl+r1KUYNDXfWveDBkJWMI4lnPyBIZzycyt7q6CLyI4F2+
	/ZY/M/vq4DmNWx/NU71FCLZ9eC2ulIwC8GIV7HqP0x9EgZokzCOA6gEs+Pgj/KEJEOW98XklGgGI7
	4pGn/3JJKscY1Lm+tBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAU5r-007Ko3-2U;
	Tue, 05 Dec 2023 12:00:03 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAU5o-007Klu-1j
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 12:00:02 +0000
Message-ID: <50e674a2-89f8-46d2-8efe-3cf65ca1b554@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701777590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9FNNsCD4UdrxJOkb/IVwaih82zP1k+LML9/DNjLCExQ=;
	b=IAVA675At4yZ/VrLScYNDbl/w7pWWgyAmRpL+D3r5bkICJmsonRbjwkAPoE5YDQ5PJf7d4
	ejJy1DXjM77hAzel142fv9DyEYR+kvK6f2OLGTEiKxuxz7vAwGPnN26LMyG7Nbb0rHuWtp
	+wCRBTsxbOQyI9Oogr51f/SrfOePv0s=
Date: Tue, 5 Dec 2023 19:59:40 +0800
MIME-Version: 1.0
Subject: Re: [v3 0/6] DRM driver for verisilicon
To: Keith Zhao <keith.zhao@starfivetech.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: aou@eecs.berkeley.edu, tzimmermann@suse.de, paul.walmsley@sifive.com,
 mripard@kernel.org, xingyu.wu@starfivetech.com, jack.zhu@starfivetech.com,
 palmer@dabbelt.com, krzysztof.kozlowski+dt@linaro.org,
 william.qiu@starfivetech.com, shengyang.chen@starfivetech.com,
 changhuang.liang@starfivetech.com
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231204123315.28456-1-keith.zhao@starfivetech.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_040000_739734_CA04567E 
X-CRM114-Status: GOOD (  17.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 2023/12/4 20:33, Keith Zhao wrote:
> This patch is a drm driver for Starfive Soc JH7110,
> I am sending Drm driver part and HDMI driver part.
>
> We used GEM framework for buffer management,
> and for buffer allocation,we use DMA APIs.
>
> the Starfive HDMI servers as interface between a LCD Controller
> and a HDMI bus.
> A HDMI TX consists of one HDMI transmitter controller
> and one HDMI transmitter PHY.
> (Sound support is not include in this patch)
>
> This patchset should be applied on next branch.


Please study Thomas's patch[1][2] carefully and write a good cover letter.
Introduce what each single patch does, demonstrate how the whole driver is
divided and organized, and why. And probably keep contact with him if he
would like to curve your driver to a good shape. :-)


[1] https://lore.kernel.org/dri-devel/20200715145902.13122-1-tzimmermann@suse.de/
[2] https://lore.kernel.org/dri-devel/20231113091439.17181-1-tzimmermann@suse.de/


> V1:
> Changes since v1:
> - Further standardize the yaml file.
> - Dts naming convention improved.
> - Fix the problem of compiling and loading ko files.
> - Use drm new api to automatically manage resources.
> - Drop vs_crtc_funcs&vs_plane_funcs, subdivide the plane's help interface.
> - Reduce the modifiers unused.
> - Optimize the hdmi driver code
>
> V2:
> Changes since v2:
> - fix the error about checking the yaml file.
> - match drm driver GEM DMA API.
> - Delete the custom crtc property .
> - hdmi use drmm_ new api to automatically manage resources.
> - update the modifiers comments.
> - enabling KASAN, fix the error during removing module
>
> V3:
> Changes since v3:
> - Delete the custom plane property.
> - Delete the custom fourcc modifiers.
> - Adjust the calculation mode of hdmi pixclock.
> - Add match data for dc8200 driver.
> - Adjust some magic values.
> - Add a simple encoder for dsi output.
>
> Keith Zhao (6):
>    dt-bindings: display: Add yamls for JH7110 display system
>    riscv: dts: starfive: jh7110: display subsystem
>    drm/vs: Register DRM device
>    drm/vs: Add KMS crtc&plane
>    drm/vs: Add hdmi driver
>    drm/vs: simple encoder
>
>   .../starfive/starfive,display-subsystem.yaml  |  104 ++
>   .../starfive/starfive,dsi-encoder.yaml        |   92 ++
>   .../starfive/starfive,jh7110-dc8200.yaml      |  113 ++
>   .../starfive/starfive,jh7110-inno-hdmi.yaml   |   82 ++
>   .../soc/starfive/starfive,jh7110-syscon.yaml  |    1 +
>   MAINTAINERS                                   |    8 +
>   .../jh7110-starfive-visionfive-2.dtsi         |  134 ++
>   arch/riscv/boot/dts/starfive/jh7110.dtsi      |   49 +
>   drivers/gpu/drm/Kconfig                       |    2 +
>   drivers/gpu/drm/Makefile                      |    1 +
>   drivers/gpu/drm/verisilicon/Kconfig           |   21 +
>   drivers/gpu/drm/verisilicon/Makefile          |   12 +
>   drivers/gpu/drm/verisilicon/starfive_hdmi.c   |  849 ++++++++++++
>   drivers/gpu/drm/verisilicon/starfive_hdmi.h   |  304 +++++
>   drivers/gpu/drm/verisilicon/vs_crtc.c         |  208 +++
>   drivers/gpu/drm/verisilicon/vs_crtc.h         |   42 +
>   drivers/gpu/drm/verisilicon/vs_dc.c           | 1192 +++++++++++++++++
>   drivers/gpu/drm/verisilicon/vs_dc.h           |   67 +
>   drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 1022 ++++++++++++++
>   drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  580 ++++++++
>   drivers/gpu/drm/verisilicon/vs_drv.c          |  323 +++++
>   drivers/gpu/drm/verisilicon/vs_drv.h          |   46 +
>   drivers/gpu/drm/verisilicon/vs_modeset.c      |   39 +
>   drivers/gpu/drm/verisilicon/vs_modeset.h      |   10 +
>   drivers/gpu/drm/verisilicon/vs_plane.c        |  301 +++++
>   drivers/gpu/drm/verisilicon/vs_plane.h        |   39 +
>   drivers/gpu/drm/verisilicon/vs_simple_enc.c   |  195 +++
>   drivers/gpu/drm/verisilicon/vs_simple_enc.h   |   23 +
>   drivers/gpu/drm/verisilicon/vs_type.h         |   69 +
>   29 files changed, 5928 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
>   create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>   create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>   create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
>   create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
