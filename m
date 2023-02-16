Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41285C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUFwGbIr+clbVarOuCRye6kZtbA4sylR+Rd2jKMJNbo=; b=DTGe30SCa/yRfa
	xGp46vyonY+YCHkSWP6E935EqMHNHmc0eNVTJtgvXRZBukm8Uh9qCJ9oaaxpvd6oSc8Ra1Ok05Fug
	vPMslMpwnNncPIxXlh2dLW0RTzzW/n8W2Vo4eHXgIXAyhG5hucu7P9MueZpKno96PMCv2cFl2j2if
	/4bxWLpWw9VLYn057Fc4GDrbBnbKEydtOL6r2VrzUPy5JBkrbFu8IOmaACjrZHHdtd/O5wakTx194
	OZ4RnpPnZaXbIguAllFmUyYnwXOAG2iHKn7jq4b9irxCE+MmjVQlf7hW+Bf8oNhpfTHfEmJW7HO55
	rtfrLjkgA8LmMwTbBKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSfhv-00Alld-UU; Thu, 16 Feb 2023 14:57:59 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSfht-00AljY-9n
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 14:57:58 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-16346330067so2829644fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 06:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D0SWa6ZBRkjqa18mu1E+Tl+FPjfljxPZFk68O+yxexw=;
        b=YKdtLtbmUpldrBKWVbzDVnWWch57Y/JXvy6Lup/JK6NA2Em5Zn/21rALTQJBHPgo0/
         fqXLaShcR2amSP2E0uZqZJK4xXFb8LKuu00AohCqC/EAXF8vdLg0CZveDPkjBV5BG2QR
         uF5ZaD7VXVWA9zK3SDGYxvaDBMjQBL+zvO0Oq7X0v+A2bPak2lQCXNJhnpP1kMIQD140
         3xBA0rpJlNbMjCI2Z9mGDTYHvXoHJYTrr4eF9cPe6MenaFR8YUur0fmS6Ropwu7RSCz2
         1XdNo9o4Co19sDT5ZtkvkuOXqfsOrSTGePQTzJRAY7UJjNRHupOr2UpbchivMXw+pOzK
         U09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0SWa6ZBRkjqa18mu1E+Tl+FPjfljxPZFk68O+yxexw=;
        b=8NsdlZhO60LJis3Tagjm9Qn0tLUCaGVAN+A2/3DWVY5hmoCr+tJ4qSZPPGQnp+aNNv
         9oGFFuTNmIFaFkKDoEyYxBoBaRCrs/S4SjmC4QRbh24oE6nVif4XKHbPf6axybq9wbjw
         dkTkyewh8ZPmB7QlGyu9l1iJ2xIF8u0akNENz2S0C9UegnlBHjlG81hXgCN7KMZl0JiK
         OZL3/pf4iJIWLm1H5orUgKvBJ5om64uslJJev12Hq/Vzy5Ui5AVrxtqLFg/hXKMQLfLK
         M/mGNjakdy9zy+4MiDYuptA8Y/4DrEYZJzkqkCK1HNUoXF+lEzxlVTimkE3i9Djf8p1n
         Dy9w==
X-Gm-Message-State: AO0yUKXMz1ezyCE4AXGdmcjvMAPyEnemIbj5mBUtNuMNDOoLw3RkAZFm
	O4SxKcUrY2su8I6WlgKcaWg=
X-Google-Smtp-Source: AK7set/qIkXn0ARD0apht7YbDTCtMTsrBPfcN20gMPdgnzo2fkgFPzcCqyvcvGeo6ZL5TGFxx05lxw==
X-Received: by 2002:a05:6870:b6aa:b0:16e:f84:5552 with SMTP id cy42-20020a056870b6aa00b0016e0f845552mr3553893oab.57.1676559475549;
        Thu, 16 Feb 2023 06:57:55 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r6-20020a4ae506000000b005177c244f31sm691325oot.41.2023.02.16.06.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 06:57:54 -0800 (PST)
Message-ID: <bfc81429-1829-bec1-ac29-0559f6a01215@roeck-us.net>
Date: Thu, 16 Feb 2023 06:57:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/3] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
 <20221219094233.179153-3-xingyu.wu@starfivetech.com>
 <20230201224619.GA3194283@roeck-us.net>
 <1f18bfdc-7a04-4914-d970-7ef1d4f99653@starfivetech.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <1f18bfdc-7a04-4914-d970-7ef1d4f99653@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_065757_372286_49625B1F 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/15/23 23:11, Xingyu Wu wrote:
> On 2023/2/2 6:46, Guenter Roeck wrote:
>> On Mon, Dec 19, 2022 at 05:42:32PM +0800, Xingyu Wu wrote:
>>> Add watchdog driver for the StarFive JH7110 SoC.
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> +
>>> [...]
>>> +
>>> +static const struct watchdog_info starfive_wdt_ident = {
>>> +	.options = OPTIONS,
>>> +	.firmware_version = 0,
>>
>> It is not necessary to initilize a static variable with 0.
>>
>>> +	.identity = "StarFive Watchdog",
>>> +};
> 
> Hi Guenter,
> 
> It would be a compilation error if drop the '0'. I found that other files

No.

> initialize this static variable as well.
> 

Ah, the old "others do it, so do I" argument.
Sorry, that is not a valid argument.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
