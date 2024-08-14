Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C20C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 00:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dGsNgehvriY/3sES0ZNnEh8rplCeGYE8vy6yzUU3OE=; b=tWPDByvLo6PYwrcrZ5jLBmj71N
	PyHW4af96sxUU8Q9pML2RdKea86RowZK2oC9cVaoQvi2Rq2r7Bxo7n2dsLqCPudywyyypEAsp0fdz
	k2HBmOXyPDUqixsjwQBAZoSXE33SR3H3YimbcRXveKYo7diXocV5xoj4flydvSWlduiHWS+Pt0D0I
	sNyMIwem5diXLQt9vSzCUSXMGf+jYET/uy2aDgXLS/Njz48hw0p02N5D4IMZ6FaNG2nPaBz0l5KVy
	13tQLD+am4eSfuxu8VavIp1MXLc5ZKBE/9FCljp6oETcV5SifRdxQ4rDHMKt3vU7ztxIdkT7CTUwm
	HVzHyBlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se2EL-00000005Ipl-1icV;
	Wed, 14 Aug 2024 00:51:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se2EI-00000005IpL-2rki
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 00:51:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fd90c2fc68so42432555ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 17:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723596670; x=1724201470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MqokAGWtlIdjeh5J6al0inMtByeR+m22lAwSRmhFIP4=;
        b=OdTFf/OHrxKZ/Gkz0GfJwN/jjvFaYA/+F0ZIRy9vkRFMMwqjnnlk9XPLA/RJKgIhnS
         4g6dm+GtH+f9D7tSIfdIt8cUR2elupC9OuHAwsbZB5YYY+FQaGPhIbCK4qFbqFLQWrBc
         94EQwD1XU+tLUUig0SBf7UJ6QUsEUma+PtgCPte1ymg/aWGPsON7/icRfZjR4rXosePq
         OSgXjQrWxrpZ0iroMYhby9zWr27Jk4UbYPYFqZ34ZL2Yb5jx3gZS8EltpDbf6h8a6Sfh
         ckQCffSHaDI6ZKBBhrNq/sL1yfp5/2bf+3JNg8Hlxcm46v+iSTCA2TmZbzqeGZHqDW2x
         LRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723596670; x=1724201470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqokAGWtlIdjeh5J6al0inMtByeR+m22lAwSRmhFIP4=;
        b=OmwCUNCZBCFyy6o+TbHjwkX+2puWd5/+TxwO2XEFrysx5ker1CyHDPLUmMfmvhHiw3
         agUnyDibptP4QYGJ8WZr/ovyD5vbGNDh70Xfizk8t91IraB+/pq9cBLK8iFgp8yF7/aZ
         g9pxb71fn1tWRQz+n2+MIXZPghW2MQen6HuAGGv7cUrvyfu2vYkSa93uBOloY+fxgF9P
         7QvUCvlWNyWN2Dr+doE6wy2MhxKwbwvAaIBvVItQ80il4OnfwXL9nQBMQBHh0QYrhtjO
         bQpEK3mZcJ3wK3GGXwFE7bqaD9NVp/hBJ9ddYOLC/83mYiJv88IUap8x7aC/HyAYBXS6
         6wkg==
X-Forwarded-Encrypted: i=1; AJvYcCVytL/nCcBCgo07uM9bwAIoNMwszjfkiKwCR/o/y2uj5yq/FoniRyp127L06TgKkzEUTDG5EMSN/CPgWd6NI/+t9IH/w6AXfaihIwdzZONN
X-Gm-Message-State: AOJu0YweOGU40cU35ovWX27EuqjIJX+31reEuiIv23pYkwrQDEz7PkiX
	WOWE1KA/AQWZN1RhsGwRp9aZoSjeTL1D2EAN68937M9r2K5oV4FbilVO2A==
X-Google-Smtp-Source: AGHT+IEjcEusNP2EwTHeMIM7dAvVS+Itgk1tZJzCE9EhuGxRLmWxxHPSkb9YZXf4uztTeRPKTYmuQA==
X-Received: by 2002:a17:902:c943:b0:1fd:9269:72f0 with SMTP id d9443c01a7336-201d64a5b41mr14997205ad.47.1723596669478;
        Tue, 13 Aug 2024 17:51:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1d0b4esm19159665ad.288.2024.08.13.17.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 17:51:08 -0700 (PDT)
