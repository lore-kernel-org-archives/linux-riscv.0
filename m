Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD17CAC5AA
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 00:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AE5ZdbPmOEZWqqtfTt7o6wJ/uSItySuRXtxKH3ACyIw=; b=HypZKZ6Zinjc1d
	h/S3DbpW6J/plBEd7wbuweQKjqAv4Ycoei00NYD2PVCG2Eq/WnQsv1eAQgk3yJD/obyLqraEZYWrX
	B3IkioSyt0CaAEprLHac6wqbD7zkmikDTlsCPf6OXxPHy/Wifi22SO2QifRbPpzrDCHW1Fcvld/JR
	g8k1XC5ryYOlWGFDwKFV4eqSct4cszOEMQm5S5cQdNbgWW4eH4GvWQE9XCv+yyrygn/O37vd6vTul
	nfNpQFJ+1ybiGrl2dBGJc7wdC0BRJQ0PAlGLijjBSWoVxXQYeEC9VyvWfnUj/rM8hUDey/nmghsuQ
	R8uG6KJMKIN0NkqBfpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rHt-0000000BwNx-1kb5;
	Tue, 23 Sep 2025 00:53:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rHq-0000000BwNb-0b5j
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 00:53:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MGUMQY031200
	for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 00:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A0ejDteovNx3lutfqEZ0wERW
	05YuCdNkebjmQBOXb0g=; b=gpq/IUVUQeuJL29Sk9CaWGVUYqwfP4WdpIRvhTAF
	DGtqU5bpSnPDIFJ0xfnym2lQvxnN2xaf6HS4MCk/BAZlEb4e6cQf2uwqZ8xncyr+
	Ev716gHbvECMHcvaZ5GcEym/6Bf0aWUReZHV/uFqoHp24zP2AVKXE0whJ0BUFdNh
	vd4pXmThgaDkqgDSSaRLt0SXPiNzAC6UG72qEI6Ip62svVwx8a74Ms3RjL/F1vgT
	XqMzumsgN4BVlfomQ+9OKYNvpUHlDTUtFjkhWZmy/Q9GviB55q73k5Mcoshpbzv0
	rVqX8A/3N3g4mGkvwYN9/K3liaFlCuFiGNgsIrlWHzlMIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn7en7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 00:53:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78f079c7120so59479276d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 17:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758588820; x=1759193620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0ejDteovNx3lutfqEZ0wERW05YuCdNkebjmQBOXb0g=;
        b=gZy9h7dMvkF4T5axy0bo/Nob/jNIqxZ6USVbehRkqYTmnbTwDK/reZH7o85a2N8VOm
         pBz6MMGV6ERoFGnuYILfaeaQ4yteLcPkWd3sFP8WSgDY1laoHuNAcfvj5zZ06DeWSziD
         uUvoDP/+uck522S+nesd28Zs7f52ZQ/WDH+iVmfF4jQDqnTzU91UNeeu1nzvgwOSFYUg
         703A1t1VDNs0yx+FPYt0NuNzxdeYSL7MGPqBA/7ayKs/85LOd+JloFKoXtBK+ui4O2LJ
         UPSCjs3Qnij5fDQfqtk9G2+7Fj3DoaeqQJgycuhbXizEN1AXmLYCCBGNGynxwc8/rZ4L
         GzBA==
X-Forwarded-Encrypted: i=1; AJvYcCUs4WGe5pTlSH8MdlA8wK3WFq8t0ZMvYGCCdWQXEja/ojyEDUC19uDPYuBt3BT/vQOYk/Sk1tK4Sa8mRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzha/U/0eWKyo8B+rFH/vs2eM+q+U3DO1HBdJjK6qPR/Otv5IjO
	QuuxUpmO5igGwDkuy84YB7DqSeWXrRsgiqwJf92Xpdv4ys1OH8R1JDZvHtPLENJb8yFWA4isk5U
	G829AA9pe9Xn2M+X4xLYoGkIVykQuPek7pHvj0GC4G15UEFY7usZ4d3VNxQ+8Q7WcIb95ziY=
