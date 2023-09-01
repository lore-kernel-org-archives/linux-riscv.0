Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7908CA0FE5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 16:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5vOVQ3wpfwVKb9D4WcBVNF/Voe0tnGmVF9F+RBEkvM=; b=qd4gMV6Skq1SSN
	l7Q/0uDPuklHczZxXSws1RGXurw451B3xX+pLGb+iaQ/Xh3ENb91bdYPQ9t4sox8G/4Q3zbS3T8+y
	I814HndYoHPxfWiLrldWmoSMssEoyIwTdF5uze2YBL9eb6YVQm/cJxi7NxJc3466tY02s2hNubE8q
	sbywALT1FYJeyZAIKYzknCcCNBwJkJb8H0ulqTTOFrKme9YkxaRJIafI4UriwPcAKps14/X1TysA0
	pkAriXf+hvTr6PQOE9QGkMy1YRZfzhus3wVmu7mTlfMWnWG9RoqVQ0WuS8tJ6D6bd/fFZ6i8mP8Yg
	z66Fh7djpAUWLLZy42Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xZ-000A6m-2e;
	Fri, 01 Sep 2023 16:25:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xT-000A0b-0M;
	Fri, 01 Sep 2023 16:25:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 63C6FCE23ED;
	Fri,  1 Sep 2023 16:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93AE4C433C9;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693585515;
	bh=sHKOqNSdp4q7wIKiijKS4YQmgT1mGamM+gLYzuAIKt4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lyMZbDyjiAC9n4nQcawlnvJh/Y4UxIyNx5hbyU40khC7ww1Isrn9b0HqjFFyCSnuv
	 kONl8Okhidd9vdCfJV9pFvQj/OlTnMjQPrR9c8FEVCO6vJExyFJyJ9JZPLmBDhjxgK
	 ZrJYWLPlllbUCLSSllcHb5oyeAh2NUvTPE00Mg/iIwT74pQJTPCTRSxA99kde1SWsA
	 UGDun1RUp9dSxyq+duIjemtcUhGw/y6gTZcyX3aQTRXyq0vvGRu2prJh+hhi6lHiYC
	 /+ILX4aCoYI/2h00GBYFp1YT72Bfb/osua5wbHdi4WBaIRgMWef6Yv7IS0DBO+UwV1
	 WjmcKg6aaIF9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78818C595D2;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/4] Add support for Allwinner GPADC on D1/T113s/R329/T507
 SoCs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169358551548.8276.916609345616924463.git-patchwork-notify@kernel.org>
Date: Fri, 01 Sep 2023 16:25:15 +0000
References: <20230715091816.3074375-1-bigunclemax@gmail.com>
In-Reply-To: <20230715091816.3074375-1-bigunclemax@gmail.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-iio@vger.kernel.org,
 jic23@kernel.org, lars@metafoo.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_092519_330928_C8C11647 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Jernej Skrabec <jernej.skrabec@gmail.com>:

On Sat, 15 Jul 2023 12:18:12 +0300 you wrote:
> This series adds support for general purpose ADC (GPADC) on new
> Allwinner's SoCs, such as D1, T113s, T507 and R329. The implemented driver
> provides basic functionality for getting ADC channels data.
> 
> Change History:
> v9:
> - Dropped fixes tag
> - Reworded commits to remove 'This patch'
> 
> [...]

Here is the summary with links:
  - [v9,1/4] iio: adc: Kconfig change description for Allwinner GPADC
    (no matching commit)
  - [v9,2/4] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
    (no matching commit)
  - [v9,3/4] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
    (no matching commit)
  - [v9,4/4] riscv: dts: allwinner: d1: Add GPADC node
    https://git.kernel.org/riscv/c/d0d73ee5e98c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
