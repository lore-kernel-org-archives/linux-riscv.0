Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DA9C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NOh+CEUXmlWdh4+YMTuC4vPkI8DNWVuEm4Wo43Xod4=; b=u3ZHgs4DDXnMV9
	OKyqSWLXxccEaxjBimkK2yAv20iVk3xSNAE0EOyFpUOssp6gVwxyOyiQO25oes//lBnculiCjB6X+
	D5tvgB5kAR7LMyJSSJLQ+xiXikcuMLURW3NK/bzRFvghKRJuUjjz/f94bwfDRGMa97jEJ8jczepb3
	07Fotjt4KAvBgfStO8l64AEiBbjlTpdnS2ACIE2MCj75SGWApDAQcTzfZSXn8YV6BiLbj7qu2+Ju/
	wrk6bCDQm0d/ATVLJkyMeLs454qVDGeGCdfLm23GLBvPwtQNmWAkuwLlzPjvK7gcXxBftvx80ZJSm
	x51X03coL1l10kuS+jHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXbC-00Ezok-TV; Thu, 05 Jan 2023 21:16:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUqW-00DUnZ-W6; Thu, 05 Jan 2023 18:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0tRpqumuzD4A8ScE1T7chaSBsFg3IHBj12rmSPS7UQk=; b=cHauAg5W/CAbRE3m6Jae6LtgDG
	6YMFaFjNbvgXsBFhI04JRRlH4/reDeZdfky8iJcY/0M+EhxSai5GZypAIukECOTsj8jyscEanBgtf
	S6tmxF14sGsKQibpmM09quEh/I3emIPCL5/Kg+dl0SimmmjjSP0BHsdthres/XZJzTVo02/beRGyG
	JBYkUnlo0RCg78HkMgYkTqTx6VKDmQ8BsqLSyvfBoou5C1zReDNHHaVBj4R4B5yTcnpdOlYaa53bg
	oXhHVVHY4y+B9MBUzL4Y2UZIpPqa4/H12tP1LIzSG3UUyoCmojll8SQj7xjY0dyfUEGlQXdu4AemY
	gMfKgnvw==;
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDROI-001OHE-0q;
	Thu, 05 Jan 2023 14:38:48 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id B05A13200921;
	Thu,  5 Jan 2023 09:38:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 05 Jan 2023 09:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672929520; x=
	1673015920; bh=0tRpqumuzD4A8ScE1T7chaSBsFg3IHBj12rmSPS7UQk=; b=d
	4XVP0hfu/F6/aqVt3l7KnXcKsYzGCyPkegPh5cMb6DGQjil4x5jP/7hc8l4l/ZYr
	dmW6ZFITa0tZjR4/RMJk2iVJQ/CwzSINlKcXCmiXdin90n2cK8pnCanUi0MD24Be
	zcl0lb4i82jOmJ3e85hZigrGZoBe+t5jwX33lNdmBA+YnzNufMNu7XmeIbGhYU0f
	c/XinqxdlpWh5ln3p+G+ikkrZ5px+5fkskZ4yXSc/sCI3CLR1ZIvENpADgRXltBn
	hLzwEaWUGw/lpLASPwL6GWgdsG0X6zodJ+DX4iBGKyCE0Zc1JTid/+VkP+KA5Xrk
	9JZVID+ykBC4TgsdGk9qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672929520; x=
	1673015920; bh=0tRpqumuzD4A8ScE1T7chaSBsFg3IHBj12rmSPS7UQk=; b=Q
	mQFZigQXsGb4r6btUJAczAkvrtBumokULURZYr9BGtsdKHGAhQuRmIsGKhhnbvC+
	LjhBx/EnM5c1+Ov0HfGPAD2Mz8/6SPy0zV69+M7LDAr/n9H1dhINb5cQ5CrrL+4r
	y1b+a8UCf/oFhnf832zSQcFvRKwGLXCjq9yi0vRlNA0IYVHfojbfw9DlqVO4b0SB
	T6YI5eKHwcttLLGw6nIiT8JZ15cxtT4SgC32TXlFEU0lDlhb6BSWja79zAwMEqHe
	gt9z8iWjSka1bTuLTQ8lk5aEQOd+ak+5EAaZBlEv3z6xka+1eGCOepNq+2ySMXLc
	PIyaqHsm9Ss57ukPytCqw==
