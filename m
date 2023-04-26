Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A1EC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxrWMmsmX+YIiBibqadRzC9woTDwGuwZGAdhHnVUiCE=; b=GN6T3GdzdCj0yi
	/jHI+VPpuMa3qo6HcyEyvOomPT5lbLs8/CbqifSdt/E5stVzT4NY0iakMwv5/5Czy3aOpN7JW9Q/3
	M3qX3EqAkaZdKTS0eiByXtJASih0uWMPvMF/dd9mGAo6NsvIVCvMzmxmYP+DyyYo5jqzJhdDtdwSI
	xkTJGJm6bQGJ5vzwbW/uI8hcQRjX/SRJWedZ/lJpXfOlSX5WrSh1AvHaR92Xbf+h9G0XIXtvvLwya
	I2FCnwinLLRUDCbTI14TCWgr/2gl4JqIuHtG+Sg5xvM/+tGMZroTPJzHLyB8jp4s/uAbrddTXN/+R
	dl6hK6LKxRrhR47kf9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pre89-003tXQ-1c;
	Wed, 26 Apr 2023 12:20:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pre82-003tVG-1J
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 12:20:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f20215fa70so27927035e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682511606; x=1685103606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AsyA/AkOxo8ZoshwfcmReREGpPnJGd+uW8k6ZSOAWtw=;
        b=DBgGwMsHhifBRn/EU1NjGyg0aWSE1n5N62i97uQFvC8SbAPiLNcfTiFyESyTeLGC0c
         rg7VkhPWIO37ejTAAjrFGJpff7RSOsZDRCJnA7CdrfkoVF4da3oUQtN9O5RGX5AngCGM
         7iub3WsQ1hSrf4zeatlNt0LnEQ9DblKuDziWmLmywHaOJ0TXCFsY4TLuqR+svLUm4wNZ
         WMh4llEVB3YkEQfNDgEqNPGshoT8YMa8I6X+DtnYs61pgoGL7IRrA+d5RuiNB/v5uK6B
         72VDBtdMo9qVzfg5pRyGTovT8YiDz/mWSJwTorYE1lCoaSV2v7AWN5AdkRxt84NhssTj
         WX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682511606; x=1685103606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsyA/AkOxo8ZoshwfcmReREGpPnJGd+uW8k6ZSOAWtw=;
        b=hw4rtEKgZ7GgxrSLg3MssCm/RdgZm2lHVpHmq/6YD+07DL6CPhbekhEtaibxgom4AA
         mmISkC9rGeE+nFJUsWgHDfuQhuOaE0tC/eMkC8ATRSFsS2nWYXYDrSZ986KQBvZIkrQa
         KCr0zCFgvtdSdqdfx/V0E+XHifQU7nA3jxgpA0p6NIpCoCJgg7mXa1hpZ9g0T+UacW65
         rWp8bO/cSQOVkSAly7JbUuD9Z69xuE2Ve0OMJEzKcVymWEBfpCkpVpu3F2iBmRPvOCbc
         2l6aQ1Ssa1xxVwoje0y5MmyYax3JJgzL4HWIX5oT+gioZvSmzzriAsW6JmVh+Qh/7Er4
         kdkA==
X-Gm-Message-State: AAQBX9eIlLaRHmiRb97Y2ZOzJ7lWDZXh4Y4njze1o4XMB1eFNAlpUPZI
	lh6QaXPjRmNmJdvRoEH5zSatNv/y3e1zROzVjSE=
X-Google-Smtp-Source: AKy350Y3HkKJCAG0hUS1i+AeOxbKgcCQF3tpJIWU+1uZBHvn3AVYrzpGQSXGWuW/PQ4mJJZWaqOMjg==
X-Received: by 2002:a1c:7201:0:b0:3ee:775:c573 with SMTP id n1-20020a1c7201000000b003ee0775c573mr12126765wmc.20.1682511606182;
        Wed, 26 Apr 2023 05:20:06 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id n10-20020a1c720a000000b003edef091b17sm17748669wmc.37.2023.04.26.05.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 05:20:05 -0700 (PDT)
Date: Wed, 26 Apr 2023 14:20:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, conor@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, 
	Hongren Zheng <i@zenithal.me>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/2] dt-bindings: riscv: drop invalid comment about
 riscv,isa lower-case reasoning
Message-ID: <ad3znhrgwbzqnfjpg7caw26yqmqemw7pu3kto3bsiz4dntfux2@5xga2lwvew6o>
References: <20230426-satin-avenging-086d4e79a8dd@wendy>
 <20230426-payphone-nautical-7098d15035c8@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426-payphone-nautical-7098d15035c8@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_052010_444704_052D527F 
X-CRM114-Status: GOOD (  18.55  )
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

On Wed, Apr 26, 2023 at 11:43:25AM +0100, Conor Dooley wrote:
> "Ease of parsing" may have been the initial argument for keeping this
> string in lower-case, but parsers may have been written that expect
> lower-case only.
> For example, the one in released kernels currently does not behave
> correctly for multi-letter extensions that begin with a capital letter.
> Allowing upper-case here brings about no benefit but would break
> compatibility between new devicetrees and older kernels.
> 
> Drop the comment to avoid confusing people.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index f24cf9601c6e..9e273a3264e3 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -86,7 +86,7 @@ properties:
>  
>        While the isa strings in ISA specification are case
>        insensitive, letters in the riscv,isa string must be all
> -      lowercase to simplify parsing.
> +      lowercase.
>      $ref: "/schemas/types.yaml#/definitions/string"
>      pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
>  
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
