Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2016C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDyT5VNSu0oBPko5HAEHlIJ6WMZR9luZtRXHrURuSmE=; b=N//Ls2vFZ3DJap
	tfD2bLQbcd8uFNvT+afktnilO5DpmmFeHO93u5kHY4+XPCetN9d45+9GnUPlSSy2IO+TYZQSF0mwv
	2XEweeeQfmVCw8V2Bzh/kWT9f+dwHp6rekICDCDYOXLB1ongiiRGeEC3KDTFpx4DgQkRA504hx1x9
	vTUrQ15f63iseLDpgrJ8leQKnDBVUUqGO1t4GohXgHiNdFQuca8zRWJqBXvTZEnuksXFhZEhKIzg6
	LBNY0BBFN0JUcU8dN11OELvC6JFN74VFR4Cv3wct+e8zRTVI/yDpve70m8D6W1/YNVKHKGZMzNvOt
	BwFj1ENt6hODUhXUP4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65Gv-00EfTQ-1X;
	Mon, 05 Jun 2023 08:09:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65Gt-00EfSf-11
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 08:09:00 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1q65Gn-00021e-UX; Mon, 05 Jun 2023 10:08:53 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1q65Gi-0003OO-3S; Mon, 05 Jun 2023 10:08:48 +0200
Date: Mon, 5 Jun 2023 10:08:48 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Bjorn Andersson <andersson@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Shengyang Chen <shengyang.chen@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH 9/9] drm/verisilicon: Add starfive hdmi driver
Message-ID: <20230605080848.GA4802@pengutronix.de>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-10-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230602074043.33872-10-keith.zhao@starfivetech.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_010859_375065_1509304F 
X-CRM114-Status: GOOD (  19.82  )
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

Hi Keith,

On Fri, Jun 02, 2023 at 03:40:43PM +0800, Keith Zhao wrote:
> Add HDMI dirver for StarFive SoC JH7110.
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Kconfig         |  11 +
>  drivers/gpu/drm/verisilicon/Makefile        |   1 +
>  drivers/gpu/drm/verisilicon/starfive_hdmi.c | 928 ++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/starfive_hdmi.h | 296 +++++++
>  drivers/gpu/drm/verisilicon/vs_drv.c        |   6 +
>  drivers/gpu/drm/verisilicon/vs_drv.h        |   4 +
>  6 files changed, 1246 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h
> 
[...]
> diff --git a/drivers/gpu/drm/verisilicon/starfive_hdmi.c b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
> new file mode 100644
> index 000000000000..128ecca03309
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
> @@ -0,0 +1,928 @@
[...]
> +static int starfive_hdmi_enable_clk_deassert_rst(struct device *dev, struct starfive_hdmi *hdmi)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(hdmi->sys_clk);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Cannot enable HDMI sys clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(hdmi->mclk);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Cannot enable HDMI mclk clock: %d\n", ret);
> +		return ret;
> +	}
> +	ret = clk_prepare_enable(hdmi->bclk);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Cannot enable HDMI bclk clock: %d\n", ret);
> +		return ret;
> +	}
> +	ret = reset_control_deassert(hdmi->tx_rst);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to deassert tx_rst\n");

The error paths should clk_disable_unprepare() enabled clocks.

> +		return ret;
> +	}
> +	return 0;
> +}
> +
[...]
> +static int starfive_hdmi_get_clk_rst(struct device *dev, struct starfive_hdmi *hdmi)
> +{
> +	hdmi->sys_clk = devm_clk_get(dev, "sysclk");
> +	if (IS_ERR(hdmi->sys_clk)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI sysclk clk\n");
> +		return PTR_ERR(hdmi->sys_clk);
> +	}
> +	hdmi->mclk = devm_clk_get(dev, "mclk");
> +	if (IS_ERR(hdmi->mclk)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI mclk clk\n");
> +		return PTR_ERR(hdmi->mclk);
> +	}
> +	hdmi->bclk = devm_clk_get(dev, "bclk");
> +	if (IS_ERR(hdmi->bclk)) {
> +		DRM_DEV_ERROR(dev, "Unable to get HDMI bclk clk\n");
> +		return PTR_ERR(hdmi->bclk);
> +	}
> +	hdmi->tx_rst = reset_control_get_shared(dev, "hdmi_tx");

Use devm_reset_control_get_shared() for consistency, otherwise this is missing
a reset_control_put() somewhere.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
