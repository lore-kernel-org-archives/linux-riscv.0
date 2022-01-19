Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC5CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 03:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbKoyt8rATRvnDCh6DIWKGbh01GeDRVUSKWWvUzvJJ0=; b=Rz0oTtwczBnhXq
	8qGeq9SIZAvFeKCMnMGdQ7SSj0IhbSKOP+/gZ7ZdG87DxlHlI4hwLXKz5DstQlY0ENhCWXp7VOGwd
	s/s/n/HpVWdQUHEmuEeGPOj+U5kxlxGgXONrxirx39Yop5jvwnDx+kCym94cq9Reqkkicfw2S+lKp
	owPDw4sWJ7fC4U5/sFUJkTUqIsWhZCwfJRa9xNDnaHAfwxgd9AfBvXnbqzO29T4/3E9rc7gZWKP2J
	+YgRH+9EFVDSoyWFLOJUluY15dWU14tDelNfCr76vIVWlFS67VkYPEHNkZFgKYTpA/maBuIiEE9qw
	RX11ZUsntOPFWWPoHNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA1R0-003fHJ-Ss; Wed, 19 Jan 2022 03:14:54 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA1Qx-003fGr-Rp
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 03:14:53 +0000
Received: by mail-oi1-f173.google.com with SMTP id e81so2044728oia.6
 for <linux-riscv@lists.infradead.org>; Tue, 18 Jan 2022 19:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kn1Mk3z9xSx65+thbR2SSoC2E940smP9FzIPCUFVCdk=;
 b=JB8oAr5ijSvHR2dq3ro4t5aNarGNHjIhBKN41e8ISt2CzgmCOMEeen6dKTS8IpeDE/
 3fKxjVB5+KAFDKe+1v6Pc3vDnb1v447/HUtFj+S9anVrDKPK38ncIkJbo7cxkWU990y5
 wicLonjUe6/ckzv0rvAXBS8s+aXQslbobw1AGqGrRXTSkIFeLMQuYDtajSxq8SFAHDCg
 vHGS7LxwQLV6Top7+6bzjVePCceuit51qACXaSQYBAOHvzNadvrNh9ZP71+yHVbakJI4
 TkMtN0w7gUMniybl8LD+LgLBuMxZK51wvnB8Ll87hWV6yawHGc6x8howXlhSsxzW1DEg
 0VTQ==
X-Gm-Message-State: AOAM532q97bQko8x17vyavieQZXbkkdWM/HmEqSomkNJely80UNHij1Y
 5rAiBrE8ctLfUWVbMVj97g==
X-Google-Smtp-Source: ABdhPJxU8xP3n7IbrfWS45xsMVH1tELwDYNmgo5+MUYtSBPkdpT750qno1pazIxCRTmuNbzkPgYBQA==
X-Received: by 2002:aca:2b04:: with SMTP id i4mr1288407oik.69.1642562091272;
 Tue, 18 Jan 2022 19:14:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v12sm6067213otk.43.2022.01.18.19.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 19:14:50 -0800 (PST)
Received: (nullmailer pid 2571074 invoked by uid 1000);
 Wed, 19 Jan 2022 03:14:49 -0000
Date: Tue, 18 Jan 2022 21:14:49 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-crypto@vger.kernel.org, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, bin.meng@windriver.com, lee.jones@linaro.org,
 ivan.griffin@microchip.com, robh+dt@kernel.org, paul.walmsley@sifive.com,
 atishp@rivosinc.com, a.zummo@towertech.it, linux-rtc@vger.kernel.org,
 aou@eecs.berkeley.edu, jassisinghbrar@gmail.com, devicetree@vger.kernel.org,
 thierry.reding@gmail.com, lewis.hanly@microchip.com, geert@linux-m68k.org,
 linux-i2c@vger.kernel.org, broonie@kernel.org, alexandre.belloni@bootlin.com,
 heiko@sntech.de, daire.mcnamara@microchip.com, palmer@dabbelt.com,
 bgolaszewski@baylibre.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-spi@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH v4 08/14] dt-bindings: pwm: add microchip corepwm binding
Message-ID: <YeeCKQrdMmhmR0bg@robh.at.kernel.org>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-9-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117110755.3433142-9-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_191451_921513_C0052030 
X-CRM114-Status: UNSURE (   9.17  )
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

On Mon, 17 Jan 2022 11:07:49 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
