Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64A0C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tInTooRK+oK7HON/4tydWfvctCHTCKI5hY1aw8C1M6o=; b=gq1SamTaByqyIT
	1fQGYyz/KzSmXMxazg3L6T4K2GKrypS0nbi+cbyjUxDpJ0omDVm5VIhKqe0eEIQxBPzeqDyKbvNog
	PxELO+XuyJoEjfkhaZtfOMXRVqUVcPptVJnD/+L+3aK+/3/IQU2eJkVRjHTruUEntRyJdAXloxcos
	MTBQggE7zzGE+89L47Osu92sLZ409WNGD4hiQWpgwFyOIIrKfoQiyxWoVpTyAoV/pbJFWBxVZp4b9
	z87NmjEiBdvPHninUS1xHIHaXy57w81l5pNz2xsggeTWBjVgRUTUdhANd93A3XegpQ/CBUy3q1wr3
	7PmoKLDOCLM7zFkS9VRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcoO-00BPST-Vd; Wed, 27 Jul 2022 08:54:37 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcoM-00BPMA-3a
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:54:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id t17so13899852lfk.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wfvzPXMvgYMiUrKp+h3pAdWcM4mbvmMcUUFl5h9IQqY=;
        b=qdAQFECb5vde05XPxQXR6CSFIyJRylut7jx8bcMsVR/UT2cFrh5p1DL5iaKRGKxKEn
         iWmKC4eWCe2kTHSNk2idpONMN1Plt2Xcy6sbKw+4wxFRYmcMzU2SdfeeuMQL9Y6v0qde
         Cp7YyOReDTwUeOu6Cri18GQ6ve0xOo7ZGVDHSfJLxIOcj+Yk81Lq2oASn/QF12HlTU97
         OtjDCJOj7uUZIr1wPegm1SeS7E/frwmpNoBtrnZB0mY9an9LuxJWz61flrjSNn9LV0LT
         xe6zjnvWTzt4k+kZXfINYP6ljKljyrQ805Tdh2ZLey72Rw0tArnnWcuEzZBIij+rj/FF
         E7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wfvzPXMvgYMiUrKp+h3pAdWcM4mbvmMcUUFl5h9IQqY=;
        b=YqetrsV/DdOABr/itbBO2lW/1ldDXdmSbzCk3ZA6OvD38AA++j8gH5z0kNAns88tiE
         6x4+H+ZdnsoLedjK9A6gclCBEQ6rL+emrvjOTc2X8GEmYV/KAhxBJVVDNTcUqKm4tNOv
         7LAAiFQUQ7lbhTpIUpB7TIVMPLO7bNC8wf4ct6MinI+Ko8xMyAJMFjq3xnM0VRPsu6Y2
         4udTh/0do6KpAuDvXwVzulf9tn+WDXE/l1MVjpNoVAwyLGw+ZrgHc5osumsGf/FEJ1Zq
         UZ3T/wmrFoX5KKrXoJj+oqcqFXyDZqigdnWqO+L6x74qwdso0wrj2NSErdZhZyq7qErP
         U8PQ==
X-Gm-Message-State: AJIora+BaD4I2/L6bDW1sEWZvD+T3MimwQWXyfkpItDxSP9k84yfO5ml
	NttcOAhd/dwHaQImNI+RplSibw==
X-Google-Smtp-Source: AGRyM1uVHJHNhUGUESYxd+T31l7LrTcDRrOCtvPmwbN2drMeVa748oGkr4rno1r/8A3krk6uQDreyQ==
X-Received: by 2002:a05:6512:32c2:b0:48a:982a:b2be with SMTP id f2-20020a05651232c200b0048a982ab2bemr3747717lfg.493.1658912065422;
        Wed, 27 Jul 2022 01:54:25 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id x12-20020a056512078c00b0048a9c1d13d0sm1083845lfr.5.2022.07.27.01.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 01:54:24 -0700 (PDT)
Message-ID: <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
Date: Wed, 27 Jul 2022 10:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup@brainfault.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_015434_179099_4B262466 
X-CRM114-Status: GOOD (  16.25  )
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

On 26/07/2022 20:06, Lad Prabhakar wrote:
> Document Renesas RZ/Five (R9A07G043) SoC and SMARC EVK based on this SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/riscv/renesas.yaml    | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/renesas.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/renesas.yaml b/Documentation/devicetree/bindings/riscv/renesas.yaml
> new file mode 100644
> index 000000000000..f72f8aea6a82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/renesas.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/renesas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/Five Platform Device Tree Bindings
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +# We want to ignore this schema if the board is SMARC EVK based on ARM64 arch
> +select:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          items:

I think you should rather ignore the RiscV SoCs, not specific board.

> +            - const: renesas,smarc-evk
> +            - enum:
> +                - renesas,r9a07g043u11
> +                - renesas,r9a07g043u12
> +                - renesas,r9a07g044c1
> +                - renesas,r9a07g044c2
> +                - renesas,r9a07g044l1
> +                - renesas,r9a07g044l2
> +                - renesas,r9a07g054l1
> +                - renesas,r9a07g054l2
> +            - enum:
> +                - renesas,r9a07g043
> +                - renesas,r9a07g044
> +                - renesas,r9a07g054

Did you actually test that it works and properly matches?

> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: RZ/Five (R9A07G043)
> +        items:
> +          - enum:
> +              - renesas,smarc-evk # SMARC EVK
> +          - const: renesas,r9a07g043f01
> +          - const: renesas,r9a07g043
> +
> +additionalProperties: true
> +
> +...


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
