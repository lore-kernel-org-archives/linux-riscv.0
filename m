Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357E4C71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 07:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVcQIFdhF7Ghn4t+q9tsqTrc8KS/VovG6o80ZxXRHWU=; b=QN31P6g28L7laM
	b3p2kr2wVyNdLjhAEn7hQLYZ+JGhBjkPpKgtE9aBngOB2KeLIuTtSlZ3SpvExC1vHAqu7RUawX/eJ
	Tg3PfEeK0SJBz81Y3lDQ+U6+DbLAGEYLMTyIQhwICsuIxPVmFwIB+uV0SeixX6muSM0YDxA1fcEh9
	vSLIT2ktC03hrcBUNqoEHZdj3aoeZ/HA0I96Wygk8uNZKYiSH4MUKVYQ1pvllyH8KO1aGzJ4ETziA
	i8Y1WSEgvsgpR4cMuqOSjHOvO20tSBVA7ECa9giwMjOGRRAHgfZatRwp66gVnQ14CYQ2wcDw/ltQq
	0HI92QrEfQOskd+Ku5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd423-003TzZ-1W;
	Mon, 04 Sep 2023 07:29:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd421-003Tyt-0x
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 07:29:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so240279666b.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693812594; x=1694417394; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQYtxZ4YMVufLg8cTj7D18vm0cjxwRPxw1iteFSZqzE=;
        b=ez+V67Comz0+TxDIz6Sk80CUMcF9yvkCwccTzwoI3/6c4+pQWMG5Vl1KWoekPfz1qF
         eUA9IkO4k30EF3lLJen1tknMkSL1liotkbcjVAQOpJobBFg2ZbZRfQDccdIOsqDzACLn
         SFkcn4x4Ol/XiuR0dZdwlGilLdjHi4GF4p4oPvrB2B0AHZc4aFw3jFj8CoSQX6wkFmLD
         xMItljva8+cmt5KNh+QthGFM9mKpxjJ9KTUS5uBJmqsPZL2Uf4HNk9sDwSGBJMnANKK9
         9FhvhDWurjWDbJL21sbtBlogVKIBsG/6ZDEso11KYNBQkBBSJw2Aw/7H1kk64DQjkL0a
         zFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693812594; x=1694417394;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MQYtxZ4YMVufLg8cTj7D18vm0cjxwRPxw1iteFSZqzE=;
        b=XV3eTUsTX7Z/OvfcFfax6ottCntLP48joC8WgG0OMWlr4Ocq/5XP4l3BPddl78ybwI
         7Jzzpr/kOjXlZL+KZwWrw6iAPP1tNxOqWQnnUSgGX13zhwVsenUIkWrWOJQ/uSNVMOay
         /WvLqpkSitFZ8tFXpozAUzu+yVQG7UzwS53L4b4UVb6/qtgUOddjdwcHREXXSjlHQRZE
         QEDL0/UHoCP9LQjW+whqeKeWF2MDgDYm8dMg4jvkgvdf81ex+voOWXvI57zLnvHNpKN2
         ORczm/BIWSWjfQLvo1bGaOIMoLpJuKa59XIZ+oYJTkO2aoDJlSwFdQpo/4JPsGyu7Q/6
         /6kQ==
X-Gm-Message-State: AOJu0YxI4IF4WhNjljiyRM2vNeJ9tuKfNuntulA5R0ZmKO+13fST0Z30
	DFZALCdvvW+7ZsBYwB0MVB0KKw==
X-Google-Smtp-Source: AGHT+IFjTFQlvYaNRPC1WlRV6FzXxov+PWopPfMBZJArbcX2WyN8R1jmD7YdwV4eNao3JwXbLyZ7GQ==
X-Received: by 2002:a17:906:51c5:b0:99c:5056:4e31 with SMTP id v5-20020a17090651c500b0099c50564e31mr9989300ejk.15.1693812593690;
        Mon, 04 Sep 2023 00:29:53 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v7-20020a1709063bc700b0099bc80d5575sm5670697ejf.200.2023.09.04.00.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 00:29:53 -0700 (PDT)
Message-ID: <7329b120-2c8a-8382-3171-d6a9426182e3@linaro.org>
Date: Mon, 4 Sep 2023 09:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 3/3] riscv: dts: Add th1520 reset device tree
Content-Language: en-US
To: Kwanghoon Son <k.son@samsung.com>, p.zabel@pengutronix.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230904042559.2322997-1-k.son@samsung.com>
 <CGME20230904042603epcas1p47c4e858d65f2618d747bdc214d350cf7@epcas1p4.samsung.com>
 <20230904042559.2322997-4-k.son@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904042559.2322997-4-k.son@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_002957_330550_975DB994 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On 04/09/2023 06:25, Kwanghoon Son wrote:
> Add reset device tree for th1520 SoC
> 
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---

...

>  / {
>  	compatible = "thead,th1520";
> @@ -418,5 +419,12 @@ portf: gpio-controller@0 {
>  				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  		};
> +
> +		rst: reset-controller@ffef014000 {
> +			compatible = "thead,th1520-reset", "syscon";
> +			reg = <0xff 0xef014000 0x0 0x1000>;
> +			#reset-cells = <1>;
> +			status = "disabled";

Why do you disable it? There are no missing resources.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
