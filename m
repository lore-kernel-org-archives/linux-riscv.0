Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBEBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 19:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZeOjwPrE1B1VzdPeZntwb7GJaTRLQmNNyIu9BrfUgI=; b=LA84MAnAhJWRRm
	bEuBfR1rt5VbbYSoHQeYEyTdMBR7b3ioZ4b8wlHggBTEQnlyu3xq2rOYUiJXAgMK8NnhB14F7a6y6
	d4X1PASmXvb8Yo1Qb5gzzLEBXGBRqpqQ23UFMMVJufxp6UsI0idaFRjYxdZIco108v2uv20KguQ1u
	h1RjNg+UsdvPzJT9knv//9OO0g/7PHFmVaT6o6ZhjyKuTw6mmCF017er0HUx3dk1rYQ4++P7w21Jo
	nhV3z5C1eSW7G+bhVzpbTfNHL7m6+OZ7MIvEViz0N+mI6jkYFyg9G8xXosWt7BVBd8miHDuiQ0nfh
	rhdL2CZfS5kya/G2JXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPUHU-003uRu-3b; Wed, 02 Mar 2022 19:05:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPUHR-003uRN-MC
 for linux-riscv@lists.infradead.org; Wed, 02 Mar 2022 19:04:59 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 834DA3F610
 for <linux-riscv@lists.infradead.org>; Wed,  2 Mar 2022 19:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646247890;
 bh=o/gq2zH0XhC0PaitqVD/LagQpkqLCpBFDwRKMGbmd0w=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
 In-Reply-To:Content-Type;
 b=VX5E2GTk3XaX1klJGyfzuzvzJhPWgNbJ65jFDYpMxrC0weEhXY+s3plrO8WZWxZC9
 FPkEz5MJ18M4nQTrn+3FzU3H+fY3QFJ0cqMqUyoR7yj2bfe1TwTYQb6VLz3H4Mz/ze
 cq9QJtMQWMxBmaEk589oylobcyXTKA5vBeFa9rM1Ow4vCG0eyM5armtlt2uhjzfvNH
 hfVi8H42m7POM3iyB/ZS7nSAw0ItWvrcKwdl19nB6Xn9fW5KaF1qojzaWQx3sKuDhu
 tQ44XJvTw/MSH9+Nv6/Xr5AVOxPhOT0D8wxKi8rMpDux3NJChuVVmMQE5U4u7PB/E+
 aQB1zUkEZ+1VA==
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020a056402344e00b0041593c729adso1499701edc.18
 for <linux-riscv@lists.infradead.org>; Wed, 02 Mar 2022 11:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=o/gq2zH0XhC0PaitqVD/LagQpkqLCpBFDwRKMGbmd0w=;
 b=ZpivKJQA+3lI4yLvVTr6Z2RUpuV/Ca0jahNtTQTALsO645CyzI8DR2AzTUxYGF054G
 2MfQ3ThDXcXj5r0z5NL4TFQ0Cugpzd+e2IR/OrVzaJ99kl8YLAKKbfaFzpF3swvZPoSS
 KwWAUDIawjB4iN7gFFlYTuCROF9bNtvKsv7sMl9Wdw3vzI1zQxgH9IobeJfSW5VYO6jQ
 ZZmyINhjVzClvSc3qyw0QVGzyR1rgPogIdfVc5WKCurb4oaqry9hFT6cyIxScodkvt4m
 XS3R3jbm1N20ycwuHNx8aw/dBLxUWPJxCcHIQrBuAyXm5Ky8pkn3AR43t/Vp4EuVxIaP
 eTkQ==
X-Gm-Message-State: AOAM530cVr59fJfhQwKwn/dQkjCHokiyIDQATJ8HBPARjXBhckUuMCb7
 8W22w5YlXrkL93jNGTHITLpGYehPufCtnrm8jSFSwGyCt8f5rv6ipdvxcJhP7OwoQavi8yAWUyr
 Uatm5Iv/UFgdY+E70k3NWFAGd4pff/y3wa2LYZ3zPBmuYOw==
X-Received: by 2002:a05:6402:26cb:b0:3fa:3817:1f78 with SMTP id
 x11-20020a05640226cb00b003fa38171f78mr30654856edd.219.1646247889889; 
 Wed, 02 Mar 2022 11:04:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5ud+uzIs5hvG4Gs8CgEyL9Hzob7WkoDzIJWUkIA9MRmpeL5TH6uATTuuggM0eZzWdPfuGEw==
X-Received: by 2002:a05:6402:26cb:b0:3fa:3817:1f78 with SMTP id
 x11-20020a05640226cb00b003fa38171f78mr30654817edd.219.1646247889629; 
 Wed, 02 Mar 2022 11:04:49 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 t14-20020a170906608e00b006d1455acc62sm6630349ejj.74.2022.03.02.11.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 11:04:46 -0800 (PST)
Message-ID: <211b3d35-1d8d-b71c-996a-b185324815f7@canonical.com>
Date: Wed, 2 Mar 2022 20:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Yash Shah <yash.shah@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Anson Huang <anson.huang@nxp.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jeff LaBundy <jeff@labundy.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-rockchip@lists.infradead.org
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_110457_954625_9BA03971 
X-CRM114-Status: GOOD (  11.07  )
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

On 14/02/2022 22:21, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v1:
> 1. Add tags.
> 2. Adjust subject (Uwe).
> 

Hi Thierry, Uwe and Lee,

Any comments here? Rob acked all these, so these are clear to go via PWM
tree.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
