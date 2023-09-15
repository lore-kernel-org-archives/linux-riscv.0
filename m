Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7DCEE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6u9LbI3HYUen4blssGBv0A5Pn1WVOsxsQL//VejQwqg=; b=UqNwHOPzcip/08
	Yq5WKuaehG9yFuxBardwaWaeBeazETkmhh6BTnRXajMlEoyNlbVl7HUEprZHqEwnYjD822vojDCxQ
	rd6JjAXdcKx+ZJ67huAgA4E/U1CyZHsYKL2WkscTMgfHtP6eCEFMpevSgC/lOUCFFIq43PWK88hvU
	oJLXJZHYWw3g/ZzWMoNV88eGOhE/jw0mU6iyH4IZyZ3wC8C9oLORV+tSqutCn93WmuFkETq4dWk/e
	Rqrz0gIkqWTRvza29OqDUW5zybCyM37awTUcjYHpQY5QP+2ZrNjcJ6Bm9p/T32wefsN2Fay2ZZT6F
	GBYm2i12CkHDhS6WVlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3JJ-00A3N9-18;
	Fri, 15 Sep 2023 07:32:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3JG-00A3MW-32
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:32:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so19989015e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694763131; x=1695367931; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1pFfXlJOJvNpdcADR+2RDuK6BOaq4eRQB5oTZpxIz5k=;
        b=sTzzW7UZMmnQVmFpaH+k1f22+mdqewstUP4wJQ0Hd9j8n1JA3Q7WtyNXNOYms/YtVh
         MGvrmJ9/h0FBYtmJjB1Za/EiQxjtgZQkNg7MwiT5jhVg42k8a2ww4NSBxn7QZDOfEvrl
         GZRAejvNAWJGoC9FJGectzf/TjXSnvpSwcF4CaDstD/xIXNsPValXHr74D6E2O75YVug
         VqkljQO91oG8nN7RTn8pGPYlQj98R/7leZn2nfVOFgbhrs86SEtgwWK8zsGw6Na55MRy
         mBBjyCkpA/PoF+0mPlIZ4+wuaH4xuSfpLlq+fi2x0QzuEFVh51dd8drCuyhYC4v0UePJ
         8skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694763131; x=1695367931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pFfXlJOJvNpdcADR+2RDuK6BOaq4eRQB5oTZpxIz5k=;
        b=l9XZCKBRwNxmtLVNtmH8M79GOSn88pnuJTQxsq1anFTLSa2cDZP6fq+irn16r8uUs8
         lHe7ZUdXSRR0Vm7P9tCEscGWAoaPTZ9RSv3V3rO7PSzubbjf/3aYKy/NKOUx3USg6yxF
         AMT1DlqwZ6HlKkabxR02lC6hG3EsKJgKLgEcU45/ZayXvGGPjWlHc9mprc3Fx3ieHAPM
         JZxWay8TFPQ1nnM1BZn1TXOzeVSgxuCWxP8gEwAPrNvq8nD0+AkAFtQEkFbQP+B+Qmvd
         H4tfbCON03McJNbt4wr4DJEGVWjboaynFaXiFl4auc4btubRQhOp4E5L5TOoJxgGoX1v
         WqbA==
X-Gm-Message-State: AOJu0YxnAvXG7YI+26Z/Yyax+M9XbEvRyMhsonlR4bMo/zt7uiDGoZSY
	SJ4+F6VlVq2uG/aE64oxUHhBCQ==
X-Google-Smtp-Source: AGHT+IEk8DMEDkEsYiFq89U3dw2MEH+q7FpthgjHUbEXaIRWLW2niQ9IP4LJHDt5iGn63/nNROlsew==
X-Received: by 2002:adf:f310:0:b0:317:e04c:6791 with SMTP id i16-20020adff310000000b00317e04c6791mr739845wro.62.1694763131275;
        Fri, 15 Sep 2023 00:32:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id j6-20020adfff86000000b0031c56218984sm3628569wrr.104.2023.09.15.00.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:32:10 -0700 (PDT)
Message-ID: <acd83ee9-951d-928c-eb9f-e3295ae7ad55@linaro.org>
Date: Fri, 15 Sep 2023 09:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 11/12] riscv: dts: sophgo: Add sophgo,sg2024-uart
 compatibles
Content-Language: en-US
To: Wang Chen <unicornxw@gmail.com>, linux-riscv@lists.infradead.org,
 conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20230915072624.118388-1-wangchen20@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915072624.118388-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_003214_977262_94BC5C10 
X-CRM114-Status: GOOD (  13.25  )
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

On 15/09/2023 09:26, Wang Chen wrote:
> Add compatible for uart.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> index 5c4b82f13207..87f7667bbe63 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -492,7 +492,7 @@ &cpu63_intc  0xffffffff &cpu63_intc  9
>  		};
>  
>  		uart0: serial@7040000000 {
> -			compatible = "snps,dw-apb-uart";
> +			compatible = "sophgo,sg2042-uart", "snps,dw-apb-uart";

No, you just added this file. Do not add buggy code which is fixed in
next patch.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
