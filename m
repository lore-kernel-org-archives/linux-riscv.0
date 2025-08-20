Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0599ACA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 20:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/82OOFrZ4DX2x/8neChfvv+rCSXcNhrZZsJt49ofcLo=; b=VzlavQZdo9J82N
	a/o80GGXl/z4zGU7y0wb0lrykjjR/5t/om5r48A6ehbzwbNMPaN+Hx1NlHMrsBR8SPt5sBJF9UF9R
	qdwqL844xZfveu6k3sjLFWTehgNP9TUvbYw4mWh/FGuLtJwp4CFDEgQqQySyg9n6PhNIxF+oiq15o
	+VEczJlwqXci2fYI1MxH0ATI/03Gl/qXNJq/gHyo6vr+PHi8BYhvIQZLJ/kpo/HpLuF3/FyZLTuOA
	ZA+NfTBFGVi9mJadWfWhInHT2nftxl0qf2+/Kcvrk6n3xRJVJ0woY92+muXcDpLO2R5fxhMAufYUt
	ouWMGiA8BtfN+Unhpnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopsN-0000000Evvh-219f;
	Wed, 20 Aug 2025 20:57:43 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomKr-0000000EUTY-1vCF
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 17:10:54 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-71fb85c4b59so9430447b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Aug 2025 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755709852; x=1756314652; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=727UKZSKS9UwGe6aim6XorGjWW+I61+OozHvio/cjhs=;
        b=R5PP+yZ1MSaiOKG7m18Ij4nbPep+5F9JG/TF2zHSdnWOUCtEOL5BpwtN0Y06OorxH0
         VjcKB2cez9NBXvJiI3FOszUmDVoxci1ll61LUA1cyRfP6yaqLowgDATvFHTk1m7LOtZj
         cNlTNYOBB9ADoDwFSpll7zBvAlbBJDuhXnL7hk1H0nfPvMJLVKerMMwALAjT5QoqbyEm
         cV8SWWW4CZQihiiK+37lUXqgsraZ2oIbZLQ6GnZDP+DpHW+VjZqg884tH/LfpNrdCJGu
         yahE598JdRTu1yzUIQSuJ2eQNKI7nAWCms6hSZN7c8YCMiCF2qWhMAJB/JbOlhdQMLiZ
         voWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755709852; x=1756314652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=727UKZSKS9UwGe6aim6XorGjWW+I61+OozHvio/cjhs=;
        b=bC9D653bmUlqUsRbJpaT7JdAOR083inZf0gXcx01tmlzBOss5x72lPAnnARWwgHeMy
         fqYtHa+JVeUDi0zdiT/7iJlCedyIP2Nwo9V7otQVrZdLFngVoqBBgaMF3rCUW77FGauB
         xCYlZj74WyerRblUymbUOEBcmCqx4Uz/UFmxpXIDe/CcX8KbifyfdY5U6Vlzv+doIaPI
         2HkFNiNkTMFejceXdWpBSi3Ca88nuXrfn5cx88EaWnzXAD7jMlRs7x5mPphjjl7R4MgS
         GozBGc3ePx7t8XsYRpb/9AIad1aXGUbXNlNbs1dG1BwcrIrso+3QA+GgAIFscaX4qp0d
         D8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVgVgeA4ID7z7kPBVNUbpXm6kGFc/X4/n5bzr27DJOeeV6zZzQlZg79+nRPtv2naD8hDxRNL4uUyh/S8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK33lEHXSj6LxkahkFsADduyuEyxgnyQM5swkWoY9hTETSRHik
	zcQB/L4mJ+I2EArWtBcVsgyKBktKLLFxrp31g/fv5Elbj9b8OpWtJmj2kUvp7+GfQD2ppSD57CL
	P4oF7xuWz20nj5HWrB3kFkcaJQzB337DmKgkMbaZCsA==
X-Gm-Gg: ASbGncvj3dbmIfit+dp2Y8WcBAa1w4lej3Bu4obSxCCWrstDJ4NGC68wOsYACUnfNWc
	ekw2T3GPLi0LkZYBgkEA7y+Bin3eTJkz1aJpYhSNE4wOxeYx0ihVSJCWszCYEzc2F2b+Gc2kuVZ
	YlqtrwFYFrN0hVsQWDFWvS26FMzlHNh7WB7Gy7qumbvBdFjJlj4y25eciRiWlUll9mEXX2CgmTf
	lNsBEUn
