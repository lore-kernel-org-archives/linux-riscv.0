Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DC9C2BD09
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jul 2024 01:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFe0jCQNz5kj7wKFMuyroxlnfMZo2uwJPdQ1XVDWEFk=; b=H70glfpyDJhj2b
	+IVRrZKFFp1ckk4anEVKBSlOkcrszFzwXCFtWyF2tjcenHrQeM/WJoamLYklmaC5Oa7wjTYT02PbQ
	IHqfqWiwWhrcoteT/esrkrmYuK582lsb/CbP312dAWAeggXcZ3KdC8Hym+DqhDqsCrxLrq9JktcK/
	udfAg8XMsudwljzNBNoju70mmhnGbOZ5RwYtlRxroxIQ73DwLJezRYMtdH8/d0CXcuxPHEP/gqXYI
	cSvKzM5v8aU9AxmWU9nNmQZcCLQ/JjkxpP8NM6S7DvRKtk5uEpraHrCZBt2Z/o73tAjA0HwwsnXM5
	uLH0mI0o+79CsH8HbD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQGoX-00000001Dbc-1PwH;
	Sun, 07 Jul 2024 01:35:41 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQGoU-00000001Db8-39u1
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jul 2024 01:35:40 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2c961b5f215so1628310a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 Jul 2024 18:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720316138; x=1720920938; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nsguKa8Fd9DPaCpX9PzRwBcETLMtI48yaYMApWrDjW8=;
        b=OaZCa2QagTdY33cCh/ONZOOigmydRT8RYa7PaDhRXoBm6kGnp/sEM3FjOhPboSLQtI
         FBNijYTKz4+AZL4FzI+04aLsQlr9/TLVgsdLuj8kXSXOkg0jyehBLa6ZJE5k+i8g3Aq7
         jdK/Kso+11qjq9cvvXmLcsvqQ9qKbHh7VgZly44e8KBj8KzwNbtgwlBRlOLGEH+HCK1X
         0CUQZHNa42RmkJhfsuiwu1p6G7bqu/7/hb7LnPSUIRD8teTjkdFSKQ7ljeAg/fLfzW7W
         pNXhjiSd4/pp89d6arRY1hbYZW/5TXev3pLW8BqLyqZZRWpw2Lf/fLlWiEhvu4DjFw1g
         M3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720316138; x=1720920938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsguKa8Fd9DPaCpX9PzRwBcETLMtI48yaYMApWrDjW8=;
        b=fsic9a5s28vrOCshugJdrKVa/ce8UCU7byvaa0Q5DNsZEzXfGtoFQv6kRch/IfVM+w
         IZwIHKp+ziztz9VUW9AddYiL32XjLshhQM+hz4Nzx5wWVj2MS5UrxKnp84B2/MpBALso
         Ob/NYDsJ1My+QX2roTv8oulln+RqjgzdvTmnOyDvu+DZIkCiOjI7I33eMPdreDN1s3i4
         ElIXctLv+dIUzswGjU6cmWHbV195qSSEax2ja2RAdNnkp8dg+AnL7XBiWcWsjtUiXS66
         V8y0pkdrVo9KlWEqFLj3fAYmD0mWdepfnHZqCGQchZSlv4uE/c1TUIKTn8E8T7+cl0xs
         j/KA==
X-Forwarded-Encrypted: i=1; AJvYcCWo4GGRjb8jKvfs2rNwClsK/G4YUp8eoFCchnKWAkvY53IuxMnfXs0IA+an5pKN6FEz8DZ9SWBgIGnrngwTti0BsyDxTjkJHSsI5Q6qbhak
X-Gm-Message-State: AOJu0YxcmMS28NT2t4Wu56KX1DwtfMyDjnOkPC+9CM0kXdhyxRtwuIhT
	aLAvNj54tDAA9hMFu/zdcrtGufQithjZG+8JKg0/KyHfyUOdBMP+
