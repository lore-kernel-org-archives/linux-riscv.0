Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE81C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 19:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ztdbT5uJXainFNDhpPpYLu5i6ZsQAMtZlfVUVkXYwc=; b=AKGqh7RDFeNiI/
	VvzAH4dHzsYHA+53D3NDeJRWdPLhXZC8YIrSn5djIa8AdVV+sXQiAuKh3y0WVq6f0LI7HEvsy1/R/
	9W/ua7o/7iOyjxRuobG0gosB+HLskvY95xSCHYTtBbvZzaTmHKgeHo70xvG6OZqMoaWKqriWiqTG3
	MAiamk6kTC0nTcCEvT9r0ZLHy9C1K/lCmfJmOHAdtV+5u8upnwzQ8RyTysYWckZt6SIS3V0McL+my
	LuuIOlURag5DpKH00KZnBj3sjkG8zeNjfoXJOon0Ncs5dY2Mrvxav4G7qiZaqxO5ijZ0RtA0TnMpl
	TkN7+mlS9Y6dIKlbnX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MT7-006e4k-II; Fri, 01 Jul 2022 19:38:21 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MT4-006e2j-25
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 19:38:19 +0000
Received: by mail-io1-f50.google.com with SMTP id s17so3206149iob.7
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 12:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oYGwea+9Dc5qlyJ44ffM89yyXqLnWemdQ1bnBNc3VDk=;
        b=KaPXRhn/2F4x/eZd4eH1YwdPyTBGj6Ur6dlU26/IT2BVrGQZmWuOEpqv3jsyp0ab+v
         6AbZoQKdYq6iyyG0jS1JIqP0I253REsHiZJXElkHiWb083oOXmfgrEr39d8+nBJVum7a
         sWywZM1JVsKROkOVJ6F3yzt0Jr6mRT425vCOMJlWRHy1odE+RbnrgtMVgHkU40zyLGrt
         dUOVhmV1Xfk0ZiCLbH2GtxoKkNp18iLuLCgHgkw+VzcgT6tJvy2g2CNF/hAyMsw21gH6
         Xj3V+smEnyePqAG2sytsc1V2u8urCucZh8QXKouMKlmDavoK3Qa0TFQTnKPktiioVZwm
         jh+g==
X-Gm-Message-State: AJIora/vDS1Xf0GWKI4btZGrpbwka77h9lI8vEjpjJyQ3vCoskwpMJN7
	Lb4iuy+zWef1zvndFSXn7Q==
X-Google-Smtp-Source: AGRyM1uejcIwzsBE+pycB2Qnm2yYV9wtrnyFGLocbsLu1VxbRBag5KlqP0ugvtvcy/HrL02BZGM2Jw==
X-Received: by 2002:a05:6602:2e8d:b0:64f:b683:c70d with SMTP id m13-20020a0566022e8d00b0064fb683c70dmr8094734iow.62.1656704295753;
        Fri, 01 Jul 2022 12:38:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v1-20020a92c801000000b002d8f1269e97sm9277818iln.42.2022.07.01.12.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 12:38:15 -0700 (PDT)
Received: (nullmailer pid 1385506 invoked by uid 1000);
	Fri, 01 Jul 2022 19:38:12 -0000
Date: Fri, 1 Jul 2022 13:38:12 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, dmaengine@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dillon Min <dillon.minfei@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	David Airlie <airlied@linux.ie>, alsa-devel@alsa-project.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, 
	Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>
Subject: Re: [PATCH v3 02/15] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Message-ID: <20220701193812.GA1385448-robh@kernel.org>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_123818_155573_382699F2 
X-CRM114-Status: GOOD (  12.62  )
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

On Wed, 29 Jun 2022 19:43:31 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan KD233 development board has a built in LCD.
> Add a specific compatible for it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9341.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
