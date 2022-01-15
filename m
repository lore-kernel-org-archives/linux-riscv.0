Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D09C35268
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jan 2022 17:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZeplRUjxmChpYM+MOufhAURphhVj/EsM1vuERawEQw=; b=KtczwgUcMMnOGG
	VwFalY2hg2OkRYn4AGeNyTM+WelJSD13im8WXD+aeI39tKX0/V49FFXemawgejboZ5CuvEM9GRvaC
	DMLxIai5Ypn/tRgeSD9MKMN8l9Ah2QDdQhpZ6OMidvsypYrsEgTfnU0ETihEX03abbAQZTr4e5Mns
	fwGVRCspXzQmHO+WMIrfW372k9bZ+aez7+tga6U27M0wIRGt2auNe5IKyfeyGxYa9CDDYRvoEhEue
	uEkHDibv3DFPqX8pZ5RMLH/En1ywvlvKuBXjpP1+JYaI10XI5HL0b9NH/y42cerPAsZsMsLFv0BDH
	t1C10iFnXIieZFRftELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8mlE-00BOmv-5e; Sat, 15 Jan 2022 17:22:40 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8mlB-00BOlY-52
 for linux-riscv@lists.infradead.org; Sat, 15 Jan 2022 17:22:38 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 i7-20020a9d68c7000000b0059396529af8so7452445oto.4
 for <linux-riscv@lists.infradead.org>; Sat, 15 Jan 2022 09:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=QdKoM92XcOD+ied4LW2xvMvWizSFp19kwNEISaRgwYc=;
 b=lBQ2GbX1UtsQ2b/1dycUX+L9szUWQWvkPvKK288OmvxTIGQKXNKmA0cyV3scw6iDZM
 MdIHobvByrHUHJj/fmwjgIS4zTWUoJm5eMEkrQuUjRwbH+PPlFjnXK5aPH6/VdmHSzk4
 zVnBSGxPeAC1zn+FJJaR3MW0eH+5Qy/hzpIUcRwxoqRIQkPm2lSnnc1oWL+416V+3FmX
 EG0lk+hLZyrpnYq7Fz09UBGDEUUAJvjPZ6xjzSnWx/YEdqwfkg0KvuagbwZbpzRQ+MZw
 ROhl1sBCbaxLe6lSABVJv2BeqD59EdnJRItYuu6LlBztctd2fUJxl20YPsL6BWRtY0T4
 pOXg==
X-Gm-Message-State: AOAM533PEY9UHBodpj5mnWPYskQp0+JEUuvnq2M3TS64S0/Q1GPGDjnz
 5nUc1tSrvggQDt20cO7iZw==
X-Google-Smtp-Source: ABdhPJxckVmhHzYLxvrbRLfL2JZUy0scMzSr8ccJ+pUoumgkQ08Xp/dABKP9617iJawKNBRs9pQ3hg==
X-Received: by 2002:a05:6830:2a0a:: with SMTP id
 y10mr10609256otu.248.1642267353083; 
 Sat, 15 Jan 2022 09:22:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v18sm2766862otp.42.2022.01.15.09.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 09:22:32 -0800 (PST)
Received: (nullmailer pid 119879 invoked by uid 1000);
 Sat, 15 Jan 2022 17:22:30 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: robh+dt@kernel.org, bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
 linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, paul.walmsley@sifive.com,
 linux-usb@vger.kernel.org, lewis.hanly@microchip.com, lee.jones@linaro.org,
 aou@eecs.berkeley.edu, daire.mcnamara@microchip.com, thierry.reding@gmail.com,
 linux-riscv@lists.infradead.org, broonie@kernel.org, linux-pwm@vger.kernel.org,
 a.zummo@towertech.it, heiko@sntech.de, u.kleine-koenig@pengutronix.de,
 atishp@rivosinc.com, linux-spi@vger.kernel.org, alexandre.belloni@bootlin.com,
 bin.meng@windriver.com, devicetree@vger.kernel.org, geert@linux-m68k.org,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, gregkh@linuxfoundation.org,
 linux-rtc@vger.kernel.org, ivan.griffin@microchip.com,
 linux-crypto@vger.kernel.org
In-Reply-To: <20220114151727.2319915-2-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-2-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: soc/microchip: update syscontroller
 compatibles
Date: Sat, 15 Jan 2022 11:22:30 -0600
Message-Id: <1642267350.889231.119878.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_092237_215380_54C50D68 
X-CRM114-Status: GOOD (  12.79  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 14 Jan 2022 15:17:13 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  ...larfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} | 6 +++---
>  ...s-controller.yaml => microchip,mpfs-sys-controller.yaml} | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
>  rename Documentation/devicetree/bindings/soc/microchip/{microchip,polarfire-soc-sys-controller.yaml => microchip,mpfs-sys-controller.yaml} (75%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.example.dt.yaml:0:0: /example-0/soc/mailbox@37020000: failed to match any schema with compatible: ['mpfs-mailbox']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1580091

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