Message-ID: <d501bed8-ed06-41aa-b628-37ccd1bbb802@roeck-us.net>
Date: Tue, 13 Aug 2024 17:51:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>
References: <IA1PR20MB4953C5DB4AC5DF01236CE785BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953936E4916334E1A234962BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <0e30eab7-e202-4639-863d-85ce28525714@roeck-us.net>
 <IA1PR20MB495356094952242D9CD8A249BB872@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <IA1PR20MB495356094952242D9CD8A249BB872@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_175110_767200_1754BE16 
X-CRM114-Status: GOOD (  14.93  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Drew Fustini <dfustini@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Chen Wang <unicorn_wang@outlook.com>, linux-doc@vger.kernel.org, Chao Wei <chao.wei@sophgo.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/13/24 17:40, Inochi Amaoto wrote:
> On Tue, Aug 13, 2024 at 11:27:11AM GMT, Guenter Roeck wrote:
>> On Sat, Aug 10, 2024 at 04:03:51PM +0800, Inochi Amaoto wrote:
>>> SG2042 use an external MCU to provide basic hardware information
>>> and thermal sensors.
>>>
>>> Add driver support for the onboard MCU of SG2042.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> Tested-by: Chen Wang <unicorn_wang@outlook.com>
>>> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
>>> ---
>>>   Documentation/hwmon/index.rst      |   1 +
>>>   Documentation/hwmon/sg2042-mcu.rst |  77 ++++++
>>>   drivers/hwmon/Kconfig              |  11 +
>>>   drivers/hwmon/Makefile             |   1 +
>>>   drivers/hwmon/sg2042-mcu.c         | 388 +++++++++++++++++++++++++++++
>>>   5 files changed, 478 insertions(+)
>>>   create mode 100644 Documentation/hwmon/sg2042-mcu.rst
>>>   create mode 100644 drivers/hwmon/sg2042-mcu.c
>>>
>>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>>> index 913c11390a45..ea3b5be8fe4f 100644
>>> --- a/Documentation/hwmon/index.rst
>>> +++ b/Documentation/hwmon/index.rst
>>> @@ -206,6 +206,7 @@ Hardware Monitoring Kernel Drivers
>>>      sch5636
>>>      scpi-hwmon
>>>      sfctemp
>>> +   sg2042-mcu
>>>      sht15
>>>      sht21
>>>      sht3x
>>> diff --git a/Documentation/hwmon/sg2042-mcu.rst b/Documentation/hwmon/sg2042-mcu.rst
>>> new file mode 100644
>>> index 000000000000..18a3578ac213
>>> --- /dev/null
>>> +++ b/Documentation/hwmon/sg2042-mcu.rst
>>> @@ -0,0 +1,77 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +Kernel driver sg2042-mcu
>>> +========================
>>> +
>>> +Supported chips:
>>> +
>>> +  * Onboard MCU for sg2042
>>> +
>>> +    Addresses scanned: -
>>> +
>>> +    Prefix: 'sg2042-mcu'
>>> +
>>> +Authors:
>>> +
>>> +  - Inochi Amaoto <inochiama@outlook.com>
>>> +
>>> +Description
>>> +-----------
>>> +
>>> +This driver supprts hardware monitoring for onboard MCU with
>>> +i2c interface.
>>> +
>>> +Usage Notes
>>> +-----------
>>> +
>>> +This driver does not auto-detect devices. You will have to instantiate
>>> +the devices explicitly.
>>> +Please see Documentation/i2c/instantiating-devices.rst for details.
>>> +
>>> +Sysfs Attributes
>>> +----------------
>>> +
>>> +The following table shows the standard entries support by the driver:
>>> +
>>> +================= =====================================================
>>> +Name              Description
>>> +================= =====================================================
>>> +temp1_input       Measured temperature of SoC
>>> +temp1_crit        Critical high temperature
>>> +temp1_crit_hyst   hysteresis temperature restore from Critical
>>> +temp2_input       Measured temperature of the base board
>>> +================= =====================================================
>>> +
>>> +The following table shows the extra entries support by the platform:
>>> +
>>
>> Those are attached to the i2c device, which should be mentioned.
> 
> I have mentioned this in the Description. Does this need to be
> mentioned here again?
> 

Here is where it is needed.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
