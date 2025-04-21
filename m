Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEE0C369D3
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 19:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDf3R1y34Rk6nzAm7VyZdt2MVyN8/burw8MLtwuDEcI=; b=gXEXiikReEIJJX
	GSni62V9B+j+Ec/j2YMYAJ3/MEnD0lij7OiT0R/qAeB20qVnKANaVqN98oz8MHi3BxlrQpeGZjbmO
	9VJ/XYCeSziMcUP85qOmHlVzYlYTlimax2xrpy2fKcGTLBpURJIQAZClYEY4V2SFrItAWcZi9okSJ
	LJxgoX4MkXDoM5lNxFb+TP7nG+R6UlWuZVcE9+KiAzeJUokvSlsfngLY7FHS7UIKS6OLkKAzI41Wd
	wrf6djfqM2AgKtwP5qVBUgr6t2xm5E0wM2qBOHCBuKG5NDnXLA14iwoQkO18t/aB9L/EJJk3Ziecl
	iSzjLKcdz+f6UCSBFa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wY4-00000004zu5-3xo5;
	Mon, 21 Apr 2025 19:11:20 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wY2-00000004ztd-2dSV
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 19:11:20 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4775ccf3e56so56405221cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745262677; x=1745867477; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxyUs0OyB6PY4ktlF6VOi53xW7dyCbW5pgQaVkoPnVQ=;
        b=PwKukt/VtZiNiOzuMAWStmnONEFSQPf+/uMzQEyZsE1h8tGRJZnX4zyNAG0bPkM6RH
         uap98cLsUJ9pECNsgb8t0Qzg/T467WiMWUFYeSQmPMvaxhQJIHkfQh8Kobt8p0vvL80E
         hbx8KA8dhlARcu8O2nGp1GCXEQbWjLe70SPcJtSexn7Esfj+XPmMpmJotIdIG8TgxQDF
         Gk7qNg9pbDEAAo2I5mCJ+rVUiVAId+oXDLeKM0CruOcIkWA96PFJVUNwU8p96MsDf0bQ
         Dr9FGkIZZeTDDRGVntg1aw9E3TLDVk2KULLRkK49Gy34zixUbVMkaHJlpBfYp0L7z5lw
         chaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745262677; x=1745867477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxyUs0OyB6PY4ktlF6VOi53xW7dyCbW5pgQaVkoPnVQ=;
        b=dwMaBZFVfAXgcu+ozZXWr5QZn9P0BUBamGQWrhUtO7WwpGgQFFeqzjkSGtI3SSovuU
         bVn5fQCYzBXMXXmUqOf1+IOGJvQVEv8xA2xZBA0c9zKuhEu8FfqkZ7zVmdNsvZ9bvh3D
         DTmz6XgVpBuabtpDaf9bNfJ6PHLCQTlts+bl5vLkLRSk1Cqrx0DjKxqGx+UmJmeh/0r1
         HCsthY7KTLBnOlFgB8GUjR9xglWo5qJ3U6QZ1Ky47Z8nWtSXRQdzTPSyut5bdpsp/rsj
         Sj44XBtIjHfVzw3BOTcWYDlcYcS631FOyaaxW/5KEahsmNI4KCH2EY/4mRIq3GfQvLWd
         PQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoi/Rmz4ouuYkdZ++dZrpk7k/60W9WmRifGMLWBBLBcEo3o2KiDuuB9V8zmxlT1wgU+4vAuoXrNloJtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHtLtcnXCJKMKE+skBpTB0/erzW/4DF1v6urhR7rqfMtCws48T
	0QJyLLIOG5x9x3coNCBAy/Cd60i9fb7qfQNgG/x0bwMgZRJTBLNuKFzlI0xyQ64=
X-Gm-Gg: ASbGnctv94qf3Htg9GQw7Mqj+QCnPk+N1Fb31R+KdAPe3Yvx00UzXPsquy6MWw3cxB0
	liIhSWHp7ArvPnnbu2LGHkT1JpaOmFyREKDrhSgpIy8xFwIykQVM0eU5ijD7nZiLPIF38t4WRWj
	pJaHffKU2rjPp4BoAOlKooWeiHPg81cILyu5NTjvqJp+VM6aDmKTSyChkwgg+Tn4E9XaGIqmNjO
	2VVK04t65MsYRE1XFQjS6gq0IXPe0nvR5uhPVPbPmuiwDHyNRKG3z2Db0MpZ3rsHSma752RDnY6
	zXT7fYRfBMyOjb7GrHfDk9ipHbu5h4xjN2d1PBnAxq3MN7yJKwXmnAnwvHSRZvCX1bhkUlGrqG6
	w6Bt/
X-Google-Smtp-Source: AGHT+IE8DZnLBNjUXN98eE0o/f4gMGDTtMaO/BL+aNlsPXo+fPOuUfQ1NdNuqmT1zTZSez0uNY8scA==
X-Received: by 2002:a05:622a:1c19:b0:477:84f5:a0b with SMTP id d75a77b69052e-47ae96515c1mr236320951cf.2.1745262677629;
        Mon, 21 Apr 2025 12:11:17 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c188a8sm45206481cf.8.2025.04.21.12.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 12:11:17 -0700 (PDT)
Message-ID: <8e7cdada-6623-41ee-8839-b6db1d24050f@riscstar.com>
Date: Mon, 21 Apr 2025 14:11:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: spacemit: add clock and
 reset property
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
 <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_121118_941514_3E632D8C 
X-CRM114-Status: GOOD (  15.06  )
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

On 4/15/25 7:15 PM, Yixun Lan wrote:
> SpacemiT K1 SoC's pinctrl controller requires two clocks in order
> to work properly, also has one reset line from hardware perspective.

You mention the reset line here but that isn't implemented
by this patch (or the next).

I assume the reset series will be merged soon, and if that's
the case, maybe you can add two more patches to incorporate
that in the next version of this series.

Other than the description, this looks good to me.  You'll
want one of the DT maintainers to sign off, though.

					-Alex

> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index b01ecd83b71b5e9f47256adde23bc8b183bef05e..d80e88aa07b45f4a3d90e8217caf93d32655927d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -17,6 +17,19 @@ properties:
>       items:
>         - description: pinctrl io memory base
>   
> +  clocks:
> +    items:
> +      - description: Functional Clock
> +      - description: Bus Clock
> +
> +  clock-names:
> +    items:
> +      - const: func
> +      - const: bus
> +
> +  resets:
> +    maxItems: 1
> +
>   patternProperties:
>     '-cfg$':
>       type: object
> @@ -94,6 +107,8 @@ patternProperties:
>   required:
>     - compatible
>     - reg
> +  - clocks
> +  - clock-names
>   
>   additionalProperties: false
>   
> @@ -108,6 +123,9 @@ examples:
>           pinctrl@d401e000 {
>               compatible = "spacemit,k1-pinctrl";
>               reg = <0x0 0xd401e000 0x0 0x400>;
> +            clocks = <&syscon_apbc 42>,
> +                     <&syscon_apbc 94>;
> +            clock-names = "func", "bus";
>   
>               uart0_2_cfg: uart0-2-cfg {
>                   uart0-2-pins {
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
