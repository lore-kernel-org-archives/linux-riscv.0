Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E74F532ED
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQvgUl4cn6ORWg5Pal5EXJZtNqyU0OFmxU+W7XZa2hg=; b=SXKkLJBuk8+aZB
	QjxIAm+c+eB3sIPh00VfACcqRxmni120QPF62DIi3kS7+ec/elC9IX0ELSGeKBA94TTT1Kw0IyLVr
	wybqQLWW2VLdcx0XL/Ll3PUn5QJN/9Oka6RTdAQ7BllEDzIYayXFgO8s4Hd1vjrqv9OajuZepIZaR
	gnnLQ756bHny9N5/6gTYcKJdDQPvefF/Wcwx3jEiw9q2Z6UCOqgI48nmHUE6H5TeMmqsX8++4++DS
	uM/30b8hCbeU7q7x8N61S5acscih0rvxKYZ7ws43PvM6W/1jsfBizvzKM5j3Y3EISTvKOVpQcAaq7
	9Y2maZjGiu3PWTbzJ3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xNP-0000000113A-2Too;
	Tue, 24 Mar 2026 08:44:39 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xNM-00000001113-36ZA
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 08:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774341812;
	bh=0YvANwo0IIKUqL+qEoGQdaKoDGB4cYehMUWEEPhPQKA=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=qdYg+cTZcdJp80mbc+BukO97/LQ3trjlCj4lJ9g8uOCO7C0qCWBzqW8ldTYea5nUV
	 vHdhhrxclvMW3C9SJCLLH847im6eGMtq8aq0q/YfF4LAGFDknoc6ZchGDSNf0b25SA
	 hywzihie2nWJA5eIcpzXLbYFRAsbaUsqd+KuMzWU=
X-QQ-mid: esmtpgz10t1774341810te82cbcf8
X-QQ-Originating-IP: Tkqsk5ZBeYEfXLsi7Obys+UNNLFSDV+KwfMkR4d5z8M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Mar 2026 16:43:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3668339084073543840
EX-QQ-RecipientCnt: 13
Mime-Version: 1.0
Date: Tue, 24 Mar 2026 16:43:28 +0800
Message-Id: <DHAVODVZL2KG.1NVQFF3B99WV8@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: spacemit: Add PDMA controller node for K3
 SoC
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com>
 <20260320091936-GKB525649@kernel.org>
In-Reply-To: <20260320091936-GKB525649@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N8Jy6PtD39R8Dfa0ZQzLpgo9QpuWadc0Vlouiu/MVjGBJJr9yT5bfYm/
	43KNO2cwgzmIYbwsCFR9OwLFC+uGErtLjnL/EjO53LsgzfnV6NuW3jnBtdZ4r0bUdJbs7JF
	XFvzDBZ85yfeE1NEe1z/0K++X3Cr4V5YkLGQAtCbOwMSJ4/PZqUdI2WZuT0GmkRfRLiNfuO
	9yb6t1ei/Bv3/xe7pzOmpIkt0nYW0EewxeCPRhQVq2zRocXaPg0rG/YhXvay1c2JSyZ6HSi
	Uy4fKqAuhlCGy3ad35M1UbGXlDxPHSPgeGeyKs1bbTpeIHbCZLTQbx7kR3Y1RIX6NNIyCLD
	qwxlvMhM045VcFuYKtrJ4pDCkVIQj9XyJoE3CZeNmzOawZAtlKBmgiwivtSwOCv6TA1zUAG
	lE0CwbHlojRErxEVme0sRU9IQLZZJpCbemNngd1r15mAkXLxM1LEy8dnqTVApuHSue4xWX6
	Prs1vQBsDud5ed7HIW8/QfDoOE8BJyyol1NtC6yB+bN0RrbO0P7315mRdNxtbPBBO2H6GND
	VxJarxuigEs5AjKHJoQHZszhd9OyrU9FdZFldancUhO1UVsUOQpg5lXST/8XBol1QRLtw3a
	DdXCaM74iQfvnIDWMzVak+qmqMTBaejsisPw0QBrUIZuF7k3kAaNEArMtWcUXyDXO+Nx6QB
	kZZDqSQkeIsJs4YYciRzMyY6MVHH4QKGHX7Q2pr2KFHuuuRoJp0r9iwEK7PwjkL2s0C0TRI
	7XfOu+G9LuL4Wr7SWCXRrMeSRACOl3e6Fyid57of5Vgb86dH31ooR0+YL9cfkFvqngftoXm
	YZdF9/QIS/lTUY84LVlVOxTHQUkIYuG4iGDOP9ssnRJ2yi/260Ic4eX9qFIjW4l1X/H097R
	2RVaMprowMX1dFikOlYPZmLF6g/C2Hkmy9VgWju9B4vLs0FBUPMqe+81uD1GXlElDlNeHr5
	QhvE7RFtkIHziGFy4DuweflRNteL+hM7nR6aibuLrSenfIVEcJmT3iJwAx2GbYE9/hAjEj4
	IIAAj2T1EEa3rjoQ7uZTclmSwufm97+aX/IkjjgLsLgetOGIqR
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_014437_698134_AD96B736 
X-CRM114-Status: GOOD (  13.54  )
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

