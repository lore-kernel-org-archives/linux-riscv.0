Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9136DC61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bb4tkQNWlX2EQ3tLzbzM8f5hfPjhnNUmgcRy7e1o8NU=; b=xqcBOIcCKbpe8Q
	zpYyxOu25yT2oraSGhYCAMznXmsFkR7+HiEVGmtkjwnZSj+lHCcpdhUCQizaohQQPdV5Dju/hWapm
	PYWUf8MPLWczAtjaWR5S5y6cZa8kD1NaB6BAcID34FuEhrMHFiDp7JgEOCGjYNnWG/Zwm3dC+eqmh
	rwoEtGE5hhc4XvYRTmqcAHUx1/PoonwlLWM9Mmz2PTW0O5z0Z0DIaAoNwLdZp3DMyK/PdrmR0s/kj
	+os+FIMRedcYUg1ABKJzB2wAmv98QVVmCnZGWcxe9hiJpCUX/p5XJhV3cbAQp4XXA4tBsCYAFL47V
	i8Jd9E4xWrcKFV9zFYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gea-0000000E96g-0Wvb;
	Wed, 02 Sep 2026 08:49:08 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1geX-0000000E95O-10u0
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:49:06 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso662974a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 01:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338942; x=1788943742; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7aqc1YiIFFi2S/7+a4K7uWSUn18PjZkaszy4zjXDoY=;
        b=D+sRUxx1t7KA5u7+wlyDuMa68TucZKuuZDXsgW7H4LJd3lTKrTV4JEwqwwmJE7/nSQ
         KuB7AHd7uTegB30vxTHNQkCLozAA8PuMQkFElQb1V3VqEgmrcSrzj+IK1OfzO6J1Kv73
         gx4vYZn1M3knV5z1m6SXyD7lKxEjfhwoj0j4Ru4llqUbwpcg63555mBTDTl0T04DuuXM
         /cjAAmsv4FbHv4j9NQpdrAziKns6ei9419aVvrzLZOuk+h8/tpQuxHv4ah2298431sVX
         /R5W/TxX/3X4VbVrSQz6Y/RSarVwvKWFBWVSAvxxxBYwvbWecwDVY8H9RHV5/ppK7zaR
         27jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338942; x=1788943742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7aqc1YiIFFi2S/7+a4K7uWSUn18PjZkaszy4zjXDoY=;
        b=Mbdlq4XmmCQrqI+VGa2ypPqI3cCuASr/IAugy4Fq2YKkC/3sM8XucUWzUE5L0oZ90v
         06lVYPzvMHDn3UyiXKn2lxhXfhT3KAjkh2wNWQhbe9hUghDc12/N58Q4Vve16BAy4XDK
         fH9v85CVx3Vmj61om7AG24haSWibEFUKpotvgf7BF01QYJjNL5xxd9Dsz3cumksrx6+/
         kmEybbCpCJBkNEqqzf6/2YqX4OEE0Fd907tfoHobCIQTvSrHmhEKhCRJ8Rj3ZXAswUX0
         haR6MmAVVUvUVyKugfDG8ufULawQpCDp5GB2t0+7JyAVnHPnwc0bFEBgz97SDj0vpV82
         cNag==
X-Forwarded-Encrypted: i=1; AKwUvBx7UaiTEbXwn9JLOTVhfNQ65lfolcf+x6VHveFkc7NDk3mhrYbe8FiAPbfTy4br/c5VIzR9hxXsxtIFJg==@lists.infradead.org
X-Gm-Message-State: AFuF++nOCxBmwoFgZwuwRQPe7ccnsWY3IkZvu7GWY6ULAA9ApjoC5u/P
	YAwNr1UebycfvHzg59BEuikr9z84tXjEJFIv2Sp6MOBWAPPFpYKX4Dob
X-Gm-Gg: AYBFou3NGvve72j8enu+CpzVJ+SHn8dxuZmAYLBdW11plIRqTZSIcR7ibYQ8YjM+Dzg
	VcvYFBgIY0u6bK1LolKgcD3axnMUt5FneRmfLSPt7wJgz0UmgtTcPF71zkp7V+Avlq7eU2DrTwk
	B1s6y9gBR+gxY6mEGOjcErjx+gxkFt3JxIpAtqhaGFBW0OkQIwrsiMP67FMZWYA4mTggkXNEeav
	dA84I4TpW9FYB+Y+/1yaOrROG16f5EGkUTkK80620kYAZ0XdNL9R0qXexF84Y7FT8GRwJz5fl5f
	S6thVcUAs+csD3HgAAIuwBdA52vuIZZMJiibkzUP2K13A+zEhOYGqRGXoqJIr7Wxqnl8oF986lw
	53Tbst3V7KY4/3g9Ohi/EkAAYnzx8mFtX4JLZug93EvNMacwR0EPWfKBp2CGVg7yM/rGNrt1ByC
	2QDHmgpHPOtwesl0oSkl5K5RTXXJN+9Ue4Ne3shxOcwAM8zkHE7c1QLI+9+0TiKn8vfRlq6lwsC
	C/im1jSqxBxMwRq8Y47iDYifg==
X-Received: by 2002:a05:6402:21d4:b0:6a3:f63a:4997 with SMTP id 4fb4d7f45d1cf-6a682567131mr2048216a12.3.1788338942157;
        Wed, 02 Sep 2026 01:49:02 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895f29sm764636a12.2.2026.09.02.01.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:49:01 -0700 (PDT)
Message-ID: <0c5a657d-e134-49a7-b2cd-82f293685cb7@gmail.com>
Date: Wed, 2 Sep 2026 10:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marius Cristea <marius.cristea@microchip.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>,
 linux-riscv@lists.infradead.org
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
 <178813261957.2788519.4929586195765891569.b4-review@b4>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <178813261957.2788519.4929586195765891569.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_014905_303529_58ED437F 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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


On 8/31/26 01:30, Jonathan Cameron wrote:
>>   
>> diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
>> index 992f8930f95c..8dc644522b1e 100644
>> --- a/drivers/iio/dac/Makefile
>> +++ b/drivers/iio/dac/Makefile
>> @@ -18,6 +18,7 @@ obj-$(CONFIG_AD5446) += ad5446.o
>>   obj-$(CONFIG_AD5446_SPI) += ad5446-spi.o
>>   obj-$(CONFIG_AD5446_I2C) += ad5446-i2c.o
>>   obj-$(CONFIG_AD5449) += ad5449.o
>> +obj-$(CONFIG_AD5529R) += ad5529r.o
>>   obj-$(CONFIG_AD5592R_BASE) += ad5592r-base.o
>>   obj-$(CONFIG_AD5592R) += ad5592r.o
>>   obj-$(CONFIG_AD5593R) += ad5593r.o
>> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
>> new file mode 100644
>> index 000000000000..52601cbf28d5
>> --- /dev/null
>> +++ b/drivers/iio/dac/ad5529r.c
>> @@ -0,0 +1,536 @@
> Why do we need those outer () ?
>
> ...

The outer parenthesis are required by checkpatch for macros with complex values. The same pattern is also used by AD3552R_CH_DAC() in drivers/iio/dac/ad3552r.c

-Jan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
