Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC16DC7EE2D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rILOtYgRSQE+QPGwTw0IUZ6l40koX4+VkOf1XmTGjVc=; b=rRIRjkOKW7Q2Am
	ItCqil3xYX+Tmp3rFmhyZJ5OVa+ds4jfVapvJ2hfJy9eVW04Fa4MYxwO24QAAs/9+P52GJ/KO9zyu
	xU7ScbJAIsfZdL9KHE9rwEixa2IrgzfDQr7iHo6S6zL3U0X8p2acBnQ9tmfOzLFAv8TOSTaQH2un6
	u+EV848XwjE58Pv2Jf8k6uWTGT7sFz96diTUlpOPeV8rpdfoArorc9Sun6sVhltMpRVBqcAJOSPHu
	T0DKJz02qhbLctLxn0U+R9Cl+YAFxTKk/GYmyPErBNTJW3DUgF7SHhTMgNabA/P7LTvngWuTBMVve
	poa/MjX2Zo08zgLyCVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23y-000ma3-0d;
	Mon, 08 May 2023 14:42:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23s-000mWW-1I
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:42:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0322963F0A;
	Mon,  8 May 2023 14:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79973C4331E;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683556916;
	bh=iiK+/z6CHwJS0C1NeEmEWs+kZ4yRiOpMM4oq3dhmQMA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oD2N2ApPYCUX15+T/aoqbi8hBBsCsi/nM1W74A0Au9Rv2QM/7nVsd0b+Rjqql5+CZ
	 XC9x8YusKHhbFzMYd8/rKiAZKo+VWLpxqqHxoyW1E+YUg4z/pPZudQNiPuEDcpWye6
	 5sUQf3/ms5YdMxxBBinVDnlBgGmPHePwTlzzrv6+7EPRw+ShPRSbuxPkXSpy+63jYa
	 /icexnPsOMnz/kyZxVQTnEWAOrE2FS0/e+Bc0q6+yakVuZXnUm+zUPkCM17k5Yb6FM
	 +9Lya6QE4dUVSb9+Thi28513dGrAb08lMW53IPCJp8Z2ZCqDuOOzn1GVUj2sURDibd
	 q+DMDWehcEYkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5AA9AE26D2A;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] dt-bindings: perf: riscv,pmu: fix property dependencies
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168355691636.25692.16621694024321930278.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 14:41:56 +0000
References: <20230404-tractor-confusing-8852e552539a@spud>
In-Reply-To: <20230404-tractor-confusing-8852e552539a@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, atishp@rivosinc.com,
 conor.dooley@microchip.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, ajones@ventanamicro.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_074200_488071_0DAC7425 
X-CRM114-Status: UNSURE (   8.93  )
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

This patch was applied to riscv/linux.git (fixes)
by Rob Herring <robh@kernel.org>:

On Tue,  4 Apr 2023 19:03:22 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Seemingly I mis-implemented the dependencies here. The OpenSBI docs only
> point out that the "riscv,event-to-mhpmcounters property is mandatory if
> riscv,event-to-mhpmevent is present". It never claims that
> riscv,event-to-mhpmcounters requires riscv,event-to-mhpmevent.
> 
> [...]

Here is the summary with links:
  - [v1] dt-bindings: perf: riscv,pmu: fix property dependencies
    https://git.kernel.org/riscv/c/4d276e4d3bb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
