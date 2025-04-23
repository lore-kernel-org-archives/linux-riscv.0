Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B11FC369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 20:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATfJnJo3lUNC/qDXtncbY/Xxic9vXC7NmgSZaim54T8=; b=tjQtW7hp41cdso
	P1ujJvwqlHu0VBFr0PaisvZYOqlm5WG7lf+tlWd7FwFFU5YnEHdCgCWulp8e0QRttGxWFjiLccJDs
	K+KiDaTNLGXMFYqWIDU/Dl/+e06I2rhxrrgV1Wxcy8cmUGGVprTtm57krkhr/gDgJRVVpNjF67dfx
	XyNma3Af2ArEUmonFbzfQ0SnZ7OvGu5B1/ePXPzWA1xweHsHSwlKY7wH7ZmUT/HY8K6e6RKSLD+xd
	gEbkjNbywhdfUHInBS6oQoQZZVRLF4aWqkC8RzP9uDmt5R6ooS73r+IqSFB4iQoZ2NZRq/UtnW2WY
	+4UtSu90GMObIN5iGMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7gXy-0000000Bw3C-0AED;
	Wed, 23 Apr 2025 20:18:18 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7gXu-0000000Bw2B-2wgi
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 20:18:16 +0000
Received: from [192.168.2.35] (unknown [98.97.25.173])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id EEF91B4C0D36;
	Wed, 23 Apr 2025 22:18:07 +0200 (CEST)
Message-ID: <1044b038-1e29-4058-9cb5-155551cd62ae@freeshell.de>
Date: Wed, 23 Apr 2025 13:18:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] riscv: dts: starfive: jh7110-common: assign 24MHz
 clock-frequency to uart0
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-4-e@freeshell.de>
 <CAJM55Z95pwTZmw-WPcUaB1BGpVoNgaRYYjUnqSFcLTNyVmZahg@mail.gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <CAJM55Z95pwTZmw-WPcUaB1BGpVoNgaRYYjUnqSFcLTNyVmZahg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_131814_893427_DB1DC79E 
X-CRM114-Status: GOOD (  11.19  )
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



On 2/5/25 02:29, Emil Renner Berthing wrote:
> E Shattow wrote:
>> Set uart0 clock-frequency for better compatibility with operating system
>> and downstream boot loader SPL secondary program loader.
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> index 8a59c3001339..6bb13af82147 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>> @@ -635,6 +635,7 @@ GPOEN_DISABLE,
>>  };
>>
>>  &uart0 {
>> +	clock-frequency = <24000000>;
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&uart0_pins>;
>>  	status = "okay";
> 
> The uart0 node already has a reference to the uart0_core clock, so it shouldn't
> need this property.
> 
> /Emil

Okay. I'll drop this patch from next version of the series, and asking
on U-Boot mailing list what to do about it there [1]. Thanks for reviewing!

-E

1:
https://lore.kernel.org/u-boot/c0023d23-4614-40c5-b612-9c0cb5b4d8b1@freeshell.de/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
