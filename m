Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12819C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKI0OKqJSGUAsW2g5S3NZHzbc89kxjuhVRHuMoLHl5c=; b=IDxYpUEGMTn5bz
	IvE3WXnmVRdLPc3DvrUETtnDWo9T3MCCg6XZe08GZ6y1QZosPROGp0HAyeeX24AdcRXqRu7zJxu23
	Rx7zZzclk7I2H6snob//k+J4+6fWkYSiVHY0p4M43wpkwW2qT0hLxUuic1oBxrgdK00fES30feKil
	hi8saL3jf1b+zdS9GFwu10nlB0jJX5XDNCU4GbReh0pflr5Icnz2qySAFFtMTLVfRnfKTgv/uJzBh
	aiO/hIy311HX/kKifBVwYO+lGSqWI1HaLRazfTbafCKAPOtSgLPGIrQrZS2G3eP5gSuKOfK5E9fOM
	gKRM9PTFJjfnJjFMIfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o96KS-00AnAs-E8; Wed, 06 Jul 2022 14:48:36 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o96KQ-00An8U-KB
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 14:48:35 +0000
Received: by mail-il1-f179.google.com with SMTP id u13so4996661iln.6
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 07:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wrq2JNxdSNjz+AtYT/VK5cdxeQSjmsW3VIzTuH5qvso=;
        b=FNysH4hkAMyTtgbQOfLdj8LX2ERxT00Ns9twJGm76yHqByb0d6g0h0Wno2XR1dllDc
         N9eOV0eYvcMhuQ0ns9Kutpu7dD0hO6U0W0qMDAeAAx7Yk2IT2wlqgZUw9O8U4rxM+No0
         s3tb1+NUdE5rsrCxQevmUYPL88JxWu7SzX8jp0TVOOAmBUZ2oJQnBaJt1AGRqBsH52JA
         oXKz1f6J62yyVtyYbaC33PaFP3AoWnjKY3/LAXUbvEJuhusUSbuTH42seBBEOMi8JWyE
         vuyOpF99AhnhTMdGd60dplTPdXg67NAimZ4MABiGs5QOEOfvxJrFyIGuxzOwQxRAeInK
         7hjQ==
X-Gm-Message-State: AJIora8QUm5y1r09j7+kIVziB8s7qW0153v/2xYyC0Xt2ggJoMXbG1HB
	A4U90RhhUo1BRs+NknLAvA==
X-Google-Smtp-Source: AGRyM1sb5HmhX0XgK9jcKFeRefRiVrF9p1b4SQg8YeeZGNu7klKkXRLtLFt3S05zijGKW8PJyzkj/Q==
X-Received: by 2002:a92:d946:0:b0:2d8:e271:79c2 with SMTP id l6-20020a92d946000000b002d8e27179c2mr24307561ilq.240.1657118911231;
        Wed, 06 Jul 2022 07:48:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a21-20020a027355000000b0033ebd47834fsm5173779jae.128.2022.07.06.07.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 07:48:30 -0700 (PDT)
Received: (nullmailer pid 21846 invoked by uid 1000);
	Wed, 06 Jul 2022 14:48:28 -0000
Date: Wed, 6 Jul 2022 08:48:28 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Conor Dooley <conor.dooley@microchip.com>, Serge Semin <fancer.lancer@gmail.com>, dmaengine@vger.kernel.org, David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@dabbelt.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Message-ID: <20220706144828.GA21787-robh@kernel.org>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705215213.1802496-5-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_074834_697870_354A4FA5 
X-CRM114-Status: GOOD (  11.35  )
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

On Tue, 05 Jul 2022 22:52:05 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 U-Boot port has been using the clocks defined in the
> devicetree to bring up the board's SRAM, but this violates the
> dt-schema. As such, move the clocks to a dedicated node with
> the same compatible string & document it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
