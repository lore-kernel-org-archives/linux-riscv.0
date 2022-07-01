Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73129C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAFwnF0DmDFNzxGFf1/2osTU44oeWB7gYoSMNAI8YoI=; b=0eBVoy2O2bNckj
	az+iXwBTwD9KqzygTO8ZQIzAu9PZJQBJEt2/noaQEViNUeJnOhWgKu7kD4kc460CEb5Ex8VYpTPnh
	VlwK0iGK0ncClG/X/WP+auvbzz2mRNeCZLBecP9kHDCqAkpfVaQ328kgdNJMsHwnemQnQbddo2VC5
	d5JDejDSqhuwY8U+g0kVQOM3P0gVHgDMapIrsMvpRldGkGuTYNHQutk01oWdTAe9S2vfV47aL4YvC
	KQB/CNg8V5sstBfVFJu5x7dJ/zKViz+82duFCZhCS277QURJpUX4pXq5YG4o5merbIktuEfkSo0gX
	hs+h16WSWQoD9pLdqUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MUZ-006eYh-G0; Fri, 01 Jul 2022 19:39:51 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MUU-006eUy-Ou
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 19:39:48 +0000
Received: by mail-io1-f46.google.com with SMTP id m13so3272470ioj.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 12:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yIjC0VMQYlxHq3YH9uFPu/iSI53LcMMtf9U7T5PvCVs=;
        b=p1sGUshtlnb5Sml3JtUuqxNRD1Y0uN74IV07B3NJlu2ETnv2DwlAuXQMQfIXgBKx1D
         xpo6gjxWK0L/2xwTvUCMtlymC+pc6d8toE2ZmcwhxDXy6/L0gacwBcSg6+YBnX1OCctL
         5BcUPXzhcuNpALHlFxhnoHYpAZAJsS/FCB2n2RGGk+o88Scby9uBcjAbadEYeRFtMhU3
         njX2kmNJ1bpgIyLy994bfbUFSwrSwq7LOhkkn7hiDhgHcaIQmfIgk1xgj/7zCrfPW1Cm
         D5p7QUj2u8pG+sSq2q8ajhXTsa9okgnz0uIhLJ2dGAOmIRIm2zi7uY4+q971is3grVSG
         8Fug==
X-Gm-Message-State: AJIora9LBT059HuktQ8VTA31Uw5CdD4L+fc+zMm48hkT8OrA/ySRZAus
	42qOQ26uVPBVBrUQFz8bzw==
X-Google-Smtp-Source: AGRyM1uDFG3jh7RbZC85xymUau5rtrth9s79OSclwWORLisSXLGll3gQmu6p4g13FmIUZ+MxpdIJrQ==
X-Received: by 2002:a05:6638:250b:b0:331:b103:8b2b with SMTP id v11-20020a056638250b00b00331b1038b2bmr10057080jat.246.1656704383511;
        Fri, 01 Jul 2022 12:39:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n3-20020a02a183000000b003316f4b9b26sm10145706jah.131.2022.07.01.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 12:39:43 -0700 (PDT)
Received: (nullmailer pid 1387930 invoked by uid 1000);
	Fri, 01 Jul 2022 19:39:39 -0000
Date: Fri, 1 Jul 2022 13:39:39 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Jose Abreu <joabreu@synopsys.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Niklas Cassel <niklas.cassel@wdc.com>, linux-spi@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	alsa-devel@alsa-project.org, linux-riscv@lists.infradead.org, 
	Thierry Reding <thierry.reding@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org, 
	Serge Semin <fancer.lancer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@linux.ie>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Dillon Min <dillon.minfei@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, dmaengine@vger.kernel.org, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/15] ASoC: dt-bindings: convert designware-i2s to
 dt-schema
Message-ID: <20220701193939.GA1387897-robh@kernel.org>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_123946_876001_293AE0B4 
X-CRM114-Status: GOOD (  12.67  )
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

On Wed, 29 Jun 2022 19:43:32 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the Synopsys DesignWare I2S controller binding to dt-schema.
> There was no listed maintainer but Jose Abreu was the last editor of the
> txt binding so add him as maintainer.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/sound/designware-i2s.txt         | 35 -------
>  .../bindings/sound/snps,designware-i2s.yaml   | 94 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
