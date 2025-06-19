Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DABDC7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1/fSqdVpab0n518H4M2pYfLddraUg1teJbnYxC49XM=; b=12cZ7ae08AfVNR
	T5iD+Heen2ujG9upOVdWaxquvw2d+IasOuTpCG3JsnJ+jGrgIDDDxViFm6TWLVGbNRgcqX8jvToaH
	cxbbSqizJt9yEAWAawq5ejt4jT0G/HffN53RryY7AYGdTr8l+UbCqUbJtlyfURjNGQCeEuaErracu
	QcJaTjJ76zKh1eXiexfyiBs7h407QYY8p8fEZftAl3rxYQ9Qe0CPuoQq5zXcK31gGnGvHOkumhb4Q
	wcAB4NcR6nw1KjSlZcuHYFWcnqj/bqcmuo+qzkv2W5cU85ynI9fPIUwXiRpYwB/G4lg8ESN1ecZxe
	XOFVX8OMTpU2zij7Iz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHWI-0000000DYzL-3oMW;
	Thu, 19 Jun 2025 15:49:42 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFEi-0000000D9eV-1yEN
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:23:26 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4080548891fso195589b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750339403; x=1750944203; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8CfBC2bXTzgQwWZYshC/feOH//kuqxuZpnRg/tZqBY=;
        b=LYe8RVrZXz5ROfzcrV5iO6tPR0aAN4V24rWbBwoYErK3G7hvkNLSWJUOl4CWCYC6/v
         uTcGX91CrW2BgMtFNyEOfjLl23Dtg/pl8fbt9Ywq2qrDDfqzl1ccUMTp2r43WcdgTtaa
         uBYXLiBV5WYr3aea0OT7hhws9Tql0Axetxejz/Dmzileioo42LkGqfW+TryMQNb9P0G5
         MH+tSAs3S0wvOjRebOkaMpnUvThTfJqEFFYYSWZmZ/a53o46di+Ugk7meJUbY+HhxBT2
         xAFt1rIG5CAshpQ2pJioxoChUBVyUcNkBuFXHzU7xB1yvq9BRIT+XWteFXRO99vbiLRb
         A32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339403; x=1750944203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8CfBC2bXTzgQwWZYshC/feOH//kuqxuZpnRg/tZqBY=;
        b=IDSdedIteihh9rr2I2qEMZ++FE0Hi6lTbVqV/oPGTCabOQ8IFjiLhQSjZSZIex+8EX
         TbQvTxOkTLSrdPcWgrlx+2PM6dPLMyOfoFSQZTgS44fyUQ6APQTCoDztqJhYpuF0529D
         26ojR6PvFSTqxuZz8afOo5Q/xClbUcug/D5BA1fYt/IoRYIXz9CDusyl8DHtiibelKc4
         6dtuddrQJkuiMFQuLBJlWpgFnrgpvQ+ZIXfsnrlUPm9erMTX3rOfZlwPk05pc523oGYd
         bL7J/tLptOETdfsEFcNogeUUen+cctqvGOZsnlp8LrICtB2lRk0UPsQqKLTutf/+MjSW
         8xlA==
X-Forwarded-Encrypted: i=1; AJvYcCVYUSowiD+X6qA7H/IgwvE8cfOvOkYPUvoUUUfNU5+fABDWlQWu2rH4T+QtPQry/+f3G71OHymYAwoktA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2G0LkOSJsliRubtJwenhB1roGhWx49KtQC6EKbuAGZLyA6JZs
	4C8RN0GhAxplKZZRbzO6XK/3w6MkmvYcUYWkkX0SX+dilib5LNaZnWkaGdicwlERPO4=
X-Gm-Gg: ASbGncu266QHF05f5J1JWi94uzQz7zyKt7lOCd77EtQ8uRVza0LwetcTXRh684i++CX
	BhhFf2TP40sJYUwevhcb/SJoEcg534Gb9DuWsmkA6LekTW9tE0iBpidj3l5feQACTCq8Tz/B98V
	v+xJikSZFuoau19EKM4oV8Vlyq3oSID5PISgE+xSmWsva9yPYNdPh8Pr5lOndhMyqEhUMqQL4Rg
	RvX9VrzWoAFmaFjI1qpCzj8ZX5lS0QB3gLO5ng3zA4IyqwJFNXpGhf4YH/JVgXYrPMVeF0VuagR
	dpWqNPUrN1eRBweg8BPGTmKagk/z7LYtnMOAvvpv+apjqks+UXHEe2Rz+lphFCQ8Z8iW2fOI0fo
	GKYqdyM7BMvpYjZQyP0zSLgx8XQ==
X-Google-Smtp-Source: AGHT+IGY28hFmDr7ULoWj9fl8QS8bDjzI+smc76lgSZ1x1dv+k82B0BpK2D8Bz8W0iYI/okzRPVkRA==
X-Received: by 2002:a05:6808:2128:b0:3f4:1c2:874a with SMTP id 5614622812f47-40a7c23eabdmr13775263b6e.24.1750339403015;
        Thu, 19 Jun 2025 06:23:23 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a741b8837sm2759463b6e.46.2025.06.19.06.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:23:22 -0700 (PDT)
Message-ID: <13cd66da-dff4-4985-989d-d757fbae99e7@riscstar.com>
Date: Thu, 19 Jun 2025 08:23:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add support the SpacmiT P1 PMIC
To: Vivian Wang <wangruikang@iscas.ac.cn>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-2-elder@riscstar.com>
 <123a7558-fda9-4b56-b6ae-a29d704419ac@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <123a7558-fda9-4b56-b6ae-a29d704419ac@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_062324_749553_D0268E89 
X-CRM114-Status: GOOD (  14.24  )
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

On 6/19/25 1:03 AM, Vivian Wang wrote:
> Hi Alex,
> 
> Before the patch body, there's a typo in the subject line: "SpacmiT" ->
> "SpacemiT".

Thank you, I will fix that in v2, which I plan to post today.

					-Alex

> On 6/14/25 05:01, Alex Elder wrote:
>> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially we
>> only the regulators will be supported.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
>>
>> <snip>
>>
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        pmic@41 {
>> +            compatible = "spacemit,p1";
>> +            reg = <0x41>;
>> +            interrupts = <64>;
>> +
> 
> (Not really a review, just a note.)
> 
> I couldn't believe it at first, but it looks like the SpacemiT K1 really
> does have PLIC interrupt 64 dedicated to receiving PMIC interrupt [1]
> over pin "PMIC_INT_N".
> 
> Regards,
> Vivian "dramforever" Wang
> 
> [1]: https://developer.spacemit.com/documentation?token=AZsXwVrqaisaDGkUqMWcNuMVnPb
> 
>> <snip>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
