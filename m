Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A51EE6452
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yJqcqr7voEyE1e3q4qWAO/5dKahNSW4WmK0HRJh5KxI=; b=HVn2dpycEWSxdRAhpEnAn0Ry5n
	zgbwpa67DHQ9q0n32mnGkeB4SGy060s9q5x24oN/3UUtnqAHGtFiwRfgz/Swf6pTdf0qo1ExGUebH
	G21kk+Mvc5eB9T5dRkEES2Mr+IVL1XZ8ykegMMJ1DwRmt4eQ72wM7KB3wRIjE8aUJsym/v2o1bIf5
	4xM4NmiorLmgiVJrqKvHv9Xw+D4SMOKqYqz2YUc95JJ1L7GSNfg5uHlyqDFQkbC+EdAFvigQCSrSx
	GI5hPM9GVmgIN/SZo+dkROEMMfHyiVvx6S19kgOw/B3Ln9gQnNtpht69ERY7KbbEkzAibY3ns4GHX
	MqTHyAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5zE-00AOQz-14;
	Fri, 15 Sep 2023 10:23:44 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh5z9-00AOJZ-20
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 10:23:41 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CCD5E3F665
	for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694773417;
	bh=DVQzFwUpbsXuIGkXzoIV2yaJxsbZHyDDscyAWq7j40I=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=vbfWrkTsVXwxRtukXn0W/a6Fga69sSStSQflzKQYlgKnejRq7VKYr+H/dxFbTxppz
	 rXMw/jRgWmgJsJGTNirnbNpnt/z9OBKRQNREqpLbHI5d2vn15Y0EHl4Ac/B1hEaW1h
	 JZ2cb45s5ka7pPCqEH+vnPTxzQCwuVu24ccZyyLHvZS1Tc+bU+foXy4Y64KNEX5EtX
	 or3QMMNsl/xdQgqMTALb30WhewDWA+6vrolassZWme9QImlfmL2tWE+UFDyT3XnGbG
	 F9XTZ1GjNztz/odwzo5ONLtSXnAvFX7orNnPqPqExSN9NjuAuNNC9dKsRFDozh7YET
	 wRxLfUvhZlE1Q==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-414cac7beaaso20514271cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 03:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694773417; x=1695378217;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVQzFwUpbsXuIGkXzoIV2yaJxsbZHyDDscyAWq7j40I=;
        b=sXvaJF4HDwZxJdOTlMbMujTBPdJb4YSoeHzpV/MSmp6S6EC5YzQWp9G/JjR4UQnRx6
         +5FP8IF/KoUMnMm/xJzwt/Ouzm6UnPuJOBYuBTfzI2Mb96s9r9SmqkTtf8zA/TnaKP3H
         F47VWvnnTgzNklxAFPA7jRhJFyomjibKmvfBIZG3vNQOVVeP7AuXMAifeVL4H7ggBCgl
         mIPimkZcVVqIvHWkzhIRaIphvLevvDYSaUdH6mhZDE+Gsiz7y0vgQ0do09lRjPPdwsnu
         4M632zMmkDXUAKiyKAg/rxIjBTsZxco8B2mCGPjFuqkWght6DL4iqEoE+JmzGMX9crXM
         H+hQ==
X-Gm-Message-State: AOJu0Ywrvk5psxruqKstxT2Sh0aHGsj4bLWwVOyYRB2lV6Hg0l97MdAp
	qX4164brp0C8Q/X5/mVvzdGUJY0Fy7T7/0m3Ks/YT+x8Urvx5+Zk3Dno2TpCysh33ozKzgy8J+O
	LHwezn18Rfe5PLrJfvQsyqHpfklrlslj2iCkB0s2MjdQTe12J+Bs4IxoN5e+D7w==
X-Received: by 2002:a05:622a:1492:b0:403:e1d1:8b91 with SMTP id t18-20020a05622a149200b00403e1d18b91mr1304338qtx.60.1694773416768;
        Fri, 15 Sep 2023 03:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz6XoHpeoa1FTEaRyEIa8VosrmBlxM/6MYyeWBvLfPWnf7jhkHcp8hPE2RmqA1ElsiydQSlVI4+mzX7w4v7/U=
