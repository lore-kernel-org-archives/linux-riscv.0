Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069A7CD4F5E
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KCB0gMSBm4aRyS/tBG1Nr2sNf/YlGXRuD0nvkDbNP3E=; b=eCnOJrr2jd/psZe9tRyx3/QP5A
	TF9UEOV5IzlTcmqXjviBzegZRAfBZFGeD/RgKwJXptF2s6djEec1ZB8dH6qZ6r4XTiqxSdMoawN7k
	bUl63jzVEDpm+JuF5zha3sEg+A3vCKNaHjP3E1Zz8KOW6hJvlCyBc/EWXRqk5Wcrb8qQYVZtm3mqy
	hOXxuADJ2N8cALSMbdoYMcmDzHCHRVSOKH2C+u/hm8j2qCfxJbWY5NAJa9OwU1ye6TTSD3gYWUfE5
	jmUP/WAiu7NrFw94s5U8M911ahu7e8Z+NyhKPvQpJy13pLwOSbcy7iR0CdJpTQP4iQ0mQGjLJKySd
	3DB+yPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjeCE-008wJq-2F;
	Fri, 22 Sep 2023 11:19:42 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjeCB-008wIw-02
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 11:19:40 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A118741DC0
	for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1695381576;
	bh=1mIxhTKnFz6jPIBGB85iZJtGzL+3q9xOGEF8ZcDvszY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=sncnI5hhujRbZJa87Wy2M5hnTaqSGgxdN2aMdCOX6Kxql0lojJxt/7OYHLDhITXoC
	 WwyPMTzQJZVdXHl+6ykml6ze/wZvhtddLvnDi5Bdi7Z9eCzPHv6fs8dEqj6f2GGojK
	 eJr1CUFD/hZ0U9YY5i/5N2tWnf7fScSO9R8N2q+e6uB7cQ8gHl8JHdPiNfkbu9Q+VV
	 Ypf9suBpN9R8+60qokxRygZpI7mi5nesCwKtAUHNkm8QfH247uUtGzsodY1NtBhm9K
	 GP3gVZS2fXv34eJDc32GrwH5COyoZVb8YMZPlDMdjV9vUqlLF0tJ8vfOGkYJVnEl8O
	 T68FqWXTUrpYQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4121ae638c2so20779761cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 04:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695381576; x=1695986376;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mIxhTKnFz6jPIBGB85iZJtGzL+3q9xOGEF8ZcDvszY=;
        b=dvDDRphWG8hIZXbydw+71PbpeZXD+KcqUlEUDWgRfp031WWpqWl0xPEsJ6eUF7O+sd
         d+2dgyocALCw4KsKhuh4zSpSU/PxUv5akKjxbvNUBSztgxgH5ImbSfqK43fBBjEXDPZK
         DNfopCVB+oCOxyLY9ZumTh962YaGqbcai4yv0L2X2fZ3QbBOWI+66MhsDC5Dx7x4zmkd
         QpZ5vKerzme5R4kTiSAFSqiBnLnV5q+LVWRyhiDkdHsTGnlRoJVo1orBHD2+0nZnKyvb
         2UIIQHTuMJc9hXCXAp6JjkRsDLPvI37MRlajwPn7xKNJvy9rg/mHg2BFfCLIABRoLRiK
         6fSA==
X-Gm-Message-State: AOJu0YwH7e8aNO/58Q74rR0ED7XTDi0SkNNE/8MFSr1O9zaYwRTJNqSD
	cWn4gI8ZNQjxgdwczg26zIDYtSiUMEXZQcRnJ9zCUiAO/6NAFy5nnvSiQ8hv9+ogFTuZUlNTYe0
	HFCXZYG2BM3RTCnuErh6+DEbWheiN240o0u/bseVjUKIjFOsri4AQxAc8D8JH6g==
X-Received: by 2002:a05:622a:1183:b0:417:98a1:3403 with SMTP id m3-20020a05622a118300b0041798a13403mr8762364qtk.25.1695381575617;
        Fri, 22 Sep 2023 04:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF84PCUxr/KMVWHCHR/zUqvpLVX2Rs9nI1gNGBy7jDTcV2nsokG0Xv14fhICpXsCH39rVxLqJq5o09Iq1BDIHM=
X-Received: by 2002:a05:622a:1183:b0:417:98a1:3403 with SMTP id
 m3-20020a05622a118300b0041798a13403mr8762342qtk.25.1695381575315; Fri, 22 Sep
 2023 04:19:35 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Sep 2023 04:19:34 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <0bd1742c-fa39-4f63-a594-6d325dc6b062@codethink.co.uk>
