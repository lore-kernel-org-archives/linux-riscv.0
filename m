Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE550C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 22:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5pfdijnic8fIDUcfIiOfu21alVNLQvFqYgP42zMQV0=; b=OMwYggGRctcHv+
	13eDqpuIgpYk/Wf3Acc9pppb5laDNRpY4TMPvDehCaRU8OGFxlGWkPHm1TB95EQ+hfBN9HOMl+pP0
	0TEZhQVB98vsMfviMxzCNzRY6lrM35N6QWekwJdnN8wU+EC57zZL8kDPjaZkRFZoT1pThf8BKJXa9
	dGFC3xXu4Vh7pTFUrn2NEg/Wr2JTqUZx0ttBgUKs0x3WYfM7lsqURr403Pvi/QCWKJsTf7WnAKLVr
	oZ12mEgqTqSPkwGhCgmvI5EVMulF+Cb8mZAX8nAIHTo0RUIqFLdeek1WTwrjYZcylAC7svzXzN596
	rj/31MtMrT+8PXhEMEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG7FO-005bGs-BQ; Fri, 04 Feb 2022 22:40:06 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG7FK-005bG0-W8
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 22:40:04 +0000
Received: by mail-oo1-f46.google.com with SMTP id
 q145-20020a4a3397000000b002e85c7234b1so6268566ooq.8
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 14:40:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4SpOqXKZyIeEOwKum6DXXuPPOySrNMUxlGQiydAANr0=;
 b=Ru59QIrAuQ15Jx0IcUPSqnrtfVCvo0qzF91q8f3b9St+7Ic9fiUSoc1R9SZxo/s22k
 VV69laRWLnO56Y4mTCMg32CoMVOxPqdFL0Ndg2MkraYb374L6nAqioVb2ind+RYr8pc9
 aLwzqZ+vZ0WNyxrx8ixC3NY05si4wEoYbHGMcE9xGC1n+6sdXBHDy0eFK07PhobHzVKh
 LFCy+fd+2ZknB1TRF81Zgm2EQzjAQw3pfOCcjrnth4FZ5MdOKf/qUwEDXFXUFiHHO5nY
 LuMc4F1DrpeMovpnZj75WxlGHqLoj+qbS7LwP3H1IdROsvxQqCZR0TkJneBlQpyIg6Tt
 69Ig==
X-Gm-Message-State: AOAM531ARmtlkdk76ylqGt+h5cWjeUSBES8cugIq8M21NZAMqjbJQ814
 E+O7bpG0o423iTuLHL7T4g==
X-Google-Smtp-Source: ABdhPJziJjQB0Qp80nJm3Y4Cy1qJ7dzDubZWuRGCVWikvMDlk1osf5kUVE4kGf/A/2TIRveTqnozng==
X-Received: by 2002:a05:6870:1111:: with SMTP id
 17mr311570oaf.171.1644014401893; 
 Fri, 04 Feb 2022 14:40:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p22sm1163371oae.33.2022.02.04.14.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:40:01 -0800 (PST)
Received: (nullmailer pid 3314444 invoked by uid 1000);
 Fri, 04 Feb 2022 22:39:59 -0000
Date: Fri, 4 Feb 2022 16:39:59 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Cc: alexandre.belloni@bootlin.com, brgl@bgdev.pl, devicetree@vger.kernel.org,
 daire.mcnamara@microchip.com, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 a.zummo@towertech.it, geert@linux-m68k.org, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, lee.jones@linaro.org, palmer@dabbelt.com,
 bin.meng@windriver.com, thierry.reding@gmail.com, ivan.griffin@microchip.com,
 linux-i2c@vger.kernel.org, atishp@rivosinc.com, heiko@sntech.de,
 linus.walleij@linaro.org, lewis.hanly@microchip.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH v5 01/12] dt-bindings: soc/microchip: update
 syscontroller compatibles
Message-ID: <Yf2rPx1NHunFOzBu@robh.at.kernel.org>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131114726.973690-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_144003_060828_556805B4 
X-CRM114-Status: GOOD (  10.98  )
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

On Mon, 31 Jan 2022 11:47:16 +0000, conor.dooley@microchip.com wrote:
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

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
