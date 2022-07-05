Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0273C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 19:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kexTHeZ41peVK+XNHfmaU1ak35IC9SQOCEapCkm+Jpk=; b=FqxhKumMpmeoTx
	W+yuvLY1/QiatLBj+xIOsXMtLxvmL0m8lUSDRSptA3gEcZqt/wdclIoxVvtC7StU07XnTOC1O37V+
	gBjMMXFunmLphOKwaPal6LFFxM4xI2dH7P2tY7pg12kJhMXam8zkQP2+wvHjErSyZKxNEd70KVP7p
	46GI8H3mkixYjCgqtkVfRqLqCUSTuDN8pvQSOcsu6DPNUi11QHoIuwlphIkrst6hZv/E2rDszXzjf
	f9ZRH1c1x5SY9XqLawJo/RKbxbaoL73aKJwgqfzu6npceUZVsr1kyHgV/aqNOjlExal8QUztHXNSk
	yNbLPIXXsGACRebVgI1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nr9-002EZ5-NY; Tue, 05 Jul 2022 19:05:07 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nr3-002ESN-KW
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 19:05:03 +0000
Received: by mail-io1-f52.google.com with SMTP id p69so12008571iod.10
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 12:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NYhNf6ucb9Y2EJr3g3GFcYGSI7hDN6hlWNBPyCne12o=;
        b=TH0GlZXvkjeqfRuCQ9WdKS2ulvGGbBlVkLxlALeFX0RMw9mtu3OyfZ0I/E2IfgilYx
         FcbkCW4o28+PUqcHDeHq07iMotRBhPv4BS7qh8Gy5rTNMu3UXJvSeWZmjbd9c5dvvB2q
         AGQbqv7FM30BywxYKrRuenxOky3YLI2v7sHAK7JLikU14xZux34tfbdvcyfPepilPeV1
         ryn33i7k9JjUDc3ghj1xwLaNUMnOUE5fIjmyAPtACFDhBUDxkxZOoaeCnaP8l+E5kY12
         LkDBEiOSzNCTctVCnjOzd5FH7l/SH9v8x6BZlRd/WpBCl7bCUQBQ+JLseJCditGVmleK
         hWjQ==
X-Gm-Message-State: AJIora+AJg9Olt8Yc0DCMzLXUcBiUbjjxg/l6/7gYRNDE1oPmN1f/QX4
	Saw70r8pwDatLXPyrmbw5A==
X-Google-Smtp-Source: AGRyM1vbgvYpzb6OcGyK9lCHO48fmdYxy4SEAi8PzKsPwRclsAgNdeYXBff/q4XTwjXyQVl9lebl7A==
X-Received: by 2002:a05:6638:2494:b0:33c:cfb8:1e3c with SMTP id x20-20020a056638249400b0033ccfb81e3cmr21373745jat.139.1657047900325;
        Tue, 05 Jul 2022 12:05:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x8-20020a056638026800b00339c46a5e95sm14948822jaq.89.2022.07.05.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:04:59 -0700 (PDT)
Received: (nullmailer pid 2450909 invoked by uid 1000);
	Tue, 05 Jul 2022 19:04:57 -0000
Date: Tue, 5 Jul 2022 13:04:57 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Dillon Min <dillon.minfei@gmail.com>, alsa-devel@alsa-project.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Liam Girdwood <lgirdwood@gmail.com>, 
	dri-devel@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, David Airlie <airlied@linux.ie>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jose Abreu <joabreu@synopsys.com>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/14] dt-bindings: display: ili9341: document canaan
 kd233's lcd
Message-ID: <20220705190457.GA2450821-robh@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-3-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220701192300.2293643-3-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_120501_722670_97A3FBBE 
X-CRM114-Status: GOOD (  11.16  )
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

On Fri, 01 Jul 2022 20:22:48 +0100, Conor Dooley wrote:
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
