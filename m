Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FABC531D4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4spcmNLR1DnH/Gg4a1KKMz0cX5rKHEgL3TtnY+8hqVM=; b=1ucozmFiwewlQP
	4pp4nWwARlJ0w7cztbDpoMli0osTGGswjxnJ55R5fpUDQ0U7LJVTF3j33rthAvG9+kIbJDAMjPy2X
	gCgJDsqWL0jOwVoBg4oFAkGbiRfV0HcEiGAfQzmaDs3VHMXRbrb3WHatSC5apbMySVVPZ2cdq8j1l
	/CT9yq3NawoWCST87dTOJjoDLle/jupt8NA9q1C8xqSigb2PDupUgcR0GcTVK6nvfA2xR5ZMSPQAS
	JuwG20rhr/3PT83kJ6cP5JJrOjoqeNhNmBVpPRbvJRN+x3e8RgxyZJq/q/+075C92mr4pX9l3MSiZ
	lquokHiFsoNmxDP17mzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu8Z-0000000ESeP-3FW0;
	Thu, 23 Jul 2026 14:10:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu8X-0000000ESdk-3Oj2;
	Thu, 23 Jul 2026 14:10:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23677405F6;
	Thu, 23 Jul 2026 14:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32D11F00AC4;
	Thu, 23 Jul 2026 14:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784815857;
	bh=e+PZO5MkosxONDiakds6k+hycWBv6dw3oVvlvWJ9PxU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BYAfUYKnB9zZMQiniXXveziNH9msnKl5+9uwI2FszSUut+ElyBtMAyLM8AzqH2s0n
	 eMNoEQc4jDZOC54Sk4GmdDBJjcLTyMesf42dG1sA8YiMI9g06rkxNkaWTYlqIIsl4z
	 4iUkgquUqOCpF7oWVq/jLPq35vN8Qqg5rpSrVayKcQwn2bdPj4m2A+LbLuNrI/dTkN
	 gNiKOmEamPi8uocRKl91WeuPe0TtYRA5aiKsgxW5bloJZSdo6sDkQEHVs50RahDJ4r
	 Jll8ci/SOCKKJKkPrnRuBzI8vmSCujWd980i9Up8WA/Uftel1vXjIgnb3Zv3UxExwx
	 JQVB9A1W332Fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B45380CFD4;
	Thu, 23 Jul 2026 14:10:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net] MAINTAINERS: Add myself for stmmac ethernet driver
 maintainance
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178481582490.2248593.7494746739447898895.git-patchwork-notify@kernel.org>
Date: Thu, 23 Jul 2026 14:10:24 +0000
References: <20260722142125.1767689-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260722142125.1767689-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 hkallweit1@gmail.com, alexis.lothore@bootlin.com, jan.petrous@oss.nxp.com,
 heiko@sntech.de, nobuhiro.iwamatsu.x90@mail.toshiba, keguang.zhang@gmail.com,
 me@ziyao.cc, mohd.anwar@oss.qualcomm.com, romain.gantois@bootlin.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, fustini@kernel.org,
 guoren@kernel.org, wefu@redhat.com, inochiama@gmail.com, kernel@esmil.dk,
 minda.chen@starfivetech.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, s32@nxp.com
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 22 Jul 2026 16:21:24 +0200 you wrote:
> The stmmac driver based on Synopsys' dwmac IP is used in a very wide
> variety of SoCs and is currently very actively used and contributed to.
> 
> It has been orphaned in January 2025 after the previous maintainers
> became inactive, but Russell King was providing very valuable reviews
> and fixes for the driver at that point.
> 
> [...]

Here is the summary with links:
  - [net] MAINTAINERS: Add myself for stmmac ethernet driver maintainance
    https://git.kernel.org/netdev/net/c/4a05269bb723

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