X-Google-Smtp-Source: AGHT+IEpDwtZVI6H+GfGnTfQIwUyY5UUZdBfiqI97/jjpj/Lpw9zMkd2OWo35A3c2Mc0ZAvXui6OtqnR/RLurFK8aDA=
X-Received: by 2002:a05:690c:4b8d:b0:71b:f419:2099 with SMTP id
 00721157ae682-71fc6380a74mr4423317b3.21.1755709852320; Wed, 20 Aug 2025
 10:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250820085609eucas1p25d7c6d67318b6c332e3f238705544b19@eucas1p2.samsung.com>
 <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com> <20250820-apr_14_for_sending-v12-2-4213ccefbd05@samsung.com>
In-Reply-To: <20250820-apr_14_for_sending-v12-2-4213ccefbd05@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 20 Aug 2025 19:10:15 +0200
X-Gm-Features: Ac12FXxCH2ttqXRbmi_2dmdMWE4eeauuwFrI7EIdSSvrawO-ealoi74PXSk4RH8
Message-ID: <CAPDyKFrjHdASRUDxR+KROovV0sherhqdkOgHC9hoA6dhdMr39A@mail.gmail.com>
Subject: Re: [PATCH v12 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU support
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101053_501090_70AE8119 
X-CRM114-Status: GOOD (  20.66  )
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

On Wed, 20 Aug 2025 at 10:56, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Rework the PowerVR Rogue GPU binding to use an explicit, per variant
> style for defining power domain properties and add support for the
> T-HEAD TH1520 SoC's GPU.
>
> To improve clarity and precision, the binding is refactored so that
> power domain items are listed explicitly for each variant [1]. The
> previous method relied on an implicit, positional mapping between the
> `power-domains` and `power-domain-names` properties. This change
> replaces the generic rules with self contained if/then blocks for each
> GPU variant, making the relationship between power domains and their
> names explicit and unambiguous.
>
> The generic if block for img,img-rogue, which previously required
> power-domains and power-domain-names for all variants, is removed.
> Instead, each specific GPU variant now defines its own power domain
> requirements within a self-contained if/then block, making the schema
> more explicit.
>
> This new structure is then used to add support for the
> `thead,th1520-gpu`. While its BXM-4-64 IP has two conceptual power
> domains, the TH1520 SoC integrates them behind a single power gate. The
> new binding models this with a specific rule that enforces a single
> `power-domains` entry and disallows the `power-domain-names` property.
>
> Link: https://lore.kernel.org/all/4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@linaro.org/ [1]
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Even if you already have the necessary ack, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 37 +++++++++++++++++-----
>  1 file changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..c87d7bece0ecd6331fc7d1a479bbdaf68bac6e6d 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -21,6 +21,11 @@ properties:
>            # work with newer dts.
>            - const: img,img-axe
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - thead,th1520-gpu
> +          - const: img,img-bxm-4-64
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,j721s2-gpu
> @@ -77,14 +82,18 @@ required:
>  additionalProperties: false
>
>  allOf:
> -  # Constraints added alongside the new compatible strings that would otherwise
> -  # create an ABI break.
>    - if:
>        properties:
>          compatible:
>            contains:
> -            const: img,img-rogue
> +            const: img,img-axe-1-16m
>      then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Power domain A
> +        power-domain-names:
> +          maxItems: 1
>        required:
>          - power-domains
>          - power-domain-names
> @@ -93,13 +102,20 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: img,img-axe-1-16m
> +            const: thead,th1520-gpu
>      then:
>        properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
>          power-domains:
> -          maxItems: 1
> -        power-domain-names:
> -          maxItems: 1
> +          items:
> +            - description: The single, unified power domain for the GPU on the
> +                TH1520 SoC, integrating all internal IP power domains.
> +        power-domain-names: false
> +      required:
> +        - power-domains
>
>    - if:
>        properties:
> @@ -109,9 +125,14 @@ allOf:
>      then:
>        properties:
>          power-domains:
> -          minItems: 2
> +          items:
> +            - description: Power domain A
> +            - description: Power domain B
>          power-domain-names:
>            minItems: 2
> +      required:
> +        - power-domains
> +        - power-domain-names
>
>    - if:
>        properties:
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
