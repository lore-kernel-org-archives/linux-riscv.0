Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D148DCA0EDC
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBdNQ0I4qqrkxryEVVbScjgaXWXbJUm16fXqoIm+OH8=; b=JC8zp+IFYNSjCu
	HzFz8h+X+LmZpwRaiIJgDyvv3dh2Yin+BkKZKaQS0I7TdeanGFlVJVe3rnQ739yA+EycTBP/tHcPB
	4kd0mbSF7pVgUJhtSCC1iv6woBUlr3Sp0+b1g3d/PZrEQYwVLSHZZ1mD0ATAzD7IQdlJORYBw883n
	x227zKazwdnWkzVaI1Nw7W7AEMIuFaEeWYguILNaVXu5pOzcX1jl5KTihUiuWFrQPo5OcysjVjBX4
	E9jy8CtcXdZ3Kby9VPrJia2wvPo1EGUTzMm4mzwXBRtmzjN94jgybqjLfk+WXm+RoSU9XgqsB8hpF
	Zi0qrU0xX5Fz7oxZvV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uniIR-00000005x03-0Cm3;
	Sun, 17 Aug 2025 18:39:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uniIO-00000005wzM-3ZlJ
	for linux-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 18:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ECD341AD1;
	Sun, 17 Aug 2025 18:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB7BC4CEF4;
	Sun, 17 Aug 2025 18:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755455994;
	bh=m3PNNERXxwpCzkdnS/g84M24HexPmr502VnjyAPJFJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5MV2LqV5LaNSHO32gXSptkeeQvdwAMfWW7X7n7y7rTWYI09NaoJG3Z9C3hepxBhr
	 dPGoUfZBzXnlxVUldR0sBdlw+z9HusCvmtzP9tIt/tG8YvzxKRZ2BYh8mkwxcB2vNE
	 WFXso5bMN0O9faE67bNcjStO7OtzvS8Ep3hAz2v7vNt7+Qvo9GpRheMJkvYVb/K/OA
	 iwgfeyTh7JYatQAJzzLJS9Qq+bboyEn8C6LCx9kadkPhgrNPXydEMvyKDF5nCzoEgU
	 CtU28F8rTR/etylIJzaHpDW5v2v+psolCfE8tzrpzkVBQbkXz7+7j5G9GNW8Dj9e5E
	 IOsSimuN2k63A==
Date: Sun, 17 Aug 2025 11:39:52 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
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
Subject: Re: [RFC PATCH 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <aKIh+MLEO2aM/vO7@x1>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-4-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814164048.2336043-4-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_113956_929361_A6A153F1 
X-CRM114-Status: GOOD (  18.77  )
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

On Fri, Aug 15, 2025 at 12:40:43AM +0800, Icenowy Zheng wrote:
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

Thanks for working on this!

[snip]
> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> new file mode 100644
> index 0000000000000..25d6e01cc8b71
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
[snip]
> +static void vs_primary_plane_atomic_update(struct drm_plane *plane,
> +					   struct drm_atomic_state *atomic_state)
> +{
> +	struct drm_plane_state *state = drm_atomic_get_new_plane_state(atomic_state,
> +								       plane);
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_crtc *crtc = state->crtc;
> +	struct drm_gem_dma_object *gem;
> +	struct vs_dc *dc;
> +	struct vs_crtc *vcrtc;
> +	struct vs_format fmt;
> +	unsigned int output, bpp;
> +	dma_addr_t dma_addr;
> +
> +	if (!crtc)
> +		return;
> +
> +	DRM_DEBUG_DRIVER("Updating output %d primary plane\n", output);

clang flagged this when building. I think this needs to be after the
line below that assigns vcrtc->id to output.

> +
> +	vcrtc = drm_crtc_to_vs_crtc(crtc);
> +	output = vcrtc->id;

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
