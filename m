Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244ABC77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFTF9pjP48TUXy5V/OJQsc/p2hnoemogoDJAojlgWY0=; b=eMfj51SHSMEgPM
	SlXMXtxbeJhGaAYgeH9zZcwPqIcQtNPwQsZQtEALCZ3jNMpqDUBPJsmThFkXKiiHs/BRYb4aWmm6v
	tYmrkkvjlXvmVeYFTUf8HTy+OwVVC63prPXPKtti/Xt8ZwkWHqn0SL0cKGwtx9+l5JFrG+twJO5Wq
	8/JZEvSTfrDDzwUa7mN6wpt2q1PBc2+RPAgcsb1xuRwshlAWACqh4YxpQlFw2Sf6QCv4Ev0OpMJpD
	c1vDvzvsL3pf1KYb6NzpGGaRQPROS81UxKLvvRzWP3PMq8n+m8wzobdKVYrbcO/0SxIdEbJjTHbM8
	dsfNeD88GkjXEdgFTkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvFXO-00D9rU-31;
	Sat, 06 May 2023 10:53:14 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvFXL-00D9o3-29
	for linux-riscv@lists.infradead.org;
	Sat, 06 May 2023 10:53:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-95369921f8eso441828666b.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 May 2023 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683370389; x=1685962389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+UErNxwinHQ3Gbr526y3MMdqkGlpH1N4yA85BQu/jQ=;
        b=ZnnPcnv8ZBylQRbOhTSgc7oOzcDTDJvIepvAiTQC79+MygS56SCqReDEyF0mvUhgHU
         EAjNO5d0xcDcvPJabqJsnAvQaB4wF4QVBi/aoMWpjjFAalyT0lHrai5RZ/TN6WliMMso
         QseBxIY0eDXDKpjBxfWhXaCbikTrNjNX5O13OFwA91j+X0fvUMozhhUNwauaZyGmrm/R
         RF9YD7HZZ8Va24bLly+sx7TTMY2iILIkmn4YRe4mRCXesg2TvuetmkZbiSNw5YUD8CQi
         w0uE57IQnBinE+2+RppNVO/9dqxOYxDYLvBaa2u4MkEliXG8mo0JBb3Fc68/O9RiT5ZV
         yvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683370389; x=1685962389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+UErNxwinHQ3Gbr526y3MMdqkGlpH1N4yA85BQu/jQ=;
        b=BAQCj2OHOHA6Gk625U1xSzNitMoz1Ot1C7ymzdOjka6AFWra2/I2e/cTzrF3y/Dfap
         HoXxe2plcjLyifOhZ9pwlvUAPc3JS/GmbfhD15Ok0un0Xw49pkkOaD7edGs6Kf+6LdfE
         05vyOx1RO1skGZbmHYIETmxv3N8+9dp14BZDludUroB02n3up/7nU38j0DTOj/Eul8WJ
         PQx8/41NMpulI/HZ2uhJFap6n2N13pRT1guYOoKcCUsEy0v3u0nygPbIKD5P9iQ3c1Gz
         nPfz0AnhrW9mpIT2gLKRGAzh0uZLqWB+D3kmTV4bCVMTMaHJ4KQqS3hF8IDoMlP+W1IL
         /ucQ==
X-Gm-Message-State: AC+VfDyXnjJozYJbnHSC8pM9q661wuon3fGpWOPKqs7A5Ac33Ld8ym+u
	3ZO41aJbqZ/pMQsILsOBkAiL7Q==
X-Google-Smtp-Source: ACHHUZ6i+Y7zVINwjFBxl6CnKYAnCnn/zV1ojQVX9NQ093UjfJjxB0nkCiJ8/BQ6zNwikObpGIENCw==
X-Received: by 2002:a17:907:60c9:b0:965:c42d:ac71 with SMTP id hv9-20020a17090760c900b00965c42dac71mr4128109ejc.51.1683370389513;
        Sat, 06 May 2023 03:53:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:efe5:7c03:a10a:7a40? ([2a02:810d:15c0:828:efe5:7c03:a10a:7a40])
        by smtp.gmail.com with ESMTPSA id ig2-20020a1709072e0200b00959b810efcbsm2142263ejc.36.2023.05.06.03.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 03:53:08 -0700 (PDT)
Message-ID: <e38cbcdf-5963-fb00-d7b2-66d4129f9fce@linaro.org>
Date: Sat, 6 May 2023 12:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329 SPI
Content-Language: en-US
To: Maksim Kiselev <bigunclemax@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>, Maxime Ripard
 <mripard@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-2-bigunclemax@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230506073018.1411583-2-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_035311_703370_70BA52D2 
X-CRM114-Status: GOOD (  16.95  )
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

On 06/05/2023 09:30, Maksim Kiselev wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Allwinner R329 SPI has two controllers, and the second one has helper
> functions for MIPI-DBI Type C.

I wonder what is the difference of DBI compatible. You refer to "helper
functions", which sounds like driver... do you mean some parts of SPI
controller?

> 
> Add compatible strings for these controllers
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index de36c6a34a0f..2c1b8da35339 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -21,6 +21,8 @@ properties:
>      oneOf:
>        - const: allwinner,sun6i-a31-spi
>        - const: allwinner,sun8i-h3-spi
> +      - const: allwinner,sun50i-r329-spi
> +      - const: allwinner,sun50i-r329-spi-dbi

As Conor pointed out, nothing improved here.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
