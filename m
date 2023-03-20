Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114ABC7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuuGtVXVN1YHWxOrIPAHaVz3PdNDkdfSHiSmnPUmfDA=; b=1pxZ8WXgrN6OrP
	PfvNLkAgCJ010z6FaiBbnKJ5TKErywoPsYadnkzBeu5FL4f7CdkmIhP2P+Ha7pOKw56tM88ZY+xIo
	IeUzpuT0O5rK2BAnkYqX8b6hALt8lGRVorybdt/wisClvXQiIK19EJyJ7tQJqVI2rIZwh0TJoTrJg
	5Zr9ZxqNXUHwJRa9zpVU2K7vXgs6pkZNFrugvlZkJYdtT3b4TAEPb9E7AeM1vB/mYSqqxP09ED62T
	hVhERFHCRoTk5atOAmDNRgApMRwpFA+27oelwvuhFl7IFjquwdHT2QdPSjC61Kjc2BmyT7v/tpN8V
	MSQwxHppz0GEMqjhxtCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHts-009fLT-0e;
	Mon, 20 Mar 2023 15:58:20 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHtn-009fK4-28;
	Mon, 20 Mar 2023 15:58:16 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-17aeb49429eso13163466fac.6;
        Mon, 20 Mar 2023 08:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8X5XJu7ZSmlXWJv7df3tWmayRZwNJIjgct+jX9CNF4=;
        b=OIqtWm5HFQu2B20HbiIU6U/8cnRju1FCVYl0aEdiwkA+w1Jrns0rOjcOpXyxzGzPBF
         C2s11YhSG/dGoWfIh9ykRdWLYvnPciLgcx3ZhNpRQLC6BSUHLuRSB5ftEOkrjvQEyrdb
         JKm4vgF8PGBtKaVlFiMhjEdxAFbcmALIaNxG3itNtaQTQJfNz9pm9IIyN4Wdy5BF8q+k
         jhTLfTHQu/0j/hYEWaJqOqq6L8THln/B5Vs1ivlOAUHGFSEPoHikE4C+zIC6h1ja/EhD
         BjJeVpp0+AGsPVCNZMnh7AXqudOztPc/pgmvtReBMYVuRw4EDSSZ1cEqV8jxtyYvrfM4
         Gc9A==
X-Gm-Message-State: AO0yUKUHXINcEQW1gVwqdWvoP1vyjd2/aaXQywpIIrJep2HsOgybOdip
	RDZJPz/T/LemQ87gLWPhNA==
X-Google-Smtp-Source: AK7set+FJqchAKh3aLkpaCyRS9ncCPb0CGLyZPm8rjBj3cImE2bhXeW/GwwFgbDKATBHmsueXL7IhQ==
X-Received: by 2002:a05:6870:7085:b0:17a:d1e6:5a09 with SMTP id v5-20020a056870708500b0017ad1e65a09mr5356989oae.59.1679327893498;
        Mon, 20 Mar 2023 08:58:13 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id vk10-20020a0568710e4a00b00172426ebe58sm3388588oab.27.2023.03.20.08.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:58:13 -0700 (PDT)
Received: (nullmailer pid 1758791 invoked by uid 1000);
	Mon, 20 Mar 2023 15:58:12 -0000
Date: Mon, 20 Mar 2023 10:58:12 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Drake <drake@endlessm.com>, Katsuhiro Suzuki <katsuhiro@katsuster.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Message-ID: <20230320155812.GA1755078-robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <167904851367.26.16449705310108549543@mailman-core.alsa-project.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <167904851367.26.16449705310108549543@mailman-core.alsa-project.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_085815_700089_2B4BE123 
X-CRM114-Status: GOOD (  22.46  )
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

On Fri, Mar 17, 2023 at 12:21:41PM +0200, Cristian Ciocaltea via Alsa-devel wrote:
> Date: Fri, 17 Mar 2023 12:21:41 +0200
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sudeep Holla
>  <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
>  Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
>  <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman
>  <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
>  Brown <broonie@kernel.org>, Nicolas Frattaroli
>  <frattaroli.nicolas@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jaroslav
>  Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley
>  <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
>  <aou@eecs.berkeley.edu>, Daniel Drake <drake@endlessm.com>, Katsuhiro
>  Suzuki <katsuhiro@katsuster.net>
> CC: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
>  linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
>  alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
>  linux-riscv@lists.infradead.org, kernel@collabora.com
> Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
>  dma-names order constraint
> Message-ID: <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
>  Thunderbird/102.7.2

There is something strange going on with your mails as there are 2 
copies in the archives with the 2nd one getting the header twice. It's 
coming from the alsa-devel list.

> 
> On 3/17/23 10:31, Krzysztof Kozlowski wrote:
> > On 15/03/2023 12:47, Cristian Ciocaltea wrote:
> > > Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> > > dma-names properties") documented dma-names property to handle Allwiner
> > > D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
> > > the reverse of what a different board expects:
> > > 
> > >    rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
> > > 
> > > A quick and incomplete check shows the inconsistency is present in many
> > > other DT files:
> > 
> > Why not fixing the DTS? The properties should have fixed order.
> 
> I was initially concerned about the risk of a potential ABI breakage, but I
> think that's not really a problem since dma-names is not directly accessed
> in the driver and DT Kernel API doesn't rely on a particular order.
> 
> If there are no objections, I would switch the order in the binding to
> tx->rx, since that's what most of the DTS use, and fix the remaining ones.
> 
> > Best regards,
> > Krzysztof
> 
> Thanks,
> Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
