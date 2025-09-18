Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450EFCAC5A0
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbXqtMtS4Iu0YPmlR0gOflDPEU3eSE6uYKOKJdIlQwo=; b=luLHaSlGNlebkd
	1unokjLY5irm3q5cCnpFzXCoohNLOP6ECjGqq8t4cTEFp2pGTI6tdgmQQse4BvMM2pOwMu0S85lW6
	uxweupx02lU+eQHTR0nK3lp8IYO7nTAlYgIxf40dWCKpQh2vJ7i126ECVuQWpoD2hZQHymcJS3fib
	MdLPBHPZvN5+vPWCXLDBgqELhAMVwS1G3npZjfZP2yQTUFgaB/eaycvFWXttxvKnRJOS28zRurt11
	7hds9iXatHRBLNIXhj4ry5tH99ie4TrHKQ3ziMq0gFB8nkUA0jDULlwBHoymRpRBg7oeIDBkduDFb
	Str3RIupEmk6RmEkKk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDJ3-0000000HJZh-0TrU;
	Thu, 18 Sep 2025 12:00:09 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDIz-0000000HJY2-2ruO
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 12:00:07 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-4242bb22132so7840735ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758196804; x=1758801604; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24dAp6S0Mw7uy79hEDvqIYLysQ8ECFwST6qu+5oIS60=;
        b=T6lLKuRCpNK+QsNqVbxrg5sAtAbW+FXANFZeXiAnU3lMeigQuefrK9+GWhwvABjCBS
         T+rQynyfR3pOTd4PW9JMsTnAi+UoQkSrvXvDv3/H6qyRDZKzQsJBiXivgKTRgCTfvP8c
         uPs5B+KV1xe/gynTn1paImB2yuj0t1gDJ63se+tYmACgoeDAVR3bEVQdYY8HG1RCozRF
         j8jlp9iNNSQOQcGKo1BOF5uyPt/4BHCduXz6FOgq69pFOm+GxWHl0H6iogIkeJM+VVYU
         UcDHrS65GD8g372bxgYzYNLang5StaZjdYgfwv0Y25nx+1l48U5VvApeFpoYfKkprcyz
         VKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758196804; x=1758801604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24dAp6S0Mw7uy79hEDvqIYLysQ8ECFwST6qu+5oIS60=;
        b=mfN4d2Bkgxwn+4Tdv0JyorzQYDVh/pdHVj0e+FgFV1C/0opmFMXYPTwRn2FRN1oYuW
         4E57bx88wDw7rUpfgyEaBs8nqIgT5iMpWdUoFDhnsEpiqtG6H7iR5iIXyk9yQ12gHgeA
         +55yj2o3Z4+ScWy5xz2Sgmv5FGcOxxP2sO5wgYXWgvHJOK87wlBiMK1DLptUQxCOMv6S
         fZlYUlSXy4pgYZkXivMMRYd1nu9W6CMHaNRBUO6zUDGMiLxQRkt/1LgG9JjbD6YUKu4/
         198SXG+bZCQkuXXzsq1JCmR2qGRlISS/xQse5ohXjjFqF/stSsDhSHOo2KotX+H3+hC/
         MQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcTtVd9FswdzQspWOJsphgLy5lAPTs35gJjxpdzkmi4jW9pc2LZMF85IqPmhXIHnI8HuMLr07yee0S8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDFujz8V1rcLN6eCf8ej/eqeQNbr1oa9LQ22Z8vCmWQXUfzSgb
	2Pbulrc732PMqAQU33R07rys/DDhxkF0z6Od5nt5gpe/0siv/UPuKmWeafoxsH9lo+A=
X-Gm-Gg: ASbGnctzfJLDoVHRZEUQrk1m1PyMpozDnouFMNMTiDPNh/DgdGBcfZfKNR4Nm9eLJh6
	f5YOuUDTdI1NL2kSQ21akeKN/UNCz5hBijeQ+U1nVEa6HlgqFcRa6uP2QAzfgHqJRIzkoRtke3D
	i+ui2tkgtMyOx9ABpcuoXOh0t9tFgsNIIaJ6q5eBMarZdDo4R9tJYOwKNH9ntomqvFY4wMYI0bP
	0XBR3QY7WgiW5UUy8B1RFETtUGlaeDXsvfSaEXcG7DllDmICp7yjsNiRBUMKWLnCBlcJILMqh10
	72x9D3sZHSrf3hPIaLsiLanv2F4Zpm0DMmjlZuaA6ztNitSiYYFtKRwmF0osiIdwkoKIGJ0USDt
	kdT9NphSLF2YJmQTq8NV/nMTpQfnzRKyhZkAg4HuVG8YELWfsT+3s0XbKE+U3DL2LVWfJNw/37Y
	GhSpuE8A==
X-Google-Smtp-Source: AGHT+IFijlR8XeEU0nDd9FqF6SZxYszafUFzoDoP3bqBLd4TIHjKMZRHmvYVFqpT9XVP5Gq1Y4eDhw==
X-Received: by 2002:a05:6e02:1707:b0:424:485:1f03 with SMTP id e9e14a558f8ab-4241a4d26ecmr81727265ab.13.1758196804240;
        Thu, 18 Sep 2025 05:00:04 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa5dc6sm876180173.47.2025.09.18.05.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 05:00:03 -0700 (PDT)
Message-ID: <88833bd7-dad5-4613-b29e-2db05d60f3f0@riscstar.com>
Date: Thu, 18 Sep 2025 07:00:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
 <20250918001632-GYA1270371@gentoo.org>
 <f7e12797-ea17-4e92-bd25-cc562c66d2a7@riscstar.com>
 <D2A109C6A8BDED08+aMu4H4xap2GSP50w@LT-Guozexi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <D2A109C6A8BDED08+aMu4H4xap2GSP50w@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_050005_966433_2612392B 
X-CRM114-Status: GOOD (  11.67  )
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

On 9/18/25 2:43 AM, Troy Mitchell wrote:
>>> while looking at the code, it seems you can use alias to map specific id
>>> to the spi controller, it even can do non-linear map, something like
>>> 	spi0 = &spi3;
>> I've never used this before, but yes, it looks like it's exactly
>> what I want.  I'll just get rid of the "spacemit,k1-ssp-id" DT
>> property entirely.  Easy.
>>
>>> plese check of_alias_get_id()
>>>
>>> note, I haven't actually verified on board, just look through the code
> This is the right API that Alex what to use.
> I have verified it in i2c driver.

Yes, thank you for confirming.  I've already made the change
and verified it works as desired.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
