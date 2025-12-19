Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8242DD711D6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlgCwTKCoNITKTcmJULM6m7247lZlmIG0gZwCIomDkI=; b=WJDxH+6rGZu23I
	/jXtaH+dB+ZlrcFXCOJsVqGMSAEezVWUvkaCgioxfbZwiB2ZQAxBRLdbYIX9t8OJhn+n6UggZheHe
	6IkZHWkhgd+0zpBR2vBVUlHdg3/+eKMqhECaCLf3qzLMLT2oafxTCTBwmPHhsmwCfh8pgopRJuHtf
	zyz/cbcnatpJqOnf2n0Y3JAKTZeo12TF8VCBODM9FgM+eJenDB6yZGjM5sYLpk+H8q9zX4zLUgKao
	ykQ1RuHODacu9jdRkzkxg5FtlHITFS0VTLvwKHx3a6+Rb2+vDxGyz2Cslpvc8rU0G5I/dh8ssCLMU
	g+jOlKjysfRgs1TD8krA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVcN-00000009pSf-3r75;
	Fri, 19 Dec 2025 08:13:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc8-00000009p4F-1lBN
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0535444498;
	Fri, 19 Dec 2025 08:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FFEC19421;
	Fri, 19 Dec 2025 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132007;
	bh=VPA2RV+H3SHEDkHvAU2bPivwR8k4P2M2QGI+Sg01Br0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZQh0Y67Rx2TED3sHcn2P5Mbjft7nV7jDjkmaBEuWlr8knlHX+Y3j/HdCVnCqWp+at
	 xZbQPi8CV0R/dAGwdy5PmKqm55nu4iHoDGzHNoH/MpnBfQ+JHRVTLGL7k4cuqOpS+t
	 sNPbGW+JtFUEXqPyAJjxO8DF/7YSw7/O4h/nFYHJirJVmQDDGaLAnN6576J30d7DGN
	 pge69FDgc/+DShj4bTgTJhyZeAgD4L84auJ9zTmADkjih3FTHEINTRMjJnUqEYqptK
	 768PsZxMwsRlzifc1CnyRynkXgGpkn1Fy9wXQcVoRd3DRgz6AlB62WHPfnUVQbs1mk
	 EL0lvUwGgHAoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2B14380AA50;
	Fri, 19 Dec 2025 08:10:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613181654.3684357.18070317581817603415.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:16 +0000
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, lee@kernel.org, dlan@gentoo.org,
 elder@riscstar.com, andi.shyti@kernel.org, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001328_628329_65EDEE32 
X-CRM114-Status: UNSURE (   9.09  )
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
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 18 Nov 2025 14:08:04 +0800 you wrote:
> Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> merged, the driver would fail [1] when COMMON_CLK was not selected.
> 
> This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> patch has reverted by maintainer [2]).
> 
> Now, P1 Kconfig patch has been merged[3], so I2C ILCR patch can be
> merged as well.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] i2c: spacemit: configure ILCR for accurate SCL frequency
    (no matching commit)
  - [v3,2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
    https://git.kernel.org/riscv/c/16bd954c9336
  - [v3,3/4] regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
    (no matching commit)
  - [v3,4/4] mfd: simple-mfd-i2c: add default value
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
