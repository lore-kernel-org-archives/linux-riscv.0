Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B10C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4vw/nkRP7kvynOd8SsuHRVevltPFDIY7ovgvckfhcQ=; b=KiBC/e9QK0MN/m
	7LWpiJfitYLDn1SBu8/arG3SPqO4bpm3BgD1PGSTIb1SWlFVvrKhqLqkYOIc+de+9sfQyY2EIfv9P
	fL4C2wblqVmySdo/O5vfTN15i7x+SN0wDg5Jg2eweDp8+kPEitAGOIwgb1/T44lag7McwPFIteK4e
	EAGqbvIFuDKUd9HEn5OH+cjwLy9KRN+Q5ht5dan3TJ8Na9kZyRYqUhczhkzAN82uszuqnRd72xhmu
	XA2OEi30Qbsj3c5qrx259xz9MTo4Npl+G2GTtL2jge7U+A1/Jud50LKludkr9rS/KdbKwn6Q8l/nn
	XfmWD4W4eOLAI7ysVGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3hV-00C5vP-Me; Mon, 21 Nov 2022 10:06:53 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3hS-00C5re-Nv
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:06:51 +0000
Received: by mail-lf1-x129.google.com with SMTP id j4so18124378lfk.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJ3fUCUUb4OgK9EIYnGNYb2aW+q1y80Ga6j52JMMJAc=;
        b=Xx2EducX5SPjuGROun0fLcpuu4E54+3fEQ/7B+Cg8AQUFChFSn4ryJwAxgXT+lp2Xz
         iY836XuBd/5SXPPAGcRlIuP0kV3vGWHDZFY4zOX0xUJCisGwfBYW3MjUPLJ/0nUeeN66
         8K+leADfXog+TnCtYU1FnAwboiB0SGqePOQm4UJzkEjAN+asDlUltMsmfoJr9Je7Qbyn
         exXHDz8LjavgNNcHsU/ing/38onBvf2UMaS49d0i222buupMvpIIu/dfQ7M0RfUaR3l2
         n794cji7zB3aUUxDMdAjmXyYsyHR3q1TrtTehbVVO6dZGbEYQ8eEXzza1rHDgNJOgQdO
         wGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ3fUCUUb4OgK9EIYnGNYb2aW+q1y80Ga6j52JMMJAc=;
        b=fh3HpXIDGgmE09ztOJL3AILGAlMP3pCZEMx9h5gMw20VWi8Dk6dSAs5KVUBBHA7QJt
         h7LMDeXaeiKGq7XcQuP7hyqUkJQnQVqoDIG6Tuuc+372irbc+CSCqJmvcF345OE4qS2D
         Essuvj2yOFufihUep4LqGM+U1vKN3ZlD4qsoL0Xte3tq4RhE5mg9huwTMs3omUCNQiGl
         pdfkAweCwyRxYiRVaGguxUqG6zP1/D7Nl4ThZo7CK9IkkOGreL0DH+8u3HO1TKBhcIn1
         9y9kPzWrDFtAnMmyaFYqSzS/1tf+tBNm6TKjRsYMT++5fCNGhJ4Y02+5zKrn1eGT93af
         PesA==
X-Gm-Message-State: ANoB5pkJkXh8W2FX8+G5MtrN54BS62aQuo3R8tHdy8CJ8dMZTGUlV/tS
	l9khRvfPAsrNl84cQ/z52R+Z7g==
X-Google-Smtp-Source: AA0mqf6yegrrfLUd9Kkr39MLPBDY3UK6Wwsg4plewaXrhUazKl3rp8YGGCyidHD4+Qtk66F/cuVH2A==
X-Received: by 2002:a19:7b1d:0:b0:497:9e0d:183 with SMTP id w29-20020a197b1d000000b004979e0d0183mr6323597lfc.537.1669025207058;
        Mon, 21 Nov 2022 02:06:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d14-20020a056512368e00b00494706193adsm1976191lfs.208.2022.11.21.02.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:06:46 -0800 (PST)
Message-ID: <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
Date: Mon, 21 Nov 2022 11:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible for
 OpenC906
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-3-uwu@icenowy.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121041757.418645-3-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_020650_805078_D310FECB 
X-CRM114-Status: GOOD (  14.73  )
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

On 21/11/2022 05:17, Icenowy Zheng wrote:
> T-Head OpenC906 is a open-source-licensed fixed-configuration of C906,
> which is now public and able to be integrated.
> 
> Add a compatible for the CLINT shipped as part of OpenC906, which should
> just be ordinary C9xx CLINT.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index aada6957216c..86703e995e31 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -35,6 +35,7 @@ properties:
>            - const: sifive,clint0
>        - items:
>            - enum:
> +              - thead,openc906-clint
>                - allwinner,sun20i-d1-clint

Add entries sorted alphabetically. This should be squashed with previous
patch.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
