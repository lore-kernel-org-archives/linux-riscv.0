Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F73C87FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HcKIIIjFHjG5jgJggkb2tWq5UaVmeUpoHVwnEycr4Y=; b=C09ZTuZPqUAsyQ
	Ff9DMDQhM9xJ8+LbobVLw8OMhRJM68mNjvBY/dv0QCrfz+XfjKEJlemvnY8fwhfB01c+Qai6K7Ixa
	QSkkihWJybVTSaAV3lPSYhzLpLgyKxwNqDjxdR+y38AYr6cBpeUF0x/ikrDnplLyY9ALmuhb7e10V
	ghbpflHcsczk6BFeNrQU/8TkrdkB0A3S5Z5KVOyQRuuQZbyxCNG7j48OW0EwohGifjRNjgQ1A/E2i
	2bAUKtaiizRIcI11UpdkLvNfVflR2F+az9eL1x6CTs3B3xohrAQB0Aj2bvcwuTp+3jxz7OV9v0YzR
	mGuvSmNhPRAna9cb8w8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU11-00000003nAe-0kIU;
	Thu, 31 Jul 2025 14:12:15 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTKb-00000003h5v-0SGI
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 13:28:26 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e3d2ad9180so1722275ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753968504; x=1754573304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZXm9ki9DqMqybY0nwzk30YMFU8vNsqP6e+BF0/SCW8=;
        b=PGW5nyqNCYZincOBah1fOhfBnHiW2yJvRRC9St759WGmZ0Ir3C9LnYFlRJBPsazM9v
         htMt05fgMZCL5TlHvveP+z2MO6uzhxqi0lhl9H2NraxGoLLhR6pPDjkuWhH0kjwgECdw
         HUweDjSVrOmXiHtcztloaUZ9W5zP/v79b6fXUhQX0Jrft8dxwafY+7uJRuzICLzNC2IE
         GpqEbHV/7PioIUPg7fmackoZaDmklHqmYr7Ox0miEci+2CshErSzP06mi+g4DEfSwskX
         WkGRcdHh34RIs7xkUgBTWlLomjWscaY3mhx76GMzHYK6FasBTxEv21neJdCSbGsCckE0
         vqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753968504; x=1754573304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZXm9ki9DqMqybY0nwzk30YMFU8vNsqP6e+BF0/SCW8=;
        b=PV1ss5ZP3jd0TLjiaDohw3kZBFX+dFcCc9HID/BDY5gvgqYu6sX9JwsKML74Xlctqi
         IhAo2yz6s8cw+q2M1KHQWDxBoiwAquwU6kDXqIxaiA/9ink+lYFfZkLkQ3wqICtufx+3
         rMIxbOPdbWOWQuabKjhY+g0IXlbFJztK2m+Z732KxeC8rnEY0aovnByGWKenf2b01IZv
         W0Uj/vUW6Cb3yUusnNcjp7QN7074DaVEX6Nr5ElnYnat5CBc5WuI/PJUvArrFNWPpEEz
         iFelAc/ssgM6aezgGeoCPA9YHaimT4R9IDoCNY1C4EF4e2wPuHOvRUfUjEUp+z8x3Ndg
         YdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2RyKwpObdQ3uoI4Ff5TNN1LP1K2Dc8PEJDwx+GyzKjWuH63cpB5XiWKLbMKcrg8/rmtaku9Hs/Spl9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1tav1LE5jQs5gpG7PrKD8jfnZtQ9nKu+Cz6m5kL8ka2eJNJG4
	tuvg+HG2uNcyaiBej0aZC5EuFWCndMuCA8oQVtHY5b05n7MYwSs0Cb/Lw/S3mu1GF8dL2BSN9ou
	V9qou
X-Gm-Gg: ASbGncs9Ft263Ay6l771jAXljiGsxoros2fYOQNmIqAC4js1/B70WApu+U9sjcjlAYJ
	g0yyd83FMse6Inb5yR9gBfN9gPcp1SpzCpIeGyk4KwT7KmNsj0IpxtJy/S8ae9AH7TaII8qF8Zj
	maAhkC6eNzXyWeXWdW4mv4PbBM6NxPOtbdw1XqUGqXGdiagGGRHCYNMOp/0znT9u2p4o5KetqDy
	uZtHlUp2gUChN/hZWJUPvoWx+QK5Gb40jO1Uh968pbcsZkyXCPZ5W2/m6WSa/3E7I5fmtxUSVnI
	chUMjeg7r0wQ/zKG1trlBMnZAGCQv1lFLrzcz2yNzN487lmk7lgFrnB2E0WDiDieeNUW3M1U7no
	8+ZiGS5HzXDOTUDBeEsnM5A6/+pCMBgC0tktnalQ/EXtz4AYegqSVTgkdNZXaDZcv7T2lyech
X-Google-Smtp-Source: AGHT+IHVd8Qk8sqX9PKUb1Vz0+PsKeeTL23Bh9mFH1nZ3uKrxB6affe8zrVEVY8SyiLFctiuAowOkQ==
X-Received: by 2002:a05:6e02:16cc:b0:3e3:fc32:3178 with SMTP id e9e14a558f8ab-3e3fc323db0mr107094465ab.8.1753968503711;
        Thu, 31 Jul 2025 06:28:23 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e402b34285sm6538805ab.57.2025.07.31.06.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 06:28:23 -0700 (PDT)
Message-ID: <e3cd0e11-e516-4cf6-b8f8-5cf2b5a236a4@riscstar.com>
Date: Thu, 31 Jul 2025 08:28:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux.amoon@gmail.com,
 troymitchell988@gmail.com, guodong@riscstar.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250726131003.3137282-1-elder@riscstar.com>
 <20250726131003.3137282-3-elder@riscstar.com>
 <20250731131827.GG1049189@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250731131827.GG1049189@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_062825_401313_D21B050D 
X-CRM114-Status: GOOD (  13.73  )
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

On 7/31/25 8:18 AM, Lee Jones wrote:
> On Sat, 26 Jul 2025, Alex Elder wrote:
> 
>> All devices supported by simple MFD use the same 8-bit register 8-bit
>> value regmap configuration.  There is an option available for a device
>> to specify a custom configuration, but no existing device uses it.
>>
>> Rather than requiring a "full" regmap configuration to be provided to
>> change only the max_register value, Lee Jones suggested allowing
>> max_register to be specified in the simple_mfd_data structure.  The
>> 8-bit register 8-bit configuration is still used by default, but
>> max_register is also applied if it is non-zero.
>>
>> If both regmap_config and max_register are provided, the max_register
>> field in the regmap_config structure is ignored.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> ---
>> v10: - Rename simple_regmap_config() -> simple_regmap_config_get()
>>       - Introduce simple_regmap_config_put() to free regmap_config
>>
>>   drivers/mfd/simple-mfd-i2c.c | 45 ++++++++++++++++++++++++++++++++----
>>   drivers/mfd/simple-mfd-i2c.h |  5 +---
>>   2 files changed, 41 insertions(+), 9 deletions(-)
> 
> This has gone from an in-function 11 line change to 50 lines and the
> inclusion of 2 new functions.  As much as I _really_ appreciate the time
> and effort you have put into this [0], the added complexity being added
> here doesn't sit right with me.  How would you like to go back to your
> v4 idea of providing a bespoke regmap_config for for device?

I LOVE this suggestion.  I will send v11 shortly and it will
be very much like v6 (or something like that).

> [0] Beers on me for sending you down this path!

I'm looking forward to seeing you again, beer or not.

Thanks Lee.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
