Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926B0C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1P8lGrylyeoTcwyhzHWVbCfy6KQgTVYH2XPCBI77k4=; b=Vmx8MBj0VqKY1LQipXyxLUKaJM
	HsU1TQjDq1XZM769+/JNnW1aI1xPIGyqJD8K8OHj3gN9H2f1pbqD7ERy47dzEA2lToHHRsH9qV2G+
	BVuULh6npLdIYnLUJkYuoM97U98z7aM4/laAkbEife5TisUpHnpXd88kjZiQJGqVQ0svsb8DLULP5
	rJyPprdpNBZpNjh663pV43GZFdYJxSaH7V97WEfmFn6m3vKzqLK/N8GnEmiYNjtXFYaWephBA/yCH
	+0egFW5nq1dBtcX4M0jS4vWbkKtGr1PaM7YvQSE6+gkM4po/MJArbinioZbIJ6W+BFhQboR77jkza
	ZxiXvYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uPd-00HEeG-VX; Mon, 27 Dec 2021 18:07:57 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1uPa-00HEdG-Ua
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 18:07:56 +0000
Received: by mail-oi1-x22b.google.com with SMTP id j185so26378824oif.8
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Audc9/8veHwTnYa6n859XP13Kx3/NHMhaJHptez5b5U=;
 b=UKT/P2ganrdFmPsTRxvMHXnv9t5wT2kTA7SsNzwG9G1SjX9dgMh6w2cquS+QckffYr
 e1Yzr767mNh/2b5CqHqfEiP2xGIqxmCNSb948yi6wckpkfJeXtWm7fmnvb3Ov9jC97W+
 55abkiDeLtG2VzHPT4Yril/1U1T84EG4OBvvOhffu3DgBDCQ9xHAEQnjpeXzn6u5CCil
 kUBxFyTzrGzsUiODxlLxg8becaMZAKmTQzteMmZWhicLZrLR+1SUcS9lx3hhBBNLMkGD
 N8+ZNZ+nWVcvlFMqH4UMhd2+A4X64jAGgpGSM56lm4ozvVfNE5SfrlEiFmm6roY8ShRj
 EhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Audc9/8veHwTnYa6n859XP13Kx3/NHMhaJHptez5b5U=;
 b=jyswMt3RxJyLFEjgR6L6mJFjmSvDTqe6g3ze8d8qGiKcse+5Pa2bac5O0E4Oew9BET
 yt9dSSX/VOhL1I4xKyc8lv+kv7+psbzJHblr+dp5RktE3Jbl3PeCDUx7+IYyLMAfG5dD
 Qyl3o5sSx/tsXnfuDxXdDpgWX5hGMgw4R7vAmiJ7FfSXB4vbxVV0ZOcostsWha92iCRc
 h/3kq+bRQ9+9haBZ/id7W14RLFOCiCvEX3YPXCDAqUnW2oPmMLZ41DluEFhpa7Ib/BhR
 4eQXxENA+aYEkDHo8eUnMwMFzDPvzmOyGPUxQ/+AGOE0JBAMqPwbUfAMmNdzj3fOU9yH
 DXsg==
X-Gm-Message-State: AOAM533zQ4ffX4hvxFJO0gujbWWYKbVxk3he1K97WcmvYtO7lpunD+dC
 ld8tYCApwOburRAXV+J4CZ0=
X-Google-Smtp-Source: ABdhPJyyvxX7VmsV15kxuxZ4I9wlhGyu+6oljhtpDZK5o0QafREMZXuc9FYqPpLqiVi0Ce6stDhHDQ==
X-Received: by 2002:a54:4613:: with SMTP id p19mr13541470oip.162.1640628473685; 
 Mon, 27 Dec 2021 10:07:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r13sm2683591oth.21.2021.12.27.10.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Dec 2021 10:07:53 -0800 (PST)
Subject: Re: [RFC 13/32] hwmon: Kconfig: add HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann
 <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-14-schnelle@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <838dd1ad-e77d-98d1-de04-46ff79c9575e@roeck-us.net>
Date: Mon, 27 Dec 2021 10:07:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227164317.4146918-14-schnelle@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_100755_046874_6519D600 
X-CRM114-Status: GOOD (  17.74  )
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

On 12/27/21 8:42 AM, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
> 

