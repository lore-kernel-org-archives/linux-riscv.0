Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68664CA0FE5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6P8yRrrNTyLuVnaPO0ZCNKE8hGCFrds3T/eaPWP6JQ=; b=10hAevu/DrZjZ+
	ATw29hg9kGGV3Jx8no+mUAfXg4qbAN86tqPI7oeSrPXs/FGvptxvOP9qbXbOuxe048LCf5bDSgJxh
	1l7cBRa360QeNBly5DiDXB4AhKevAMm2an+bWVL9ZEIjw8Yg7eKW9USnq6fzWOEyzrSFe8ics2V1Q
	ZrK1CHqSGI74XzXJeqTiWWFi5ZcQwMMbTC8Dgi2pL5BvYFFCiw6n7SOAd+g/kJPDopPh3jPUmhho8
	/q1d1PdqsIUYJQPpvORzAKMY+YnHUqHdJiI1ISNoAisK59HrdOPoMs9m0JNHDBn78UmYtS6X57s3P
	u03Pu8bKOymRAuwb0wrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xW-000A3I-26;
	Fri, 01 Sep 2023 16:25:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xS-000A0c-1e;
	Fri, 01 Sep 2023 16:25:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADEAC62DC1;
	Fri,  1 Sep 2023 16:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9098C433CC;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693585515;
	bh=U7IcSk/+Nrzcif5ILllS7Sx3cRSaNGCvHPdUJRmgY+w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tEnq995I/E3nhH0Vvgt1lnUVTT8v5KvhEBpPcEWSpW1hVSH7BoJ1M9We0E2xS8bUL
	 /mRueoBjj1C2ldNAdN3yeOWC16n3vrrHHh45USxIddXNCaxarxcKVJbcp/nRvPkl1H
	 l8ZjUIdp7ChBareTmPru39tCMSZYmqPWQcr3D2a1c9TtBAT+MGxyM/1Mds3P4kPlTI
	 drL1mh/UkVCTkcXZntW6goWBhHIijQcwkn64ub07M8fXp70Hb+BJ24TzWup/BzyMi4
	 OJfQyaQ+Bl/+HloCd/PBzOY1F/yp0H4sIFORWZRwX9miCS3apfUJEwq+qL3b0evo5Q
	 dHGxPMpdc0Cug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E5CBE29F3D;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169358551557.8276.8875001900828239804.git-patchwork-notify@kernel.org>
Date: Fri, 01 Sep 2023 16:25:15 +0000
References: <20230807191952.2019208-1-contact@jookia.org>
In-Reply-To: <20230807191952.2019208-1-contact@jookia.org>
To: John Watts <contact@jookia.org>
Cc: linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 samuel@sholland.org, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 wens@csie.org, robh+dt@kernel.org, palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 bigunclemax@gmail.com, mkl@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_092518_596536_C44855A1 
X-CRM114-Status: GOOD (  10.56  )
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

This patch was applied to riscv/linux.git (fixes)
by Chen-Yu Tsai <wens@csie.org>:

On Tue,  8 Aug 2023 05:19:52 +1000 you wrote:
> The Allwinner D1, T113 provide two CAN controllers that are variants
> of the R40 controller.
> 
> I have tested support for these controllers on two boards:
> 
> - A Lichee Panel RV 86 Panel running a D1 chip
> - A Mango Pi MQ Dual running a T113-s3 chip
> 
> [...]

Here is the summary with links:
  - [v3] riscv: dts: allwinner: d1: Add CAN controller nodes
    https://git.kernel.org/riscv/c/f05af44f6913

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
