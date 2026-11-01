Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A5B6071847
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UDTpBZHD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PKfbTIwU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0VpMs/Yl/jZZ0n1gfwK1X+YXJMX6NpE0X8oG/UXDZRw=; b=UDTpBZHDAHMV0ogmi6nQavRmYQ
	C7zWKiCnqE33gVdsEXuv/nRpXj3b0uWaP2vNaDO/WHPN5X0u9clnNswk0nYsOR/1fiuqvyb+DU48u
	a4DRk/f6E1bokk3sE7MyjF2lgmxHJRJLwo30/PwXpmlvdD+4L97aYpbkoYhazzcTm9i3oiEj5cemY
	DApFFeIW8pKXvpLydHvGJv9NRcS32jxOqqir2QRbB8gvSHds4P0ugLtZ4pPfIB13KcpNu1H9DhiVh
	io8Fue0wMsvKK1OKlAYMKgadHOhopPdmdY2uVr/tGHN9uleumS9z8NSyPXIpHOtX5NOiEyXVr3jY4
	AMl/wavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqx-0000000F0rA-408j;
	Sun, 01 Nov 2026 22:16:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqf-0000000F01v-3XsS
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BDF44197A;
	Sun,  1 Nov 2026 22:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F151F00A1F;
	Sun,  1 Nov 2026 22:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571381;
	bh=dO8IDvnKbQ89guABqKeHsYCIoKDAIsVkhl3ddA1wtcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PKfbTIwUwRg7utef2I61K+61rzrtDd/F/7eBveR00naBoqdh8F3uPt9bannBILkUq
	 FQXvy8Z0s5mkEUdeNhZmZVKFkBmt/LUE+5D1CvzgeMepBxoKf1PdLKC8RwoCB40Mf5
	 OdkcjsQ690c2MU+DctNOxnLmgdhbGaelLNRiN/qixigRpPtaiG2ijQmAVgt/H9pdCb
	 FiOvUSJsvaZ7CtN4srqpYrX5YQCsqj7N4Wxx4hnjOnXfuL07C7Ow54npn+WdSZ8oPe
	 Plja86Te6UpKeeKPM7LXj3NXO5VI//NBfrJ+Uv+0AsJVqmhPK+HaK/XHSo8YOL1C3I
	 iVVMD5YkVeKPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4025738003B8;
	Sun,  1 Nov 2026 22:16:21 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357137979.2624073.5964699004424197111.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:19 +0000
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, kernel@esmil.dk, pjw@kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, alex@ghiti.fr,
 p.zabel@pengutronix.de, brgl@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 lianfeng.ouyang@starfivetech.com
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Linus Walleij <linusw@kernel.org>:

On Thu, 10 Sep 2026 03:03:35 -0700 you wrote:
> The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
> per2, per2pok, per3, adc0, adc1, emmc, and vga.
> 
> In the current series, we will only add the following pinctrl:
>  - sys0, sys0h, sys1, sys2
>  - per0, per1, per2, per2pok, per3
> 
> [...]

Here is the summary with links:
  - [v8,01/22] dt-bindings: pincfg-node: Add property 'input-debounce-ns'
    https://git.kernel.org/riscv/c/5dde08ea70b9
  - [v8,02/22] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
    (no matching commit)
  - [v8,03/22] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
    https://git.kernel.org/riscv/c/9d3dc8decb60
  - [v8,04/22] pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
    (no matching commit)
  - [v8,05/22] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
    https://git.kernel.org/riscv/c/6701c1c00891
  - [v8,06/22] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
    (no matching commit)
  - [v8,07/22] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
    https://git.kernel.org/riscv/c/bf8241062c79
  - [v8,08/22] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
    https://git.kernel.org/riscv/c/1d5c13990916
  - [v8,09/22] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
    https://git.kernel.org/riscv/c/941cc8022c21
  - [v8,10/22] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
    https://git.kernel.org/riscv/c/594deb7f74f4
  - [v8,11/22] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
    https://git.kernel.org/riscv/c/402323de0c04
  - [v8,12/22] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
    (no matching commit)
  - [v8,13/22] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
    https://git.kernel.org/riscv/c/d6001140c2e8
  - [v8,14/22] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
    (no matching commit)
  - [v8,15/22] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
    https://git.kernel.org/riscv/c/b598855cc302
  - [v8,16/22] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
    (no matching commit)
  - [v8,17/22] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
    https://git.kernel.org/riscv/c/c9ed9daba98a
  - [v8,18/22] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
    (no matching commit)
  - [v8,19/22] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
    https://git.kernel.org/riscv/c/340588f9b94c
  - [v8,20/22] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
    (no matching commit)
  - [v8,21/22] riscv: dts: starfive: Add JHB100 pinctrl pad number header
    (no matching commit)
  - [v8,22/22] riscv: dts: starfive: jhb100: Add pinctrl nodes
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
