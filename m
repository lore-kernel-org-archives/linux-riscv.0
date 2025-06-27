Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D66C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drhpXOzjw336p3FfR69LYdmqAZsNzJNxWO+sLOfpItM=; b=UJYxR3Qo+SK/l3
	Hj0FPz1JNqgsgKiVI3EGy0ZPAh8cuuficKfMd4HnprslvchgOBri7DjDZ8izb+egFcXvlxmFgCxcm
	p2d4z1PrXoZdE7csHaVYGYUaRYcgB+jZxLVxFEc0xF5omv6TPdzNQlj3lUphVm0PgKP6BwFr3CX2+
	nVNEFLjxmI7uszwVXU9WS2SqeYFxS4beG7dwWreMM3Mdrh9Bc7H9y1sSB+Gz8DVrQvsPGUy/TZC0V
	gOvKgAa4GegVMwrZk5kUKiMbycafDROQ9DaR0Pc0udq5ZXiByOncYQs+D04guESUcZHMb65+3mtZg
	qcWFHJYgQjiTuRfqYVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9qx-0000000EsCY-1evU;
	Fri, 27 Jun 2025 14:14:55 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9Fy-0000000EnTQ-3IhL
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 13:36:44 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-86cf9f46b06so68366739f.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751031402; x=1751636202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfiJnZdQRFrCAW+w9heCSHyeWa3Z+YlU9j/j6ABGxx8=;
        b=L3RGRK5RS0ko8xUHcuSIAiflOLv82zBZ7VOlHX02RcreLt25uAQOmyX6aeOZ8lK7uy
         WRN0SM+w0QXnNZLatccO4fqSCXB6GedG4uJ7nbD4MinQl6XkesAMivKArlibGvGHvI3h
         CYLeuPs/fnsrXytzHKIwuViDvXwoYWuVazwg/n3d1RVcueTD7DneOmbTdVqUYT2yNwN1
         /81TlfYNc4mF+iCkiv2ZTbRjGukH7yeqzHehKJLsTlx6V/M2aV55E33zHQ/mxhurin5t
         QoIgygIrbAaEh/JYv2oyrkaZd3H4p3gHcHeUzp69BIP/XgCaWUcDH0dYB52CEEye+tfx
         yGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031402; x=1751636202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfiJnZdQRFrCAW+w9heCSHyeWa3Z+YlU9j/j6ABGxx8=;
        b=OZVlxJd1ef7Pl0LbonIuz/MOCcCPRHv4gwe0QP7ShQ3KgdP+tW7vvBx9HsWvhejCgk
         tyz73/JSRviJGTsH6tpSnsbacEo1pTAnNYKjBlnWFkutiorWJ2FwIelYharWiC5yYY1Z
         iT7udkAXl7otCXEWsjMl2hS+mCLYH3uKDeioJ3FY6RPlYHUroGxl53q5Iv8hHtWZIck2
         DyX1cKrmbt+S8tJ5WrYfeFSVBONh2xHB/k3Ewl/xpfKPmAqhonLAPgAW1QRqU+Pg/FPJ
         VcbkomD4UWutv7ye6bEGr4NX6j33Bk2KJcrorgZa/RJcq6jHmOR+ZSbu/F6XaqCiGUxC
         2apw==
X-Forwarded-Encrypted: i=1; AJvYcCXO+tSigYtYy9i2mxs5UEsj6YvWHjyEX0NhhGiF2VBkY9WB3tdYpdaS7RRw4Y9dZ3yanGdrMu9NIJYy8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwO6kbrdmYZJt8F1vpJwiw5YOMQYv4q91O7r+zZ3+oG0ciNoLY
	Ubgdc5AG1yWGlOCh807fm1pt6A2lueSZgSAa9FOIFKpz+2K8ovbM+e3A/VYrzTW4GkM=
X-Gm-Gg: ASbGncvQIwLbQB+mPpQ9FK1jXwnGAzCAs1F/Q2c0JwI1lOksXjbI/I81GN37F4csvWM
	yqbWMNKF+evKmhUulg/lHA4zq9Qfs35Z3XscNgWSfXg2MPkPsUX5ZjGKskkG75/Ek4SLpXWOes3
	qEo4MWKBtufBW5QjL2SRM5f3sXJCl/pG0j9XKAk+2fbuP3Kg6YbQshaTvGi7j606h6pEt8+Y3bp
	2GP5bcuKuPNGUkqUyE9imUL+YojBJxg1QVnrkK0QSmikP+GscBQO7tNxggRHpWDAdh9oNyEMnqg
	ZLETHvHCbAQgokPgMA/j0YrvbzyV36ftwxnMllPPH470hTpdtqOqGd7e+2jaGeBQalGJfDeUEjN
	PxDTWMQsMILoMs0gY54yZu5OD0w==
X-Google-Smtp-Source: AGHT+IF1O8tzv2KWCzSl21OTyig59TTY0gf7CGovzXL+B16wQcpv5kKezeVDaVnpkiTgGZ9wCICGDQ==
X-Received: by 2002:a05:6602:2dcc:b0:873:3691:6fb8 with SMTP id ca18e2360f4ac-876882cb88dmr404639839f.8.1751031401882;
        Fri, 27 Jun 2025 06:36:41 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-876879f3584sm46791339f.9.2025.06.27.06.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:36:41 -0700 (PDT)
Message-ID: <0eda5bf4-ce63-43da-9c2f-7d4ec902758c@riscstar.com>
Date: Fri, 27 Jun 2025 08:36:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-3-elder@riscstar.com>
 <20250627125119.GF10134@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250627125119.GF10134@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_063642_958579_2CFD4FDD 
X-CRM114-Status: GOOD (  10.32  )
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

On 6/27/25 7:51 AM, Lee Jones wrote:
>> @@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
>>   	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
>>   };
>>   
>> +static const struct regmap_config spacemit_p1_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = 0xaa,
>> +};
> Suggest making this more widely useful by adding the 'max_register'
> attribute to 'struct simple_mfd' and conditionally overriding
> regmap_config_8r_8v's value during probe.

So you're suggesting I make a general improvement to
"simple-mfd-i2c.c", because everybody else just uses
the generic fallback regmap config?

(I'm asking because at first I didn't understand your
statement, and the "more widely useful" comment).

I would be happy to do this, and it's not that hard.
Can I do it as a follow-on patch though?  It's adding
scope (again), beyond what I anticipated and honestly
I'm ready to be done with this...

Anyway, if you say "no" I'll send another version of
this series today.

					-Alex


> 
>> +static const struct mfd_cell spacemit_p1_cells[] = {
>> +	{ .name = "spacemit-p1-regulator", },
>> +	{ .name = "spacemit-p1-rtc", },
>> +};
>> +


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
