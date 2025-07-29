Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CACC87FCC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 21:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5Ik5Fz1MnZrrRR+2GuMFOOgoB0AMGikzKT6kDsn9Y8=; b=Eq9vKM3CP5+zev
	ja4Jju+zolByPkAgUuek1ezAWQGQXX5QyNqZbHA58IPAIE7UNUDkFW8KEG9YIUoCjk4/6vL8+XzNk
	cex6b6Qm7f3WEd5aluBraTBKNXJWTIDP6eQnuiCxlQr2DX6wBYc+AiIT6SBHBaO8KMvmOcZKNw8hq
	rlpZ/iJLM3qzt/f+ZpEBgK89AWxmXF08a9CPEZ9Ye/ZKVjI1BfzybjXg3J/DMolPOsIvepTPx85/3
	E7CMqkk7DOThtjAaa2YW4cXoz7VJEoCdG+qwfZbdUKm8PxTnowjenYcn6lrFW+uN4Wz0ZAkiw3PLv
	3vYVEcibL3LVe5X9zZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugs1r-0000000081t-1Onp;
	Tue, 29 Jul 2025 21:38:35 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrzM-000000007sh-3pLs
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 21:36:03 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e3ef0024acso2027605ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753824959; x=1754429759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6TTijnB+mf1Tx70AUpgzd27gcsp61CTxKy/bu5Mf0k=;
        b=soWFIecqRn/xMoGgDAN5aCKLv1V012EHQ5Wmps3FDVPFcsPt7Yi3tMp1DF65y8Qaxi
         aR4bp25K4casc0VP7Xj4p7v8mxv55UEohjEmMSCELZ5E307rrqvN/Eu9Ohgld9tWINuq
         BptAbSBuIHowFOBsWfbJB5k3cl7qs0K75qmGuU7YakIh5e03vMQjbySR37RwRryoWy/x
         JURCT8CLAyYYkNXivXEkXBRUHhVQ1xH3HCMw5Ibk81uCDXz+gowlxKmmah42mBpcAAM3
         9RP+sXUlfCsyytBNJW1MICZUlFv+A+WlUjK6ggB+NAUVjuo5GvV7rp8FLzvwlaPp7ijG
         6uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753824959; x=1754429759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6TTijnB+mf1Tx70AUpgzd27gcsp61CTxKy/bu5Mf0k=;
        b=AQW7vRYRWnsBeD/Du034XJhq/DJ8TxJB9SdCxOVYfl+eSNj//aiWvt0ukLkBPRLWOn
         2xxRYwpiSL3VqDcCMZtGwhyRHpX1jfTWxsWMT35HFsEE8QVpEtccquoDO1R5cdsqGKKK
         M02F37jvp4cmDazTY7iITNu+q9MeKVLBDamU7cOhpFiIQFeWPbmXMNkQxtKsnzZ3T1BY
         yu05Zwuy3wVr7TRiNwtQpP0/c3j6uRECPIwjzg8tF+6o1nuFeXGcokeltuUtWnnaFJ80
         P6YX5T2iRdt3DarxlqO4bI0PMFZ9Jnv336HzgKCeq+w1toM2SeoSbTVZYIbC6+2UXmGf
         BAVg==
X-Forwarded-Encrypted: i=1; AJvYcCW2aw11d7+x6y8NIohXC7kFT4kWFmldi7wvsnCXmCBEGlm7KgvWn02xBQ0FRpg1aQy8VOwjTd7vbHTccw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz00x/iw9XLssbqFH1NvUckOzKqdgYM9ouyqF+hYSyNk3+yU55/
	pByGvkKB1jBAejwlm1QXvFxdtzRFglKDo1W5zL0j+xzHKLgr4CKKDuqFyTi0/QYQzi8=
X-Gm-Gg: ASbGnctITBfXDILaWmu/YkiYBb6qqSII9q9C+aOQvo1B0uLpe8hLxWiZPoNk6raG6Tc
	XjfwbeNWsB+5hcZS/MKbumV8Z3DQYHNV0nliK8tKggqBZ/P2EENLGRuOtv55U93/ScXVwxWixVC
	UCKmpe5kA+LWmX2JezdPnqyQ+Eu5mghxwqOBU9+8e+M/xOFCLN0Y37ZGqaLNJ/PxL1U3i136U+B
	HMtK4W/snkHEg/uR1hG+DNu7K1m33eLI/z2W2JRXrm8gJ8fT+oxB8VqnV4juaEWs/x+URqkE1mm
	KgQ37Y45334xADcLE2y6lR99x8i6LYkuszgec+RX5UWg7fjQa8K10V51mDrRANrvoEoLjYr++mb
	XnkKoaz2yy2oYe/fOT/aK3S9zt9gU7nn7MGuAbNUFm2Qk5JRPsenq7tgDI2Yyng==
