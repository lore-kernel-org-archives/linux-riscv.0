Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D34C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 12:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrefHzQf6xXxX6pXBqrVn5yksVmoFWvIYStVqjHXtZM=; b=hJApLSBf3IIj9L
	7P951ApxIuk1BnljtCNNNXwEM0ut471KRBo4BLgZoVdOQckZD1eLFR/uE4ac7LADuXNSgQkawkMY+
	X/S1JSZOIS69nzSmASHBHGMbIUp9gV9DeHVUmsjfr2JXbQAImEsqdMnCJwIZe+JUmrDf38m+v8jtc
	qFT5fu7FZE2+dJmpKHHXUXozNNu9dcYTqo6RHUfj4YDCAl8mbxNXpooDy1ugS/Ztu+AcvX+h3X05k
	ZDBmtRNzH3gOP6hMtnHkU5iEj/ugH2n/nkQa5Q2C0bzf58d5FO6zt5Kozz0bgYWRAKJ0KhIETsDg9
	UUHCW0ymnzF4Q+Ed3jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1nOh-00DOb6-0T;
	Wed, 24 May 2023 12:15:19 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1nOd-00DOZk-1J;
	Wed, 24 May 2023 12:15:16 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-510eb3dbaaeso1816866a12.1;
        Wed, 24 May 2023 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684930513; x=1687522513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sUEzEX3IxY8Nj/uA0tEcwms+OAaTSJtcQdltzfG1TQM=;
        b=X/G1NRsS65NS3/nroiKeHVMFrgfmO06b1WCf9NBEt/zESPE47jw43hqRGOAShFpJE1
         m3xTu1TjLQMjTgoqDmVUZDyyzU+a73NtinuXY5ckIzQysyIOpXo1M0SM0qStrdIeekUi
         R3/tDDkULOtYtQ3A+VMR4+u88WPvDgZlz4jmSvCrI6Rw6mVnE8R5UT+HiB0mvhHS943V
         CznrLkLGsxNCrfXDWJUd4jL+UP2LUKr3KtZm3nuiTtkGOvoh+OVqIikKR3QINUszw30m
         YV1e62+euP4Zvn4f7sRunatEnf80HQsWQYwxtUvjyelOFbKOSyWcQ9aHnRUcTDX1apva
         RRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684930513; x=1687522513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUEzEX3IxY8Nj/uA0tEcwms+OAaTSJtcQdltzfG1TQM=;
        b=YYaP9M0ZsptXqfccq6HHCjV1ivgf5cbFoy2dilWoM4XIjZAuMwoz30ZcA8Lv9I/qa5
         f22QpoXhI3shgffIfqpPkZ/bOymvk+D9cQ+2ogweE6IN32T79Gt2NJITixE6xoeVTjIp
         vYuldYesTfUEjnLnlJ/9rtqZO68sD6PPgAPU3j/XkuqPjDkiyuJGkoz8dKRVo8mDUuEd
         8TcsGxF/dqVWGfPw1dqSu7i6453WXj1A2jOruQI2uvGd7FLZopMsbFfTJsIpm08bC4VV
         wKqkHLrn60T6D0uEGSDP0VanARDuj83z7TT8VKUAt9WLUPEam6SnE2bSLLxD6rVYPj+W
         cJ+w==
X-Gm-Message-State: AC+VfDz1iuT+CCj7qFtO6HbD7okFEpso+uqNdZha2zt4Y2I0XZwqYv2u
	zIlfPPMysu/EfD58rj1v6sJZ61sYNSMwuicTP7k=
X-Google-Smtp-Source: ACHHUZ51AUAOCcHb4T/Z3x9qqA2jZVV2HPi2un7zsMK9HeI68/1biA1xYkNAn9I+KTD2GDPMckgYEPnNIWHEvtCefbA=
X-Received: by 2002:a17:907:72d2:b0:973:8198:bbf6 with SMTP id
 du18-20020a17090772d200b009738198bbf6mr2018665ejc.3.1684930513259; Wed, 24
 May 2023 05:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230524082744.3215427-1-bigunclemax@gmail.com>
 <20230524082744.3215427-2-bigunclemax@gmail.com> <20230524110105.4928906c@donnerap.cambridge.arm.com>
 <ZG3vzxWicUgndMqv@smile.fi.intel.com>
In-Reply-To: <ZG3vzxWicUgndMqv@smile.fi.intel.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 24 May 2023 15:14:54 +0300
Message-ID: <CALHCpMhhUnkko7COzg6W9AqLUfwzKA+EAmcZ+Vwmy_7KB=UdWg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] iio: adc: Add Allwinner D1/T113s/R329 SoCs GPADC
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-iio@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Haibo Chen <haibo.chen@nxp.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, Ibrahim Tilki <Ibrahim.Tilki@analog.com>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, William Breathitt Gray <william.gray@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Caleb Connolly <caleb.connolly@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_051515_444806_4D6A0124 
X-CRM114-Status: GOOD (  25.51  )
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

Andre Przywara <andre.przywara@arm.com> wrote:
> Or we follow the other idea of reading the number of channels from a DT
> property, which means we would already support every IP with up to 16
> channels, without further driver changes in the future.

I like this idea. This will rid us from duplicating code, and we could also
use a common DT node for D1 and T113.

> Is there any particular reason you chose a regmap to model this here?
> Isn't that just straight-forward MMIO, which we could just drive using
> readl()/writel()?

Actually there is no special reason. I just made it in the same way as
in the sun4i-gpadc-iio driver.

> I wonder if this should be either moved out to some multiplexer: the DT
> bindings suggest that such a thing could be independent.

Sorry I didn't quite get it :)

> But at least we could cater for the possibility that this channel is
> already selected, and skip this part then?

Thanks for that suggestion.

> Couldn't taking the lock go into the function? It seems to be only one
> caller,

Yes, we could. Thanks for the remark.

> and we need the lock in any case, it seems?

This lock is used in others ADC drivers to protects a read access from
ocurring before another one has finished.


Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> Even though regmap adds a few nice features that might be used.
> For example, locking. But I dunno if this driver actually uses it
> OR uses it correctly.

Just I wrote above, I made it in the same way as in the
sun4i-gpadc-iio driver

> > > + config = of_device_get_match_data(&pdev->dev);
>
> Please, avoid using OF-centric APIs in the new IIO drivers.
>
> config = device_get_match_data(&pdev->dev);
>
> should suffice.

> > + irq = platform_get_irq(pdev, 0);
> > + if (irq < 0)
> > + return dev_err_probe(&pdev->dev, irq, "failed to get irq\n");
>
> > > We should not repeat the message that printed by platform core.

> > > + ret = devm_request_irq(&pdev->dev, irq, sun20i_gpadc_irq_handler,
> > > + 0, dev_name(&pdev->dev), info);
>
> You can simplify your life with
>
> struct device *dev = &pdev->dev;
>
> at the definition block of the function.
> > > + .data = &sun20i_d1_gpadc_channels[1]
>
> Also, leave comma here.

Thanks for the remarks, I'll fix this in the next version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
