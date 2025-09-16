Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1C5CAC59B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 18:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/IefHPNC6xlTxYte3fqw9cvkEu8QhkPzu+ZNemwDqY=; b=L+Q2K4aVpCD31s
	eCQB763vYSE0V89LKUSQkx9PWqXG/lHa6SvtYy7DuxKPbkk952vHEv77nDS1TupWKVe4+WKwb3Yur
	a5qr4VIuq/Ihczs4prlalAXKraetmt1jOYdkSXTKQNx6RMGuGeTKWYnkvhO/S0P77yl3y/GAvNmCT
	DrgYleOV8ufub8M3ekBqA7j/PldOa2IMpuJ31s4v70Sb1EA8mopINYvLzFPNUDcjw2rOgXCUOtY6I
	F6Lbxtwzozg1tf4xZonxo7OUjGlLMa+slVc4ik75rgbY116MzQNpyT2YLm53d1daTZruJFKuV57ld
	Yoz6sRvFtzYjSfnHCKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyaNd-00000008ky9-3xTs;
	Tue, 16 Sep 2025 18:26:17 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyaNb-00000008kwi-1yTL
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 18:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pfR7Xsy4BQPLEp1myu06IGK0gA6NnQf3jtJg3r/Xogg=; b=0e3rb8TXFHuItZMejDHEA/J4qr
	Ncudvij/fFD65016h6R73EusavImCWVjmuJt4DcY6D3nT+YL9bjjqvc2nCt9Nseo2SDVC5xvhM4tS
	JST+mGABW9nUmN5mL8hVq8BPVGB8yK2+yhi5kL1p+LoKrYjKEiaH8h9XmxU2BMevdJrMRC1y1yI3S
	j1hMnf8mAT6yFgJCGcZ+A694Z1TU3R1TjFf31MOt6+6aTQuY6/SC2RFcoVNizOBVBUIg2TZMZkLbN
	MbaJBP6xep/n+a/oEjuWFCwd2LdNFgt+d8xBqXT6CdKZUbnK+H26O6OiZdObrbf2UOf9o+mzZQw9o
	kSQ7Gxzw==;
Received: from [63.135.74.212] (helo=[192.168.1.249])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uyaNM-0001Qd-FC; Tue, 16 Sep 2025 19:26:00 +0100
Message-ID: <51960b81-d8df-423f-b24b-4b4ec1e7a245@codethink.co.uk>
Date: Tue, 16 Sep 2025 19:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] riscv: dts: Add Tenstorrent Blackhole A0 SoC PCIe
 cards
To: Drew Fustini <fustini@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>,
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Drew Fustini <dfustini@tenstorrent.com>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-6-ddb0d6860fe5@tenstorrent.com>
 <20250915-mouth-banner-ddfb2e48bdb3@spud> <aMhSSka3gyIcND/L@x1>
 <70241f44-2f8d-4945-9c84-71416776cefd@codethink.co.uk> <aMmd/JQAfPwKuYyB@x1>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <aMmd/JQAfPwKuYyB@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_112615_596745_E7768A1C 
X-CRM114-Status: GOOD (  14.89  )
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

On 16/09/2025 18:27, Drew Fustini wrote:
> On Tue, Sep 16, 2025 at 02:56:05PM +0100, Ben Dooks wrote:
>> On 15/09/2025 18:52, Drew Fustini wrote:
>>> On Mon, Sep 15, 2025 at 05:47:08PM +0100, Conor Dooley wrote:
>>>> On Sat, Sep 13, 2025 at 02:31:05PM -0700, Drew Fustini wrote:
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..b2b08023643a2cebd4f924579024290bb355c9b3
>>>>> --- /dev/null
>>>>> +++ b/arch/riscv/boot/dts/tenstorrent/blackhole-a0-card.dts
>>>>> @@ -0,0 +1,14 @@
>>>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>>>> +/dts-v1/;
>>>>> +
>>>>> +#include "blackhole-a0.dtsi"
>>>>> +
>>>>> +/ {
>>>>> +	model = "Tenstorrent Blackhole A0 SoC PCIe card";
>>>>> +	compatible = "tenstorrent,blackhole-a0-card", "tenstorrent,blackhole-a0";
>>>>> +
>>>>> +	memory@0 {
>>>>> +		device_type = "memory";
>>>>> +		reg = <0x4000 0x30000000 0x1 0x00000000>;
>>>>
>>>> This isn't at address zero as the node address claims.
>>>
>>> Thanks, I'll fix the unit address.
>>
>> Is it time to just assume any dtc can handle a 64bit number?
> 
> Is it not valid for me to use the 64 bit hex number in the unit address?
> 
>

No, the reg = < > contents. It is a right pain to read split 32bit
numbers and I thought dtc had been updated to allow 64bit now?



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