X-Gm-Gg: ASbGncsavORe6V3VrLrbz+O4KJ76z5g6Vgo9JO48qvDCDEUH/M55WGQ6sctgMjhzsID
	Hogtu45pja44WcA8VBSIczCWtEnT5mq/drIMr6QQMs2L9VJiDKV6JdIN/fk9AlHkKU/ISwfIxoF
	utAr0yenyAGOsvizW3ZUy2by79WRrsBJ4p5B8GrmkRwW1I+15F3ERLt8m/NS0GHeDXuUoyh5Pky
	Xegsz9W09DSsZUkqpoozjgooqKJ5Erm22vgcxWpJVEZJXy7BaZkGWWBWs95vCILlmjyzURFLk6g
	ymb35eAmhYhuQqlGfXOJjC8Xu817oMniXf7L6PN84b0c9X8kWAGSPGZ1Y2ccaCcgvf168bnHi01
	m0fnwhDsAhuu31UCWqWRhX9yjtGBAsYlw3u2115ZMmSIvumdDf91s
X-Received: by 2002:a05:6214:dac:b0:792:50bd:2fa8 with SMTP id 6a1803df08f44-7e7027cf866mr10593346d6.30.1758588820101;
        Mon, 22 Sep 2025 17:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCVW+jgFymH6ugT8RZ+VX3dkHRF5VrlyFvp+GIT+bYXUiMJUgbOusL9ZRVnMDthCoKsQIBCA==
X-Received: by 2002:a05:6214:dac:b0:792:50bd:2fa8 with SMTP id 6a1803df08f44-7e7027cf866mr10592946d6.30.1758588819402;
        Mon, 22 Sep 2025 17:53:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57b7e33b78bsm2160908e87.45.2025.09.22.17.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:53:38 -0700 (PDT)
Date: Tue, 23 Sep 2025 03:53:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michal Wilczynski <m.wilczynski@samsung.com>,
        Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <a46szgmjrwgqhv5issuijyvih4tof3xa45tdhxv4qjplekszpz@55tgbkeby7zr>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-4-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250921083446.790374-4-uwu@icenowy.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfXx4m7YypLP6MU
 4BLVj8rp+ghlvfTZELhAyOfRAe9eOOAwtUu9agVLhEvBgHNxDRdwo6ziN3Dp0UqOSJtlSdShigK
 uWNdf3Ybjn2UD+7/mCWgyPSlrHQe/bWN4V/c4jE8GMjPPLJs1sRlW83FrvLXM3MtUAmd0uq+GQ4
 d4QRsuNFLa3tF7e+rDaH0a3A2oa/7HO2pwiqb4V0IykDj96gC5rG0+MI/bljGc6zGQn1HpzM88M
 wzWRu5Vuh0AtycSXMIH6N98Q5d5ccNa0iS+y1K144vF5lZOM+mFtEORwgUy0jXdzeq9CQpCuaQZ
 EeGnuEXzvWoAi6KvxC+6VWFxGLHGAaxcM6PvLLN8L9mzknUt1dEs4fVMV38kRhJ+TPMlDgaUmLw
 8nknOAhu
X-Proofpoint-GUID: EWK71B2sv8iuiv2TVErt0Ty0hHDJTfwb
X-Proofpoint-ORIG-GUID: EWK71B2sv8iuiv2TVErt0Ty0hHDJTfwb
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68d1ef95 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=UYI74FSAo_19EvzY_j0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_175342_311744_3824688C 
X-CRM114-Status: GOOD (  31.87  )
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

