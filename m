Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D14CA0FEA
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vL1wU+U9rmYYszM0iPSl5zxiGt3OJCT5qc9OUidy1k4=; b=w4lf0k0z/tQUBK
	4VnmnuVd8el7ae9+lzmaQk5b5kPTksfO85Mf4ouuvdgynQOH6uk6CzuQrrQo/AbtlRkgHO1EMes2B
	M1IpE62xv/PToPqUHA0kkI5YeH3SAH12dJZeeMoHQRlWy0ooIM2bGf4n/b8Dc622oYKrIS0s/Ml+U
	rLbrBzbF1/LunHFOvmg5Au4jxsRPaUpsjzWcMcXytns5h9vAYZ/ztDoBp4coSpgX9O8m7G8EpwNQQ
	6xQ+2fjDf+rKPDKT2aNV4HRNdDtkvX92KxRlmDNQtbom+ECCv7PPpIC/c1llkdwV5F+2qbrgucuLf
	qH5ZKuVCwkwsHHeewY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xZ-000A5Z-0A;
	Fri, 01 Sep 2023 16:25:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc6xS-000A0f-1t;
	Fri, 01 Sep 2023 16:25:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0406462F28;
	Fri,  1 Sep 2023 16:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7CDFC43391;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693585515;
	bh=V8XH4cIvHWrSs/u5pfHFkWBm7960Sk/XsLtEUa1DSQA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BzksYAGVttU96YQgR8k5uPURSLS9LxrDL3vCUmVWVd45VRtBL/9kKNPEEGelVZhxc
	 Oc/b4siJEVLM1MxOshBWjoNsfwpV/l5oYYAlrdYh8JJWyRWPW55lIZtKj1rUPixmP5
	 I3QIn7BAV56Jw4ujVvpUR+GqHQH9eU8LgHFpqAQaE1eK8kCFgQhtHk0hJH7B8A18Ci
	 GqfEXh5Qx6Iw6MmoeBeILSTb9jQuOVFf8FUDPolZBe9kvmn8N7D6b0q6Dtuj8cKbPS
	 GQIybfMcQcwTtqXXSwbdaiTR3re0BpZE9MKbAdCwWZeu5iafX9qtUdTXs61O4Md7MD
	 pMwVI/9NU8lZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1CF0E4509E;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] Add support for Allwinner D1 CAN controllers
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169358551565.8276.3801944999733958707.git-patchwork-notify@kernel.org>
Date: Fri, 01 Sep 2023 16:25:15 +0000
References: <20230721221552.1973203-2-contact@jookia.org>
In-Reply-To: <20230721221552.1973203-2-contact@jookia.org>
To: John Watts <contact@jookia.org>
Cc: linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 wg@grandegger.com, mkl@pengutronix.de, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_092518_711355_074532F2 
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Marc Kleine-Budde <mkl@pengutronix.de>:

On Sat, 22 Jul 2023 08:15:49 +1000 you wrote:
> This patch series adds support for the Allwinner D1 CAN controllers.
> It requires adding a new device tree compatible and driver support to
> work around some hardware quirks.
> 
> This has been tested on the Mango Pi MQ Dual running a T113 and a Lichee
> Panel 86 running a D1.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: net: can: Add support for Allwinner D1 CAN controller
    (no matching commit)
  - [v2,2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
    https://git.kernel.org/riscv/c/6ea1ad888f59
  - [v2,3/4] can: sun4i_can: Add acceptance register quirk
    (no matching commit)
  - [v2,4/4] can: sun4i_can: Add support for the Allwinner D1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
