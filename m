Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0BCEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEHsifxaRNCUPLcqTG3v23/bX06CPyPwQm9u8kN71uQ=; b=HRYTFmyRl4EN+h
	fdY2LvqCkzA3AydsxsM1+vA5SHeHuEcp57HrRcj3vndZIVSd7Ts/q84w9PDnCdJ5RjHnDeuD65GXE
	xTc+/UBzvtjc9KM6ramvQGpp0eEVGIdrGMRADRPyyAyjOnXU5+4XjhK3Fz0HGeulYanWm4W8TjyQh
	qNONVpupEdbpxtHHK5Vt8uuduCb2J0TCq19qRjvPzRxnrq3M8WhpEaZd3kBAmJxyD/nYYQMb0u/qY
	2jPJM7U727YsW4FS0nBrF6P1O7lK2jk7hgcjoiz88BLy8jdjwVrISd12IEYKcks8gACZ/DS3Pkep+
	g0MMaRXPSacXsL7p+fEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcVV-00ClYp-2u;
	Tue, 04 Jul 2023 09:39:37 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcVT-00ClYJ-0h
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 09:39:36 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51dd0205b2cso9521244a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688463572; x=1691055572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJ0qtnupAs7ltHx9bKvNPX83TbrwpqmJjWVOcNgIVHw=;
        b=THisYSUqeNl/i8NXmLzxvee7RSsIi+PJ0hgPODvCHhZ4VsWua0WflWx+IRCsmUXjpq
         drjQYwXK4wZ0iZ9eujy2fYbfv37G1kGqijXN2tDkpYzQ0tdsrshyu3krVhNDDtZcTcnW
         Gk+AHF/A9F8TXdvAvTC+djhiSteHcBAJ9tfIMHjTee96u8Op6yhuST1+1l45tlN77UA6
         biU0qAI+2Rhv+uXDby5aRwOZI8RYkmoB6ipJp+bJlN8tTBST5qscGnJb9mjz8zMMc7/C
         Vxd/kObQHi1VV2CGayihKXOk+Z6ycEGXdAXXSfK0mBZIr7pQ3iB954Mv7ZhS4H6qlhQD
         EqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688463572; x=1691055572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ0qtnupAs7ltHx9bKvNPX83TbrwpqmJjWVOcNgIVHw=;
        b=kWdYRtQGyHEQn2XmwS2Pzc+MGPEXOBS3ekrcJwGDIWmy28r1tfDLty0uZ3cU4XksZs
         wRJBOwIjAcOktyxeZZqgp8dUP8sd8WDROJYBR2Z0Lm2dUth1inphai1qHjSuVvV4UofY
         6srFtFU+kWlNjM8neL+F1ekjlUCUI5SIj2TyRl0Qd8BHh7pJOB7Ffo316oaIPlBmqLQq
         bC2+/sglsUHCQL2b6ao9iGJ2gy1LZSl8hVSY2TM/EQh0NQJ8dt0GbglmNAuCRe0D/vKp
         hVd4rygQEGkdJB10DLIkp+4cOInVuWaztINubzq+vM5miY7Oh0oBKYcCr64pzz616gVZ
         V5Hw==
X-Gm-Message-State: ABy/qLbn4g4bAhCm5FtLnb9AQM37RwA9EAx0Qc30xBPE3Ai5libuPWmx
	AUkUhB8x0YaCN6nBT1OPxLPjlg==
X-Google-Smtp-Source: APBJJlER9WHFO7KniG1uIOyPZKfVSdRulKONCVGU7aNr+BQ+vjTlPTIx0JV/ZvgkeuQml/6096dhKA==
X-Received: by 2002:a17:906:3bd3:b0:991:b7f4:31dd with SMTP id v19-20020a1709063bd300b00991b7f431ddmr10787322ejf.2.1688463572014;
        Tue, 04 Jul 2023 02:39:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gw26-20020a170906f15a00b009929d998abcsm7422613ejb.209.2023.07.04.02.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 02:39:31 -0700 (PDT)
Message-ID: <7f3b600d-d315-22d6-b987-eabfe1b04fdf@linaro.org>
Date: Tue, 4 Jul 2023 11:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND v1 2/2] riscv: dts: starfive: Add spi node for JH7110 SoC
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-3-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704092200.85401-3-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_023935_322414_CD188344 
X-CRM114-Status: GOOD (  13.70  )
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

On 04/07/2023 11:22, William Qiu wrote:
> Add spi node for JH7110 SoC.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Missing SoB.

> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 52 ++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 98 +++++++++++++++++++
>  2 files changed, 150 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 2a6d81609284..a066d2e399c4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -126,6 +126,20 @@ &i2c6 {
>  	status = "okay";
>  };
> 
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins>;
> +	status = "okay";
> +
> +	spi_dev0: spi@0 {
> +		compatible = "st,m25p80";
> +		pl022,com-mode = <1>;
> +		spi-max-frequency = <10000000>;
> +		reg = <0>;

reg is always following compatible, not somewhere deep in properties.

> +		status = "okay";

okay is by default

> +	};
> +};


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
