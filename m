Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C76CC55825
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZZSvxH6tBjCOB/usvxgv0ir0SqIZoXyNQGbMdlDcE4=; b=hA02VWdY9UCxqK
	jSjCcMyArFaJUesTwgjCsB4X1+mcYYhe0n8wG/fdBF8mRfKmY5Q09t5T5GUEpAumgTzzdxAJ4J8GP
	dWYPiExtx5jpwqt3A1buMQEjXNb48VZM1kSuVJR7t7DLT53Vw4v30m9MQDN6bxy4BAEQ6Ms7DD1xp
	j1KkiXPDiO/Iu/+GLxu9cf0stLW7vuOGVh1NUay7cjkdntsAFckmZ8jPuS0dGmTI4E0i2afjCkg0q
	oDddCAOU9eFIdM04+gmjmKzocB004O4EMh+b86S8Rra4NQ2VAK+eMkt0qk0oMOdrK9KJkEG1xDMdt
	9wG7W/Eu8HLeUnatK8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HGJ-0015X5-0u;
	Wed, 15 Nov 2023 14:53:03 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HGE-0015TN-21
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 14:53:01 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3CE7C24E20F;
	Wed, 15 Nov 2023 22:52:28 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 22:52:28 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 22:52:27 +0800
Message-ID: <21e14a40-e707-4925-b43b-6656ae59d680@starfivetech.com>
Date: Wed, 15 Nov 2023 22:52:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/vs: Add KMS crtc&plane
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sumit Semwal
	<sumit.semwal@linaro.org>, "christian.koenig@amd.com"
	<christian.koenig@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki
	<jagan@edgeble.ai>, Chris Morgan <macromorgan@hotmail.com>, Jack Zhu
	<jack.zhu@starfivetech.com>, Shengyang Chen
	<shengyang.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-6-keith.zhao@starfivetech.com>
 <pfjfxkpg4cheozhnjgql67ntfiapssba36ukusqrlo6za4owv3@mwzucmdqboy5>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <pfjfxkpg4cheozhnjgql67ntfiapssba36ukusqrlo6za4owv3@mwzucmdqboy5>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_065259_221042_A3261D8D 
X-CRM114-Status: GOOD (  32.31  )
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



