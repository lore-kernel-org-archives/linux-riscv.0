Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E4DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 19:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFtEjDz9oR5TQc5oxSsU7XniO5uYcBis2cREoZRba4I=; b=XJyBlHR48O+1uW
	3UTEjpwWjdii/Ci8WZUJhQYq042DWKr7Fsibjq+iJJ1teKzxUIjtUa6hfxTSMeIOvLW9fJlT5DMPi
	gD4VnAC5sG9NYuEBelxO0L8ZlI7UQtM4aXIbbYLI3UwBIUNtYXZlDpYb53PajwtceV7HwkkABcAx0
	nX4b/fySQ6rX5cdwUoFWVXx14kp9wNdjbehNokcGWar8Eaf1xZ2F8N2qzrnxuTXZD7xSzj0zQZ09A
	QSLc2RPX4GqlrkKb7FID74OvRt86QwnsGm5e3V+NzRGN4X/tenjka8Ay/nAIyL/zhlbi1jKK1AsjF
	oZOKmgtseJNwQZnoL2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrmlG-002BtR-3B; Mon, 29 Nov 2021 19:56:26 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrmlD-002Bsv-DB
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 19:56:24 +0000
Received: by mail-oi1-f171.google.com with SMTP id s139so36650174oie.13
 for <linux-riscv@lists.infradead.org>; Mon, 29 Nov 2021 11:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2bv3MqtAYFd6aKtve0kHQtlsznvcV7uI6PKWd3pGaDM=;
 b=E8UoaJ2VcaupBUD66RibjyulL/qv9OzN9m/LYOumYjAHJ2qDCnHgwZ7P4x39UILguE
 2xCdf2ztUsODdPnPte0LhPNyuZMyvYzbNMdhc0MjInPmoUhbv1puADj1qTE9M0C1Ipbe
 i1PITzYyc2mtdSrXISbLgmTudXo+jAubIbVAzKiemg8Ev41PJ/BhzNycO+LIaTfTcBaU
 MoJMOdraTxs0WFM+dPgJRM6f/O14uUIq6L7Zf6IvYKnGZGfM4JP8pCxOB30pSAIinjBg
 SrxCTcmiwIgAk6UZflTMOar7nydeNO50QDKgr413AA5QrqUEirCxNecZvubNHwsNw6rO
 7v9A==
X-Gm-Message-State: AOAM530YpheYMP41LuX0KD3XU5pFbvG1VKT5zK1SI/g0h2Y6Va8ewjlF
 eNikGiMIoyWD39aSL/bxwg==
X-Google-Smtp-Source: ABdhPJzZTkmKa7Ovd7T72fND6EsSsej/FmXr489BG/R05JxgA09sAstD4jrlNB2n0QXW7mdfgksy5g==
X-Received: by 2002:aca:4307:: with SMTP id q7mr156403oia.3.1638215780450;
 Mon, 29 Nov 2021 11:56:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w29sm2522578ooe.25.2021.11.29.11.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 11:56:19 -0800 (PST)
Received: (nullmailer pid 502661 invoked by uid 1000);
 Mon, 29 Nov 2021 19:56:18 -0000
Date: Mon, 29 Nov 2021 13:56:18 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 broonie@kernel.org, gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, atish.patra@wdc.com, ivan.griffin@microchip.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 geert@linux-m68k.org, bin.meng@windriver.com
Subject: Re: [PATCH 02/13] dt-bindings: interrupt-controller: add defines for
 mpfs-plic
Message-ID: <YaUwYkHHhTsPkAQh@robh.at.kernel.org>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108150554.4457-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_115623_471465_C4C73DB6 
X-CRM114-Status: GOOD (  11.42  )
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

On Mon, Nov 08, 2021 at 03:05:43PM +0000, conor.dooley@microchip.com wrote:
> From: Ivan Griffin <ivan.griffin@microchip.com>
> 
> Add device tree bindings for the Microchip Polarfire Soc interrupt
> controller
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
> ---
>  .../microchip,mpfs-plic.h                     | 199 ++++++++++++++++++
>  1 file changed, 199 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/microchip,mpfs-plic.h

Notice how there are not SoC interrupt defines in this directory. That's 
because we don't do defines for them. The 'rule' is only defines for 
made up numbers which are not in a reference manual.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
