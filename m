Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2643AC87FD2
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 02:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQz7UFNVqMxcU/5wzbWCBCSdez1ED0RNttAD9LAniAE=; b=XZ1MfkBIUHm7NE
	qywn4X3ehDrw3zZBsP7DwkloPyfBfzk9m0q+pJ1MLBZAWOeHeNDAx7puW+HflLWtHTcMk41gdXuMM
	u3ssRw+nTjD1/cMfcZlazgAeIMbk9KVf1gFbyVoqU/sGGaESc+JjwawKw223l62HapwAXqHNECkRX
	M1s6+V3+l/CxqIl+ZzsjJj2qn5l33ly6LWaDfopFLRsoqdzBVzBnnasncosnLRMUY5qsn6MmZ+W61
	Yc+NiVD4Kj/z4SROMEcR35c8WR9UaTM0Wz/craldSgEc4SmZCwl0/+dBYbjicNP7XQiSZutGcIV8b
	9I/hcglnQxGTAZ4iKgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvP-000000085Pw-2aeb;
	Sun, 03 Aug 2025 02:58:15 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvN-000000085PZ-0TAU
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 02:58:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754189887; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LkVdGpsewSq7EUoNkwSZFDq48TcI9YZ9dASr5aKolIkup9zpqRImu/LWAePVcXK1JheZfAtDHSRNNlMEQZGzxAqR4y3j+yaRPTlvhf0Zl0au3tKquKtQ+Sf1Rv5v5noeCI3CCJMe7e+GKIrqHPOs3aWBVNtLnqWrI03PtnDPyzY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754189887; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i0Jx5wsPXVzHcNKwvNaiczllxlJAA25jxDOq/uaaaSM=; 
	b=kToYBY8sLrcxmNM+NeoNfHuK5XmkaeElmo60w+600pWaLxADpC3vG3BLOvPTM7zD89+Z13C03f1eEJNBXHo6iNS9SzWtOrY9e+Yq1D9itN/wkqZ3kSOlKAlC43eUu/OEedOGCdvVN//t8eZF+osIAx1Se62ZuYdrZoEkGtYh9l4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754189887;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=i0Jx5wsPXVzHcNKwvNaiczllxlJAA25jxDOq/uaaaSM=;
	b=f3oaib0sr5t8khGJjviKaV+9fuUvEnxpxVlM7HTtYPOHT0yoi2mD2j7aZdwd7OFA
	3/sTyG5wQ8t9o1QU4epqE+HJzZzjHTx613da8X9x6NRHY8rAkXUh30QLNAxohmvuBJG
	0C2JvkINc/i6YyIF3bli6UZEpd3wrJ7iJYwiuORQ=
Received: by mx.zohomail.com with SMTPS id 1754189881012449.99415784449957;
	Sat, 2 Aug 2025 19:58:01 -0700 (PDT)
Message-ID: <757cf40c-a48f-4980-b638-35a29a91ecb3@zohomail.com>
Date: Sun, 3 Aug 2025 10:57:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] riscv: dts: canaan: Add clock definition for K230
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250730-b4-k230-clk-v7-0-c57d3bb593d3@zohomail.com>
 <20250730-b4-k230-clk-v7-3-c57d3bb593d3@zohomail.com>
 <20250730-laughing-dancing-emu-5540d6@kuoka>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20250730-laughing-dancing-emu-5540d6@kuoka>
Feedback-ID: rr08011227eed8815bf276c5c4b75ffa5600006591fb6f11eb539136822dedc845eb4f784c06394fc0181388:zu080112278cb6ca04e82c2e93804d320600000b8ddb55721fc1512e19cc5620ff577603d30229fcb367ab14:rf0801122c266281f77e22f90ba2a807280000940c7b3693dc9be470390b6e4b350d435e079e35d9802a6494db8e13fbcf:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_195813_219854_E63232AC 
X-CRM114-Status: GOOD (  14.08  )
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


On 2025/7/30 15:06, Krzysztof Kozlowski wrote:
> On Wed, Jul 30, 2025 at 02:43:53AM +0800, Xukai Wang wrote:
>> This patch describes the clock controller integrated in K230 SoC
>> and replace dummy clocks with the real ones for UARTs.
>>
>> For k230-canmv and k230-evb, they provide an additional external
>> pulse input through a pin to serve as clock source.
>>
>> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>> ---
>>  arch/riscv/boot/dts/canaan/k230-canmv.dts | 11 +++++++++++
>>  arch/riscv/boot/dts/canaan/k230-evb.dts   | 11 +++++++++++
>>  arch/riscv/boot/dts/canaan/k230.dtsi      | 26 ++++++++++++++++++--------
>>  3 files changed, 40 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/canaan/k230-canmv.dts b/arch/riscv/boot/dts/canaan/k230-canmv.dts
>> index 9565915cead6ad2381ea8249b616e79575feb896..6579d39e2c1690d9e9c2b9c884db528c37473204 100644
>> --- a/arch/riscv/boot/dts/canaan/k230-canmv.dts
>> +++ b/arch/riscv/boot/dts/canaan/k230-canmv.dts
>> @@ -17,8 +17,19 @@ ddr: memory@0 {
>>  		device_type = "memory";
>>  		reg = <0x0 0x0 0x0 0x20000000>;
>>  	};
>> +
>> +	timerx_pulse_in: timer_pulse_in {
> Follow DTS coding style.
>
> Please use name for all fixed clocks which matches current format
> recommendation: 'clock-<freq>' (see also the pattern in the binding for
> any other options).
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml?h=v6.11-rc1

Got it, I'll update it to clock-50m as recommended.

Thanks for pointing it out.

>
> Best regards,
> Krzysztof
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
