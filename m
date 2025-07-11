Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A70C83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 01:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mbki1tXKTLgQqO+kPsd+kn0qqnF9csU+D7iZwhS0Dww=; b=iKNUq4u/GmZVzu
	TcYnRHwnl1AMIWpUpEmAlPc3kHVPWbwhSpP7EMoh6uSeKqYXxJeMVsnsvnAzYJghCKgk84PxaVczQ
	V/YddI807tTR/sjfj4sM9Kb5DtFbX/syJVPpf4Sp3SyFng7AbOtTNrZ95g/V/RLxXyIwBzK93AfLM
	WmB3F3VN9nGdzNhcvWm8fKX/krGbDlWhNWEwGAlEF9rF5BWd4aczbaa2dt/tBx+EPkwkk7KoFykQt
	l+HzKKtWHz/0BFvMf64bQlgUxmVWFF3B+fGrbRYkLGCGYi4aBz1UvdTXLuIQTwZ67FXUzg3Ei/Jtb
	Us+5xkBhB+NFXgx5bUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Ro-0000000DScZ-2sz5;
	Fri, 11 Jul 2025 01:21:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua1f1-0000000DMRY-0cnZ;
	Fri, 11 Jul 2025 00:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 323B2A54AFA;
	Fri, 11 Jul 2025 00:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA6FC4CEE3;
	Fri, 11 Jul 2025 00:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752193841;
	bh=EUY3LTEqVfnyft6jycovUuD3pKLNok7s/ZTVTtqQMRI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qDXgPd5682nZ7FxAb4YqDdWOGHXZssyZ1ldAX7Z5B3DUTn9/3iaDtxIGl+IU25+/6
	 lCszKV01HyORq6wQmXt1o3uXd1KhkRXh5SXKFDB0hrzfQQBQ8ZapuKqBDA93f85QFc
	 26fFctGAWw/B1xy0XKWQ9VkKYx78xtROUAJZkcmN3OzZOyZJZVMe2vVjYwaOqoSblB
	 v2XnV+3u2o//Jcy4jn/7uzkGWOWL3IRyDiTnp183+Q3udj7HgOZYITzn1+F0vX0JT9
	 C4DtjnvVrsqV6x3f7tIZFUbLHaRVg333LZU2L+hV6FrTFfigtTI771vxvSIJZIQfIN
	 B+p/Kkkq6AYSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CE0383B266;
	Fri, 11 Jul 2025 00:31:05 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 0/3] riscv: sophgo: Add ethernet support for
 SG2042
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175219386374.1715084.5771017921965824302.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 00:31:03 +0000
References: <20250708064052.507094-1-inochiama@gmail.com>
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, unicorn_wang@outlook.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, rmk+kernel@armlinux.org.uk,
 prabhakar.mahadev-lad.rj@bp.renesas.com, joe@pf.is.s.u-tokyo.ac.jp,
 l.rubusch@gmail.com, quentin.schulz@cherry.de, peppe.cavallaro@st.com,
 joabreu@synopsys.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 dlan@gentoo.org, looong.bin@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_173043_252562_D7383A58 
X-CRM114-Status: GOOD (  10.51  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  8 Jul 2025 14:40:48 +0800 you wrote:
> The ethernet controller of SG2042 is Synopsys DesignWare IP with
> tx clock. Add device id for it.
> 
> This patch can only be tested on a SG2042 evb board, as pioneer
> does not expose this device.
> 
> The user dts patch link:
> https://lore.kernel.org/linux-riscv/cover.1751700954.git.rabenda.cn@gmail.com
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac
    https://git.kernel.org/netdev/net-next/c/e281c48a7336
  - [net-next,v2,2/3] net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
    https://git.kernel.org/netdev/net-next/c/543009e2d4cd
  - [net-next,v2,3/3] net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string
    https://git.kernel.org/netdev/net-next/c/d40c1ddd9b4d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
