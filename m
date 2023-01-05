Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D984C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 22:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAZ70vW2bkEKH9vi6eUi/KLKQjueiIXGszDUfEN/MhQ=; b=22R+PEvIEgs50H
	kt3ZbR59jqW3JI4jwuyct90ColCmNF+7cFSB59bnASL1G6NXFWbo9jJ2qbgTeCQyUQRSd4QAQKDNY
	MDAVcU6aqCMd0WtEagdvAFod39ZJaxw84xLpsE7W/7A/1UWvu+LdAIIa/FdyFvqvFEh1dnS7DaLOf
	LdhLCmwuMMfiflgfTtbJ27XV8I+n4/S6oDyhUWxHflJ2A9fYtg3/jzbYSBQc3QreYtXIwEdgW/4Eb
	sXKFNiwZOJm4Q7gvsDRRnAVR3AOYxfC33opDBwdyCz8nEEkYSNbizP2KdaXKX56rmbp5AxNJa3khN
	8WOeBWeMkFV+C24jd0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZ4T-00FnPq-Lw; Thu, 05 Jan 2023 22:50:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVOI-00DsH1-Iq; Thu, 05 Jan 2023 18:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V6G1v0bX0D4UJNGGt2xLs1w58IJyGOC4jf7dccTEEPM=; b=jhJL4UM/zRJ3riduo3C4YwzTYr
	V6MTA1CltSGOyPKTP6Mg+b1aAVe25l26G1sjBhQW35Pw0AxLo0+QyrhISCEfgNvmQp/Z2pOdsd39S
	K0AhvV6ArmtGYrSW8+Hv6quJBAlEYDXmRC64W91mfIbwgpEjEwNCAvLPcQTlDdwCEgJGKBCyCqYXd
	2Kdlb0l9iO7NHEZkKZ1CXL+QVPY1dbS1Q+tvYRloun+HA3GsOzAHP1bglCv8fIV7h8mjjqJOXoPRU
	tk0gV+cR47eKWtXqDWq1hsGvIEfScdgymdehcmiL57P0JibM05zYYx5PeX5izVzY86Gc4vcYIAj4N
	GxDcoz6A==;
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDRY4-001OwM-1r;
	Thu, 05 Jan 2023 14:48:55 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 18BDD3200947;
	Thu,  5 Jan 2023 09:48:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 05 Jan 2023 09:48:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672930134; x=
	1673016534; bh=V6G1v0bX0D4UJNGGt2xLs1w58IJyGOC4jf7dccTEEPM=; b=1
	gZckvrW14EF6QB1iyxkjWAB6iRnHIiVv2ITPJDMOAekUfAtApvHM4joaNEsNOTPz
	dm3iPtBjbXT4UaiyshKQ7x2M9bSXx7PR5x0ao4mHvjuJvXLV5YQjcsIwmdizvyxR
	J8FFXJG4EoWwR3gajt9fQTRjmkPZra4YljZh21KuppF6OBhIzlmdClElEtm2m1tx
	4yiw4oOIoqELlaB5ahYbxjeB6uB7XzysI7VPsqns2BaboVLGIDyBCtsKBx+eSJBP
	sKhMKbVzNp0QwShyyyDt4w0JKxiHp04InkVNB4jDvkhTLK5kHUacKKEkds2otrcd
	xCilLN3Xtiv9UpUJnbqWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672930134; x=
	1673016534; bh=V6G1v0bX0D4UJNGGt2xLs1w58IJyGOC4jf7dccTEEPM=; b=c
	NOnBTbP9S0V2/aQUaA120sVik6fZ0yLzAfug1DGbwRkHr5kGzXq7wLs81ycuGu+S
	pSddtWpa7rIvSaym3JpoG6hsxAbcr4Ga2cWr6hWkM/cN5F04En3rzIQNZ2q6elLe
	n9Y611F4OYGB22rrilQ9mQqAVCR64GxgF96nRaeVqqcpT5fgmLCCSFt+me3GpPa6
	7zqLyHEmY54YecWhB/MfI3973WARveHAUWZaHl5fAIhXltYID+l4BSGxLZEEDhMj
	oatK+gHoGaubk1+APfp0w9EEaB3/N1ROSp3dUpZ9W7+NygTlSOmG9jxDgPGfQfFi
	xYw3BS/RnUVy3dVxqwbWg==
