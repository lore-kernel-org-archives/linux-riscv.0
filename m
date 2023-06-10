Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CD3C7EE45
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 19:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mZ2kdWMsp/QAK42g/wpoBsMGwbnKZg7N8MlEMzwz/8=; b=daXKQbYr6KN0wk
	3Pd4iHpKK2w9bBV8D/nLc0x/SDc3HZw1OvnFGjWZiDukGF+9BdWr3FkrESCn7qmRXV/GDDIQmrY5j
	jsOZDGNnkHHHsUziD5uBTil6dK2Gjw1HV4RSOndFk45RmgEv0ooCCzSCXxTq35pRwVo7W8Pehl9NR
	eL/f/gZLWn0M78vvMl1TBvZU0XnzXr/VLIKQgDqR02wyZn6qsu/53xCwuZGfRmvJQhfKtt3uC6vN4
	z91ZIPztY5khRqPiRy8iKaUnsEBzRVxsm1J6tMK+ayHbBrZO78xa//daki9jP/pD0Tsbpq82DMGnm
	oFDDJi8kiBNhYqliTIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q83vG-00Gqr4-2D;
	Sat, 10 Jun 2023 19:06:50 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q83vD-00GqpW-0I;
	Sat, 10 Jun 2023 19:06:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30fba11b1ceso184222f8f.1;
        Sat, 10 Jun 2023 12:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686424004; x=1689016004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLmWexq6F1fpCfKHIaE10IRWiqCed7zDFT7GaTdKHRo=;
        b=IP3kaBlO+DW4oxuj+GWhC2vXnxRfDfZQpETl+JHJYyR0oesjS9GWJvz0w7Hsf+PcFP
         eOq5kTAqpoIN6gV64ARWRDTstNnW/jDLoCgDLrmBIzGGPLHHDewvzOWcTt/gkSrxQ9KZ
         bD0H2/atZHUtRflcoAhgn/IiaY7k2jRF0+BFTqw0ozLkG8vgk9+8tW1J8VKEA8So3JbB
         DCwZkZDvChhicoFE/I4SpQHaeKtrIKRac4/L4QhIP2LhwRSPq7W2x+uKCk0MxsfdizIp
         Wz4lKhnGtjF5GGsogQp0S9IPdpwD71IVlNzbhiDOEa9phf8e2Ps9w8B2ZRhV6sGwsaQQ
         v8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686424004; x=1689016004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLmWexq6F1fpCfKHIaE10IRWiqCed7zDFT7GaTdKHRo=;
        b=iMT+tEoA+m/G02CEslJ3zuEYGEEn0I3QblOwu7dhmM8OIxUbQXPVz5q8GBlT/1HpQ5
         RoYULuAWEYxv2pURcj0fQlfLn6y3dV4HBOLVcPD2L/6Y6qHRQjd7aH7wvEpWLs44kk7L
         O1ISRo4wsxqRqvJEcYkjn23oBZAvraBKa4K6KVfEaUsKJc6OJ2OPhDRfDUtSVsKU9oC7
         BbHqLKMzWOJuyfIj2TOsza57cBX/wuA19Ws49k5fI+34B6QiJze4qUc3sHqA+3OUSKE+
         4KxtogRIF3pPijU5OklO1Y1nl81iJAstn+/H+gmTL6ZEblVausC4BI77Tshlud5J1Ksb
         +Eug==
X-Gm-Message-State: AC+VfDzEpXNhWdNZrdC8mqIMZye4vXLEzuqsIUoRA5Dl8YavSL3Aj/OE
	HqtLacowxRtqCWnm7JPlMnM=
X-Google-Smtp-Source: ACHHUZ7CIYvfhWjHA/EvyWexJGoYAIZjQeK0hazJ2nkWKdj9AUYLYe+9efJ0EHpIF4fE1f2Q50xXSw==
X-Received: by 2002:adf:f347:0:b0:30a:f17e:e02e with SMTP id e7-20020adff347000000b0030af17ee02emr1642740wrp.12.1686424003802;
        Sat, 10 Jun 2023 12:06:43 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id a9-20020a5d5089000000b0030ae973c2e7sm7739586wrt.83.2023.06.10.12.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 12:06:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maksim Kiselev <bigunclemax@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 William Breathitt Gray <william.gray@linaro.org>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Leonard =?ISO-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Caleb Connolly <caleb.connolly@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Sat, 10 Jun 2023 21:06:41 +0200
Message-ID: <3563678.R56niFO833@jernej-laptop>
In-Reply-To: <20230610191204.007c0159@jic23-huawei>
References: <20230610122934.953106-1-bigunclemax@gmail.com>
 <20230610122934.953106-2-bigunclemax@gmail.com>
 <20230610191204.007c0159@jic23-huawei>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_120647_128777_7BE657D2 
X-CRM114-Status: GOOD (  14.26  )
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

Dne sobota, 10. junij 2023 ob 20:12:04 CEST je Jonathan Cameron napisal(a):
> On Sat, 10 Jun 2023 15:29:07 +0300
> Maksim Kiselev <bigunclemax@gmail.com> wrote:
> 
> > From: Maxim Kiselev <bigunclemax@gmail.com>
> > 
> > The General Purpose ADC (GPADC) can convert the external signal into
> > a certain proportion of digital value, to realize the measurement of
> > analog signal, which can be applied to power detection and key detection.
> > 
> > Theoretically, this ADC can support up to 16 channels. All SoCs below
> > contain this GPADC IP. The only difference between them is the number
> > of available channels:
> > 
> >  T113 - 1 channel
> >  D1   - 2 channels
> >  R329 - 4 channels
> >  T507 - 4 channels
> > 
> > Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Looks good to me. Just the issue Connor pointed out in the DT binding to resolve.
> Note that this will be cutting it fine for this cycle, but 'might'
> make it in if the stars align.  If not it will need to wait for next cycle.

Cutoff for sunxi DT changes is at -rc6, so I would say at least that part will
land in 6.6 for sure.

Best regards,
Jernej




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
