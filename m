Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABB5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 23:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yD6yAQtLh0lvdnsB9i22k+6g2LOMA8MXN2fbCbNGPk=; b=jNGKQMllLgdrJn
	thU0MEUyLrd56XSsR0493aWw/901JseK/Wy3ivO7b76BCOVigC1zbvSzDadWsfMg29mWncMozpP23
	gajR3XIVHfcYeABQwP/0/AyqQPQExO3Cy4nLMs8KfGzPUEZjgWS25GN0cOMvzfypau1aepkgRzXPu
	o3qsXYXAq/ECM4QluxSFypH+DhkMqrV/n2rV3mHB31FcSBxeJzsn35SHNiCSaE9EXsbvevb1+3Uhu
	XSxMpfI7WTCd1csyatTU3HswsQD3xjlXI+07QjY5OH1KuqRxv9fYTjgT8gx1dM0DuAuV+NhldwD+K
	tJZGC6vwjhzBxVQYC+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG85a-005mtS-LY; Fri, 04 Feb 2022 23:34:02 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG85X-005mt5-SQ
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 23:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644017639; x=1675553639;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kjitzkvpd5SHLeNm/aAzpQh3TCApea/ZtTpr7Lpfw+k=;
 b=fKc5xxlTyVfGz3Ub88eK1Y9kZ3l5vSW2ypXz8ASqNzJsyCmeyUrAY5a4
 /BmZhO0bb79HIDiwPm5a5Q+7rIKidYt9YdFjE7jxK1qfhKecj4sLJRBcS
 2N3wPxB50yGWN8IeVcsBbrXxW+e9Tj5RE/x95j9GUitAKXZN0FLpydMqd
 fKQGmak1hhNNADclyqQm1JJgFbwS5S4HSsdI4r0EYxep2GC9Y9zJoXJpQ
 Pl2AukIxpE81abFQj954xjnPWAJNttgets1Y+5sQCGTqqSPwO2kywxFnU
 MtSovbUr76ZLgAzGqji16yzljpnK66NIv7wzxcBjglUd3lj1GqK/+oK3v g==;
X-IronPort-AV: E=Sophos;i="5.88,344,1635177600"; d="scan'208";a="304105614"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2022 07:33:55 +0800
IronPort-SDR: feWLs1GqVedJNKYgRbZCgE5fJVk8Taefe2rD0cPZ5K77MAOdoVH3xXTYt6jlPUITUMho9CcB0N
 sTYEb/BDiRE1RF6cryIA2gaMcM3R6fcYRf9/lgKGQi2XgCniBzcyDCEOP1uFsV1u0CQNqScE7K
 JeexTLqq2rSjs/miZusxs17PDsRUaTE9l3GnKF54k1Evx/1kZXVM7XToJoW8Y/ErfwTKX3VxCg
 3AjQB54fXSBaJlXAIXgmdr49jnzkokMPfVnpyQmyr5Ti1zA80VdBqfB3E47dzPzrb4q1A8q6Ge
 /5x/cOZmtJdgYMwa+5rBk88R
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 15:05:49 -0800
IronPort-SDR: l6Aoa3V8p1usK+tfelLMlcbuWUrSrQudKq1aeNjjuOvzgXGiy2iTg2jQmQ7OlScC0edNHt3+da
 7SV4Rf3NbzJ5TBEsD3JeaGnLc66ob7UwIOKS4vPeycwigRUD6xh7uMBZAYVQGfDcMg0vngVVRp
 PV3rtcmO+tVCGmI/+g+NwJCsoliDD4l5+PnHZsxIhDteo3mY4m1sIjciunYLaIL0k4wZJ4F+q+
 tGeLKby9lZKS+theK01nK+bHh8xD9ycaAoD3AMu8M0xXLr6cfu1jud0O+4qZMCRKaRqmXRRpQh
 8sI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 15:33:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JrBgl0ZWRz1SVp2
 for <linux-riscv@lists.infradead.org>; Fri,  4 Feb 2022 15:33:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1644017634; x=1646609635; bh=kjitzkvpd5SHLeNm/aAzpQh3TCApea/ZtTp
 r7Lpfw+k=; b=Ud9XcBPEO4foBjPZWtgbcp4HaJh16SXnC1ucMgsalervNql1nQS
 IETQYPPEcImSmwASS7Cwge+t4cwEyhBWNf1RJ4u+gLhS7R6YPCQao479EYe61lsl
 lnwXVG4Jq4j9DEsUcjsUhNZ5z+dDrnEvKz+st7zGQ6vROmiymhShhCZbP3c+acoh
 tM1TvvzsYjElp4n1iSASsQ8QOK4R6vber+fOxwMyKRIcj/Ccj+qZmprFh7c9EvOD
 x7WCrvz1Xvm+D5BXgJQUXvYRoBRBVrpQsfHMCjOXAOCBhoF5rSIvHcWrsRhxpF1V
 3HfzLmSTdQzJmWtVl35OQlrI8Moo209GAmw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 236F1xGb8K3i for <linux-riscv@lists.infradead.org>;
 Fri,  4 Feb 2022 15:33:54 -0800 (PST)
Received: from [10.225.163.63] (unknown [10.225.163.63])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JrBgj2gvNz1Rwrw;
 Fri,  4 Feb 2022 15:33:53 -0800 (PST)
Message-ID: <aa6f85f3-1146-e857-148c-7a314b21e647@opensource.wdc.com>
Date: Sat, 5 Feb 2022 08:33:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] gpio: sifive: use the correct register to read output
 values
Content-Language: en-US
To: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_153359_998917_8824367A 
X-CRM114-Status: GOOD (  25.49  )
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

On 2/4/22 22:02, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
> 
> Setting the output of a GPIO to 1 using gpiod_set_value(), followed by
> reading the same GPIO using gpiod_get_value(), will currently yield an
> incorrect result.
> 
> This is because the SiFive GPIO device stores the output values in reg_set,
> not reg_dat.
> 
> Supply the flag BGPIOF_READ_OUTPUT_REG_SET to bgpio_init() so that the
> generic driver reads the correct register.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

This probably needs a Fixes tag. I have not checked which patch though.

> ---
> The patch was tested on a canaan,k210 board (canaan,k210-gpiohs compatible
> string). It would be nice with a Tested-by from someone with a SiFive board.
> 
> However, the u-boot driver for this device already behaves exactly the same
> as this driver does after my patch, for all platforms using the driver.
> 
>  drivers/gpio/gpio-sifive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 403f9e833d6a..7d82388b4ab7 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -223,7 +223,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  			 NULL,
>  			 chip->base + SIFIVE_GPIO_OUTPUT_EN,
>  			 chip->base + SIFIVE_GPIO_INPUT_EN,
> -			 0);
> +			 BGPIOF_READ_OUTPUT_REG_SET);
>  	if (ret) {
>  		dev_err(dev, "unable to init generic GPIO\n");
>  		return ret;


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