On 2023/10/25 21:57, Maxime Ripard wrote:
> On Wed, Oct 25, 2023 at 06:39:56PM +0800, Keith Zhao wrote:
>> +static struct drm_crtc_state *
>> +vs_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
>> +{
>> +	struct vs_crtc_state *ori_state;
>> +	struct vs_crtc_state *state;
>> +
>> +	if (!crtc->state)
>> +		return NULL;
>> +
>> +	ori_state = to_vs_crtc_state(crtc->state);
>> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
>> +	if (!state)
>> +		return NULL;
>> +
>> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
>> +
>> +	state->output_fmt = ori_state->output_fmt;
> 
> That field is never set in your patch.
> 
>> +	state->encoder_type = ori_state->encoder_type;
> 
> That isn't either, and it's not clear why you would need the
> encoder_type stored in the CRTC?
> 
>> +	state->bpp = ori_state->bpp;
> 
> You seem to derive that from output_fmt, it doesn't need to be in the
> CRTC state.
> 
>> +	state->underflow = ori_state->underflow;
> 
> Assuming you're setting this from the interrupt handler, it's unsafe,
> you shouldn't do that. What are you using it for?
I am going to use the crtc_debugfs function for printing.
crtc_debugfs  will use it
But now I'd better delete it

> 
>> +static const struct drm_prop_enum_list vs_sync_mode_enum_list[] = {
>> +	{ VS_SINGLE_DC,				"single dc mode" },
>> +	{ VS_MULTI_DC_PRIMARY,		"primary dc for multi dc mode" },
>> +	{ VS_MULTI_DC_SECONDARY,	"secondary dc for multi dc mode" },
>> +};
> 
> Custom driver properties are a no-go:
> https://docs.kernel.org/gpu/drm-kms.html#requirements
> 
> And
> 
> https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requirements
> 
>> +void vs_dc_enable(struct vs_dc *dc, struct drm_crtc *crtc)
>> +{
>> +	struct vs_crtc_state *crtc_state = to_vs_crtc_state(crtc->state);
>> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>> +	struct dc_hw_display display;
> 
> Why are you rolling your own structure here, if it's exactly equivalent
> to what drm_display_mode and the crtc_state provide?
My original intention was to make the hardware part purer. and 
want to decouple hardware from drm struct.

so I define the own structure  between drm and hardware.
Maybe doing this will make both the hardware and drm happy

> 
>> +void vs_dc_commit(struct vs_dc *dc)
>> +{
>> +	dc_hw_enable_shadow_register(&dc->hw, false);
>> +
>> +	dc_hw_commit(&dc->hw);
>> +
>> +	if (dc->first_frame)
>> +		dc->first_frame = false;
>> +
>> +	dc_hw_enable_shadow_register(&dc->hw, true);
>> +}
> 
> It's not clear to me what you're trying to do here, does the hardware
> have latched registers that are only updated during vblank?
> 
>> +static int dc_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct drm_device *drm_dev = data;
>> +	struct vs_dc *dc = dev_get_drvdata(dev);
>> +	struct device_node *port;
>> +	struct vs_crtc *crtc;
>> +	struct vs_dc_info *dc_info;
>> +	struct vs_plane *plane;
>> +	struct vs_plane_info *plane_info;
>> +	int i, ret;
>> +	u32 ctrc_mask = 0;
>> +
>> +	if (!drm_dev || !dc) {
>> +		dev_err(dev, "devices are not created.\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = dc_init(dev);
>> +	if (ret < 0) {
>> +		drm_err(drm_dev, "Failed to initialize DC hardware.\n");
>> +		return ret;
>> +	}
>> +
>> +	port = of_get_child_by_name(dev->of_node, "port");
>> +	if (!port) {
>> +		drm_err(drm_dev, "no port node found\n");
>> +		return -ENODEV;
>> +	}
>> +	of_node_put(port);
>> +
>> +	dc_info = dc->hw.info;
>> +
>> +	for (i = 0; i < dc_info->panel_num; i++) {
>> +		crtc = vs_crtc_create(drm_dev, dc_info);
>> +		if (!crtc) {
>> +			drm_err(drm_dev, "Failed to create CRTC.\n");
>> +			ret = -ENOMEM;
>> +			return ret;
>> +		}
>> +
>> +		crtc->base.port = port;
>> +		crtc->dev = dev;
>> +		dc->crtc[i] = crtc;
>> +		ctrc_mask |= drm_crtc_mask(&crtc->base);
>> +	}
>> +
>> +	for (i = 0; i < dc_info->plane_num; i++) {
>> +		plane_info = (struct vs_plane_info *)&dc_info->planes[i];
>> +
>> +		if (!strcmp(plane_info->name, "Primary") || !strcmp(plane_info->name, "Cursor")) {
>> +			plane = vs_plane_create(drm_dev, plane_info, dc_info->layer_num,
>> +						drm_crtc_mask(&dc->crtc[0]->base));
>> +		} else if (!strcmp(plane_info->name, "Primary_1") ||
>> +				   !strcmp(plane_info->name, "Cursor_1")) {
> 
> Please use an enum and an id there.
> 
>> +static int vs_plane_atomic_set_property(struct drm_plane *plane,
>> +					struct drm_plane_state *state,
>> +					struct drm_property *property,
>> +					uint64_t val)
>> +{
>> +	struct drm_device *dev = plane->dev;
>> +	struct vs_plane *vs_plane = to_vs_plane(plane);
>> +	struct vs_plane_state *vs_plane_state = to_vs_plane_state(state);
>> +	int ret = 0;
>> +
>> +	if (property == vs_plane->degamma_mode) {
>> +		if (vs_plane_state->degamma != val) {
>> +			vs_plane_state->degamma = val;
>> +			vs_plane_state->degamma_changed = true;
>> +		} else {
>> +			vs_plane_state->degamma_changed = false;
>> +		}
>> +	} else if (property == vs_plane->watermark_prop) {
>> +		ret = _vs_plane_set_property_blob_from_id(dev,
>> +							  &vs_plane_state->watermark,
>> +							  val,
>> +							  sizeof(struct drm_vs_watermark));
>> +		return ret;
>> +	} else if (property == vs_plane->color_mgmt_prop) {
>> +		ret = _vs_plane_set_property_blob_from_id(dev,
>> +							  &vs_plane_state->color_mgmt,
>> +							  val,
>> +							  sizeof(struct drm_vs_color_mgmt));
>> +		return ret;
>> +	} else if (property == vs_plane->roi_prop) {
>> +		ret = _vs_plane_set_property_blob_from_id(dev,
>> +							  &vs_plane_state->roi,
>> +							  val,
>> +							  sizeof(struct drm_vs_roi));
>> +		return ret;
>> +	} else {
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Same story than above for properties
> 
> 
> Honestly, that driver is pretty massive, and you should be simplifying
> it a lot of you want the initial contribution to be as smooth as
> possible.
> 
> Things like all the tiling formats, the underflowing handling, all those
> properties, etc can (and should) be added in a second step once the
> foundations are in.
> 
> Maxime

ok , Thanks for reminding me. I will clarify my next goal and be more likely to simplify features.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
