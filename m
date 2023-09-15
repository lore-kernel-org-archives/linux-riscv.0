Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB439EE644C
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JpHNa6Qxp7xss2ybQVMqyToM/bgBVzVWUtEZ/oTpnwM=; b=q7W1QIukseONg+G+ROTJkvWyZ2
	vnphjNVKfIZYrOj6Js09y4sNFxgXVIdZ4YdJgJd3/NLdgm0WSjenPSPmTkS3SiuAUnDUImdbLlJVl
	PDnXMVN+J438ap+mmmmW21UQloKnZOIeZEAVU364fSwefP+Vt57ZuIfCZxmEy90NeyxcJPOQ0YAdE
	eUPhGkylfV3eLJSYqRzFmO2668Tpovlj7rO6alTdqpQ/aR6gqktjhuosOO45gp+HFa6oCksD7n4rn
	VHu60yPvHegMvlw1JFwVG6vIv5nVC/bvhEGaO6SYUNyV7/41JBARNbJY3+YtUaX8ooFBLCziZ5GEu
	Cu97HuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5f8-00ALxS-0N;
	Fri, 15 Sep 2023 10:02:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5f4-00ALw8-10
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 10:02:56 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D122D3F67A
	for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694772168;
	bh=QkyFp7kf2CVO2Ub+8zdfAbl+jurBUvZ+r3KzB+EtSOE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Cl633bW+qJNcebsrcec5ajCpi/p/4uooYtmUqZHFdVJuY1li6JWm2W68Het3EM1E4
	 UBGpdfieeKjRhykQNDs8UxLtaX7iRm6cVHJ6PsU/z2UKhzUi7MVeX1oP/IUBIL3g3q
	 1S0DfTnSn78XaO4LrmxnFP1wAzPpxL68mlNPXJe2Aj9VmqJim6IeryxfW2z9rS+/bG
	 h8KI2jJ/NKgNAjlzs5sK4GVm+2wxkmougECfwH+FJVwHmenG9iHslENzA1VkS2tbc8
	 x66Q0Xj4zyw4LMpVY32E8dyAdoR+2qz1l6CQ9BhGcdfO2F6yNmJ5OjFlnAkH1sqbjH
	 rUh9ejCIqiJQA==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41360d145b1so22139941cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 03:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694772166; x=1695376966;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkyFp7kf2CVO2Ub+8zdfAbl+jurBUvZ+r3KzB+EtSOE=;
        b=sAJNhtyjGUPspUK0ZSsGomqVIg2eiTXJAjoD1kdfO9uYNBvakajHRLx0eo7ZwEEeL+
         yZJ5WMWVnDfj8iT6Bjx77MtrfchtSVF2e+KeJCEFj+Q4ReqnmefnJRLoGQDpjR4MfVS7
         8yVjb6y6QrYXJ/nQQny0YmW3Y/zZEWzUQPNMbDaLRTMLFS/FWJlsYMhrZhGz8qibC/Sd
         HRfjOYlCWodLAEY1DtGqavRUsTIg4FHmUMTpQyBGWNPFdFwBFF0NZEGbsiEaHvFR9D8A
         IhWn/MSyNAHPFdlSEUzlV7yHbLJSX0WgdK0v3Bj+SY9ES27ilOTCvL/VOIiCmUftb1r8
         ki+g==
X-Gm-Message-State: AOJu0Yzf/3owIxPBF8MvShLNOeYWTwyhXv2MHXJ13Po/dG6yzMcOBwei
	mzHLD6O8auBa70oNiYFIefak2RYcw7Abs3M/bCot4XeM+/zlDsG7heclxeWdQzUMogfvOvsTRaJ
	GadiW0KuRdu+lkO7HqZKSY3OMPhLXZivITZ+RJ/4zW0v0TyT8az3MX0fs8Qa/ww==
X-Received: by 2002:a05:622a:50f:b0:413:3384:d43f with SMTP id l15-20020a05622a050f00b004133384d43fmr1205913qtx.11.1694772166711;
        Fri, 15 Sep 2023 03:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcuEVbIaKxRfintolzQeQEqh1KYU8VcadUoiPE32/xiQVSV3jCFDSTK9K4fjz4v/l2KVtOBfxlhc7L+2IchGU=
X-Received: by 2002:a05:622a:50f:b0:413:3384:d43f with SMTP id
 l15-20020a05622a050f00b004133384d43fmr1205890qtx.11.1694772166482; Fri, 15
 Sep 2023 03:02:46 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 Sep 2023 03:02:46 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <803daa8f-f4bd-34b7-f826-89e1db5f24f6@linaro.org>
References: <20230915072558.118325-1-wangchen20@iscas.ac.cn> <803daa8f-f4bd-34b7-f826-89e1db5f24f6@linaro.org>
Mime-Version: 1.0
Date: Fri, 15 Sep 2023 03:02:45 -0700
Message-ID: <CAJM55Z-GMm5Hmk7-QWt8Prvp7qyFzOrQVjOjB7jfoX-oiT_C1A@mail.gmail.com>
Subject: Re: [PATCH 10/12] serial: 8250_dw: Add Sophgo SG2042 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wang Chen <unicornxw@gmail.com>, 
	linux-riscv@lists.infradead.org, conor@kernel.org, aou@eecs.berkeley.edu, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_030254_771666_1D916F60 
X-CRM114-Status: GOOD (  20.14  )
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

Krzysztof Kozlowski wrote:
> On 15/09/2023 09:25, Wang Chen wrote:
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >
> > Add quirk to skip setting the input clock rate for the uarts on the
> > Sophgo SG2042 SoC similar to the StarFive JH7100.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> Missing SoB.
>
> > ---
> >  drivers/tty/serial/8250/8250_dw.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> > index f4cafca1a7da..6c344877a07f 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -770,7 +770,7 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
> >  	.quirks = DW_UART_QUIRK_IS_DMA_FC,
> >  };
> >
> > -static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
> > +static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
>
> Why? What is wrong with old name?
>
> >  	.usr_reg = DW_UART_USR,
> >  	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
> >  };
> > @@ -780,7 +780,8 @@ static const struct of_device_id dw8250_of_match[] = {
> >  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
> >  	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
> >  	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
> > -	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
> > +	{ .compatible = "sophgo,sg2042-uart", .data = &dw8250_skip_set_rate_data },
> > +	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
>
> So devices are fully compatible? Then use compatibility and drop this
> patch entirely.

I'm fine with this, but these are two different companies and SoCs that just
happens to have both implemented the Designware UART with an inflexible input
clock. So if fx. a real quirk is found on the JH7110 then we'd need to either
change the compatible on an unrelated SoC or change compatible on the JH7110 to
something like "starfive,jh7100-uart-with-quirk" and "starfive,jh7100-uart" will
forever be a quirky way to spell "dw8250 with inflexible input clock".
Is that how device trees are supposed to work?

/Emil
>
> Best regards,
> Krzysztof
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
