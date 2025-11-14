Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE016CEACCE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 20:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvYXNTwGsUzbLhO+v8MI6HeTLkXDh7b5VOcoIbIUTvs=; b=kGaJjkJC/gZb8B
	x3jvgYhga65xACcFI+zy/tH0bqvPGxjdKN7DPKzVDvSe8wOO0nImXpEjB7eprKbrk3F29AYfbmHlc
	7FiEZwKl3LskcE8GlTcFA2DYu3H6hlxwUCcBz4lFsj/7BelsWHEyVNLGaABDEjxFiguJJ/Xl6ikfC
	1OU2sGvXsg+uCt6tcDgTnWczhmjc94xewHHnv3/a6fiFJp4vJGsxmR3PZQ9OVimw65Mhtg4HjgE7F
	dF11B/NhdsKV6bXEEJXXXyqof67RCiGJ4tTVe4ZsrDVMVtY8NOV4NnyG1fSjqNiHZNk/dFS8Mi8RO
	NOqdviAqXXuDbeD428Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0Xi-0000000D5Xc-3Hjn;
	Fri, 14 Nov 2025 20:37:14 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0Xg-0000000D5XG-20h0
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 20:37:13 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-92aee734585so93716839f.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Nov 2025 12:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763152631; x=1763757431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2N7A4sphnOSNn2VwNdf5jHhtrwzomqOxdOIMs+gXosY=;
        b=qa8iWCwwgiH9HnGQa2P5ltbhx9bgIQVNVxM/jzkORdjkQdsuG5uv95bS/KB+9l5Tl8
         b7UiMD6aEH8Qdr8FrWVzXijaFaBVnS6XtHMCZWJdqZxo7QhvcEuV/0oVws+5Jk+VIuiH
         +g13jsY0AOJuHvT7rwCMHyNJ5PvA5u9qmViGpFxvL/CvzQpKPOE0S1mB7X9p7AUWdJs/
         t8a7gzv3wgJpaBOEqlFEkXMe66aWh6iABqSlPtcDl0gbPVVQwncQh7d5rCjC5AyVdKQe
         sGuzFKfuyVgQ5Dg7spG+E4BCU/33hk69PT1ZmzHVQjBBjajnSnfKnIglZPzPoUHKE49I
         ugXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763152631; x=1763757431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N7A4sphnOSNn2VwNdf5jHhtrwzomqOxdOIMs+gXosY=;
        b=EO3pQGK8oUn/5138pfMH0HMmt2w8DttJgRUUjbv6murP3tOoM0mRYGwiT/v2qYn8gi
         h4fldLqKeevqIr+mTE/bbegiBV3J1iL9qjKFOgn8qy09IpZEaoNPon9ioYfhbXi7DKbM
         K0RNrsA9pWQ0ma9W9FTvSh/35+3Retug6crMPKxaVVbl/hwLjzwY43VH6B/w9UNzM/yT
         /HG7M++LkfujQPVmN4Gyasw4rGDPvIMtzkJqzOMSEzN83anJx70B2LSLU8XT50uVenBG
         X4PPJ2NV1j/dyowqapIxduLP0IAjgGVFPEfpE8oajfyIJ8nn6TzdR0VG+EYh/xtKu5hO
         /GLg==
X-Forwarded-Encrypted: i=1; AJvYcCWDhOOs6HJZA2H7LSF/7rHyEwP2Q79zQZ+Q+ZuvxNTb5z2AU0kDhHUrmrpWxtfMnrdTrPxcGzN66+VS9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YztdEtjm4ZAzsrWZ8JpZT3L7MK/2e1LDjXWt4DrJfOqH81FGIw4
	GG1yWNuQr3u9SzyMzfgA6d+soPBSXVIFuSFwMQkzMonMdYw3+zYW2im0N+zYpa9gtoc=
