Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D05D2E027
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+P1DmxrUCrOTUEgdNPK5z2CWhHOW4DxTYKNH0qyLPGY=; b=r/NjgvUqscXjoD
	Vpfyk2rc3lVJlSNKZ31RFNcMkO38wJpHwyB8gGon06421SXkM67C9ht8RIfmlIBSi/5xrKg6Zw4Ac
	PP7fi7JbmN0XKoWxWEQ6uwKk57gnoj8qqDzKdHUYnbPwwXXpNtAQ8iBUQAK7TtPYhoUAZY/bKfg1S
	MVq+IKTW7vSm1b/Ioryw6ZpdqReeuMN+FYL4cCSCVLS2aXlu1tIkSInBmz7pLHokjqK2Kp9y6izjd
	sUnn9YDzHGJe3FT2GUx1y5TWT1CH79WQOVXNIrD4vlMJfGZgkbSBGjH1K7S6f4In4BPK3PRTKCqWl
	VgXra+YQBoFWLKC79Nag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X66-0000000DduY-1kAP;
	Wed, 23 Oct 2024 08:52:06 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wvo-0000000Dbzf-0ooU
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 08:41:53 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a99f629a7aaso115965866b.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 01:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729672885; x=1730277685; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3m+jGvhTZvFu8vnBmFkPGAav8w0MskfOqv9WrwcR8M=;
        b=L7WLfczGeOnjxZHAucBaPIpv+XhShiK/3QL2b6PceicXQ4gUTNTJWFjNZxrQsc8XxQ
         FMw8Lb6ltG7thX8e0SYFgdYfB4j/ttZZyUbkwvSihnfFAjxj8yuYYuNJzkOyIccRfFcb
         JQiAWy6L0Ot0VCOZhv3pzZLpbEK21Pl1fqQN1GEHt/MWLboyON1oWVWlYYC1R1rpAEN2
         JRuY5oVB/LZJMmEgafCCrssEqmrVl6BekVZgvbpJ6llnt4YZovjycV8kTSOd2Vl+nPxo
         Ke7ugrGB/iSj8QUju14U6s+oMsHQH8DFwqxbpA30G+Vqi3Mf6y4qbPbTD7MIess9N2bB
         /B5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672885; x=1730277685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3m+jGvhTZvFu8vnBmFkPGAav8w0MskfOqv9WrwcR8M=;
        b=VmRbjFwnpYeHatZ7uN29t6bRO1qLTC0ASSrKCvNzin+d8pTr3rpKaN+r+Z9a59OQBl
         Yp9mmozl0V0gqTbaxaJQzBKZmvCjDjxlB7EvJ7+8qWXC2C+vmqsVaTg4nOUJ8rR0tJ5P
         XAFnT2WqLjFPFVGMEEUCkg2gXMldJcTjb4Svu70E3lQB7CytXCn6kKtYRpZnVnKKWznu
         kdTFZ/YGM4PbLgKlzpUCx7zpQudWdVvxIUGf0cfTWGNBGX7a1Kq+783WTB3HPQ79rIKn
         stEZ/zROzY9aMkSbXwpsOcnNUpa449I1Yb7h2Wapm0lES/KxbfFczI1KNqa+pZjq64Qm
         VXDw==
X-Forwarded-Encrypted: i=1; AJvYcCWaxD0DnZGxGEsOlucrQhFgl56TExQqA7nqgymYtwsGFwQKmmAw/JHSkeIOiPWefh0wxTb5A+aKhZQJWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHrwwukqCJXiMUlZ8jAOXGKT5zEQff52XdN4lNj2L04aStlugr
	1MrHTpyBaobs9X+YvrzGNjs5zaWS5AzrUFBUqIRPppfgHmmrKK+p
X-Google-Smtp-Source: AGHT+IGjgTscanjqaQvjgPoy+gTYwYNqELv6t37GRN6MY4QIpWWzsLfkOJAEvyPZlFmgIbO7dJZ5pQ==
X-Received: by 2002:a17:907:3f1d:b0:a9a:170d:67b2 with SMTP id a640c23a62f3a-a9abf32535cmr172378866b.29.1729672885119;
        Wed, 23 Oct 2024 01:41:25 -0700 (PDT)
Received: from [10.10.40.97] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d62efsm439658266b.44.2024.10.23.01.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 01:41:24 -0700 (PDT)
Message-ID: <ae939f90-c23f-483b-b4bc-70891d0de167@gmail.com>
Date: Wed, 23 Oct 2024 10:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: Fix build error for ltc2664
To: Jinjie Ruan <ruanjinjie@huawei.com>, jic23@kernel.org, lars@metafoo.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nuno.sa@analog.com, conor.dooley@microchip.com,
 michael.hennerich@analog.com, anshulusr@gmail.com, sunke@kylinos.cn,
 kimseer.paller@analog.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241023082309.1002917-1-ruanjinjie@huawei.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241023082309.1002917-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_014128_272077_060C0DF1 
X-CRM114-Status: GOOD (  13.64  )
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

On 23/10/2024 10:23, Jinjie Ruan wrote:
> If REGMAP_SPI is n and LTC2664 is y, the following build error occurs:
> 
> 	riscv64-unknown-linux-gnu-ld: drivers/iio/dac/ltc2664.o: in function `ltc2664_probe':
> 	ltc2664.c:(.text+0x714): undefined reference to `__devm_regmap_init_spi'
> 
> Select REGMAP_SPI for LTC2664 to fix it.
> 
> Fixes: 4cc2fc445d2e ("iio: dac: ltc2664: Add driver for LTC2664 and LTC2672")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/iio/dac/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 45e337c6d256..ae6d04c758d1 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -381,6 +381,7 @@ config LTC2664
>  	tristate "Analog Devices LTC2664 and LTC2672 DAC SPI driver"
>  	depends on SPI
>  	select REGMAP
> +	select REGMAP_SPI

Should you not replace REGMAP with REGMAP_SPI instead?


>  	help
>  	  Say yes here to build support for Analog Devices
>  	  LTC2664 and LTC2672 converters (DAC).


Best regards,
Javier Carrasco

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
