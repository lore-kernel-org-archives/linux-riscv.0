Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E563C072AB
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 00:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8gboMA+RRjlEqyNMzJji1g4jzBKo9UketuiEQYzPB0=; b=a44ZLIHARGk3yY
	u9IIF5vClVD0FwdPyKPLvgNh3Okp8fjWN2zCQFkf1AD+VRbuN3xXMI8Lgz7bP3J7AvHeSoo6D0QLi
	FpXiYSt7mRQ49Ofb8W89d5NlpKDENIrFZPlT0KcnfS2L6ONf4Qdtr3N1vQn1bpQ9L6weDUGQlM0Wc
	PNUnLf9qszgNw6NK5eZ30C0ELCe3qqode7U2uVEDmBYHGnO9p2dtNOw30s27+hCef7FtxDRAJuOdF
	N2qsOmVVSMi5dXSdIuMgXNxkI4W0eAHk48cbWND3/lVmwhXd8c+VLQyRoYKqX46NyFEY2J2YgD0b1
	dfMjGzuxoGTerRJJL/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1yld-00BWqr-1q;
	Sun, 12 Nov 2023 00:56:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylS-00BWhM-2Q
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 00:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D1B84CE0AF8;
	Sun, 12 Nov 2023 00:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EC71C433B8;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=ECwHfXafrdIwVU+4vTjRoTfaOIHL/jM2cbtKPhWIDRw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XMQ/QzTsm/2p5sHNY8XVoVRUi/j61I8rkkz7DG0sgmog4v688RP7n7E268SHwB4Hi
	 kM0oj63eLQex67boZza/xlq/NXQhQarerk1DiZ0A9cI+O4hKRcQL6zCxr+Be8MFqLq
	 LmG1qw7E31WmN336Chx4XSLZrIrWEAsnnhfwbG4G297droNnZZ+MWBK8twkUXq2W6X
	 g6fd+XEsK/RQshV/QOYDIvyOhyVZKmkHTIn1ZMho9R5YVmektddYquRBbZrjGIT60B
	 DG5Z/HG204onRvLGN6PKGOdgeJeaVKp2kuuocKEYjxdKFgotC+WUwkDBTvfVxKWGly
	 QxG7lgKBhxmYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D992E0008C;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054638.11360.7816717973824399061.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20230912072232.2455-1-jszhang@kernel.org>
In-Reply-To: <20230912072232.2455-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, guoren@kernel.org, wefu@redhat.com,
 conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dfustini@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_165550_957168_9F3AFBEE 
X-CRM114-Status: UNSURE (   6.79  )
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
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Sep 2023 15:22:32 +0800 you wrote:
> riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> dma coherent, so set dma-noncoherent to reflect this fact.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Tested-by: Drew Fustini <dfustini@baylibre.com>
> ---
> 
> [...]

Here is the summary with links:
  - [v2] riscv: dts: thead: set dma-noncoherent to soc bus
    https://git.kernel.org/riscv/c/759426c758c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