X-Received: by 2002:a05:622a:1492:b0:403:e1d1:8b91 with SMTP id
 t18-20020a05622a149200b00403e1d18b91mr1304322qtx.60.1694773416535; Fri, 15
 Sep 2023 03:23:36 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 Sep 2023 03:23:36 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <862905cc-48c3-2dc9-6032-6ee189a629e6@linaro.org>
References: <20230915072558.118325-1-wangchen20@iscas.ac.cn>
 <803daa8f-f4bd-34b7-f826-89e1db5f24f6@linaro.org> <CAJM55Z-GMm5Hmk7-QWt8Prvp7qyFzOrQVjOjB7jfoX-oiT_C1A@mail.gmail.com>
 <862905cc-48c3-2dc9-6032-6ee189a629e6@linaro.org>
Mime-Version: 1.0
Date: Fri, 15 Sep 2023 03:23:36 -0700
Message-ID: <CAJM55Z8WDcjRER3ffnj+6V=QWEmudZyaO9z2iPUvreU1okq27A@mail.gmail.com>
Subject: Re: [PATCH 10/12] serial: 8250_dw: Add Sophgo SG2042 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Wang Chen <unicornxw@gmail.com>, 
	linux-riscv@lists.infradead.org, conor@kernel.org, aou@eecs.berkeley.edu, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_032339_939127_FF0178D4 
X-CRM114-Status: GOOD (  23.43  )
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
> On 15/09/2023 12:02, Emil Renner Berthing wrote:
> > Krzysztof Kozlowski wrote:
> >> On 15/09/2023 09:25, Wang Chen wrote:
> >>> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >>>
> >>> Add quirk to skip setting the input clock rate for the uarts on the
> >>> Sophgo SG2042 SoC similar to the StarFive JH7100.
> >>>
> >>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >>
> >> Missing SoB.
> >>
> >>> ---
> >>>  drivers/tty/serial/8250/8250_dw.c | 5 +++--
> >>>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> >>> index f4cafca1a7da..6c344877a07f 100644
> >>> --- a/drivers/tty/serial/8250/8250_dw.c
> >>> +++ b/drivers/tty/serial/8250/8250_dw.c
> >>> @@ -770,7 +770,7 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
> >>>  	.quirks = DW_UART_QUIRK_IS_DMA_FC,
> >>>  };
> >>>
> >>> -static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
> >>> +static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
> >>
> >> Why? What is wrong with old name?
> >>
> >>>  	.usr_reg = DW_UART_USR,
> >>>  	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
> >>>  };
> >>> @@ -780,7 +780,8 @@ static const struct of_device_id dw8250_of_match[] = {
> >>>  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
> >>>  	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
> >>>  	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
> >>> -	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
> >>> +	{ .compatible = "sophgo,sg2042-uart", .data = &dw8250_skip_set_rate_data },
> >>> +	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
> >>
> >> So devices are fully compatible? Then use compatibility and drop this
> >> patch entirely.
> >
> > I'm fine with this, but these are two different companies and SoCs that just
> > happens to have both implemented the Designware UART with an inflexible input
> > clock. So if fx. a real quirk is found on the JH7110 then we'd need to either
> > change the compatible on an unrelated SoC or change compatible on the JH7110 to
>
> Wait, why? The compatible is still there, so you just add here proper
> entry, if ever needed.

Sorry, I messed up my example by writing JH7110 where I meant JH7100

> > something like "starfive,jh7100-uart-with-quirk" and "starfive,jh7100-uart" will
> > forever be a quirky way to spell "dw8250 with inflexible input clock".
> > Is that how device trees are supposed to work?
>
> I don't get this part. But anyway if the blocks are really designed or
> done independently and there is no shared part, except the DWC block,
> then indeed the compatibility might be just a coincidence...
>

It is. Sophgo and StarFive are not the same company. Sophgo are using RISC-V
cores from T-Head and StarFive are using cores from SiFive. They just happen to
both use the Designware UART in the same way.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
