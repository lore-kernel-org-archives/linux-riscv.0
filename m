Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25974CCA473
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZXt57bcvQJIduUuw8e/crfApv+2LlFT3Z697b/UVP0=; b=2bDnZEFT0hO9mH
	LeOeeWp0HNG2nWlD31ksHPYEkArN7VPAd17CAFim30LcWXMPfS2miYR8IGotN/TqN5Ag5YIEEfv81
	WIKcW5Woc9sdrDWv7bu91VJAoJ1L0D4yAQ4V25k84aMgVaSrqjQNM7Q+uplatBlSvn+tI1dJXEJXt
	nXGTHrBDLWUFJe3eaw6EIllI9UpXNOCQrSd51PONoz5mMKdvvhPBeCmISRa+YF4NgUR6yHXZI4wOv
	mGhuSwVp875pSuU2j1ncu8aP99eIon5f/xZvf+TmNxfVdJemiuF+xSGwZL1TUYOmJ8F302Co6jj+/
	xG6sw7Jk9Y2q0OheBxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o906v-007I8P-RG; Wed, 06 Jul 2022 08:10:13 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o906n-007I2p-82
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 08:10:09 +0000
Received: by mail-qt1-f179.google.com with SMTP id r2so17180316qta.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 01:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pNNZ2G3zXs1oo3JcBfsTX3whovGatUAPfm1YVK9uZPI=;
        b=OIcRk8IdvHy44NKfuq1cu6Z6MEhL2h64nYXCJZCbT5qcY68B0yS2XaiYyeIV4t7Itu
         fIvhLE1/g1+9ozlfZTYh78UVaTgaZHdCAe6mWx3PVlmSsa7CyvtPXxMYIgeHfOFWDydc
         ltokKakl7MDnTdVZ2sNV/SNP/tGJAvhJ+edx+eCiTm4ydxW8IedM1/9ewUqeGV3IVUY1
         e1LrDi4cyYzQzPpwCKxBm4+AZkYhaREdQ95LYuJmPPrUpIhNV8NbfGfmqKeVJ17lqBSk
         qV6yV7cV6RYNLv+KjJ2dEq60InE9DpBRJSmlTWwBjyISVkJ3vG+HkxJTlszwj9PwlXkj
         YcNw==
X-Gm-Message-State: AJIora/9Gb5VKERo0XWwdAu4t/HlyGqYyjDTJBLgOdssGBHZEf45kzLi
	cY6TkMWGL+MUhpZli05B0g547DRNPe4m+g==
X-Google-Smtp-Source: AGRyM1uQS2ynkVmyFLh78j8y2q7VOxL5Z0VKkKShTb4RW1qBhG22TidIHwMG/jS9Nfw0YMXW1FVZzw==
X-Received: by 2002:ac8:5a81:0:b0:31b:f68d:5ce4 with SMTP id c1-20020ac85a81000000b0031bf68d5ce4mr32121243qtc.552.1657094998817;
        Wed, 06 Jul 2022 01:09:58 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id v13-20020a05620a0f0d00b006aedb35d8a1sm29898438qkl.74.2022.07.06.01.09.58
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:09:58 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id o2so20795565yba.7
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 01:09:58 -0700 (PDT)
X-Received: by 2002:a25:be49:0:b0:64a:2089:f487 with SMTP id
 d9-20020a25be49000000b0064a2089f487mr27921915ybm.202.1657094998024; Wed, 06
 Jul 2022 01:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220705215213.1802496-1-mail@conchuod.ie>
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 10:09:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrVsvYRth+edCs6_bdDTWDacxegMDmgy9HeaKPRaWfkg@mail.gmail.com>
Message-ID: <CAMuHMdXrVsvYRth+edCs6_bdDTWDacxegMDmgy9HeaKPRaWfkg@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Dillon Min <dillon.minfei@gmail.com>, DRI Development <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine <dmaengine@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_011005_313923_176C0691 
X-CRM114-Status: GOOD (  20.58  )
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

Hi Conor,

On Tue, Jul 5, 2022 at 11:52 PM Conor Dooley <mail@conchuod.ie> wrote:
> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> based boards. To make keeping it that way a little easier, I changed the
> Canaan devicetree Makefile so that it would build all of the devicetrees
> in the directory if SOC_CANAAN.
>
> I *DO NOT* have any Canaan hardware so I have not tested any of this in
> action. Since I sent v1, I tried to buy some since it's cheap - but could
> out of the limited stockists none seemed to want to deliver to Ireland :(
> I based the series on next-20220617.

Boots fine on SiPEED MAiX BiT, so
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