X-Google-Smtp-Source: AGHT+IFoUAJxvVZfvCiN/bhFxXLAbSuX+gKzkgcu8uug+VjJ8+a7o3oqyy5WCYAmmuP/vmkix0XODg==
X-Received: by 2002:a05:6a20:9146:b0:1c0:dfb3:4214 with SMTP id adf61e73a8af0-1c0dfb345bemr3921383637.38.1720316137656;
        Sat, 06 Jul 2024 18:35:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb3ce7144esm48053225ad.300.2024.07.06.18.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 18:35:36 -0700 (PDT)
Message-ID: <a0337b42-4cce-42f4-91f6-eca65c62ed47@roeck-us.net>
Date: Sat, 6 Jul 2024 18:35:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <IA1PR20MB4953967EA6AF3A6EFAE6AB10BBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953F58B631D836F3863115ABBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <5a2e23f4-d54a-45ae-a09d-e557b110e017@roeck-us.net>
 <IA1PR20MB49539E946C2D5D025932ABEEBBD82@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <IA1PR20MB49539E946C2D5D025932ABEEBBD82@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_183538_837447_3B2404E2 
X-CRM114-Status: GOOD (  23.58  )
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

On 7/6/24 16:34, Inochi Amaoto wrote:
> On Sat, Jul 06, 2024 at 09:48:58AM GMT, Guenter Roeck wrote:
>> On Wed, Jul 03, 2024 at 10:30:43AM +0800, Inochi Amaoto wrote:
>>> Due to the design, Sophgo SG2042 use an external MCU to provide
>>> hardware information, thermal information and reset control.
>>>
>>> Add bindings for this monitor device.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        | 43 +++++++++++++++++++
>>>   1 file changed, 43 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
>>>
>>> --
>>> 2.45.2
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
>>> new file mode 100644
>>> index 000000000000..f0667ac41d75
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
>>> @@ -0,0 +1,43 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/hwmon/sophgo,sg2042-hwmon-mcu.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Sophgo SG2042 onboard MCU support
>>> +
>>> +maintainers:
>>> +  - Inochi Amaoto <inochiama@outlook.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: sophgo,sg2042-hwmon-mcu
>>
>> According to the other patch, this actually covers four
>> distinct models/devices.
>>
>> static const struct sg2042_mcu_board_data[] = {
>>> +	{
>>> +		.id = 0x80,
>>> +		.name = "SG2042 evb x8",
>>> +	},
>>> +	{
>>> +		.id = 0x81,
>>> +		.name = "SG2042R evb",
>>> +	},
>>> +	{
>>> +		.id = 0x83,
>>> +		.name = "SG2042 evb x4",
>>> +	},
>>> +	{
>>> +		.id = 0x90,
>>> +		.name = "Milk-V Pioneer",
>>> +	},
>>> +};
>>> +
>>
>> Is it really appropriate to use a single compatible property for all of those ?
>>
>> Guenter
> 
> These board can only be detected at running time (even this should on
> a specific board). On real world, it can only sees a MCU onboard.
> I don't think it is a good idea to add some bindings to cover these
> model. It seems better to remove this array and let userspace to parse
> these ids.
> 

Isn't that what devicetree is for ? It should either not be necessary
to distinguish the models because they all behave the same and all of them
are happy with the same compatible property, or there is some difference
which should be reflected in devicetree. In other words, either they
are all compatible with sophgo,sg2042-hwmon-mcu, and sg2042_mcu_board_data
as well as sg2042_mcu_check_board() are unnecessary, or they are not
compatible and there should be separate compatible property names.
struct of_device_data does have a .data pointer for a reason, after all.

In yet other words, it seems odd to have a devicetree file for Milk-V Pioneer
and then to check in the hwmon driver if this is _really_ a Milk-V Pioneer
and bail out if it isn't. And I _really_ don't want to deal with continuous
driver patches whenever one of the systems using one of those MCUs starts
shipping a new firmware version or is deployed on a new board variant.

Thanks,
Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
