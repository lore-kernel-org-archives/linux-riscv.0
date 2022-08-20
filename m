Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D334AC25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+dd0KO12O0ujG4k8rqRQLeMJiZTNakNnHvsIUxa9+KE=; b=e+1gWAfesZTbL/tVTDeAQKh3bD
	5miydB24cnfO4QcFen7kFJ6ba/KUFmEX6M1M8Zhhol/C1XsJ7ngZ/y/Z80rOVQemFAhH5/FmJelFz
	7p6PavjDeLzy4c6oGLbQtuSn8VZRFNdxHySx03LMINAJ8oU8FXiVxh5LXBXEiEMGP99/bhqJl5xkK
	HvFSk2sIlFwed0kMih/CmlQDPATDFX1Li+BiV3dBtvFkulQWu/xKxKKi9QaAwoC/A9lx5T1grOVM9
	3EANI7aeiGwgNgZw3eypvM+RP1hmAFB9pNyzTHzBeGeyYkkP37D98999miv6CJIv2w2KGQI7LIVa6
	aUiVHqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSDZ-00BFP0-9Y; Sat, 20 Aug 2022 17:25:05 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSDU-00BFMa-Su
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 17:25:03 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A31565C0040;
	Sat, 20 Aug 2022 13:24:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 20 Aug 2022 13:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1661016297; x=
	1661102697; bh=5Fma7zGYExQkO+bwyNYDf8Z3vOM0RX6XTYyF0I2rGsU=; b=W
	lKvcgPSERJCgolbdz/GETypfPUNCvgWksfRm3H6sdJMQdCnRMESNof2kG49mujSY
	1iY4SdZMO504xEorFUZbzSFnDsP4KKJiOd440Xx7Mgpz1166ynTEJylG4mupCUmO
	8EFXHuxL6OEZcqf9g8W38N6wOalxumJEZNji8AHlWRcN0F9D3sKWSd/u0PATIB8k
	iKjqBUDkiwSPf7ggD2WVDDD/10H85Phn64sw8jpMt2Bc7Ulkj2hmMEFL7LCf0txd
	HWFnNXoopdQbfnXVSnPU2pZKMB+6J2iTNMJBEvm9fw2TuDZwQbFpySMzqZWycdPw
	3u3BkCqUULmwsEh/ch5yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661016297; x=
	1661102697; bh=5Fma7zGYExQkO+bwyNYDf8Z3vOM0RX6XTYyF0I2rGsU=; b=q
	T6DYYNAXtipupjclWIzfxsvrYblX9n/SuIQ/QlvV9OWI2tgEGEyjPt+Q/Dv8zozD
	kbr0ijTopaT4LjyGzxHc1i0XeCczuVDpb2S34nd3uhPYidwvsHThS9LxQFpYHuJC
	SiKgfcMjfQ/MXvvx/4xOd2PRt3gVe+ct1hNGpy9YZsRmTyNns4opsTKsW/YFpgfb
	i9rtkEAA408UqBoK4gowOjmFCiyDkjGPcWMx+m/JFNoz1Ol6T/eJUGCrHfW6uLjX
	NScDecR1ikueguxic01qQqRxlFb2DO75IePRIYeDG1igaXTPjGVado5CDnQ76kNY
	IIEt+Q+g+vbg8Gu5y8MeA==
X-ME-Sender: <xms:6BgBYxd17tt4aZ9s18Pnxo1ew_dyPPEbdhArw2c2VwGX4LXTELWQ_A>
    <xme:6BgBY_Og5Axxreetq2ECM8K0xyYSpSgZ60IN3iMemnOvKfYS7wHiPHpYlGtdLWK67
    c-Q47JufROJAskV6g>
X-ME-Received: <xmr:6BgBY6gxV_dyEx0Xh7Hfb19t4BdK-fSZ2xJ3EKsq_iGPN76iqaS1SmIrYoqqHU6tIkbTEjLqmQzqlev5N0-p2g97vTTn8cCWYG_SkKBPGeLztQgG0QkxdoV8KA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeifedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepuffvvehfhffkffgfgggjtgfgse
    htjeertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgv
    lhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrghtthgvrhhnpeelteejffdvgeehke
    dtkeevueeuteffteffhedufeeujedvudefudetieeijeevleenucffohhmrghinhepkhgv
    rhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:6BgBY6-AgGL8GQicpNUXP8F7CNZzu1BcxEmk559pKMwnt9pN7wm-pg>
    <xmx:6BgBY9vI6wNEgSKrJxoGQw7Q5EXsJFt695CIyxxNhQh78O7dWgCenA>
    <xmx:6BgBY5HjoxZPY-tDi3U_-obTyKr-3eqtB080j2qYNazGwcKPjkS6fA>
    <xmx:6RgBY5H8rcO7mRAvevVMavBWMmw6HAkqBVSuWLvs_UHwPE3ND4N8Rw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Aug 2022 13:24:56 -0400 (EDT)
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
To: Conor.Dooley@microchip.com, andre.przywara@arm.com
Cc: wens@csie.org, jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com>
 <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
Date: Sat, 20 Aug 2022 12:24:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_102501_609098_CA09EC26 
X-CRM114-Status: GOOD (  15.50  )
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

On 8/15/22 12:01 PM, Conor.Dooley@microchip.com wrote:
> On 15/08/2022 14:11, Andre Przywara wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Mon, 15 Aug 2022 00:08:09 -0500
>> Samuel Holland <samuel@sholland.org> wrote:
>>
>> Hi,
>>
>> thanks for all the efforts in getting those SoC peripherals supported!
>>
>>> D1 is a SoC containing a single-core T-HEAD Xuantie C906 CPU, as well as
>>> one HiFi 4 DSP. The SoC is based on a design that additionally contained
>>> a pair of Cortex A7's. For that reason, some peripherals are duplicated.
>>
>> So because of this, the Allwinner R528 and T113 SoCs would share almost
>> everything in this file. Would it be useful to already split this DT up?
>> To have a base .dtsi, basically this file without /cpus and /soc/plic,
>> then have a RISC-V specific file with just those, including the base?
>> There is precedence for this across-arch(-directories) sharing with the
>> Raspberry Pi and Allwinner H3/H5 SoCs.
> 
> For those playing along at home, one example is the arm64 bananapi m2
> dts which looks like:
>> /dts-v1/;
>> #include "sun50i-h5.dtsi"
>> #include "sun50i-h5-cpu-opp.dtsi"
>> #include <arm/sunxi-bananapi-m2-plus-v1.2.dtsi>
>>
>> / {
>> 	model = "Banana Pi BPI-M2-Plus v1.2 H5";
>> 	compatible = "bananapi,bpi-m2-plus-v1.2", "allwinner,sun50i-h5";
>> };
> 
> I think this is a pretty good idea, and putting in the modularity up
> front seems logical to me, so when the arm one does eventually get
> added it can be done by only touching a single arch.

This is not feasible, due to the different #interrupt-cells. See
https://lore.kernel.org/linux-riscv/CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFisGxHMBPUEa8nTMFpzw@mail.gmail.com/

Even if we share some file across architectures, you still have to update files
in both places to get the interrupts properties correct.

I get the desire to deduplicate things, but we already deal with updating the
same/similar nodes across several SoCs, so that is nothing new. I think it would
be more confusing/complicated to have all of the interrupts properties
overridden in a separate file.

Regards,
Samuel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