On Sun, Sep 21, 2025 at 04:34:41PM +0800, Icenowy Zheng wrote:
> This is a from-scratch driver targeting Verisilicon DC-series display
> controllers, which feature self-identification functionality like their
> GC-series GPUs.
> 
> Only DC8200 is being supported now, and only the main framebuffer is set
> up (as the DRM primary plane). Support for more DC models and more
> features is my further targets.
> 
> As the display controller is delivered to SoC vendors as a whole part,
> this driver does not use component framework and extra bridges inside a
> SoC is expected to be implemented as dedicated bridges (this driver
> properly supports bridge chaining).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> Changes in v2:
> - Changed some Control flows according to previous reviews.
> - Added missing of_node_put when checking of endpoints for output type.
> - Switched all userspace-visible modeset objects to be managed by drmm
>   instead of devm.
> - Utilize devm_drm_bridge_alloc() in internal bridge.
> - Prevented the usage of simple encoder helpers by passing a NULL funcs pointer.
> - Let devm enable clocks when getting them.
> - Removed explicit `.cache_type = REGCACHE_NONE` in regmap config.
> - Fixed a debug print using a variable before initialization.
> - Fixed a wrong index when using bulk to handle resets.
> - Added missing configuration for DPI format (currently fixed RGB888).
> 
>  drivers/gpu/drm/Kconfig                       |   2 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/verisilicon/Kconfig           |  15 +
>  drivers/gpu/drm/verisilicon/Makefile          |   5 +
>  drivers/gpu/drm/verisilicon/vs_bridge.c       | 330 ++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_bridge.h       |  40 +++
>  drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  54 +++
>  drivers/gpu/drm/verisilicon/vs_crtc.c         | 217 ++++++++++++
>  drivers/gpu/drm/verisilicon/vs_crtc.h         |  29 ++
>  drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 ++++
>  drivers/gpu/drm/verisilicon/vs_dc.c           | 205 +++++++++++
>  drivers/gpu/drm/verisilicon/vs_dc.h           |  39 +++
>  drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
>  drivers/gpu/drm/verisilicon/vs_drm.c          | 177 ++++++++++
>  drivers/gpu/drm/verisilicon/vs_drm.h          |  29 ++
>  drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 ++++++++
>  drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
>  drivers/gpu/drm/verisilicon/vs_plane.c        | 102 ++++++
>  drivers/gpu/drm/verisilicon/vs_plane.h        |  68 ++++
>  .../gpu/drm/verisilicon/vs_primary_plane.c    | 157 +++++++++
>  .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
>  21 files changed, 1789 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
> 
> +
> +static int vs_bridge_atomic_check(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *bridge_state,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state)
> +{
> +	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
> +
> +	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
> +	    !vs_bridge_out_dp_fmt_supported(bridge_state->output_bus_cfg.format))
> +		return -EINVAL;

I still think that it's better to have per-interface type bridge funcs
rather than checking for the interface type inside the function.

> +
> +	vbridge->output_bus_fmt = bridge_state->output_bus_cfg.format;
> +
> +	return 0;
> +}
> +
> +
> +	bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
> +				       &vs_bridge_funcs);
> +	if (!bridge)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bridge->crtc = crtc;
> +	bridge->intf = intf;
> +	bridge->next = next;
> +
> +	if (intf == VSDC_OUTPUT_INTERFACE_DPI)
> +		enctype = DRM_MODE_ENCODER_DPI;
> +	else
> +		enctype = DRM_MODE_ENCODER_NONE;

Nit: DRM_MODE_ENCODER_TMDS ?

> +
> +	bridge->enc = drmm_plain_encoder_alloc(drm_dev, NULL, enctype, NULL);
> +	if (IS_ERR(bridge->enc)) {
> +		dev_err(drm_dev->dev,
> +			"Cannot initialize encoder for output %u\n", output);
> +		ret = PTR_ERR(bridge->enc);
> +		return ERR_PTR(ret);
> +	}
> +
> +	bridge->enc->possible_crtcs = drm_crtc_mask(&crtc->base);
> +
> +	ret = drm_bridge_attach(bridge->enc, &bridge->base, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		dev_err(drm_dev->dev,
> +			"Cannot attach bridge for output %u\n", output);
> +		return ERR_PTR(ret);
> +	}
> +
> +	bridge->conn = drm_bridge_connector_init(drm_dev, bridge->enc);
> +	if (IS_ERR(bridge->conn)) {
> +		dev_err(drm_dev->dev,
> +			"Cannot create connector for output %u\n", output);
> +		ret = PTR_ERR(bridge->conn);
> +		return ERR_PTR(ret);
> +	}
> +	drm_connector_attach_encoder(bridge->conn, bridge->enc);
> +
> +	return bridge;
> +}

Other than that LGTM.

-- 
With best wishes
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
