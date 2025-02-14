Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE70FC02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOPEwhLNtVDeISwJJnihabnRe5pwac6u59oFRviwPac=; b=4zKWuV1sffE1HF
	E5gKPM/7Bgz9LSpLjotLgZ64rnQJ0OEzb/z3YjYz/So6dqd0nSChaJoWH15kp9Bpr20opRgrcaQeQ
	2aFy1mjmwpnC1DgTE1FJworiRus5mNO2t0rxkzKQN4faJfNmqIL5PyyfoRp2oniZbUUvG42KIIAAc
	VShrUOmkNG1FtRCmNEX5w6Pxx+UqUO+Rdfr+VwtX+O8ZKyGEiPAIOSk+y8h+VMnV2LWGQNzCtx/lS
	33PG61KIzmc5O+6pA0aZrbySDa41v4vLxx9G71adV6gPhBHWNBmoeUJwBCMEWlFaf5Q635KuNup6d
	KsoaB1cw7fjjDnND80cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyWk-0000000FVDk-2MNk;
	Fri, 14 Feb 2025 16:26:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyWh-0000000FVBt-2wJx
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 16:26:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so16551605e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 08:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739550409; x=1740155209; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yYahPJ7CPZFZpNoRGXLgzm0+xcyc7qKygSX7eH5P6s0=;
        b=DnURxxv4CqiKGrgAI7i2FZureno+ONkzAZS46UKwthxOH8/i2R8Iq7EC+DdCc7XSOJ
         gDJfcTQZWBkqliet/3Y9ibcygBfnRWLTAGPbhalJbgy8H7+KYTIKj3ctbqqBzYbKCf0m
         Y0A0sQfpQiwEJnuhvl+fC3P0rqleQ27hV/DeaLb6sF95kEypcZs/wMBXjYVwsK7pZWPg
         evxjXo+VNou4yqRnkIURoIBx5olVFhNZ0SBlxtcxWvHFmtSWYrSwQGAhf/+KNpPci02U
         68KTow7Gse5HO8i1YCZ/fFoh87IeXm4EL0uHkr61LSzDUjHB022cW9nq4RuI72gRaxw4
         FDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739550409; x=1740155209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYahPJ7CPZFZpNoRGXLgzm0+xcyc7qKygSX7eH5P6s0=;
        b=ebyZkjKb+Ch9j8FKj8t1JT3zyjKlnaa0v7t1SZk0lV2ZuFALKwafAM7c/ndImiKeSd
         +lIFbFaQlMm0k2OEzSP4e72q1yyguR18Xsq4EOr2YHkF3T1csYg89uTO1Tbrt9eIqqgW
         qCuW3XPQutP6BzGS9DbIn6oPDx1gFST6knwKmICNwgRCmot+Hy/qHGGVtSWMuit9e/WP
         C4iwACOs/azqF78eUoekqbgEr36Fd8eS5ymoCZu6ESjot9bLazL+ApoquqHPl358LiIe
         KlIIcixhdHFQu0wFbXiUIO7ml54xvOMJOaSSZkm+n7LF+lXd8stUVjuW1zxTVshqZoIN
         Kpuw==
X-Forwarded-Encrypted: i=1; AJvYcCUmmdpc1opEWXgZXuGfdK0ii3TVQLLhD9+xofgUhQlh5+MtQIKlcQR9Lw8HUa7MFNr1f6n0NDd1LSL0ZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfA5hnf+SRpR9ZQfUVHOe6eiiB46WCciAVShKrcFnXi077fIRi
	NdB36M6EV8qG4ItX+ABeRTJHy4+a9blp+E3G2BkJJOeuDtCK2Qwce+2A8kS29po=
X-Gm-Gg: ASbGncsoJKGIYbE5HDx5v2JDU7+CRUWvZFFvU1061DWDojX8KnoKR/YoGPhvnFNosvL
	IxD53vxT3SKUDCwN3KRVHp1xmt3TXiKjQTW4kuYSWgsltg6mDTvcsP+zoMcV7TEs4dhYXez67F0
	LjMNuxW7Y0p/471jG2bZbrPlA5s51Fb7eBV9ukXfoQ9qfpRZJLQR3bNNPfqiCyWBVX93NPcW7Ca
	VJJ98Wzf7dYpXYOjSyWi+uv5ctCxgfYH1ZPgSErr8+ZccN6P6YuOQyDQS+Lbdr2B6522jjvn8s9
	phh29Z7LsRlF
X-Google-Smtp-Source: AGHT+IGD0ZwSKP2SVlV7tCbb67DNu8v1KQBEuuR8bN5t8fbcPighOdQVzKxfEH8x4T2JZ2zth1XX9A==
X-Received: by 2002:a05:6000:1546:b0:38d:c2d7:b5a1 with SMTP id ffacd0b85a97d-38dea26ecdfmr12656044f8f.19.1739550409013;
        Fri, 14 Feb 2025 08:26:49 -0800 (PST)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dab74sm5084116f8f.32.2025.02.14.08.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 08:26:48 -0800 (PST)
Message-ID: <05ec141f-8d2d-456c-830f-f5ea2adce671@suse.com>
Date: Fri, 14 Feb 2025 17:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add Milk-V Jupiter
 board compatible
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: javier@dowhile0.org, rjones@redhat.com, abologna@redhat.com,
 spacemit@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>,
 Yangyu Chen <cyy@cyyself.name>, Yixun Lan <dlan@gentoo.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250214151700.666544-1-javierm@redhat.com>
 <20250214151700.666544-2-javierm@redhat.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250214151700.666544-2-javierm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_082651_745700_C0457BFB 
X-CRM114-Status: GOOD (  10.09  )
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



On 14/02/2025 16:16, Javier Martinez Canillas wrote:
> Document the compatible string for Milk-V Jupiter board [1], which
> is a Mini ITX computer based on the SpacemiT K1/M1 RISC-V SoC [2].
> 
> Link: https://milkv.io/jupiter [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
> 
>   Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index 52e55077af1a..077b94f10dca 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -21,6 +21,7 @@ properties:
>         - items:
>             - enum:
>                 - bananapi,bpi-f3
> +              - milkv,jupiter
>             - const: spacemit,k1
>   
>   additionalProperties: true


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
