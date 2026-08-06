Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11297C5AC67
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHtA/n8hSrijFFVMX+ttDUpcOhjX97bjG5ggXtmPoy4=; b=CdWex2F5OiF9ao
	um16bCblEtqF64dW4TD/lFKLjKnGGhDRHh5knxJAdUnjaAwBIgSpOgHbKsY8w/nXHFjIzTscs92QJ
	Eqvh2A6Nyi3ajQIGzyitGpRTsr0T1ywwagdHAhtvV2qvIA+t076VrYFy/Xy50Slt/XY6isV0mgO0S
	AxmN6hLdemcyL+goHJonf5YI85Jga1Tr7W4KOdbwvNBr2PIoh7l3IVh+0+29AWnVgViD2hoyD0CZW
	BZ7ZhaKhLFFfxxQkUNqZOn9IdgB8QjzTPL0Y6gYyS8aHK+g4AA0I4YjNj8UZ2+xrPCa7CSreazoZS
	z7w0P24dA3WR7q9g+kxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3o2-00000006ZJ0-0N05;
	Thu, 06 Aug 2026 19:31:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3nx-00000006ZIa-2VQz
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 19:31:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso28297065ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2026 12:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786044661; x=1786649461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96I6v/AKBNTvV/KdjO4chCrzAPiR9Nz0WdXHIejWW6U=;
        b=ng5NbUsTuZA+dCaBH5IYigdjIEnLncf5Ae43CwZXemlzAXoAljKV6yh3edKcIve5Gw
         BwFeSJXG1sBsGq/fvuROntx4C32cOzXlDcWFM5tZKHJCYvieNkOHqMflrOLg+ZhhhCqG
         +XzYg0bxU6B4hNB4P1kDMRRqvG8lmCUqrOSmtCo3pxwBofv01h/apQxwdqaZb4uJppFq
         etBe1oyx+jTcK3z2XVB23ppXMp1KcU7kTwF0nph1UAAvgjlBg3dUoFLbm28d8YIii6XG
         KRkfUzHHCJUoOy+4OvarKiGfdCPPu/HiUaLD2SYX0XgDj4W03a8Q6wDc3qw1sFvMIge2
         besA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786044661; x=1786649461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96I6v/AKBNTvV/KdjO4chCrzAPiR9Nz0WdXHIejWW6U=;
        b=Eb3NXt113CpVJtkeCzX2YEapm2bMdS5okV87PXpSuqBxzMmINX7RQjP/9SLp+8Kovl
         rUPZSSA5ZK9cbMWtgTb8DpZv+zhKXr6yqECgfEskhiPMZx3QtF8RvbHmSKKHFCa29Hs6
         l0ZCpjwzKJaNNQterPKa32y727ZCSjuqODb0b59W/NK5EJ1wSNILv/ZjO48gg+Swjkw4
         Gw7/DCxXsguV1Rh1CIYFket/fs+x0XQyODxOHeXsuaMajRlzu9JCC3xOIENh+rf8rVVG
         01CglP5aJMqokUnxLoJrOJGUeJkG2w9CVibVmW138ZtfX8u7kGtpDbHerMxtGd8tcZ3g
         V/tQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxgUjHISZkBi+lwegkFp+0IZnSKb30I5OUhe7rpSTAV1JGaoMaNJUq/RCbutEdvdH0co4W4cVPOpG/Mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjhDdTBo5Z8nrvAT0niUhU6UVC5/9hrbiphgx6D9zZ184Fcrtc
	RSEBkswzR9w2zU5Yc64ONmuLra2fNFRaevM1lYSQLA3I/5X6frs6ClV/
X-Gm-Gg: AR+sD12gpvO6he5kXDpgSE8gpd3Js+FC5992uwmoOHyd6LcELWJqxkgwVKuzQ9jOCnf
	HjizYWezz0Lh5YIflVUqwueF060KbXSGYq2RSXRRTYq6Uon4B2M4ouw/2f6kfiQhKKRA94DKp+R
	B7J6urV0jsqhIVFZdsney49uYTkYwkqeORrVyvGTKDmwW64HzEZM+Fpc5VO3T/s3nicc+GMRjgA
	Zh+VACsjXW6Wvnhg6fjkRK3p/RifipZ9zNj5bAumhc3XVUkKGaoKwXQw+cwPmkMcAPA/tPqw36F
	Ou72AcYpsTwTYfCWlEn2Nbw6OFtfnJgord+C1S+bQSa/RxvurKmf4uvsxeaLpgXaWcaSFopE8Se
	Q/zpQy7razIri/vqjb7PXoz0rsOa7Mp/Migo7jlAnGdoHrNR+2B+arZFVz0kn16Ei93aXUue3nl
	31lXKo+/CYW/N7lzBxav4RZRiRP3Pn4bvWeBEZYNbLSwZVfthsDzFpwRuav0KV8fWwwM2Cf/tJZ
	1o=
