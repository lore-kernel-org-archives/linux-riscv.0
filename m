Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFF1CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gK2VHnfGh32S5OUbNtdiFNkgxDVJrP0K6hMsW8BafvE=; b=JsoSDuqh0JqYDb
	B1VM0ZWD+/m7DFGAMI6xXpsl7q2pXyhR1qRfKnLpwVNcBa4oSJsI9I54wWpQhOgYmHFoda23sMdHH
	ByIFUGpiAWUE0NlkI+dPAJ+pSe3XPizHXoqWfv1s3kguOFpKbo52JybMn2w9JqC4pdAoXnkUzboHY
	AktWLCqQFV2Gs8C9/NysCZg4qsaOh4XuSZs4r1pNUEEhYzgg9zVgetFTHMk05sgWVd1oidK4gBj9e
	vQPJjnY0G6qPjgSWSHAfjCIQtYW7ICt6GQtOWkpdh/XsjOGnG4bnMVqMd5e85oaD6UKpliirrzoQ1
	iT66AJMqtlG0KBNyl7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0igE-0000000ArW0-30le;
	Mon, 22 Sep 2025 15:42:18 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0igB-0000000ArUA-12CU
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 15:42:16 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-42485372dc6so24940725ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758555734; x=1759160534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCb28mlSlNfcpBhhz89Sqz+h4hruBEOLY8zc9ehwxLQ=;
        b=ndFaD6tK51A6zXKMQRzR//rTgB2L346AsETn4lPN5aR3YWkPRNbKf1A+gHrBLAp78X
         e9GtccWBDHU50k2cEoBOIsjtY04Q+HGL6xB8IRK+U1CBzGRrAJmQsYB8bBmMEqsuU8Mf
         WvMUyfPosSiPFkYy4+SA8p7ErQ8sOfAlsFR52XOSxxA1A7OCsH7HIyEAwKyzO5xL0YZT
         oK2KV1Y4YwCFufoNnRGVm5vaq2D0wmZ6l1cG6YZnS0p450Bg3xM7vXzX3aAn6LRmxI2X
         Kjhi/VEvd0/YR3AGHGzoK7hE1ym9GKSSQSytqbJ2D7doTrHWLEfgHqJioMmSuBwAkamN
         3hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555734; x=1759160534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCb28mlSlNfcpBhhz89Sqz+h4hruBEOLY8zc9ehwxLQ=;
        b=a8rbp5QFqRL6CQvokP/WnlcTWum2oIOsvHKADQcLY0/qjbI8Ti81DxZ9aGqgnCYF0J
         s19YRyFl+QX/BbTxHYv5L9LaO1qnUHfzvfuaiGpMcu+SoBvPgvuItnH1Ovcd1BXOP+CU
         qREgJg5FE9c7znpgubj5xcZTxEj/iRB/Uq0hjJP4EBY8TmJM0mJ9+TeBs8gKXTOC5tli
         HAE70EmPJFyh5HSjWnUpssp6t6ovc61cOVswawqoITp+xLKFoTh/5UdMRhSeAOUDkuAn
         vNw39B495XG8VGv0/as1adT4AH/dLkmzZXRdcQXAyAd5epkQXKmn3ExuAOfBW5OgcDVB
         n1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCX6YHuSkuZoRLmut/jv1itc+tLIaDTYATMLX9l09PPw2jru7oc3iGT9Lnzrrh/UI3HrTjPkPlmtrZ0UWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi5QAuIzY3H0bxf5dKex6rnfsNyKIbc9YoWZfx2/S2bLb5g/Cn
	EJ542neC73CsNjj68jVBQryIbaJH/qpyzyVr10QfXPYXa6duy2PEn2rXzOU3JxZLOxI=
X-Gm-Gg: ASbGncsDIdJSVX9sUZWcAWeta8KU6dQ2Eibf57mOyUKFJ3XR9WGthtTsMO1dWzgMKub
	rptGlfh6gLEWhd50cmNFG+VRq2SNnNWM6K4Uenl35PIfgDtkcor2Y1r6oFyl1TDILAJrUbqLG3I
	Qcvds7JjnB0MgXzxkpWtoTuIFALId9oT3g9ep1wtbkWfRLpY9GcaI86feYdAQ0lGAFnEYuHgyrt
	+lx6XPcS+xWJY5Es9R4HdXMutmbf6Q2+aXQ3tp4yMXT5LATvHIru2izViTJ5eCuydAI+//vP1PC
	FkexZUHVaEQ5cVuxaXiET/8/6Q3dWg7cr75DoXObClxsGZUPwsZFtkoELlOU57RdwVhJtthB/cr
	9a0VsEqC3w7s4uDu+AJMfhEgBwBj3vrKqfbVAL/ACj0O4Ghwsxs4V9e6R0ttFVg==
X-Google-Smtp-Source: AGHT+IEN4LGz38AGZZTp4ukzEKIPIUkdoS/Gnv7RkPq76qCV6jt3rdGb1C+1QpNl8gxWwynbDMr/lQ==
X-Received: by 2002:a05:6e02:194d:b0:425:73c3:d25a with SMTP id e9e14a558f8ab-42573c3d2demr73984785ab.16.1758555734141;
        Mon, 22 Sep 2025 08:42:14 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afab539sm59790485ab.27.2025.09.22.08.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 08:42:13 -0700 (PDT)
Message-ID: <3fe0ffbe-b4fa-4585-b2d6-2437ade84928@riscstar.com>
Date: Mon, 22 Sep 2025 10:42:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: define a SPI controller node
To: Vivian Wang <wangruikang@iscas.ac.cn>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-4-elder@riscstar.com>
 <50456256-fc9e-4de5-a512-5749b832dc3a@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <50456256-fc9e-4de5-a512-5749b832dc3a@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_084215_405946_CC19490E 
X-CRM114-Status: GOOD (  11.89  )
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

On 9/19/25 9:57 PM, Vivian Wang wrote:
> On 9/19/25 23:59, Alex Elder wrote:
> 
>> [...]
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index 6cdcd80a7c83b..f8c37d16968e4 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -856,6 +856,22 @@ storage-bus {
>>   			#size-cells = <2>;
>>   			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
>>   
>> +			spi3: spi@d401c000 {
>> +				compatible = "spacemit,k1-spi";
>> +				reg = <0x0 0xd401c000 0x0 0x30>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&syscon_apbc CLK_SSP3>,
>> +					 <&syscon_apbc CLK_SSP3_BUS>;
>> +				clock-names = "core", "bus";
>> +				resets = <&syscon_apbc RESET_SSP3>;
>> +				interrupts = <55>;
>> +				dmas = <&pdma 20>,
>> +				       <&pdma 19>;
>> +				dma-names = "rx", "tx";
>> +				status = "disabled";
>> +			};
>> +
> 
> Is storage-bus the right place for SPI? I'd have thought that SPI
> wouldn't need its own dma-ranges if it does DMA though &pdma.
> 
> I know "dram_range4" is where SpacemiT put it but I'm not sure if that
> makes sense now.

You're right.  It belongs in the dma-bus region.  I will fix that in v3.

					-Alex

> 
> Vivian "dramforever" Wang
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
