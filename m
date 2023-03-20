Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A3DC7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43Vrt29E/XaRG8FJ9EqEZLsBknILeWtUw1yHditvp8s=; b=fjTkOdlP/5sUV/
	dMJNKpEXAhRolg32GgtxsNGaUK16xYiDtGhIBk7hUvPp4uSRwVzbRKPd8Ozp1EHLemSr9X9/eQ+ri
	yIemGrUK6AhRpEtOBjQTy63KDYwGAJ86kMgzd4+y4XRzFIxyEfk6RhI1WyNO7RKSO3KZfH+xOnbcs
	C+WvsFJMX1w8v/DzD4qwyKA9iQrMiKvEbXV8BN2Apq/pu/TrV+1rYNKW8lyQ5lYVTAwVJeHg3P9P0
	ErkhU9xIF6KBOa05ph4qU1XcnFYAx+ybP3+5lahrW0GoWn2lNGqfyDXq7Da1yNT7qNSDhnt9IE4qh
	IkC5qs3Y7mXhOR4kBxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHyH-009gX5-1U;
	Mon, 20 Mar 2023 16:02:53 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHyD-009gUS-3C;
	Mon, 20 Mar 2023 16:02:51 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-17786581fe1so13473383fac.10;
        Mon, 20 Mar 2023 09:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679328167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXPLPHoO6OcEzh0FRvvTkMYHJJivlJafTToDO4kOl40=;
        b=tebiGTARqupP0FPMNqcdQcj26g0QnaObZ+MYyP1HPt5t8XkKXV3YA10FwmlL6LeCbl
         RQjj9n2Hs3vpTi7canNlLRuUo9qm8fsKIzez5mbsZ8ZKOdOMTTKaL7ksnicoiOYYP57K
         cx13DWK5c3Rto0AZLgRFElCBQdJg0Ip7f8E+kH1VaejaLWftsdnJXEOwkTwGoDJMHMVy
         ytQNEK+Fz6LI29Iby/4HzDMRp1M/HzRhahQQf3BiizRlscm/uXX5o+rBfVR2aYrHHji2
         QLqc7RxPWtmED6LDxtrluEJbTQXq0ClfpZbFn51tuM3dyB84g2QT2EifjfTegdsICYW+
         YOrA==
X-Gm-Message-State: AO0yUKWqr1zjXWu6K1q+SVnu44tOZOLDsyP/z4YsmiTUUNRurdReXTT4
	nEOrXYIT1YikSNod8/LTmA==
X-Google-Smtp-Source: AK7set8XvRgwjmJDOYipg3BA4ranqSKnJyKo74CpeOtIhfaO2wH4agFUVkOR5yGuCLkfnjT0NXGXHA==
X-Received: by 2002:a05:6870:a549:b0:17a:b214:f004 with SMTP id p9-20020a056870a54900b0017ab214f004mr5277277oal.6.1679328167586;
        Mon, 20 Mar 2023 09:02:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id tk6-20020a05687189c600b0017703cd8ff6sm3389673oab.7.2023.03.20.09.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 09:02:47 -0700 (PDT)
Received: (nullmailer pid 1768734 invoked by uid 1000);
	Mon, 20 Mar 2023 16:02:45 -0000
Date: Mon, 20 Mar 2023 11:02:45 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Cristian Marussi <cristian.marussi@arm.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Jaroslav Kysela <perex@perex.cz>, Katsuhiro Suzuki <katsuhiro@katsuster.net>, Daniel Drake <drake@endlessm.com>, linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, kernel@collabora.com, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 04/11] ASoC: dt-bindings: rockchip: Document audio graph
 port
Message-ID: <167932816525.1768684.13404674229392132860.robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-5-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315114806.3819515-5-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_090250_025399_032342DD 
X-CRM114-Status: GOOD (  13.92  )
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


On Wed, 15 Mar 2023 13:47:59 +0200, Cristian Ciocaltea wrote:
> The Rockchip I2S controller is currently used in conjunction with
> audio-graph-card to provide an endpoint for binding with the other side
> of the audio link.
> 
> This is achieved via the 'port' property, which is not allowed:
> 
>   rk3399-rockpro64.dtb: i2s@ff890000: Unevaluated properties are not allowed ('port' was unexpected)
> 
> Fix the issue by documenting the missing property.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