X-Received: by 2002:a17:903:1a83:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2d106e81d72mr45720725ad.21.1786044660266;
        Thu, 06 Aug 2026 12:31:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d120c611casm1084905ad.83.2026.08.06.12.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 12:30:59 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:30:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v3 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Message-ID: <977654fc-d5e1-4d23-8ab3-286acd2dc372@roeck-us.net>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-4-b86c75d1c552@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-4-b86c75d1c552@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_123103_305557_91A0BD6D 
X-CRM114-Status: GOOD (  26.60  )
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

On Wed, Aug 05, 2026 at 02:00:54AM -0700, Troy Mitchell wrote:
> Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
> the LM63-style temperature, tachometer, and PWM register layout,
> while using a 12-bit local temperature register and requiring the
> ALERT/TACH pin to be configured for tachometer input.
> 
> Register an optional thermal cooling device when the device tree
> node provides #cooling-cells, allowing thermal zones to control
> the fan through the existing PWM path without changing behavior
> for existing LM63-family users.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/hwmon/lm63.rst |  22 +++
>  drivers/hwmon/Kconfig        |   8 +-
>  drivers/hwmon/lm63.c         | 414 +++++++++++++++++++++++++++++++++++--------
>  3 files changed, 366 insertions(+), 78 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm63.rst b/Documentation/hwmon/lm63.rst
> index 9e27367d7405..c40bd0dfe591 100644
> --- a/Documentation/hwmon/lm63.rst
> +++ b/Documentation/hwmon/lm63.rst
> @@ -33,6 +33,16 @@ Supported chips:
>  
>  	       http://www.national.com/pf/LM/LM96163.html
>  
> +  * Sensylink CTF2301
> +
> +    Prefix: 'ctf2301'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: https://www.sensylink.com/upload/1/net.sensylink.portal/1689557281035.pdf
> +
> +    Register description: https://github.com/TroyMitchell911/ctf2301-datasheet
> +
>  
>  Author: Jean Delvare <jdelvare@suse.de>
>  
> @@ -62,6 +72,8 @@ value have to be masked out. The value is still 16 bit in width.
>  
>  All temperature values are given in degrees Celsius. Resolution is 1.0
>  degree for the local temperature, 0.125 degree for the remote temperature.
> +The CTF2301 local temperature input and limit have a resolution of 0.0625
> +degree.
>  
>  The fan speed is measured using a tachometer. Contrary to most chips which
>  store the value in an 8-bit register and have a selectable clock divider
> @@ -93,3 +105,13 @@ support these GPIO lines at present.
>  The LM96163 is an enhanced version of LM63 with improved temperature accuracy
>  and better PWM resolution. For LM96163, the external temperature sensor type is
>  configurable as CPU embedded diode(1) or 3904 transistor(2).
> +
> +The CTF2301 is register-compatible with the LM63 family and provides 12 fan
> +control lookup table entries. It supports 8-bit PWM resolution when configured
> +for a 22.5 kHz PWM frequency.
> +
> +Device tree nodes may declare ``#cooling-cells`` to register the fan controller
> +with the thermal framework. The cooling state is mapped to the existing
> +``pwm1`` range from 0 to 255. The driver keeps the current automatic or manual
> +fan control mode during probe and switches to manual control when the thermal
> +framework first requests a cooling state.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d59..abb1af8664fb 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1501,10 +1501,10 @@ config SENSORS_LM63
>  	depends on I2C

This seems to be missing the THERMAL dependency as suggested by Sashiko.

...
> -enum chips { lm63, lm64, lm96163 };
> +enum chips { lm63, lm64, lm96163, ctf2301 };

Alphabetic order, please.

> +		if (data->kind == ctf2301) {
> +			msb = i2c_smbus_read_byte_data(client,
> +						       LM63_REG_LOCAL_TEMP);
> +			lsb = i2c_smbus_read_byte_data(client,
> +						       CTF2301_REG_LOCAL_TEMP_LSB);
> +			if (msb >= 0 && lsb >= 0) {
> +				data->temp8[0] = msb;

Why keep the assignments to data->temp8[0] and data->temp8[1] ?

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