Similar to watchdog, I don't understand when HAS_IOPORT is needed and when not,
as there are more hwmon drivers using IO ports than the ones listed below.

Guenter

> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>   drivers/hwmon/Kconfig | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 09397562c396..c1a2d8ac96fd 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -547,6 +547,7 @@ config SENSORS_SPARX5
>   
>   config SENSORS_F71805F
>   	tristate "Fintek F71805F/FG, F71806F/FG and F71872F/FG"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	help
>   	  If you say yes here you get support for hardware monitoring
> @@ -558,6 +559,7 @@ config SENSORS_F71805F
>   
>   config SENSORS_F71882FG
>   	tristate "Fintek F71882FG and compatibles"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	help
>   	  If you say yes here you get support for hardware monitoring
> @@ -761,6 +763,7 @@ config SENSORS_CORETEMP
>   
>   config SENSORS_IT87
>   	tristate "ITE IT87xx and compatibles"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	select HWMON_VID
>   	help
> @@ -1387,6 +1390,7 @@ config SENSORS_LM95245
>   
>   config SENSORS_PC87360
>   	tristate "National Semiconductor PC87360 family"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	select HWMON_VID
>   	help
> @@ -1401,6 +1405,7 @@ config SENSORS_PC87360
>   
>   config SENSORS_PC87427
>   	tristate "National Semiconductor PC87427"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	help
>   	  If you say yes here you get access to the hardware monitoring
> @@ -1432,6 +1437,7 @@ config SENSORS_NTC_THERMISTOR
>   
>   config SENSORS_NCT6683
>   	tristate "Nuvoton NCT6683D"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	help
>   	  If you say yes here you get support for the hardware monitoring
> @@ -1442,6 +1448,7 @@ config SENSORS_NCT6683
>   
>   config SENSORS_NCT6775
>   	tristate "Nuvoton NCT6775F and compatibles"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	depends on ACPI_WMI || ACPI_WMI=n
>   	select HWMON_VID
> @@ -1664,6 +1671,7 @@ config SENSORS_SIS5595
>   
>   config SENSORS_DME1737
>   	tristate "SMSC DME1737, SCH311x and compatibles"
> +	depends on HAS_IOPORT
>   	depends on I2C && !PPC
>   	select HWMON_VID
>   	help
> @@ -1707,6 +1715,7 @@ config SENSORS_EMC6W201
>   
>   config SENSORS_SMSC47M1
>   	tristate "SMSC LPC47M10x and compatibles"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	help
>   	  If you say yes here you get support for the integrated fan
> @@ -1741,6 +1750,7 @@ config SENSORS_SMSC47M192
>   
>   config SENSORS_SMSC47B397
>   	tristate "SMSC LPC47B397-NC"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	help
>   	  If you say yes here you get support for the SMSC LPC47B397-NC
> @@ -1754,6 +1764,7 @@ config SENSORS_SCH56XX_COMMON
>   
>   config SENSORS_SCH5627
>   	tristate "SMSC SCH5627"
> +	depends on HAS_IOPORT
>   	depends on !PPC && WATCHDOG
>   	select SENSORS_SCH56XX_COMMON
>   	select WATCHDOG_CORE
> @@ -1767,6 +1778,7 @@ config SENSORS_SCH5627
>   
>   config SENSORS_SCH5636
>   	tristate "SMSC SCH5636"
> +	depends on HAS_IOPORT
>   	depends on !PPC && WATCHDOG
>   	select SENSORS_SCH56XX_COMMON
>   	select WATCHDOG_CORE
> @@ -1995,6 +2007,7 @@ config SENSORS_VIA686A
>   
>   config SENSORS_VT1211
>   	tristate "VIA VT1211"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	select HWMON_VID
>   	help
> @@ -2114,6 +2127,7 @@ config SENSORS_W83L786NG
>   
>   config SENSORS_W83627HF
>   	tristate "Winbond W83627HF, W83627THF, W83637HF, W83687THF, W83697HF"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	select HWMON_VID
>   	help
> @@ -2126,6 +2140,7 @@ config SENSORS_W83627HF
>   
>   config SENSORS_W83627EHF
>   	tristate "Winbond W83627EHF/EHG/DHG/UHG, W83667HG"
> +	depends on HAS_IOPORT
>   	depends on !PPC
>   	select HWMON_VID
>   	help
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