X-Gm-Gg: ASbGnctUTMwPajf+lmr145+0XHjbYtiRjLDI4CQa/x6Cc1xXSg71dcirZkSrjTS5Pob
	95V7WYpVdkqj1raC/Ajv0YbxOjapaDEihQmcgwyg4NVfj/7yoyPWbmC2/hdJjH9NKweOoeLGIqv
	SRz5OxYc9pc0mZ9tOjFlPQ/mNGEGqZOvuTEiCnTRJiRJGwor257i38OXtXs/+OvWjOcD0XfiImY
	WuP0Xlntb7AU5AO5DIxvebkJRsIca3cvzRs2fZlvQkF65bsVt4u14ZidPrUS8ttu5THeRSnqKlz
	Wz7flQnCRCqDTVh3WNQMoAOfBVkUvdbmDxZ6PQt9uLGqAYv5QdI5PnZIYt+y6SwGSd5o7SYX7tj
	DUCWsmbAy9NJKKf7iXpCSnoBzPuj+IJCb1TLxwqoc54lMMluSR3DAiBDyVYajPdLMhJBXtu9Qv4
	q2efDEylBeux68WKnO2LZtAAY0JA/h3zhyNbphZyA92g5vihYHp/n9UdBePKs+
X-Google-Smtp-Source: AGHT+IEsFHp9+KTrH36IfqMNkMBqKDdgRHUJrYhyOx128Vw+1DZKY9oKj4WLZvRXlvy/+FFiqg/IEg==
X-Received: by 2002:a05:6e02:3c88:b0:433:767e:8f47 with SMTP id e9e14a558f8ab-4348c954ba8mr72409145ab.29.1763152631499;
        Fri, 14 Nov 2025 12:37:11 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434833c5eeasm33471855ab.5.2025.11.14.12.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 12:37:11 -0800 (PST)
Message-ID: <939d76d0-a535-4d7d-bc3b-9d92be9b782a@riscstar.com>
Date: Fri, 14 Nov 2025 14:37:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, broonie@kernel.org,
 dlan@gentoo.org
Cc: p.zabel@pengutronix.de, linux-spi@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251027125504.297033-1-elder@riscstar.com>
 <20251027125504.297033-3-elder@riscstar.com>
 <FFC4D2691116C9D4+aQAgeeG28SpSI7YR@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <FFC4D2691116C9D4+aQAgeeG28SpSI7YR@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_123712_788143_CB430BD9 
X-CRM114-Status: GOOD (  16.55  )
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

On 10/27/25 8:46 PM, Troy Mitchell wrote:
> On Mon, Oct 27, 2025 at 07:55:02AM -0500, Alex Elder wrote:
>> This patch introduces the driver for the SPI controller found in the
>> SpacemiT K1 SoC.  Currently the driver supports master mode only.
>> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
>> supports both PIO and DMA mode transfers.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/Kconfig           |   9 +
>>   drivers/spi/Makefile          |   1 +
>>   drivers/spi/spi-spacemit-k1.c | 965 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 975 insertions(+)
>>   create mode 100644 drivers/spi/spi-spacemit-k1.c
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index 4d8f00c850c14..2e933edab1718 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -1071,6 +1071,15 @@ config SPI_SG2044_NOR
>>   	  also supporting 3Byte address devices and 4Byte address
>>   	  devices.
>>   
>> +config SPI_SPACEMIT_K1
>> +	tristate "K1 SPI Controller"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on OF
>> +	imply MMP_PDMA if ARCH_SPACEMIT
>> +	default ARCH_SPACEMIT
> SPI needs to be a built-in feature?
> if not, how about:
> default m if ARCH_SPACEMIT

I finally implemented this today and while testing I found a
bug in the module removal code.  It's been more than two weeks
since I got any feedback on this series, and although I've been
holding back on posting I think it's time to send a new version.

In addition to this suggestion, I have two bug fixes plus your
Ack on patch 1, so I just posted v7.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
