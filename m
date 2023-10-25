Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE63C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J0Zsafq/5jYifn2XdOKK/IE9I7BgRGSLLEZU+mLdAE=; b=gFFbs90X7sp1HTi8+TkU6d/Qdq
	nc7qB3L64h0jBsb7FuVQXK7aYcfrVwI5FQaKzKoWgVO4vNonh4purKhN6at3/8KnvCbV+NmOtRyz/
	ts3fBkbswM9YMUGXuNVEuIPGR7i1esccMjFBvAUCk3AU1dcpbIUJLjv2SsPtItiJrYeBa4t//sEXr
	9wvjRMKN+2u0Mh+sUSVY4Kp3poKrnQY0EsRKp++bbciA6/qnNxcw5kfzL69rv1xtrkcMu3XS6zsGr
	BmA/Rc+T1wPGI2zanatGiSwwjdRHceftslR0jI9CJHQ7mkxR0Ids2hUkVwgwuLDnvKGOTSOkMFiwl
	Gj7h1jLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qveXW-00CTcC-1j;
	Wed, 25 Oct 2023 14:07:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qveXM-00CTZ2-1p
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 14:07:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DD0A2B82F7F;
	Wed, 25 Oct 2023 14:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFEFC433C8;
	Wed, 25 Oct 2023 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698242826;
	bh=Zee+eW93udYcnyqtqjHObnizhWlLmAgeUVCuNGTK10c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmqVUmUz0UOCgO9GV+60fX6HqNIqZIp1hjMn6Tmm8aa45TUpCC8MbYutA93Z+/quZ
	 bnI3K6Z544gS9Yxjyr0Cc5pZNZ3j9fiekUlH2Q5cbvNzD7/YyKDygMoG0xqao0ZJYo
	 74JYxAc2EBJujr9Odf9sr+KFvIv921z42mcpTav5PHfwhOHcZ+LexTEk12M535Kqo4
	 CGQ8LTP6RIy/O0C+jJEqUugYsVk5Zu4FhOJbIohWZJ1TZWGzx/JUX950EN7yGREPZB
	 Wk0I5Xs0K+L3YOTR2+AqmKcrLaMDz/0D4woqgJM6ImuKcv2L7pFeo8TYuXCCl3+lnb
	 1341mqfpN7b2g==
Date: Wed, 25 Oct 2023 16:07:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
	Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
	Chris Morgan <macromorgan@hotmail.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Shengyang Chen <shengyang.chen@starfivetech.com>, Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
Message-ID: <3ud27r322pkaflcs2bw7fwomymt4niws6nchmosjfhlcxr2wek@fvycunfo3rdn>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231025103957.3776-7-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_070708_910653_C2DCB1A2 
X-CRM114-Status: GOOD (  21.61  )
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
Content-Type: multipart/mixed; boundary="===============2793725183470938996=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2793725183470938996==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="66s2onyuolrasskv"
Content-Disposition: inline


--66s2onyuolrasskv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 25, 2023 at 06:39:57PM +0800, Keith Zhao wrote:
> +static int starfive_hdmi_setup(struct starfive_hdmi *hdmi,
> +			       struct drm_display_mode *mode)
> +{
> +	hdmi_modb(hdmi, STARFIVE_BIAS_CONTROL, STARFIVE_BIAS_ENABLE, STARFIVE_BIAS_ENABLE);
> +	hdmi_writeb(hdmi, STARFIVE_RX_CONTROL, STARFIVE_RX_ENABLE);
> +	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);

You're never using that variable.

> +	hdmi->tmds_rate = mode->clock * 1000;
> +	starfive_hdmi_phy_clk_set_rate(hdmi);
> +
> +	while (!(hdmi_readb(hdmi, STARFIVE_PRE_PLL_LOCK_STATUS) & 0x1))
> +		continue;
> +	while (!(hdmi_readb(hdmi, STARFIVE_POST_PLL_LOCK_STATUS) & 0x1))
> +		continue;
> +
> +	/*turn on LDO*/
> +	hdmi_writeb(hdmi, STARFIVE_LDO_CONTROL, STARFIVE_LDO_ENABLE);
> +	/*turn on serializer*/
> +	hdmi_writeb(hdmi, STARFIVE_SERIALIER_CONTROL, STARFIVE_SERIALIER_ENABLE);
> +
> +	starfive_hdmi_tx_phy_power_down(hdmi);
> +	starfive_hdmi_config_video_timing(hdmi, mode);
> +	starfive_hdmi_tx_phy_power_on(hdmi);
> +
> +	starfive_hdmi_tmds_driver_on(hdmi);
> +	starfive_hdmi_sync_tmds(hdmi);
> +
> +	return 0;
> +}
> +
> +static void starfive_hdmi_encoder_mode_set(struct drm_encoder *encoder,
> +					   struct drm_display_mode *mode,
> +					   struct drm_display_mode *adj_mode)
> +{
> +	struct starfive_hdmi *hdmi = encoder_to_hdmi(encoder);
> +
> +	drm_mode_copy(&hdmi->previous_mode, adj_mode);
> +}

You're never using that field, and it's not the previous mode, but the current mode.

