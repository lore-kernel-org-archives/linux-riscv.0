Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2B3C001CC
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uuur5HAgmJ/txRorWLfxheHF9iecYrKvYv65UyX/t04=; b=F6eTnDj/gfY0Ai
	k2eUQ9quy/CEMyvjr3LKc477aubmLAaBF9q0J8kX/GrTbsAjx1lyQGpve0Z83KeTW7VGu6e4X8mM3
	/g0ajS+xGO34wra0l9FlGjBxTkwcn8XDOHMMZUwU59xv4YQLI9W9cFQeWQtRWAfbjD/LoMLj1O538
	ysFak0uFgEX96MMyJqGg+EJsAnRnrBNyZ0z4IVhCQUHFJ+zZm0yKirlaQHmZYhIryzruL2w7eTbi2
	s9LFgIz4bXF/B9D1PwG6AyMUJqX7yu61JI9hbIBEbi2nTHJN2QRJTQWhFdlu6b3TzwpPkkiaOMkWL
	vtN2x+zVncMaS3h9spIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvvtc-000000057Hv-1evV;
	Sun, 14 Apr 2024 09:11:32 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvvtZ-000000057HJ-0GdQ
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 09:11:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F78D1C0002;
	Sun, 14 Apr 2024 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713085886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ucqJYAIoktU0BaFjFoxsK2t1BH4GJs/UThpTq3LARR8=;
	b=GN1CMzsYW7HkiiQrLBRaZXY727moXji1hMlvFRdiPgg6fCYeRSQwCVWksVXkI2DwGQfONe
	pYxEbZJ+Ak50/dzaIBqrtOBv4063jSM8zfgb1T5qf4ky6s0CEtspCoLIda7Eq+D8x33SPc
	tC6O+ycHpdMeMmOYpLg2cDtTtFClbwxaOJL4uuUrG7ZFNLuRMoh9R4ObS6k4ktdO4lHPQA
	4k+Ns5LX0kNJ7zzef1LBltq7nYVIHe20P4NnnnjdbjiJyUSUwU+vV8ZDwd6PiFRUPx//rt
	hgNdqGfMhNqcHuvnLdTK/7THiJRlPkWvUjT6pRATdOOqAO8d6XrsDoZJUAWuDg==
Message-ID: <a86c6e6d-812b-4777-981b-c747ca601372@bootlin.com>
Date: Sun, 14 Apr 2024 11:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, Jisheng Zhang <jszhang@kernel.org>,
 Liu Gui <kenneth.liu@sophgo.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
 dlan@gentoo.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v9 0/6] riscv: sophgo: add clock support for
 Sophgo CV1800/SG2000 SoCs
To: Inochi Amaoto <inochiama@outlook.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E5E78F930EE25A86EE1CBB052@IA1PR20MB4953.namprd20.prod.outlook.com>
 <2696c0e0-0f15-44d1-ba40-dcab4be802d2@bootlin.com>
 <IA1PR20MB49536A93C7A684EAE844E316BB0A2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953A5ACD22C8CB791C76BABBB0A2@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <IA1PR20MB4953A5ACD22C8CB791C76BABBB0A2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_021129_480433_DA89E992 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

Hi Inochi

Thanks for your help!

On 4/14/24 at 08:43, Inochi Amaoto wrote:
>> Hi Michael,
>>
>> I think you boot with the `defconfig` config. This config does
>> not enable the CV1800 clk support. I think you may need to apply
>> [1], which enable the clk driver. Also if you want to test sdhci
>> with real clk, you can try [2]. I test them on the Milk-V Duo S.
>>
>> Regards,
>> Inochi
>>
>> [1] https://lore.kernel.org/all/IA1PR20MB4953CA5D46EA8913B130D502BB052@IA1PR20MB4953.namprd20.prod.outlook.com/
> I make a mistake when reordering the url.
> [1] should be https://lore.kernel.org/all/IA1PR20MB49537E8B2D1FAAA7D5B8BDA2BB052@IA1PR20MB4953.namprd20.prod.outlook.com/


Indeed, I was using the "defconfig" config. Too used to having 
everything working with this configuration on RISC-V :-/

Gotcha for the CONFIG_CLK_SOPHGO_CV1800 setting. However, I'm confused. 
Why is this setting available in linux-next, but neither in 
git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git ("master" and 
"for-next") nor in github.com/sophgo/linux.git ("master" and "for-next") ?

What's the tree used to push to linux-next?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
