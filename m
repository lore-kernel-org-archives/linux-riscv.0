Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAB8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8k/KAfo/7OwkNFIbOQnGdNuOyJ9VREXGnd/TC0W+Ip4=; b=qmzKZ55AmUPkQ8
	T/sb1HeFSGQLZ/bK76tALHylJN30axDvHbHlMyIbN3h+wDITIVXt4hzjb4cGUNz2NcYcNPOzafos3
	n04eSlNJNmCA/R1IcIZl19i+RvlpfHay7U+BRiYfxnQLLKrROpzo9vUkjEmLoVZpPkIxLKk9vGU9z
	JdvmkErV+TT6pFF+tb2TP8WIMIfcDnSc36bQMeAzSApx0DUYN6w65A3Bwn9qMhJQbZ9wM5aajxeST
	OF1s2UIR+H+QU5YFkbfszJCIc9O/0bhy06m1jtOxqc0AeTKns56L7XnpB1+yVn4OvhXBNbZmgC8Ma
	8QU6vCubLwqlEqmY9YbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myE7n-00AbjO-KI; Fri, 17 Dec 2021 14:22:19 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myE6v-00AbMZ-QE
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 14:21:27 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 e17-20020a4a8291000000b002c5ee0645e7so751945oog.2
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 06:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=wkAFS0gqpntm7Rar5jEd8yMr1SM1y7rL2Y3F6yNnnb4=;
 b=Lt2tNakJWzg/ugyMEIAeTZl6voU0ETe6HNf6xukv9wUIKxamBfxGVvBxjFp8aNlRpu
 nZQCCBgOakKxWw7n9DTPZuxzIM5vAzg0GSkDtNaihrphHutLRYnuejA9mRbRd6Bio6sL
 SiSRKfGfQJ0k3JO26OR1U/uuvwq+MltAtnFH9dcprW5YGgOGF4gM2RXl3/EejFN33+UV
 6OXs2pmixnLqd67Iev0Ibex9FxdlzYAHDPqlkGO3dyhDHKNbSozUZSjoVuYgp9rPFmYs
 /sgb03IjeUmyaY0q7YxI5X9O+7a2ppXRxO68XXARwYVDlfS5sHxz9R9O3pPRZfIuQIJ1
 pPow==
X-Gm-Message-State: AOAM530+WUAHdU6N0lY2Um5fC/AuWhlEccEvjGN0A75M5K9EFAUAjXJr
 E/IS/IATFO7UJSGIIyYTQSjg3+CbCQ==
X-Google-Smtp-Source: ABdhPJwfsjVeZSJcEumwC7rI8OiKwXwCweJpgTsSim/Ubs2nJHyVI3S60NqCJLQl/ivrLxwO2ySB9A==
X-Received: by 2002:a4a:cf12:: with SMTP id l18mr2047389oos.25.1639750884738; 
 Fri, 17 Dec 2021 06:21:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q2sm1672622otg.64.2021.12.17.06.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 06:21:24 -0800 (PST)
Received: (nullmailer pid 2814878 invoked by uid 1000);
 Fri, 17 Dec 2021 14:21:22 -0000
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: jassisinghbrar@gmail.com, alexandre.belloni@bootlin.com,
 atish.patra@wdc.com, linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 lee.jones@linaro.org, linux-i2c@vger.kernel.org, ivan.griffin@microchip.com,
 devicetree@vger.kernel.org, daire.mcnamara@microchip.com, palmer@dabbelt.com,
 robh+dt@kernel.org, bgolaszewski@baylibre.com, heiko@sntech.de,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 thierry.reding@gmail.com, linux-gpio@vger.kernel.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linus.walleij@linaro.org, aou@eecs.berkeley.edu, linux-usb@vger.kernel.org,
 bin.meng@windriver.com, geert@linux-m68k.org,
 krzysztof.kozlowski@canonical.com, lewis.hanly@microchip.com,
 paul.walmsley@sifive.com, u.kleine-koenig@pengutronix.de,
 gregkh@linuxfoundation.org, linux-riscv@lists.infradead.org
In-Reply-To: <20211217093325.30612-3-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-3-conor.dooley@microchip.com>
Subject: Re: [PATCH v2 02/17] dt-bindings: soc/microchip: update syscontroller
 compatibles
Date: Fri, 17 Dec 2021 08:21:22 -0600
Message-Id: <1639750882.632899.2814877.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_062125_892440_153D220D 
X-CRM114-Status: GOOD (  12.42  )
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

On Fri, 17 Dec 2021 09:33:10 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree.
> 
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

See https://patchwork.ozlabs.org/patch/1569804

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