X-ME-Sender: <xms:7-C2Y5pDpDdwzZ9i1c8ziDXeBnxnpPMJEv30DfLvp6tDjYJQIrNvQw>
    <xme:7-C2Y7pAm2sM3PGdZZXvzn8WrKomMEc-zUSYuMvCvo4A9vc1OKr4HvfHTNfqNf4PC
    1pUnki5hMqTbkAxEA>
X-ME-Received: <xmr:7-C2Y2MDGjw_4EF4JjqLYeISZ9wH4Pz46PsKY12SANCHdYIiSDeZC45ei0IXcnNMzSoKN47vArjirjMi6kgFpv1Sw7iUUfh9KHGHC0GOleWUO0h1T2hrH8byEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepkeejleelfeeitdfhtdfgkeeghedufeduueegffdvhfdukeelleef
    tdetjeehuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:7-C2Y07PRTSiCseNNHcdHN-fhBrwQUshcyconVZGhlx2XWYqiFxH8Q>
    <xmx:7-C2Y44cJfaJdZEI7LHg5qIGEmGoOBe5DWlejR7aihYkkRlkrfS9GA>
    <xmx:7-C2Y8hYQx225tPwiImxWhzHqlmVmoFMQ15_h04c-vsnwMmjY9xH-w>
    <xmx:8OC2Y1O802ea8_p3G5yF6B-Pb7YVl7CFQQl1QE3UHG0IC2NxFoQd_g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jan 2023 09:38:37 -0500 (EST)
Message-ID: <3b6ec431-70ac-cf68-6f46-9dc0affb1e68@sholland.org>
Date: Thu, 5 Jan 2023 08:38:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 4/4] riscv: dts: allwinner: d1: Add video engine node
Content-Language: en-US
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-5-samuel@sholland.org> <Y7aiZdjI8L5h1Ca3@aptenodytes>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <Y7aiZdjI8L5h1Ca3@aptenodytes>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_143846_514081_B468D812 
X-CRM114-Status: GOOD (  15.68  )
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

Hi Paul,

On 1/5/23 04:11, Paul Kocialkowski wrote:
> On Sat 31 Dec 22, 10:46, Samuel Holland wrote:
>> D1 contains a video engine which is supported by the Cedrus driver.
> 
> Does it work "outside the box" without power domain management?
> If not, it might be a bit confusing to add the node at this point.

Yes, it does. All of the power domains are enabled by default. However,
if the PPU series is merged first, I will respin this to include the
power-domains property from the beginning.

Regards,
Samuel

>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
>> index dff363a3c934..4bd374279155 100644
>> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
>> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
>> @@ -34,6 +34,17 @@ soc {
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>>  
>> +		ve: video-codec@1c0e000 {
>> +			compatible = "allwinner,sun20i-d1-video-engine";
>> +			reg = <0x1c0e000 0x2000>;
>> +			interrupts = <SOC_PERIPHERAL_IRQ(66) IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&ccu CLK_BUS_VE>,
>> +				 <&ccu CLK_VE>,
>> +				 <&ccu CLK_MBUS_VE>;
>> +			clock-names = "ahb", "mod", "ram";
>> +			resets = <&ccu RST_BUS_VE>;
>> +		};
>> +
>>  		pio: pinctrl@2000000 {
>>  			compatible = "allwinner,sun20i-d1-pinctrl";
>>  			reg = <0x2000000 0x800>;
>> -- 
>> 2.37.4
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
