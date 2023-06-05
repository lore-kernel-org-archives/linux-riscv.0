Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F09C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1mNOA3h7ihB+8Lzy070IBXXuvLUEKDKMQtlYo8ovp4=; b=xnyo+I+m32kOjy
	qe1WS+T5EqAmDwHkFB30y7Z/hgZstNpExfzGHNNpDaJVcft8gBYZPw9cXLh8eBNEe2d/kiKdY+775
	/dN95ElK/iK8VMK97P+UFMsSNMp7FlEPGjS0V08WbeTxMjiH2CfRKzjC2eJ2DXMRI0SW9oCEZcRWR
	x640y2eO5TR/1bXUgk++wKn6OJ/GVuVyOIH5869yKBIDRhKEcYDVWr6S4w3VVWn2YEYOw1BBnd90j
	9IH+mNa+7tsaxioCaDscN2YyDFsCmHkSmpcEw0qPinx21FOTRxIhqKpXqwzp16ADC7eDFAi3tgKF7
	D9Kg2RMT5YF6PccKKDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q63x0-00EPn5-0o;
	Mon, 05 Jun 2023 06:44:22 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q63wx-00EPmK-0X
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 06:44:20 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-973f78329e3so710890566b.3
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jun 2023 23:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685947458; x=1688539458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUGCYeOScHhssGielwBu6OShRHtxTVGNeYBVmelokvM=;
        b=Y3hi0KNyXSzEYKMvg+MDTVHjRG6F+Kktuiaj4Da85HCaJjgiUomvJmHGQvQME2xvIf
         RGSWI57KJ99Ori4rrlFP+8DBBQzFLU6rBY2g/0ZJo1hiWWrXAEzTFL7vCFAreC5iP/AG
         +6tul+68Tllyue+r4cmcuHQXJatb2LakNUYVB3NyHE07AuySQBravQOnvFjpl15kK1MW
         VoCs08vRcpJViLY0VuiOo3vdxHoIwxJl6CAhRJvsh+RvLozfGhYZNxTars9/QGWBz15B
         Q9b3QBfjegFYvJC4SnI7FXGp/hSUb5oDiURzpF6s/d7ugNqWiol5BbCGTwFWvo51eCz1
         HLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685947458; x=1688539458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUGCYeOScHhssGielwBu6OShRHtxTVGNeYBVmelokvM=;
        b=lv0XuNlkIOMp+CJuIpzVvOF/rBcHnyUPSh3DElt2NISUrrW8eA3/cCQLhLbOO+CKpx
         hVfm+4xU6d9ZH6JuWiB42pdbjH5pyA9ImyHGpB2OlT35qHLJw4GmCcmpxXCV6RbTe7pD
         Neba/jsQ79gNkpdDJ8xirBNOsBDlNPOkmVDIMkADNrRjnU3GecxUVM7/dGoEx225joPZ
         FlgH8F7vbwdwjHDwFM8tp8NKw2FpzXSmFoXx531ETGbx2gtS7F1QhtYsmOQUNGq09s3O
         2ZnpC+XMHJ00m+yjIPt4EyxvBXtPA4h6AhUL8L6opR4vLoOaCsWx5kKJGF9B54ikysdA
         Sw/w==
X-Gm-Message-State: AC+VfDzk51BR/ph1NSdf8LynRCVGo9+YIPOscfQ1kt4WabtxDCybPUxV
	DfCh1D2M/eEf5tnuYwV56FGULg==
X-Google-Smtp-Source: ACHHUZ5+qQg5JWv/PBzryjhJ2KpeTQWGfg3wSLbmTG3o/Dcw24uO+D5wNXzGHUhrb/s3P273RT1zBw==
X-Received: by 2002:a17:907:728f:b0:966:4bb3:df63 with SMTP id dt15-20020a170907728f00b009664bb3df63mr5464988ejc.63.1685947457973;
        Sun, 04 Jun 2023 23:44:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906594600b009745e1b6226sm3859246ejr.125.2023.06.04.23.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 23:44:17 -0700 (PDT)
Message-ID: <d26d0a24-eaa5-9b32-4888-61217a24925e@linaro.org>
Date: Mon, 5 Jun 2023 08:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Content-Language: en-US
To: Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, ChiYuan Huang
 <cy_huang@richtek.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Mike Looijmans <mike.looijmans@topic.nl>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 William Breathitt Gray <william.gray@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ChiaEn Wu <chiaen_wu@richtek.com>, =?UTF-8?Q?Leonard_G=c3=b6hrs?=
 <l.goehrs@pengutronix.de>, Haibo Chen <haibo.chen@nxp.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230604185336.1943889-1-bigunclemax@gmail.com>
 <20230604185336.1943889-3-bigunclemax@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230604185336.1943889-3-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_234419_208704_DF987B01 
X-CRM114-Status: UNSURE (   8.99  )
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

On 04/06/2023 20:53, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> This ADC is the same for all of this SoCs. The only difference is
> the number of available channels.
> 

Patch is still broken. Don't send code which does not work - does not
compile, does not pass basic usage tests.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
