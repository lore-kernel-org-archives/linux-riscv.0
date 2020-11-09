Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB75CC4741F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 13:47:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A4DA206B2
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 13:47:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFczSrN0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnkNa2H+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A4DA206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UpNWOea4GrlS4bx3iXqVx6WXkKM0MvXDOiAi9EXTMNw=; b=bFczSrN0SkRa4UQvznK7babCm
	sGHCt/2wxkVQw16Y2f4k/sYa5CtgKMuMgzkpG2Xm7I7Bm84Cu/vXEcyhB/XA1QisLik0XsRCcHrJv
	wlXTSKaZrvayLqqwigk2x9QaU7jKfhCjuU75/skCxaNl624o/WvtPxi72C3abK8s1oTEy8DwCRpb7
	o4e4IhhKnuWjmre9mi7gHZiCwGBE/lSORXI08EhV1dPkHnrqBc6obsq0HlfjSRCnICchW8UTtEy6M
	lQsY7pNYAyRi4D+jhzcN26exHLChcAMYc1RlryvM7MqArlMqWvB8vjE3yx5R/hWt9O8mr81k/gg0U
	nw2X+ZrXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc7Vu-0005sY-1s; Mon, 09 Nov 2020 13:47:18 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc7Vr-0005qv-PC
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 13:47:16 +0000
Received: by mail-qv1-xf42.google.com with SMTP id g19so4021292qvy.2
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 05:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3P4Xy4X3O8T4Nf4PgfEYUgS4xFf3jYJhHCyEVrGcPOA=;
 b=CnkNa2H+6dHsGG7oCncPC1SvCVCwADCa9oL2vYqCUUL6ad1Mh28I2FOsrm9mgoH5WX
 g55LdA13TrGDSXZ055BjdxAzQ0M9jIyGi3wzjqndyaXTv0IBwgw7Pc8MVJ5RDDjAgcIt
 9ZR/1NXyTe7eLwblNB2plK5rsEMXcvcwrdKR3H2HTUllWkHNWUDrjyXm4oW2D0s72FOC
 zbg5CnVzs0TFt18VD/0akL0kKhkS2osuOx3UfPkM7UXHtE50ZJcrVUQ4wuc+5WMA1Cms
 hxWduHV+ffDJv0vlyOKvQsrU7c6OZuTvDYzNHKaSkBYFVxPVQkjnbZeHw7JJz4xD8F2Q
 e34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3P4Xy4X3O8T4Nf4PgfEYUgS4xFf3jYJhHCyEVrGcPOA=;
 b=O/WezJHg9fWNg27ftVvNIPBNe5ux+epVLXHpsUsahnXGADkVqkL9z5433urCb3Z9Is
 sevPybXVSAe9c0a7qvx+YIQ36OF9ZivqHIZs4DfYiet1mZzRGVVOd4YCAjIJwMsMLsob
 35X+w5Y+wc75LTSF6g3qb2CsuTjTOAq/tlSXBnTvR0NlCoyh48ijE39QGf9PiJyYM4nj
 uY4Ymltp6YylJjrpbHNGiuRrrekEDGUc5+nNjZpYTCoit/aUz6lJEMl8YuykeG59FKEc
 rFEtWGQ78WcL0m9ES+CkX/eU1uBg6iZEB9H2pCab8q/xidFaSnn6tBBRuEFAgCp3KOFF
 ufLg==
X-Gm-Message-State: AOAM531lD59bB1mict2tMjX9N9TqkxRMAV+qkwDCfzDRmXfg1fwQpzvs
 mlJqeh6g8NwINyL1lUe07Tw=
X-Google-Smtp-Source: ABdhPJzU05Fw0kzNgO7z+uoXZtYaKr3IfKDrqYuQ/4WUNUe6l+9tEW5JmP/HvpwEVZFqdcj9iMWp3Q==
X-Received: by 2002:ad4:4e2f:: with SMTP id dm15mr1130200qvb.7.1604929632527; 
 Mon, 09 Nov 2020 05:47:12 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id j50sm6081221qtc.5.2020.11.09.05.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 05:47:11 -0800 (PST)
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
To: Mark Brown <broonie@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
 <20201109132935.GB6380@sirena.org.uk>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeM
Message-ID: <c37ca9be-ea92-b07a-b600-d68de4f7bde5@gmail.com>
Date: Mon, 9 Nov 2020 08:47:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109132935.GB6380@sirena.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_084715_861353_A9DFBBE0 
X-CRM114-Status: GOOD (  23.05  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/9/20 8:29 AM, Mark Brown wrote:
> On Sat, Nov 07, 2020 at 05:13:51PM +0900, Damien Le Moal wrote:
> 
>> The resting state of MOSI is high when nothing is driving it. If we
>> drive it low while recieving, it looks like we are transmitting 0x00
>> instead of transmitting nothing. This can confuse slaves (like SD cards)
>> which allow new commands to be sent over MOSI while they are returning
>> data over MISO. The return of MOSI from 0 to 1 at the end of recieving
>> a byte can look like a start bit and a transmission bit to an SD card.
> 
> If client devices are interpreting the transmitted data then I would
> expect the drivers for that hardware to be ensuring that whatever we
> transmit matches what the device is expecting.  We shouldn't be putting
> a hack in a particular controller driver to paper over things, that will
> mean that the device will break when used with other controllers and if
> different devices have different requirements then obviously we can't
> satisfy them.  There is not meaningfully a general specification for SPI
> which says what happens when signals are idle, it's all specific to the
> client device.
>
> In this case it also looks like the controller hardware requires
> transmit data and therefore should be setting SPI_MUST_TX and just
> removing the in driver default anyway, though that will have no effect
> one way or anther on the issue you're seeing.

There is a recieve-only mode, but it is not used by this driver. Perhaps
it should be.

> Please also try to avoid the use of master/slave terminology where
> reasonable, controller and device tend to work for SPI (though MOSI/MISO
> are going to be harder to shift).

Here I use it to draw distinction between the SPI master and the SPI
slave, which are both devices in different contexts. 

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
