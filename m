Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A756C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOYD3rKvKdo3l/eT5MG1B6CrjbMBM27vnI5n2zYoLbc=; b=jUS/N8ObsH75z/
	qk5Vx9/umsAH2KSoy41GQNY6qwaSVWvEspqR6cV3odEvc4lIDQc0br5OlCESdxj7DBiIVqqcIvoIZ
	NcUgZdE9hSFsH5Kc0ZgGK+RIN5RpPed5bmJUJo3znCEjb7hXZB0w69PhxS5umF57JUaUq7LGWuLt9
	z686TYSaaswdPxjecB9mfhv+Q5AIIVX5OA1F7wZr0rFJr6/8DEXrdjnQ4S43IvYRU9t6QJivsSwwU
	vo+jL7li/ZJcz93y8hCXMKSEN2Zsy6ZuLnbC4yKi13VHyqGFrdBFr62Em6SSnlg0Nxvwr8Xf18L3i
	NB9V+9ACXUSGeFs1rI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEBy0-0000000HZGf-1BZz;
	Mon, 03 Jun 2024 17:59:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEBxx-0000000HZF3-1WCf
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 17:59:31 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2459B3FE5C
	for <linux-riscv@lists.infradead.org>; Mon,  3 Jun 2024 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1717437565;
	bh=NGNhTqQ1puFiyXl8JAY4ZMmpCE46IAqVnU13ZC7hB8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=t4Z5PXlTqdPGuA2urZ36V7CwiNTr4Oy4UAu5qCTWaNXMy/ACQay/jSrGrWCsrSB8Z
	 iposiVa5tnORkNdVZP6ttLKLKN+fkthsyWXOjGo8MKv7LNzLvep/ZL2PD0Lp2dmpDD
	 +IrAPHsQ7emaOQURxQQT2d1Yq8Fw2mu9DRsYNzTxPGVgPOQGpm8xD7og9S3thkBDYx
	 9dQ321CvvocTFqkTYuymHzSFv63kGtpCNShdETkeyUovFTnelOOV/lIDD6XgwI+Ag8
	 KD8E+abJtSyY/w4gJuPDiL/FUOZjOMOdWh/D/wSX8Y6e/odnFBIwNsrWuuWhzkYMD5
	 s1c+thjFwb+hw==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a68eb60d73cso6108466b.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 10:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717437564; x=1718042364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGNhTqQ1puFiyXl8JAY4ZMmpCE46IAqVnU13ZC7hB8k=;
        b=sp9cSFC2mpCw3lINXkwp4927tqfKmeoH2qkxIlS+baAQX9oSv8wh358QyEE5sOn30K
         E41jSj10frA8cxF05IWRxqBEXVA8Oyh5YOSD+t9EE3nwX77xTeQBU7E2LNiphyQf6ZSB
         WGefCuNkJ7z1MzLpoxfbtp6QSAmqszhnEbF1/CpxWErL7oN3uS2OYXKQENN+UPjW8oRY
         ktuhb1HVlfCeCcms4RqIctsTL7ww/LTiz5qxL4JMvqikZim7aidofQb8xrumUkL/siRt
         9HWXhIyzwcyh+f42/mmoKgx9UkLLr0Vq8fTUfSdcQzNriZ6BjLeGXWiVo+H7Z2bN5bW7
         j7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqpjVGjb9lzsV5dvej8u+HODBb305GRmgn8G8MXl0VE3pIUL/vsoQYsDxTJB96NkwMU+uUKNgYXzc7D/NP1PZxC1E1RXho99wfPcIKrT1K
X-Gm-Message-State: AOJu0YwpUGUiXZbi+fVc47BgPLu0RETELfst1w96THyoUJnlVnzZ4L/7
	l29ppsb+OUiCLX7hfdzMz6qQ+GLLrm95xivTTpc4LBAHqeIsZervmcveIjUmxVHtSxF621EUkhw
	A4WTaWSA6CP3RL6Y26Rs0fdbrQ9YuniOvl0/a+mHklE1dSzMXf+3RrfLJ+R1s5FozDx9onrxg8o
	K8LCXN9A==
X-Received: by 2002:a17:906:a985:b0:a59:9c58:763a with SMTP id a640c23a62f3a-a6820902b4bmr606925066b.46.1717437564354;
        Mon, 03 Jun 2024 10:59:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtG7dbqJYpRx2MknxitYZaS+Oa0hsRvMnbn+9VSSfDEbOmEheu0+SmHp7vtsXcmGpJsSf7CA==
X-Received: by 2002:a17:906:a985:b0:a59:9c58:763a with SMTP id a640c23a62f3a-a6820902b4bmr606924166b.46.1717437563874;
        Mon, 03 Jun 2024 10:59:23 -0700 (PDT)
Received: from ?IPV6:2a00:20:d00b:f75d:4268:6ea6:3e93:63b4? ([2a00:20:d00b:f75d:4268:6ea6:3e93:63b4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68afbaac03sm395655666b.149.2024.06.03.10.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 10:59:23 -0700 (PDT)
Message-ID: <0eb3b03d-f817-4f6d-8a29-abf87c3632f6@canonical.com>
Date: Mon, 3 Jun 2024 19:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: Update flash partition layout
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, duwe@suse.de,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 matthias.bgg@kernel.org, kernel@esmil.dk, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
References: <20240603150759.9643-1-matthias.bgg@kernel.org>
 <CAJM55Z82+_RL1Z+DCW+_xgE7ZMmiWdPekCt6qtREPXg1jB+68g@mail.gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAJM55Z82+_RL1Z+DCW+_xgE7ZMmiWdPekCt6qtREPXg1jB+68g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_105929_819711_78E15CD9 
X-CRM114-Status: GOOD (  17.98  )
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

On 6/3/24 18:10, Emil Renner Berthing wrote:
> matthias.bgg@ wrote:
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> Up to now, the describe flash partition layout has some gaps.
>> Use the whole flash chip by getting rid of the gaps.
>>
>> Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Hi Matthias,
> 
> Thanks for the patch.
> 
>>
>> ---
>>
>>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index 8ff6ea64f0489..37b4c294ffcc5 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -321,16 +321,13 @@ partitions {
>>   			#size-cells = <1>;
>>
>>   			spl@0 {
>> -				reg = <0x0 0x80000>;
>> +				reg = <0x0 0xf0000>;
> 
> ..this is definitely fine, but..
> 
>>   			};
>>   			uboot-env@f0000 {
>>   				reg = <0xf0000 0x10000>;
>>   			};
>>   			uboot@100000 {
>> -				reg = <0x100000 0x400000>;
>> -			};
>> -			reserved-data@600000 {
>> -				reg = <0x600000 0xa00000>;
>> +				reg = <0x100000 0xf00000>;
> 
> Do we know that all of the VF2 1.2A, VF2 1.3B and Milk-V Mars boards have at
> least 15kB SPI flash chips? In other words were there a reason this previously
> ended at 10kB?
> 
> Also it looks like my Mars board and VF2 1.3B both report discovering a
> "gd25lq128d" chip of 16kB, so why stop at 15kB?

Hello Emil,

0xf00000 (15 MiB) is the value of the size-cell. gd25lq128d has 128 Mbit 
(=16 MiB).

Cf. the examples in 
Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml

The prior partition scheme had a partition 'reserved-data' also ending 
at 16 MiB. We don't change the expected size with the current patch.

Best regards

Heinrich

> 
> /Emil


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