On Fri Mar 20, 2026 at 5:19 PM CST, Yixun Lan wrote:
> Hi Troy,
>
> On 15:55 Tue 17 Mar     , Troy Mitchell wrote:
>> Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
>> The PDMA controller provides general-purpose DMA capabilities for various
>> peripheral devices across the system to offload CPU data transfers.
>> 
>> Unlike the previous K1 SoC, where some DMA masters had memory addressing
>> limitations (e.g. restricted to the 0-4GB space) requiring a dedicated dma-bus
>> with dma-ranges to restrict memory allocations, the K3 DMA masters have
>> full memory addressing capabilities. Therefore, the PDMA node is now
>> instantiated directly under the main soc bus.
>> 
> ..
>> This configuration defines the essential hardware properties:
>> - Register base address and size
>> - High-level triggered interrupt
>> - Associated APMU clock and reset controls
>> - 16 hardware DMA channels
>> 
>> The node is disabled by default and should be enabled by specific
>> board device trees as needed.
> I would suggest to drop above, as they are quite obvious, and easy for 
> people to grab from the code..
I'll remove them in the next version.
>> 
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
>> index a3a8ceddabec..f90d34a81be0 100644
>> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
>> @@ -438,6 +438,17 @@ soc: soc {
>>  		dma-noncoherent;
>>  		ranges;
>>  
>> +		pdma: dma-controller@d4000000 {
>> +			compatible = "spacemit,k1-pdma";
> I think here we should introduce a new compatible for K3 SoC,
> it would avoid ABI breakage if something different with K1?
> cases exist even same PDMA IP integrated into different SoC..
>
> The commit message tells some difference, although no code changes
> introduced so far..
Nice point.

                            - Troy
>
>> +			reg = <0x0 0xd4000000 0x0 0x4000>;
>> +			clocks = <&syscon_apmu CLK_APMU_DMA>;
>> +			resets = <&syscon_apmu RESET_APMU_DMA>;
>> +			interrupts = <72 IRQ_TYPE_LEVEL_HIGH>;
>> +			dma-channels = <16>;
>> +			#dma-cells = <1>;
>> +			status = "disabled";
>> +		};
>> +
>>  		syscon_apbc: system-controller@d4015000 {
>>  			compatible = "spacemit,k3-syscon-apbc";
>>  			reg = <0x0 0xd4015000 0x0 0x1000>;
>> 
>> ---
>> base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
>> change-id: 20260317-k3-pdma-7c1734431436
>> 
>> Best regards,
>> -- 
>> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
