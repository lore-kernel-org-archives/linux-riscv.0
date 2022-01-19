Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8082C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 03:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZp2WJVlu/LZqOkwY7eODIHNDgYq62/tB/+sxdDtM6w=; b=huk6LLJ8l5tTXG
	+CONCbybg8m2UX434nh8iUHiUFheZ/qnz/mFcytXgOGXHs6puwQzGYakNkiDJalP7VUcTORAUGkte
	SeHQGD/8rd5ds8ECM4UcHSeXm+L3qENAIpXtqRXsKi3GKnWfkm1u4CyjHhNzAFbcZf+7F4WDLOCto
	fsOIudoLVX2uqQ7S+4VN3eGwg0Y0W/k0ZDBfCDnP8gjWOe5isMvYv4HYBxuEIfpuJzk45MPkue+IG
	rxFruRkTkWaNjnP+aPEaWEBNSleT6Qsc04cOzz/GW/TX+sKz6Ey6Y1u5akBOnMCWKzwPhdYQFcOh3
	jbwoIhsez/2/yMuiZ2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA1Ms-003eYH-Fg; Wed, 19 Jan 2022 03:10:38 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA1Mp-003eXs-MQ
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 03:10:36 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 l64-20020a9d1b46000000b005983a0a8aaaso1255895otl.3
 for <linux-riscv@lists.infradead.org>; Tue, 18 Jan 2022 19:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MS2fURrf1nnAP7sSkdeRoaX+N07h6MHgI/yoTSDi19c=;
 b=jF9O2x9IZaUwOHBavyza15sIpwLyppwSlLFFCon/XGyXmuGg0sftBjpmh9b4xS6T16
 f+lNr3f5yRQDonfl9j5uH4tf2QUcfYc1dBk2gXBvtDI6F7zYXewPoRwLqWwMRznbTpjt
 9Iewk6xMyr/HWw8jx5i/fVWWv+EHor4Z9yh6Pf0bpEbMLMY62Z9GpdZXBV4bSSKRe9k7
 kilec9g0d90buJnrEdZ9cF38vNdzoTZ7duXM3NtHBu1cFE8h45bBcGTOitiD5kXARPoZ
 iaHn3BwmuuMDg0vP/A3eNo4Z2wiT5P2S19xKd8Ei8oSNW51pBdS2sc+CKbF7RpjWSBzg
 ptGQ==
X-Gm-Message-State: AOAM532T8fB9O+hL7l4SN2eKN2i8XiTUXteh7XaMwslbdXbhEbXg+/hz
 1qTwZpU1rUiieV76ZdMYUQ==
X-Google-Smtp-Source: ABdhPJyZL7Pc5y5Wxqi8b6iBReEOkkhPbvIJQQDOpLQ7RrJ4fK7SIMgpc6ViWZt+LZWYVq80y2yjhA==
X-Received: by 2002:a9d:3f1:: with SMTP id f104mr652207otf.28.1642561834561;
 Tue, 18 Jan 2022 19:10:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id be4sm5860001oib.56.2022.01.18.19.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 19:10:33 -0800 (PST)
Received: (nullmailer pid 2563196 invoked by uid 1000);
 Wed, 19 Jan 2022 03:10:32 -0000
Date: Tue, 18 Jan 2022 21:10:32 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: palmer@dabbelt.com, u.kleine-koenig@pengutronix.de, aou@eecs.berkeley.edu,
 broonie@kernel.org, jassisinghbrar@gmail.com, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, robh+dt@kernel.org, atishp@rivosinc.com,
 bgolaszewski@baylibre.com, lewis.hanly@microchip.com,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org, ivan.griffin@microchip.com,
 bin.meng@windriver.com, alexandre.belloni@bootlin.com, a.zummo@towertech.it,
 linux-crypto@vger.kernel.org, thierry.reding@gmail.com,
 linux-usb@vger.kernel.org, daire.mcnamara@microchip.com,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, heiko@sntech.de,
 gregkh@linuxfoundation.org, linux-rtc@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, lee.jones@linaro.org
Subject: Re: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Message-ID: <YeeBKAHgEcHTAfQY@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-4-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_191035_761623_E3085C74 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

On Mon, 17 Jan 2022 11:07:44 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
