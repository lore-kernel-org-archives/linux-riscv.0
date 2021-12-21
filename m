Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF31BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkM22wVIDuRDMyrvFkPP8Xv9brnZn3LxNKx+cs7upII=; b=yVOGOaYnyr7Zgb
	wMvXXL5l+j/huQn5aZhLvzRXzoyGKyy2mm7lXr5sQUjd5CVTa3nnefpwz5wGl+NCCKsOUTLhxzzEE
	b65156nLYyWxdLA9oXXumb/KnE2V2DT+eS1sQVvwGPmHUtnqWkGTDaSUCt0Dd5P/RbIh1WIIPubmi
	RybVvdB8P0O1u51/a4tcHRg3UIwpvvxe5HG32ZH1JDheelEr0qc0qpzmMlTfBurcOxd07fG2IZazy
	7j/XZCse6PjyMfZ/oLshYaQpNrzqQUBeZG/5Eux3s9asvnTMEr/b3zk7TcgwORJF3TTT7XWqx3C+S
	3RLmHkDSLMVDn20CcKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzjEW-007vCa-4H; Tue, 21 Dec 2021 17:47:28 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjER-007vAL-Vg
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 17:47:26 +0000
Received: by mail-qk1-f172.google.com with SMTP id 69so791626qkd.6
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 09:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=enBZKRe45Eq3IaJ4YleNfTEAHY3TWjrKA5JUyvv9lv8=;
 b=tzOJbZRklZY8crrWOVwbp8NhTojHf6gmph/2Ca2vZvodjm4/62pS5ngg7tn9Ku/tco
 BES4foxAIic4s1wZQefXerzabhnlUojUSNdnvD2pV1s7/YxoQCc9AffQgIu0/+MJiODV
 OM6Ei4hf60Elx6YD9ywV9fsyupEsbwyG1meYsvafIJAAZ1kHirTIi3JWZWtv+ZUGoUp0
 jrkmKUrvwIDqWiODK4/aY3q7zovrquylHjn3oIo26C8lHtBaa3eq/EPLLdutjM9+T8gr
 QyW7T1S27a3bEhgyHjOSMqLq40nDfvWs0zUOgSldzIhAcgovubTsyhF2tkZCc0ylMOFJ
 pl/g==
X-Gm-Message-State: AOAM531sX3LyHp++cKtVrq9oqR8Eg9K+w4IiJzlAZvApzA9snl8s7LAC
 /YJOG+HdbZTTL2KLUvh5sQ==
X-Google-Smtp-Source: ABdhPJz3OOPp5uAFgP2bRqUduxgScmvXC/dj9htul/5dPYzu+6NqrrafVrSjfakiGVyL6R3b5cnMvw==
X-Received: by 2002:a05:620a:1496:: with SMTP id
 w22mr206198qkj.463.1640108841543; 
 Tue, 21 Dec 2021 09:47:21 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id ay42sm13916078qkb.40.2021.12.21.09.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 09:47:20 -0800 (PST)
Received: (nullmailer pid 1484960 invoked by uid 1000);
 Tue, 21 Dec 2021 17:47:16 -0000
Date: Tue, 21 Dec 2021 13:47:16 -0400
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 atish.patra@wdc.com, linux-crypto@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org, heiko@sntech.de, geert@linux-m68k.org,
 lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 u.kleine-koenig@pengutronix.de, linux-rtc@vger.kernel.org,
 linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
 krzysztof.kozlowski@canonical.com, palmer@dabbelt.com,
 bgolaszewski@baylibre.com, ivan.griffin@microchip.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
 linux-i2c@vger.kernel.org, thierry.reding@gmail.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, bin.meng@windriver.com
Subject: Re: [PATCH v2 01/17] dt-bindings: interrupt-controller: create a
 header for RISC-V interrupts
Message-ID: <YcITJFfZ/U56MxBv@robh.at.kernel.org>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217093325.30612-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_094724_050979_D237E2D0 
X-CRM114-Status: UNSURE (   9.66  )
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

On Fri, 17 Dec 2021 09:33:09 +0000, conor.dooley@microchip.com wrote:
> From: Ivan Griffin <ivan.griffin@microchip.com>
> 
> Provide named identifiers for device tree for RISC-V interrupts.
> 
> Licensed under GPL and MIT, as this file may be useful to any OS that
> uses device tree.
> 
> Signed-off-by: Ivan Griffin <ivan.griffin@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../interrupt-controller/riscv-hart.h         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/riscv-hart.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
