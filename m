Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0040C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a578nDTtnUt3hWcxEDLJEFGB1pzrpbfZSa0j9Aep5CI=; b=lOh/AxIvFycfMy
	GtIbR8Rc25olKVed4DJpMboIMhiOmlOc4hIvRe6Esrmq/Xi/kQAJPeibDaksB/FT9zlGYTuXZEXyU
	tlzLby249HaTy+j9ET8h/8q0vA5h8+4r5Z03OsZ2Mgkp/tHmDkDSAV3w8ChrSR3OCYIPJsO0mlpnT
	mB6jvCnpar4bq4pOe8blBB1L+xAzvidGmmdpzXW3TKk8Qy7lWUN09ACnFgyJWoWoFIMHfvSvxcEPc
	6NTwwsZDN6WLsYngG5Rj95MdYux+loyPyP/vismgyx7nzYiWuEwLQ+SH+JT/FwZOxBf9QAk7z50EL
	RViz8ae5ThWChUB7ZC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHyT-009geP-1G;
	Mon, 20 Mar 2023 16:03:05 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHyQ-009gbm-18;
	Mon, 20 Mar 2023 16:03:03 +0000
Received: by mail-oi1-f177.google.com with SMTP id bo10so9046077oib.11;
        Mon, 20 Mar 2023 09:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679328180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNC+OXlKdlbVkyP5FbmhjfPQE78DDQdoT/lxRDWBrmE=;
        b=qRHt0QQSUkDElJUjaniaN5sMiCDjsbou/3Ykak73wJNVzvOE4sbbt0OT8yEUlhffMs
         Q/qIhF2gAULHHivVKJjqVLmIKJozygArPidwXZ3Ok9ZzVuIxx6EZh6cHwPFhzqVEjtZv
         gV3NKdyXE1HJ/FlQzJe5erOYY6kFSF2KDe4JyIg3t0BZvlqCoXerCdho20UsDZa7Ha95
         lXyLZhWMVwnUYrQm00N7nk2rSHz3FcAqImgSJzm+tc8FvejPKhI8CoJ0wI/JX6oDRP9C
         DMcmqjNFLLLjJbjkMMQOUySOH95P8nwFMK1faS68sMIpgJp1wIojS/Rc0mUjn1rRJ6tp
         cu9g==
X-Gm-Message-State: AO0yUKUeQaVFAg4vAyqSgRrP+dNSyZz5e7LkPOb/2UWBjHft4vWXjSCO
	XN3shUai9IW+aqodMy1tHg==
X-Google-Smtp-Source: AK7set8Py2GSqg1krKh8kyywDWaz6ivjsTyoY4utp1Q09KYKg3F84NdU3xUAPh4qNBy0G//Ug9VI1w==
X-Received: by 2002:aca:f04:0:b0:387:115d:1e26 with SMTP id 4-20020aca0f04000000b00387115d1e26mr209867oip.3.1679328180069;
        Mon, 20 Mar 2023 09:03:00 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bk38-20020a0568081a2600b0037832f60518sm3821272oib.14.2023.03.20.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 09:02:59 -0700 (PDT)
Received: (nullmailer pid 1770233 invoked by uid 1000);
	Mon, 20 Mar 2023 16:02:58 -0000
Date: Mon, 20 Mar 2023 11:02:58 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, Heiko Stuebner <heiko@sntech.de>, Cristian Marussi <cristian.marussi@arm.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Daniel Drake <drake@endlessm.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <sudeep.holla@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document
 audio graph port
Message-ID: <167932817831.1770182.9717265674737412940.robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-6-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315114806.3819515-6-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_090302_414223_F162E41C 
X-CRM114-Status: GOOD (  13.56  )
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


On Wed, 15 Mar 2023 13:48:00 +0200, Cristian Ciocaltea wrote:
> Document the 'port' property to allow the Rockchip I2S TDM controller to
> be used in conjunction with the audio-graph-card.
> 
> The property will be used to provide an endpoint for binding to the
> other side of the audio link.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
