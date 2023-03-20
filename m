Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8822DC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaFsFjLPCmyMPoDfaMf6PjL04Fj2pwVGu+ABZUm1WX0=; b=PBybDAkIM3u8z0
	B8d+0VO+SArh1SK4RCLl0H2m63ARCPULdoAfLaLW/GV2XqC/amxv02ccaexMbUgLalOgLuDt9CqtG
	pbHjxzoVyn3o70h7HMVAZfRTWahbZROC9h417Fxx2ooYYEOHL8s7UmY+LJZxZy3Gh/DHsimwdy2jH
	0Trwaj5uhbVVk07pEOhJ61/RPWl/5pNGMnd08YbBnNjjcNbpstr0zCn9g0djn8/mJZrUYPClpq/BK
	SAf5gY0SjTqVHmHQlKp7wNFW0bkgnycrAwWYWOxZtt4s+jmdZXduNzQKrkB6BbBwf6/roKEjfqkG1
	A5YT/YMWQBIf0N/HztwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHyn-009gqq-0x;
	Mon, 20 Mar 2023 16:03:25 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHyg-009gly-2z;
	Mon, 20 Mar 2023 16:03:22 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-177ca271cb8so13528588fac.2;
        Mon, 20 Mar 2023 09:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679328196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk4bf5o+T0icO2it+WiVyLr9KB3ljMdbR5QHyH11JsI=;
        b=8NM3kBr1KTX1DKIMmQh6aLssX2woot0OFKhKg8pZvlQzNmOce7PW8hjnLg6ldVX12K
         jAX2TJtkO33krlt0tCyfJeX51Gc56OVJTsIxzx5NlGKhfeubeCBNUd+lAAQ4xgkpqOa6
         8eytRFFRgxXj3/refDGA0PUhEiRdwjQlfGob5q8/egEoM2PRFcRMULwG25w1BJ6vKuNj
         7BNuLajzxpzmO225oOYeXldSZ4CGnMZ5I5J/hqJc0gUNgJi6nbidjZx4jF7SA95cAae5
         hvi37W4J1Tc4nOOjJGccZnDBkjzyMym1cgZQXv70s1wQuaNSKj/jT/xJvR/NQNHXZz7s
         IkIg==
X-Gm-Message-State: AO0yUKVhh3ekAaKqSBdTMaIzK50Hl7sO2j7lJfGXgP/1jUCEHFADnd8+
	evW+ACs9pFxe6eBxahVSYA==
X-Google-Smtp-Source: AK7set+K3nWOBlUoUowZ7HA8nsud+xt7EyVHYJaSSzw2tyQ5SdbaGQ0LXy0ftmchOcmPlwGf6U+e7g==
X-Received: by 2002:a05:6870:4789:b0:177:baf4:5b10 with SMTP id c9-20020a056870478900b00177baf45b10mr5713445oaq.31.1679328196643;
        Mon, 20 Mar 2023 09:03:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id zd47-20020a05687127af00b0016dbf59175bsm3363841oab.47.2023.03.20.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 09:03:16 -0700 (PDT)
Received: (nullmailer pid 1771200 invoked by uid 1000);
	Mon, 20 Mar 2023 16:03:15 -0000
Date: Mon, 20 Mar 2023 11:03:15 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Daniel Drake <drake@endlessm.com>, Cristian Marussi <cristian.marussi@arm.com>, linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Mark Brown <broonie@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, Katsuhiro Suzuki <katsuhiro@katsuster.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Takashi Iwai <tiwai@suse.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document
 power-domains
Message-ID: <167932819469.1771105.12720875880996381388.robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-7-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315114806.3819515-7-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_090318_965173_94614A82 
X-CRM114-Status: GOOD (  10.56  )
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


On Wed, 15 Mar 2023 13:48:01 +0200, Cristian Ciocaltea wrote:
> The binding document is missing the power-domains property. Add it.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