X-Google-Smtp-Source: AGHT+IH9yMoT3SyI/T66ZtxcPnZNldk6FIOoyhUi5kHT3q4ZE7dn1hQwAMIQq+oM/1pZl9ARWn7tQA==
X-Received: by 2002:a92:db50:0:b0:3e3:b3d0:26cf with SMTP id e9e14a558f8ab-3e3e97254b5mr53179065ab.10.1753824959544;
        Tue, 29 Jul 2025 14:35:59 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c9343739sm2781465173.69.2025.07.29.14.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:35:59 -0700 (PDT)
Message-ID: <79fde2dc-2370-4ec8-94eb-57715cfc2806@riscstar.com>
Date: Tue, 29 Jul 2025 16:35:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as
 clock names
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lkundrak@v3.sk,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 spacemit@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250728220002.599554-1-elder@riscstar.com>
 <20250728225319-GYA900803@gentoo>
 <20250729-reshuffle-contented-e6def76b540b@spud>
 <5c3f9f10-6a9d-45b4-80c0-09402b35bf47@riscstar.com>
 <20250729-clench-hastily-b80f11f73336@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250729-clench-hastily-b80f11f73336@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_143600_977927_C803F23B 
X-CRM114-Status: GOOD (  19.45  )
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

On 7/29/25 4:08 PM, Conor Dooley wrote:
> On Tue, Jul 29, 2025 at 04:04:05PM -0500, Alex Elder wrote:
>> On 7/29/25 12:54 PM, Conor Dooley wrote:
>>> On Tue, Jul 29, 2025 at 06:53:19AM +0800, Yixun Lan wrote:
>>>> Hi Alex,
>>>>
>>>> On 17:00 Mon 28 Jul     , Alex Elder wrote:
>>>>> There are two compatible strings defined in "8250.yaml" that require
>>>>> two clocks to be specified, along with their names:
>>>>>     - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
>>>>>     - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"
>>>>>
>>>>> When only one clock is used, the name is not required.  However there
>>>>> are two places that do specify a name:
>>>>>     - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
>>>>>       compatible serial device is named "main"
>>>>>     - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
>>>>>       serial device is named "uart"
>>>>>
>>>>> In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
>>>>> and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
>>>>> named clocks be used for the NXP platform mentioned above.  Extend that
>>>>> so that the two named clocks used by the SpacemiT platform are similarly
>>>>> restricted.
>>>>>
>>>>> Add "main" and "uart" as allowed names when a single clock is specified.
>>>>>
>>>>> Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
>>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>>> ---
>>>>>    .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
>>>>>    1 file changed, 14 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
>>>>> index e46bee8d25bf0..cef52ebd8f7da 100644
>>>>> --- a/Documentation/devicetree/bindings/serial/8250.yaml
>>>>> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
>>>>> @@ -61,11 +61,17 @@ allOf:
>>>>>                - const: uartclk
>>>>>                - const: reg
>>>> ..
>>>>>        else:
>>>> would it be better to drop this 'else', and moving following 'if' block
>>>> to the same level with "nxp,lpc1850-uart"?
>>>>
>>>> the reason here would avoid too many indentions if add more constraint in
>>>> the future if other SoC uart need different clock-names..
>>>
>>> I agree, it's more typical to do it that way I think to boot.
>>>
>>> Also, why is there a k1/lpc conditional bit that is not part of the
>>> allOf in addition to the bits in the allOf? Can that get merged with the
>>> allOf please?
>>
>> Are you talking about the blank line here?
> 
> No, I'm talking about what's down around line 270 in the binding.

Oh wow that's in a weird spot, and it might be redundant?

Anyway I'll work on getting that fixed too before I send
my next version.

					-Alex

>>
>>      then:
>>        oneOf:
>>          - required: [ clock-frequency ]
>>          - required: [ clocks ]
>>                             <------ this blank line
>>    - if:
>>        properties:
>>          compatible:
>>            contains:
>>              const: nxp,lpc1850-uart
>>      then:
>>
>> I didn't notice that before.  It got inserted with commit
>> d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
>> 'uartclk' and 'reg' for nxp,lpc1850-uart").
>>
>> If so, yes I'll remove that as well when I update the patch to
>> get rid of the else as Yixun suggests.
>>
>> Greg won't take this for a couple weeks so I'll hold off sending
>> v2 for a while.
>>
>> 					-Alex
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
