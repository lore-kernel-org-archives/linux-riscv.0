Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812BFC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 08:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abyZonhNnEFakzF15o09RgNVpgvIl7xi+AV+biXzM64=; b=g9LlMxl9+dWPip
	LBdr58EWpFmyLQ4EkHEzu4A/IoKLVFyZ1iuPG5AIewUSYQ8EtAgMQhdr1pstfpHLciVNVNPP4AJ3y
	CJV0xeSMqAjXQvWxpiRYjr9K69JaV/loleVKt2VS/kMVfCXRmNZCzg4jv2dYZVs+7tzWDZtPM8sHU
	7IDvdfpYav727saEcsSq3Wcpe8MN5uy4Coy7PlTa4qD1aMuCTrMMNiq4zLiO8Q+JJEXH207ZNaqhK
	xacraoyHjX9MdpbZk4yMmz8af52C9RodCh6hFwgE1ba5zyo4KzUudh7o8yK0JS9GTw00TQ6HZE+LS
	LpfIR54mmXDKhm/H4MAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o900Z-007GJs-VE; Wed, 06 Jul 2022 08:03:39 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o900X-007GI0-Gv
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 08:03:38 +0000
Received: by mail-qt1-f182.google.com with SMTP id c13so17162475qtq.10
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 01:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dm7RnST85MIDJNN+2iaSBOhoswr2qSrezycwHqjqOec=;
        b=MlEajMX9pUrt8YqSobdZ6AAkRf/Ur3plbj3qmCcDhI3CjYNcVdVI3cT831XjXU/T4j
         2BPRRIXQR2GxiSwkO0A8ZU6xv0gq8ZczzyX8iGzXBdRqjOAGAqB+X3Zer5mPIbv5nNOV
         eVim3l1LVz2Yh5DqDubfnGp0phFKPQpo6Eqwh/ZH8fion+jvILczQZqzjryS9/yFlKMQ
         Bg31AecjbU17viM+EOmJDGiXshe/zoUdanJFIFGFvrFX8qV7rXL64HNFAu2KWCQVSdW0
         EwhyRx1AlV08J2S2mBREf+ssv9xeDY3o83b+2DYGuhuJM9SlKEjlGBbBqYTAuiEN6HqG
         23VA==
X-Gm-Message-State: AJIora9qwCnq1PSYvrT0T5IEJLXu0M8RL1RA8gIKA9ZXp44lDYUi9zAe
	NHNjLzFyURcObcDM7JO9f0yvFKTuBojQEg==
X-Google-Smtp-Source: AGRyM1t3oSFKx2cjhWembopmfbD8aoHtOUnblcUYQOhTYN38ktsAG+PiQiHgK98kUHupdrYUVSLmVw==
X-Received: by 2002:a05:6214:2583:b0:472:fb33:f9e7 with SMTP id fq3-20020a056214258300b00472fb33f9e7mr9393867qvb.35.1657094614525;
        Wed, 06 Jul 2022 01:03:34 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id l12-20020a37f90c000000b006b14fb1ba18sm16131881qkj.35.2022.07.06.01.03.33
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:03:33 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31caffa4a45so60299567b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 01:03:33 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr9659273ywb.502.1657094613015; Wed, 06
 Jul 2022 01:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220705215213.1802496-1-mail@conchuod.ie>
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 10:03:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
Message-ID: <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220706_010337_628852_8C64DE9F 
X-CRM114-Status: GOOD (  18.98  )
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
> I *DO NOT* have any Canaan hardware so I have not tested any of this in
> action. Since I sent v1, I tried to buy some since it's cheap - but could
> out of the limited stockists none seemed to want to deliver to Ireland :(
> I based the series on next-20220617.

Digi-Key does not want to ship to IRL?
The plain MAiX BiT is out-of-stock, but the kit incl. a display is
available (97 in stock).

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
