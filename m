Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E129ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l82EVV10bKK6qXZMgmbBDdf3pyYFX27SfUR8AgQlRak=; b=XdU5jwWLPE9ZLv
	od4pYIkvJcmS7zGVuHS80bmZ+XcJUHyvTtHAwbCTO91GVY6Hj6k70fOXnJ51nnvhLGQh9a9SvqGCq
	dCTe2ymzsQolitk7bEP3sOIHd2iCYm9zzmjrSqSoVoqCdVFHkethaJtR+9qBOkSt2SWAVX+tpZ5ku
	sRBVYZmril9tLWGgrUQeQ5FRajc0FySxGyFW0gOiNcTWSsp0FSSFGQKbW8UjU+U4cXQ3cRv+8G4GH
	fQF/6WAQXs+OBV254zJYFneb/aV9NWYzkNB2E024b4i0AEyvBoMzSjOxkf1OmvAXa32HWlihe0H8r
	tzwvhbHat9gRqJiy5a+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3fX-003CnI-Is; Fri, 02 Sep 2022 10:12:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3fU-003ClO-PA
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 10:12:58 +0000
Received: from [192.168.1.90] (unknown [188.27.54.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BEFE26601F03;
	Fri,  2 Sep 2022 11:12:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662113575;
	bh=uPwA05/mzppSgHqnQObaTSbjueljkx5JGjGCVIFaX/M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kPZgY93OKHOGvRZLDJeVcLlegA/q+BYNmivqJPMl9tMwfq9YLFz2qOH+o20c2DOS2
	 4NonJ4WJPIP5t4/AHYTQjZY+uI3CNxoUCfT9tpB5bdnXaD6aBTLigNlV6kV6r2vMYA
	 c6G7rh66/ZN1N+6E59YhzyEeAARtSivDETcsTmE0T98vaHRgh9mbHCkxbZxqCL5Dxg
	 r59DPFah2gscMSGZbPOykzM9xfyOaPy4vHYLRveYWt7XNmwbVYexDh4ZIef0WxWuAP
	 p30bjgATWCyhMgg/ODF0W0Yc9YkftjR7F87nc18lduiyNzNcCYVV80yketeeX4uhBa
	 2PhCLMGBsoK+g==
Message-ID: <092ed898-dee9-e27f-1f18-3a17b259563e@collabora.com>
Date: Fri, 2 Sep 2022 13:12:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/3] Enable initial support for StarFive VisionFive V1 SBC
Content-Language: en-US
To: Conor.Dooley@microchip.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, michael.zhu@starfivetech.com,
 drew@beagleboard.org, kernel@esmil.dk
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220901224253.2353071-1-cristian.ciocaltea@collabora.com>
 <04151f8b-5722-b5a0-a4ab-4958f55b8dec@microchip.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <04151f8b-5722-b5a0-a4ab-4958f55b8dec@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_031256_981259_804F5243 
X-CRM114-Status: GOOD (  21.31  )
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


On 9/2/22 09:27, Conor.Dooley@microchip.com wrote:
> On 01/09/2022 23:42, Cristian Ciocaltea wrote:
>> [You don't often get email from cristian.ciocaltea@collabora.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> The StarFive VisionFive V1 SBC [1] is similar with the already supported
>> BeagleV Starlight Beta board, both being based on the StarFive JH7100 SoC.
>>
>> In addition to documenting the necessary compatibles, this patch series
>> moves most of the content from jh7100-beaglev-starlight.dts to a new file
>> jh7100-common.dtsi, to be shared between the two boards.
>>
>> No other changes are required in order to successfully boot the board.
> 
> Gave it a go this morning, dts stuff itself looks good to me. No new
> warnings, although that's to be expected, & boots fine.
> 
> I know that most jn7100 stuff is not really wanted upstream, but I'd
> say that the minimal vision5 dts is an exception to that, so with the
> one comment on patch 1 resolved:
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the quick review, I have submitted v2:

https://lore.kernel.org/all/20220902100806.2378543-1-cristian.ciocaltea@collabora.com/

Regards,
Cristian

> Thanks,
> Conor.
> 
>>
>> [1] https://github.com/starfive-tech/VisionFive
>>
>> Cristian Ciocaltea (3):
>>     dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
>>     riscv: dts: starfive: Add common DT for JH7100 based boards
>>     riscv: dts: starfive: Add StarFive VisionFive V1 device tree
>>
>>    .../devicetree/bindings/riscv/starfive.yaml   |   3 +
>>    arch/riscv/boot/dts/starfive/Makefile         |   2 +-
>>    .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +----------------
>>    .../boot/dts/starfive/jh7100-common.dtsi      | 161 ++++++++++++++++++
>>    .../jh7100-starfive-visionfive-v1.dts         |  20 +++
>>    5 files changed, 186 insertions(+), 153 deletions(-)
>>    create mode 100644 arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>>    create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
>>
>> --
>> 2.37.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