> +static void starfive_hdmi_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct starfive_hdmi *hdmi = encoder_to_hdmi(encoder);
> +	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> +	int ret, idx;
> +	struct drm_device *drm = hdmi->connector.dev;
> +
> +	if (drm && !drm_dev_enter(drm, &idx))
> +		return;
> +
> +	ret = pm_runtime_get_sync(hdmi->dev);
> +	if (ret < 0)
> +		return;

pm_runtime_resume_and_get is what you want here

> +	mdelay(10);

???

Sprinkling delays here and there isn't great. What is the issue this is
trying to workaround?

> +	starfive_hdmi_setup(hdmi, mode);
> +
> +	if (drm)
> +		drm_dev_exit(idx);
> +}
> +
> +static void starfive_hdmi_encoder_disable(struct drm_encoder *encoder)
> +{
> +	struct starfive_hdmi *hdmi = encoder_to_hdmi(encoder);
> +
> +	int idx;
> +	struct drm_device *drm = hdmi->connector.dev;
> +
> +	if (drm && !drm_dev_enter(drm, &idx))
> +		return;
> +
> +	pm_runtime_put(hdmi->dev);

pm_runtime calls should be safe anytime. If you need to protect them
through a drm_dev_enter call, that call should be in the pm_runtime hook
itself.

> +	if (drm)
> +		drm_dev_exit(idx);
> +}
> +
> +static int
> +starfive_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
> +{
> +	bool valid = false;
> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(crtc_state);
> +
> +	vs_crtc_state->encoder_type = encoder->encoder_type;
> +	vs_crtc_state->output_fmt = MEDIA_BUS_FMT_RGB888_1X24;

Ok, so those two will always be ENCODER_TMDS and RGB888. Drop them from
your CRTC state and use the proper defines there.

> +	const struct pre_pll_config *cfg = pre_pll_cfg_table;
> +	int pclk = mode->clock * 1000;
> +
> +	for (; cfg->pixclock != 0; cfg++) {
> +		if (pclk == cfg->pixclock) {
> +			if (pclk > 297000000)
> +				continue;
> +
> +			valid = true;
> +			break;
> +		}
> +	}
> +
> +	return (valid) ? 0 : -EINVAL;
> +}
> +
> +static const struct drm_encoder_helper_funcs starfive_hdmi_encoder_helper_funcs = {
> +	.enable     = starfive_hdmi_encoder_enable,
> +	.disable    = starfive_hdmi_encoder_disable,
> +	.mode_set   = starfive_hdmi_encoder_mode_set,
> +	.atomic_check = starfive_hdmi_encoder_atomic_check,
> +};
> +
> +static enum drm_connector_status
> +starfive_hdmi_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	struct starfive_hdmi *hdmi = connector_to_hdmi(connector);
> +	struct drm_device *drm = hdmi->connector.dev;
> +	int ret;
> +	int idx;
> +
> +	if (drm && !drm_dev_enter(drm, &idx))
> +		return connector_status_disconnected;
> +
> +	ret = pm_runtime_get_sync(hdmi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG) ?
> +		connector_status_connected : connector_status_disconnected;
> +	pm_runtime_put(hdmi->dev);
> +
> +	if (drm)
> +		drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static int starfive_hdmi_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct starfive_hdmi *hdmi = connector_to_hdmi(connector);
> +	struct edid *edid;
> +	int ret = 0;
> +
> +	if (!hdmi->ddc)
> +		return 0;
> +	ret = pm_runtime_get_sync(hdmi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	edid = drm_get_edid(connector, hdmi->ddc);
> +	if (edid) {
> +		hdmi->hdmi_data.sink_is_hdmi = drm_detect_hdmi_monitor(edid);

You're not using that field anywhere, and it's available in drm_display_info already.

> +		hdmi->hdmi_data.sink_has_audio = drm_detect_monitor_audio(edid);

Ditto

> +struct hdmi_data_info {
> +	int vic;
> +	bool sink_is_hdmi;
> +	bool sink_has_audio;
> +	unsigned int enc_in_format;

You're not using it

> +	unsigned int enc_out_format;

Ditto

> +	unsigned int colorimetry;

Ditto

Which means that as things stands, you can get rid of that entire
structure.

> +};
> +
> +struct starfive_hdmi {
> +	struct device *dev;
> +	struct drm_device *drm_dev;
> +	struct drm_encoder	encoder;
> +	struct drm_connector	connector;
> +
> +	struct starfive_hdmi_i2c *i2c;
> +
> +	int irq;
> +	struct clk *sys_clk;
> +	struct clk *mclk;
> +	struct clk *bclk;
> +	struct reset_control *tx_rst;
> +	void __iomem *regs;
> +
> +	struct i2c_adapter *ddc;
> +
> +	unsigned long tmds_rate;

You're not using that either.

Maxime

--66s2onyuolrasskv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTkhBwAKCRDj7w1vZxhR
xeTuAP99oERAnvU2fXnykYFW54PBm3gLFqfrf2Z5JgERsAxT0AD/WQn+VOFkfmGS
WHhxPbr9LHj5tiAXXZ37JfQt4XsOtgg=
=eGdb
-----END PGP SIGNATURE-----

--66s2onyuolrasskv--


--===============2793725183470938996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2793725183470938996==--

