Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06CEC7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L16EDV+KOTUli8n8ksovYh1VJhSLagC8RzfCI+mv5IQ=; b=JXOEmbI5z+zPDa
	xWg7d6zrePburpJQB0WdnqLOhJeCrnj0I7cbT944oz7QRuR5BnNBbJGrVJUkcqJLbiiIYj7BBprZQ
	bFTNr4+GoqvI4yzc4dOut0+augwNtg254+4A5Z4mqLWYOx22oswpss6ejp8ajpBuEcKM9x9SEcVfG
	KuJicuyamegxFB10UR/0T1n96LJivdCuGx+2oAYS1Or9MupZrz/m9VPax1R6TjBRd26OGLTqfoMJY
	4Rbla3iOaNSdDB8xgmVA+GPOI0x3cQyzSnE+Da6X1O24E7N5+3p8kJUS9ICHhJwFu8grjzh90tVmY
	rFWcvW2IjjS4cPfK648Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mBq-004vEy-2p;
	Mon, 12 Jun 2023 18:22:54 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mBn-004vCN-17;
	Mon, 12 Jun 2023 18:22:52 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5186d5508afso382302a12.3;
        Mon, 12 Jun 2023 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686594165; x=1689186165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKqLQJH1mqzuRzsiJTvJ04rfDSsqHrrA3iBCbUsSHOI=;
        b=T/UJRDl9pOyQ3VKr8bq+HySE8u53jPaikn0peb1zVwX9CuhAUw4k3534zSzLozIQ9N
         HjwDar/76Lpgu9u93/0q1djWVtidybQ842u0ZOQ9wcRR1SVPweBamtp4hVueu7CmckxZ
         oFa/h95Nui+af9J+pwpmVGOq9kdaUrtHzqakK7OELmRk537vkUhpgvueF71cMHQQWdDB
         8rB7mwoKQgDvY4M5lkbqqbAV4239QPN+025gzlzz8M4R6Tcd4y8ZyFzcVC+wgEiXrum7
         z7U0coETkDZnD64r54ssnqfMLxX9lNsY2Lvpeyfh5XB4Ao71wKaevaCNFCV/jWe2rpDg
         XZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594165; x=1689186165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKqLQJH1mqzuRzsiJTvJ04rfDSsqHrrA3iBCbUsSHOI=;
        b=XxSGAs+sjVrkRe6338VIB7o+JjOl/G3Kgdz+e4pmIynmt0/6nF5bqCITr88zjBnXeM
         5z1QdczZ9pUmx6b91GYZaKn0MhoVIUllQcfC1XmWH8z+9ThGQ5HO5Cw8QmQK3wkdGpNp
         JSL64bPlIAljkKtEvD9LqlN0LGaZ2Cup3UMv+JPZr8Rd90LXQ4qV4vQpk+ENQzFPMpye
         YeRvlPRXsPXHK5EK/xk5ZSlPWQBr3bpaubWgerMFNw0HDG5pD7V/90kGCV0Esz0LRsdw
         PfOjsFu7BUHmCbW7+P3qhI/iVkc+WXwXS+HbMOYzoWRT/OOeuhB0EYTgj8d1MAs8pvan
         /uFw==
X-Gm-Message-State: AC+VfDxnBvAXgro4JAa1yjwPhXYz/DaG0/AaMmwpuf6tU1Ae8Rkz4ODg
	TKkkk4hTpAeMpqLgEeIW6wE=
X-Google-Smtp-Source: ACHHUZ7SIa1EObO/QHbeisX6ifIqewTz5w73pxUAYksizGq0x9vX6Bwlibfza1dl8IakcSAsMmJE1g==
X-Received: by 2002:a17:906:fe43:b0:978:9235:d428 with SMTP id wz3-20020a170906fe4300b009789235d428mr9303920ejb.36.1686594165554;
        Mon, 12 Jun 2023 11:22:45 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id c19-20020a170906925300b0096f67b55b0csm5575839ejx.115.2023.06.12.11.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:22:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add D1/T113s thermal sensor controller support
Date: Mon, 12 Jun 2023 20:22:43 +0200
Message-ID: <13282074.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230610203549.1127334-1-bigunclemax@gmail.com>
References: <20230610203549.1127334-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_112251_387172_FFF97D46 
X-CRM114-Status: GOOD (  13.68  )
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

Dne sobota, 10. junij 2023 ob 22:35:41 CEST je Maksim Kiselev napisal(a):
> This series adds support for Allwinner D1/T113s thermal sensor controller.
> THIS controller is similar to the one on H6, but with only one sensor and
> uses a different scale and offset values.
> 
> v2:
> - Fixed SoB tag

It doesn't seems you fixed that.

Best regards,
Jernej

> - Moved binding patch before driver changes
> 
> v1:
> - Initial version
> 
> Maxim Kiselev (3):
>   dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
>   thermal: sun8i: Add D1/T113s THS controller support
>   riscv: dts: allwinner: d1: Add thermal sensor and thermal zone
> 
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
>  drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
>  3 files changed, 58 insertions(+), 1 deletion(-)
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
