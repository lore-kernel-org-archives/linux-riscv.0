Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF8FC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQsKYjhmqRCyRREqsk1YquELB/E6//ZMOCN2D9FB6MY=; b=I9PEkh7O9RQXn6
	y/Dtp9tw8d+ytksyoWyqswlV1JEv6HMEuj0NRN3QyPGhqmVZUpTnthmYKO+Gd1m7N5on3++fTOurY
	Y4hwfb3LWhPi1zintdmdix0Hxd6zuu7fBpkqHWcrfbl189rvtzSBhm4o3T2wofeH1f2TpsDpPDHTO
	c8lQKpVdRJI33gpTN/UOAmE1CsDSPTOZFCwiWLbox9U90uX7tFDltjgkwVvTrp/UOfpGyETOwLtga
	rXuq42kDhF4UJdCPIw1cs/SFUrTaAUkoksRdunLwJsC/iKSdh6RIG61wGICylluyQyEtQQyI4rFd3
	6o5MIwvxGrgMb7T3AdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHy3-009gQx-21;
	Mon, 20 Mar 2023 16:02:39 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHxz-009gOt-1L;
	Mon, 20 Mar 2023 16:02:36 +0000
Received: by mail-ot1-f47.google.com with SMTP id 103-20020a9d0870000000b0069f000acf40so4572082oty.1;
        Mon, 20 Mar 2023 09:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679328152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ONYF9Dhx9WuItYv8TAksl5NcQGpYz4D/9DErzT0sW8=;
        b=XyXvpNk0hZrdSmIVtAv1SjihwTwMlV2kfAztK6BmNp1rIJjZyFqFFYj2w7HBlpoJQd
         aSvlweK7N8YtgHWcqv8jvhS8vjjDxmiBfxh+clL99Rn5D7m1r6Dt0MeusZiyL0PfJnn9
         HkV5htf1vyulSlbS5C3isyCNKce32p+7MJiWgIQ1wh2ZAgLIP8yACz9FWlIj3D0mynWZ
         751Yfh3wN0fSMHIBAdDTKaOF1cnuHBsEy5zPxXEHRyadbv6mzSpFJn2pwmw0+aO9WUlp
         pjl084C9b9AKr/jNZR9/T5WitWDeM21EJRGp0iQMVM+pj7rTFgbQ4yjBVVpE6TgKbiDm
         Z7DQ==
X-Gm-Message-State: AO0yUKWgcevO76LRCgYRq7Fm2qny+ggfNVEHqZaSA8wrYr2t1onJvh/y
	iIffjx+Y0mVN1FzHSxbyYA==
X-Google-Smtp-Source: AK7set8NH1bWAW41KIn+lr6vHiP/x1CpF/1YMJ08oLnvsEuB8hZrMa5U2xgwSIKI0WC3TSJ4A51DjA==
X-Received: by 2002:a9d:7595:0:b0:69e:80e7:905f with SMTP id s21-20020a9d7595000000b0069e80e7905fmr243497otk.13.1679328152031;
        Mon, 20 Mar 2023 09:02:32 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c7-20020a9d6847000000b0069f71b0d060sm117205oto.36.2023.03.20.09.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 09:02:31 -0700 (PDT)
Received: (nullmailer pid 1767227 invoked by uid 1000);
	Mon, 20 Mar 2023 16:02:30 -0000
Date: Mon, 20 Mar 2023 11:02:30 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org, Katsuhiro Suzuki <katsuhiro@katsuster.net>, Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, Sudeep Holla <sudeep.holla@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Jaroslav Kysela <perex@perex.cz>, Albert Ou <aou@eecs.berkeley.edu>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 03/11] ASoC: dt-bindings: everest,es8316: Document audio
 graph port
Message-ID: <167932814988.1767188.7685028838394723224.robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-4-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315114806.3819515-4-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_090235_452684_0601E207 
X-CRM114-Status: GOOD (  14.34  )
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


On Wed, 15 Mar 2023 13:47:58 +0200, Cristian Ciocaltea wrote:
> The ES8316 codec is currently used in conjunction with audio-graph-card
> to provide an endpoint for binding with the other side of the audio
> link.
> 
> This is achieved via the 'port' property, which is not allowed:
> 
>   rk3399-rockpro64.dtb: codec@11: Unevaluated properties are not allowed ('port' was unexpected)
> 
> Fix the issue by documenting the missing property.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/everest,es8316.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
