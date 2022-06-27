Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF281C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 23:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fU9glaZcOeHen24F694nmEzRaraep/uD8ZLyhw58aHc=; b=MzOUb24TVpRSMH
	kaDGrRP/kQxESRsaxBJHr72h7v0tF8c0VlUyvDFNmAtHcrV0DbMjd5+HbT1zENpPHmlC0Vw4TBVaT
	21rqpw3GfnhfJRbDX5NhQlNDQyzaUt5ovxgFGb4Io+0Q2zbIa1mle4q9AW8lBpC4ZGYYTmzZESFxN
	0VNgaXGChYdqdR1yZFDDGUlsFMsccO8ftMm+Vr7Lc1+af+lfKWqzis1TCun5WqNQOBzxAptk0nhep
	tDpH/TgmnjiUgP1x077B92DzEvaV5e7PLpEfuhxCnaySmvdDY05tj07SPkrPzJ1auDSmlHSt0SBmb
	sliSWh+j4q5nCdy180FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5y2O-003F7q-Nd; Mon, 27 Jun 2022 23:21:00 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5y2M-003F76-BV
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 23:20:59 +0000
Received: by mail-il1-f175.google.com with SMTP id i17so7032644ils.12
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 16:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ceugb8p4sPvAqdgfnrtKA+vm4NF5OVcyALYNjlDqlwc=;
        b=Ac8eGbgVf13wE0KOeOaU2rOO1hcbXfvhplkIKPPmQsJWWn8QIscJcT6xlA66WgqhcB
         4k1QDAUOxVQNbsVcoNPZupyDEZqgBLRS/yP388XOmqK1k4WMtbgxNPZ+686Xe66mTXF3
         Kpe51XJq0AYRUiCld6tuujJmuUbgMFt7h3K/n+lH4kcY9gpB6ZMObUCDxtko1JgP/TqK
         wjEr4WIL6y+zu6am/Y2t7dhcIVFL7c70jtyvblPLuS62Q+uIoc4/EDGE5SzZbOZ1W+UP
         XgXG3fMrEd4zD8cM9r5OXXHxcbL4vwU0NTgxFVyJWGoTUMWubbacQGn0GIWlQ90+FnQW
         cGLg==
X-Gm-Message-State: AJIora9ZXGHt1EvKaOSQjbfo4kHYxKNcjwXMWoOEbQifIsD6ITUCOFUj
	1KM/b5UXiR/Lc4VwG7Vadw==
X-Google-Smtp-Source: AGRyM1s2ztwoSBusasaBa/b2ACZCEycSaaxHL4lJfIIeTxh/zrx32YNfVPG2AlRLoX75ei2t68AjEQ==
X-Received: by 2002:a05:6e02:214e:b0:2d3:df8c:611 with SMTP id d14-20020a056e02214e00b002d3df8c0611mr8403927ilv.295.1656372057040;
        Mon, 27 Jun 2022 16:20:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y4-20020a056e02128400b002da7e147de7sm3137057ilq.17.2022.06.27.16.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 16:20:56 -0700 (PDT)
Received: (nullmailer pid 3155702 invoked by uid 1000);
	Mon, 27 Jun 2022 23:20:54 -0000
Date: Mon, 27 Jun 2022 17:20:54 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Jose Abreu <joabreu@synopsys.com>, devicetree@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org, 
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, dri-devel@lists.freedesktop.org, 
	Sam Ravnborg <sam@ravnborg.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Niklas Cassel <niklas.cassel@wdc.com>, Mark Brown <broonie@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Heng Sia <jee.heng.sia@intel.com>, 
	dmaengine@vger.kernel.org, linux-spi@vger.kernel.org, 
	David Airlie <airlied@linux.ie>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Dillon Min <dillon.minfei@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH 01/14] dt-bindings: display: convert ilitek,ili9341.txt
 to dt-schema
Message-ID: <20220627232054.GA3155668-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_162058_429939_62C3497E 
X-CRM114-Status: GOOD (  15.22  )
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

On Sat, 18 Jun 2022 13:30:23 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> A dt-schema binding for the Ilitek ili9341 was created as
> panel/ilitek,ili9341.yaml but the txt binding was ignored in the
> process. Move the remaining items in the txt binding to the yaml one &
> delete it.
> 
> The example in the txt binding has a spi-max-frequency which disagrees
> with the yaml replacement (and its own documentation) so change that to
> conform with the binding. There are no users in tree of the Adafruit
> yx240qv29 to check against.
> 
> Link: https://cdn-learn.adafruit.com/assets/assets/000/046/879/original/SPEC-YX240QV29-T_Rev.A__1_.pdf
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/display/ilitek,ili9341.txt       | 27 -----------
>  .../display/panel/ilitek,ili9341.yaml         | 48 +++++++++++++------
>  2 files changed, 34 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
