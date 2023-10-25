Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500E4C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIQ6n5nvV66recLpiNitR51CiqDYmEDuw7SOqHITdMg=; b=RR9VRffqQlZRCk
	xVrY4/2+ft1bilA7Qo8HS1MaUEkAnu54WHlWpxCZfcpX9nPVn1izbASFeF0dUX7Md5hxM+arEpZCx
	xjumMlLlpD2lzsC3qSC17R7nP8D3GGTrPncyclY4PzQSj92XqhdogL3K/FVSkflPvzLOdlYIiKx3i
	mpQy3S4+O1/Kx8C0LirtJkPuN2Y2N3NM2kuIPPZ/+JlC35fIBf6M0jL9hxCbKIBqyCARTYaB2qUqP
	e32+b1bq7fCAXuxwtJmv1tke0zd9FStj0IMyIbQR8uO2Sse1ZcihIwWKEaPKS4BLTYZmOgVfAoOdk
	/2u7jw69EtkW0qhjtjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfns-00Ccdc-1U;
	Wed, 25 Oct 2023 15:28:16 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfnq-00Cccd-0G
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 15:28:15 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-66d17bdabe1so39975106d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698247691; x=1698852491; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/OEf6wY4K8LL5fCd9Dam3mad0hP6D3Fcdj2bC0ObXE=;
        b=PNXh+5N8sTIJiHkkBpKuD8Uo7VM/JZCZKBYNjWAVZyyM30ydEZn5iTo/pzp40QJs2q
         X3N0TGGVFKNCEVk2cMBCgEbdiFo2lEu8+0dt9Ezv/jxPorF7BPzUdCxvq0W8N+D5z8h5
         eV9y4yghalnSNpheeDb9RRiMSU/xQTbS95/NyVoS6s3zxPEdqSzNTpC3v7OJIlT0b5us
         OGcv6PnGuRyHigtisZIJlMNbuyNy3dBrvi8ZIgMdLmLjxIoHuBAvm47dHTbkvNPEJlwO
         d2bLz6YnqHe//jqsfezyAOy6NvejTj/LtV9KDp1gA1IEBTf6pw/U5CHigjYeLMDo8iOk
         roIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698247691; x=1698852491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/OEf6wY4K8LL5fCd9Dam3mad0hP6D3Fcdj2bC0ObXE=;
        b=soI73xqV8PV22lwHGeYYvMEoB0uwdojTH89fn7e+K7GmnzxMjNlBpb4bj74VYHHAQS
         pgBgUXLfCjoA4w3HvqniNIHMaPTSx+oS4n3OqzcSN22flzKCEWdGpbCFl7RumivvgBKp
         M2DpgR0migr3THutawMGZQJ51+oHH05uY5M1mOHOT3qzBJmYZfqRk1pUiOGRGW80uQx4
         1X2HD31urtD64D1oWpVR+1ieQmR+RuEOWNglIePrPYh2KWD8AGYakZBc/vbBDVWDiwDB
         Vy0mARzuOExP0xupQWdI3rs1931xJvq1O70gPU4LjXbUyK4oCrrkwsEihAaayj5MS8VZ
         wmlw==
X-Gm-Message-State: AOJu0YxuJkjJi+wNtzQm3pVUvFhO1P382gAIREPpKkFGEvuzpoXmBHHM
	qUrJvNU5R8JhBGzOF4lGP5G6Vg==
X-Google-Smtp-Source: AGHT+IE+oXbdMGDC42eUqY/5d0Rh7NZd8nWQ0r8DPCttIVT1/TMaphayNooiWx9ODfgyZFTKsCHSrg==
X-Received: by 2002:a05:6214:2586:b0:66d:1d22:42d8 with SMTP id fq6-20020a056214258600b0066d1d2242d8mr20338672qvb.11.1698247691667;
        Wed, 25 Oct 2023 08:28:11 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g24-20020a37e218000000b007671b599cf5sm4280080qki.40.2023.10.25.08.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 08:28:10 -0700 (PDT)
Message-ID: <6f145485-c330-4a89-9e5a-af35d0b72e21@linaro.org>
Date: Wed, 25 Oct 2023 18:28:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
Content-Language: en-GB
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-4-keith.zhao@starfivetech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231025103957.3776-4-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_082814_140315_78C4DD53 
X-CRM114-Status: GOOD (  16.51  )
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

On 25/10/2023 13:39, Keith Zhao wrote:
> For each modifier, add the corresponding description
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>   include/uapi/drm/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8db7fd3f7..a580a848c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -419,6 +419,7 @@ extern "C" {
>   #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>   #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>   #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_VERISILICON 0x0b
>   
>   /* add more to the end as needed */
>   
> @@ -1562,6 +1563,62 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   #define AMD_FMT_MOD_CLEAR(field) \
>   	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>   
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL					0x00
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_MASK					((__u64)0x3 << 54)
> +
> +#define fourcc_mod_vs_code(type, val) \
> +	fourcc_mod_code(VERISILICON, ((((__u64)type) << 54) | (val)))

Please use fourcc_mode_code directly.

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

1) this is not a part of uAPI
2) please use fourcc_mod_code directly.

> +
>   #if defined(__cplusplus)
>   }
>   #endif

-- 
With best wishes
Dmitry


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