X-ME-Sender: <xms:VuO2Y_NkVNEO0nT_BMvVb77DrTxIi28CSm96zlAn9CwDF011NETtkw>
    <xme:VuO2Y59pmwVnoaXykU-NV9RLgQIww6y6kd7P6f1lUnUxRakts76Xi-b1iQtGvzciu
    kFbD_w2H8dTOa7D3A>
X-ME-Received: <xmr:VuO2Y-QqBTy4JTZ1d_rCLqaM23Fa_KzSSvi1hfjSucarsOpGiD4ouNXPfi2g4BhqAfs_VqgYXARxGsUHj0ULvzvFrZFWA9c2sJyB96bHyUcpufT3-k61FFwqNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepheffgfegtedttddutdfhfefhgefftdeklefgueeltdettdekgffg
    ueehvdfhffdvnecuffhomhgrihhnpehlihhnuhigqdhsuhhngihirdhorhhgpdhgihhthh
    husgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:VuO2YzuHz7nqtQ1CK9xQOK1ubF4Qr2BoMFzRtn8v2K3OS98dKrCkMg>
    <xmx:VuO2Y3dag6Hskmc6IZJ5Xd_6lHgdqLmZsIYERnaxh3D4Qh_ZmgPMmw>
    <xmx:VuO2Y_0Kz-AfUxMnu_kCWQjpj2xSV-bTlRpBvpAavLLn5Sv0cL8JeQ>
    <xmx:VuO2YyDiQLu7j2MiOI9kd-2203LolwT-LoaxhNGV0RgrSj2KADdDXw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jan 2023 09:48:53 -0500 (EST)
Message-ID: <383edfed-c9fe-9214-5b61-dbe6f017e03a@sholland.org>
Date: Thu, 5 Jan 2023 08:48:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
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
 <20221231164628.19688-2-samuel@sholland.org> <Y7ap2dZdCHLNzzHb@aptenodytes>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/4] media: dt-bindings: cedrus: Allow power domain
 references
In-Reply-To: <Y7ap2dZdCHLNzzHb@aptenodytes>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_144852_998645_56A4D863 
X-CRM114-Status: GOOD (  22.23  )
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

On 1/5/23 04:43, Paul Kocialkowski wrote:
> On Sat 31 Dec 22, 10:46, Samuel Holland wrote:
>> The Allwinner D1 SoC contains a separate power domain for its video
>> engine, controlled via the "PPU" power controller. Allow the
>> power-domains property so this can be represented in the devicetree.
> 
> I've been looking around for information regarding the PPU and couldn't find
> anything about it. Do you have some reference where it is mentionned?

There are some oblique references as far back as H6 in some user manuals
(in the bus block diagram and interrupt list) and in the vendor clock
drivers.

I gathered some information here:
https://linux-sunxi.org/PPU

It is used by OpenSBI for CPU idle:
https://github.com/riscv-software-src/opensbi/commit/9dc5ec5c.patch

and I have a series adding PPU support to Linux for the Video Engine:
https://lore.kernel.org/linux-sunxi/20221231160402.16157-1-samuel@sholland.org/

> I do see a power domain driver (apparently for the GPU) on recent allwinner
> kernel releases but that seems to be for arm64 chips only.

Yes, there is an older GPU-specific power domain hardware, and the
generic one found on D1/R528/T113 and newer. However, I found while
writing the Linux driver that the two are more similar than the vendor
drivers would imply. Most of the registers from the old hardware remain
in the new hardware; they just are not used by the new vendor driver. So
you can reference my Linux series for a full register list.

Regards,
Samuel

>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
>> index 541325f900a1..d5be7f604e8c 100644
>> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
>> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
>> @@ -63,6 +63,9 @@ properties:
>>        CMA pool to use for buffers allocation instead of the default
>>        CMA pool.
>>  
>> +  power-domains:
>> +    maxItems: 1
>> +
>>  required:
>>    - compatible
>>    - reg
>> -- 
>> 2.37.4
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
