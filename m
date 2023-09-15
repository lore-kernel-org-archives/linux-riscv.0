Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C86BEE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0LVkqwlkA4c/rk4OcFwprZPlILuUKWI0Quy0nIgAF4=; b=LyewSxV5NvvDXQ
	pp1nivroG5A/bRN9M56FdvHX2xb/pAE5wcvJO5Tb9RyPo1RWr35w49tn7ln5u9UhZIkQgc7AMoFBI
	sjAcvf1L2f+kjrXMq8JMcLTdiRwYOIXfSMDOMkwQs9597ZkGBOeevhxhb6zxdXPUJdXAEANqXZ6U3
	UeNUkgl3CJa6OhdpPNDWh/eSRLq9d485sW2vBTIbchXYrEVS4+2CXN97MsVcJqXWETB2uKQfd3n6h
	9E7z3iY+3bP/E5xyMnq6fjVCV309WdvFbrR/2uSEFN/pE7a+cB3I3LsIYn5JRnW2yy/hb7jpfiQcL
	HDwiD4B9BRjcxBnXj9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3H8-00A2um-0o;
	Fri, 15 Sep 2023 07:30:02 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3H5-00A2tO-0q
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:30:01 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52a39a1c4d5so2109702a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694762997; x=1695367797; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWx6IyehUEd6WP1uZ5sdPpY2p+OfJAAmTziPQjdEIpw=;
        b=CjsqWwGFgN16TpMznbf9yh08xXztyDyv3pQVIO9K11D8Z885TdC4GxQgD4tgIKhGbl
         Q/4iB5Fcg/CKSzZw7aSebspQErix/ljkrYOYSp2tyArcE0h7w3+Z+xu/YZCCWGySzyyM
         T3fiLfqDz+b+lsefZJDl84u1ghE4o8mPj+GlKtqHdCgvc43NLeAUUMnpKQemWnPGbmr6
         SseWbWz7LJYohHuOU5oTDePu59RtkN8AJ8nKI5KDirFl0Y5N0hNfdp/BLfpBRNR9m8L9
         qsPIfeAZZUF2sUEn9BkUy++aZAWY82CFumnqbAr3dFmYiAAON0Eygnj+2G9VqJmaOBZe
         SEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762997; x=1695367797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWx6IyehUEd6WP1uZ5sdPpY2p+OfJAAmTziPQjdEIpw=;
        b=J/4t9g1GdffY9Jb0cqxciGmRK8bW1Z5OKF+9h40RTU6Ob9uBgG9KYJoftIC0dCuyue
         QANjCGJoezyGU8JA7RoiCAmduFgf7Ryb1BJ4csPm091SbFY4/hyFfthLQVG41vu8OOsu
         azEvBRqQggqkcGPH+9de3EBpcc4cbFDiWsejZQRUbKgb/DIA/a/DB+IZql36j+PY8ypa
         RAoaBxacqTvt5jKu3CCnQJAPhxMbpR2uSPpXbRPN8LS38rJCylh9dp8aynI61+RFjCc9
         lxQiOI29jxBd8VS40dc9tq7deig5rrlq7wUraHx2zKOr8Cn4JFzRm8pvnl3bvVg67GPb
         NwLA==
X-Gm-Message-State: AOJu0YyClN3LsO2BaBjOQwJYsFB5lHbPJARM5BbCaCSa/nf8+286NNDp
	R1iJROegoGKgkbAhcTLbTaRA1g==
X-Google-Smtp-Source: AGHT+IHEdnrk+p48Gcgs8Gitk+VjFYnhXtk5LidxjJQOz8O0a03Q0KXmD4dCClrq9u6i5z3sbe0/tw==
X-Received: by 2002:aa7:c948:0:b0:52c:164:efe5 with SMTP id h8-20020aa7c948000000b0052c0164efe5mr720921edt.39.1694762996902;
        Fri, 15 Sep 2023 00:29:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id c1-20020aa7c981000000b00523653295f9sm1833849edt.94.2023.09.15.00.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:29:56 -0700 (PDT)
Message-ID: <0fbda26b-235e-5043-d83e-af873dada5e5@linaro.org>
Date: Fri, 15 Sep 2023 09:29:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 06/12] dt-bindings: timer: Add Sophgo sg2042 clint
Content-Language: en-US
To: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, Inochi Amaoto <inochiama@outlook.com>
References: <20230915072415.118100-1-wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915072415.118100-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002959_301309_DA8E2A33 
X-CRM114-Status: GOOD (  17.05  )
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

On 15/09/2023 09:24, Wang Chen wrote:
> From: Inochi Amaoto <inochiama@outlook.com>
> 
> The timer and ipi(mswi) of sg2042 are on different addresses. With the
> same compatible string, this will cause a mismatch when is processed by
> SBI.

No, same devices (obviously on different addresses) with same
programming interface have *the same compatible*.

> 
> Add two new compatible string formatted like `C9xx-clint-xxx` to identify
> the timer and ipi device separately, and do not allow c900-clint as the
> fallback to avoid conflict.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index a0185e15a42f..2a86b80c3f1e 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -39,6 +39,14 @@ properties:
>                - allwinner,sun20i-d1-clint
>                - thead,th1520-clint
>            - const: thead,c900-clint
> +      - items:
> +          - enum:
> +              - sophgo,sg2042-clint-mtimer
> +          - const: thead,c900-clint-mtimer
> +      - items:
> +          - enum:
> +              - sophgo,sg2042-clint-mswi
> +          - const: thead,c900-clint-mswi
>        - items:
>            - const: sifive,clint0
>            - const: riscv,clint0
> @@ -74,4 +82,22 @@ examples:
>                              <&cpu4intc 3>, <&cpu4intc 7>;
>         reg = <0x2000000 0x10000>;
>      };
> +  - |
> +    clint-mtimer@ac010000 {
> +      compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
> +      interrupts-extended = <&cpu1intc 7>,
> +                            <&cpu2intc 7>,
> +                            <&cpu3intc 7>,
> +                            <&cpu4intc 7>;
> +      reg = <0xac010000 0x00007ff8>;

Drop example, not needed.

> +    };
> +  - |
> +    clint-mswi@94000000 {
> +      compatible = "sophgo,sg2042-clint-mswi", "thead,c900-clint-mswi";
> +      interrupts-extended = <&cpu1intc 3>,
> +                            <&cpu2intc 3>,
> +                            <&cpu3intc 3>,
> +                            <&cpu4intc 3>;
> +      reg = <0x94000000 0x00004000>;

Drop example, not needed.


> +    };
>  ...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