References: <20230915072558.118325-1-wangchen20@iscas.ac.cn>
 <803daa8f-f4bd-34b7-f826-89e1db5f24f6@linaro.org> <CAJM55Z-GMm5Hmk7-QWt8Prvp7qyFzOrQVjOjB7jfoX-oiT_C1A@mail.gmail.com>
 <862905cc-48c3-2dc9-6032-6ee189a629e6@linaro.org> <CAJM55Z8WDcjRER3ffnj+6V=QWEmudZyaO9z2iPUvreU1okq27A@mail.gmail.com>
 <0bd1742c-fa39-4f63-a594-6d325dc6b062@codethink.co.uk>
Mime-Version: 1.0
Date: Fri, 22 Sep 2023 04:19:34 -0700
Message-ID: <CAJM55Z_M47JA3U40whsRnW-nHN+yjyOo6eCUrGBK-=a1VvHuaQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] serial: 8250_dw: Add Sophgo SG2042 support
To: Ben Dooks <ben.dooks@codethink.co.uk>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wang Chen <unicornxw@gmail.com>, 
	linux-riscv@lists.infradead.org, conor@kernel.org, aou@eecs.berkeley.edu, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_041939_377369_07480DE0 
X-CRM114-Status: GOOD (  28.07  )
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

Ben Dooks wrote:
> On 15/09/2023 11:23, Emil Renner Berthing wrote:
> > Krzysztof Kozlowski wrote:
> >> On 15/09/2023 12:02, Emil Renner Berthing wrote:
> >>> Krzysztof Kozlowski wrote:
> >>>> On 15/09/2023 09:25, Wang Chen wrote:
> >>>>> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >>>>>
> >>>>> Add quirk to skip setting the input clock rate for the uarts on the
> >>>>> Sophgo SG2042 SoC similar to the StarFive JH7100.
> >>>>>
> >>>>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >>>>
> >>>> Missing SoB.
> >>>>
> >>>>> ---
> >>>>>   drivers/tty/serial/8250/8250_dw.c | 5 +++--
> >>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> >>>>> index f4cafca1a7da..6c344877a07f 100644
> >>>>> --- a/drivers/tty/serial/8250/8250_dw.c
> >>>>> +++ b/drivers/tty/serial/8250/8250_dw.c
> >>>>> @@ -770,7 +770,7 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
> >>>>>   	.quirks = DW_UART_QUIRK_IS_DMA_FC,
> >>>>>   };
> >>>>>
> >>>>> -static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
> >>>>> +static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
> >>>>
> >>>> Why? What is wrong with old name?
> >>>>
> >>>>>   	.usr_reg = DW_UART_USR,
> >>>>>   	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
> >>>>>   };
> >>>>> @@ -780,7 +780,8 @@ static const struct of_device_id dw8250_of_match[] = {
> >>>>>   	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
> >>>>>   	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
> >>>>>   	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
> >>>>> -	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
> >>>>> +	{ .compatible = "sophgo,sg2042-uart", .data = &dw8250_skip_set_rate_data },
> >>>>> +	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
> >>>>
> >>>> So devices are fully compatible? Then use compatibility and drop this
> >>>> patch entirely.
> >>>
> >>> I'm fine with this, but these are two different companies and SoCs that just
> >>> happens to have both implemented the Designware UART with an inflexible input
> >>> clock. So if fx. a real quirk is found on the JH7110 then we'd need to either
> >>> change the compatible on an unrelated SoC or change compatible on the JH7110 to
> >>
> >> Wait, why? The compatible is still there, so you just add here proper
> >> entry, if ever needed.
> >
> > Sorry, I messed up my example by writing JH7110 where I meant JH7100
> >
> >>> something like "starfive,jh7100-uart-with-quirk" and "starfive,jh7100-uart" will
> >>> forever be a quirky way to spell "dw8250 with inflexible input clock".
> >>> Is that how device trees are supposed to work?
> >>
> >> I don't get this part. But anyway if the blocks are really designed or
> >> done independently and there is no shared part, except the DWC block,
> >> then indeed the compatibility might be just a coincidence...
> >>
> >
> > It is. Sophgo and StarFive are not the same company. Sophgo are using RISC-V
> > cores from T-Head and StarFive are using cores from SiFive. They just happen to
> > both use the Designware UART in the same way.
>
> Out of interest, what's the issue with just providing an fixed clock in
> the device tree for these machines?

You mean adding a "fake" fixed clock to the device tree and specify that in the
uart nodes? That would break the clock dependency, so then you'd need to add
some other way to tell the clock framework not to shut down the real clock.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
