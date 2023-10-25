Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE12AC0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 13:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=730Oq1maJxXKAQl3w+XnTmmMB5mJjYy/F4mHlesLDT0=; b=Yf8GzFKJ0YLViKW5bew3TBjTyP
	nkXgPOb1yNNmoRJrlTgopNfMxgLtoady/rrjCi27xsqrVrrlYSPMMVVIR56LmA5QXvs7XPoHjY1gm
	zppPd3HMUuc+cOLVOcHgIVjmBTVygH1+qYIVF3oG2/zUjF0glQ26m/2XlgEDWORWWCvqsTEVl0KXu
	wFOeO3A4Uem3vuMQjWJSjD30H0eFufDOL2pcZUqiWGBQk0rcga8bGZH6tRKaryUN41OQaXT9AH9wE
	RELU19R5uoflk4LCakzD6yc/siRuRATrORU08BjzeeBJiHUbyI2tmmFFe6smIbUhtIx/usb7njfcE
	eCqa7+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qveHN-00CRPo-19;
	Wed, 25 Oct 2023 13:50:37 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qveHI-00CRNk-0M
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 13:50:35 +0000
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0BFA93FADE
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698241820;
	bh=W1x37B91j9+69z88CpRerUtWigBjNUnfhOj4SQBIvW4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=qNtUnbct4CvGWU0oRN6DjDkbAlSxH3HVtL826PDPxdqvPCNc0bCcY4jt1009sXLbG
	 j4f2cIlvRlsoK9dQ4DKW4aLa9PMSgIB3yI98x3oMf95Cz6AjbjUHE+2qWYPZGXr0KB
	 0+I90P6dnFaPYdO/uGTo0AOoc8HTEJFqgn8IzO2mrRQCzHaLR1cKJLb/lj15cnglSb
	 uNmPd+ZW4Kr7/NkN2fi+Ii4ICj9K2B9FRK/Ralc+p5DmCYEy0Mg+sW4F2xyJig6VSu
	 CuoCS2xdtQAoQNaA6eaSC6U13B37rq8F6+/uAh/75yutb6zzhKZpXzr1YsyAcT6bKb
	 NYFEJ5pFOTzhQ==
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-49da52a5356so1805508e0c.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 06:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698241817; x=1698846617;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1x37B91j9+69z88CpRerUtWigBjNUnfhOj4SQBIvW4=;
        b=iUAXp4rReD+0TSbpIdpmRIiauBnJIw4o2D0uBPy9rX1DlL4EKTbQTce+iZ3VLut5K6
         SQX6kct6n6voq5ew8/OLJqygl9q9ethnxwBG3W7sR2AEbTZWYzodFKiFOC4IEVLHc0pp
         5uwnzjBUVfby6Tx/3qe3R0smYsnWiKi6RP+RcsY7XsegnioBwHmmVNdbnosliiHLPqIs
         B9dxQ8zsdGppNNUGz0EmbsCqjomMLnKTdxyvQ/g0pRCaBF/TMLYmWR8C59h4Wdn1S1bp
         RCoccBy8q95A1tyaokd6ZDXPZHwYHBbBVEF/UhNjbm8STiBBkXoe4zBlYgo6RnhbnS+C
         sbBQ==
X-Gm-Message-State: AOJu0YzQ5usSTE0uZssYhiRH7yogO8JbnienmfvinxdH9X0tiQAGorDV
	V50HLbpEb8bkgtGyJ89s8VIN1Cs3vVt2sdZGq3eyqNT/bhKykH2SC6LIfYj0pkHxTt0ybQOIiO0
	E07Z5uP16eAQUj1QpEhQ9dCf/1aMubq9+okQLv1DuXsQhW8HWLdKYQWKOlvZ+0g==
X-Received: by 2002:a1f:2413:0:b0:496:b3b7:5d4c with SMTP id k19-20020a1f2413000000b00496b3b75d4cmr9124800vkk.16.1698241817357;
        Wed, 25 Oct 2023 06:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9zDnpBEjkuG+zK5+I3md5OYseNj7+FyeAufjrHbMrkjT4o0+aAODqiZVHTJv2jiFeyLuyYUPzrjH27o2gXYU=
X-Received: by 2002:a1f:2413:0:b0:496:b3b7:5d4c with SMTP id
 k19-20020a1f2413000000b00496b3b75d4cmr9124773vkk.16.1698241817037; Wed, 25
 Oct 2023 06:50:17 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 06:50:16 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231025103957.3776-4-keith.zhao@starfivetech.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com> <20231025103957.3776-4-keith.zhao@starfivetech.com>
Mime-Version: 1.0
Date: Wed, 25 Oct 2023 06:50:16 -0700
Message-ID: <CAJM55Z_SS351YyudUkiS3YvBx7O9OM=MGL6PpgVZZjaYjLy3+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
To: Keith Zhao <keith.zhao@starfivetech.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
	Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, 
	Jagan Teki <jagan@edgeble.ai>, Chris Morgan <macromorgan@hotmail.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, 
	Shengyang Chen <shengyang.chen@starfivetech.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_065033_066070_DA85107A 
X-CRM114-Status: GOOD (  15.31  )
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

Keith Zhao wrote:
> For each modifier, add the corresponding description
>
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8db7fd3f7..a580a848c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -419,6 +419,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_VERISILICON 0x0b
>
>  /* add more to the end as needed */
>
> @@ -1562,6 +1563,62 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>  	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL					0x00
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_MASK					((__u64)0x3 << 54)
> +
> +#define fourcc_mod_vs_code(type, val) \
> +	fourcc_mod_code(VERISILICON, ((((__u64)type) << 54) | (val)))
> +
> +#define DRM_FORMAT_MOD_VERISILICON_NORM_MODE_MASK				0x1F
> +
> +/*
> + * An x-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
> + * Each 8x8 sub-tile consists of four standard tiles .
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X8		0x02
> +
> +/*
> + * A y-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
> + * Each 8x8 sub-tile consists of four standard tiles .
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_8X8		0x03
> +
> +/*
> + * An 8x8 tile consists of four standard tiles
> + * that are organized in Z-order.
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_TILE_8X8						0x04
> +
> +/*
> + * An 8x4 tile consists of two standard tiles
> + * that are organized in Z-order.
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_TILE_8X4						0x07
> +
> +/*
> + * An x-major 8x4 super tile consists of 128 8x4 sub-tiles in total.
> + * Each 8x4 sub-tile consists of two standard tiles.
> + * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X4		0x0B

These indents are all over the place. Please either align them with tabs or use
a single space like the AMD defines above.

> +
> +/*
> + * A y-major 4x8 super tile consists of 128 4x8 sub-tiles in total.
> + * Each 4x8 sub-tile consists of two standard tiles.
> + * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_4X8    0x0C
> +
> +#define fourcc_mod_vs_norm_code(tile) \
> +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL, \
> +				(tile))
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
