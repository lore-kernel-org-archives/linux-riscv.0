Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A71AC4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8PLH4XA3/xMY61QyCnm2EJJ+JR2z4VotpL/BEjG59w=; b=E1RDE5K2AtDEjH
	H8HYB0xa9vrYUMGPdqZ0aPC3I9Kpbfix598kqcewpIFxta0trYXdL4EhQQoy3Bm0sw4HzHj0fUcWH
	QGSDmFOJDnnwwURov/VPO3SC87saLO8P2RAljroX0hlQyOdRydHjhDC4+35lFFIZ0vnYeVSlcELFl
	7mBw2Eodwr66h5PPhWmhWDld3I3/WhiuX3qRKFhWmA/h5ziESDbD4YQplenfupOd4xHha26D5n7Gm
	ooc0juWv3Kgb7PHNpakfTCxt1/2a762qZRdrTgIGi27ylC4u3INxixNYE7tIG7Dlsnp/IdyqEQb8n
	6Y+nlnlHlWiSIKPHDI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeBD-00AEKS-1u;
	Thu, 02 Nov 2023 20:20:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeBB-00AEHX-1g
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 20:20:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 160ACCE0683;
	Thu,  2 Nov 2023 20:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A82BFC433D9;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698956430;
	bh=o+okMsX1sujuGrVBY8RFU/Wu9ztfX9TyxTvpmsJCxx4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HHDH5fW0VoxooDlTJ+8nCB5rfErz3QU6csb2u63bYlKAc6kiSvrDayvvYChCW+IMH
	 a7mtiHV8kej5cPyJ1h0X6+h7+xFcZMk+Um3WR4lOVGvd4UJH3V2i46r4OTOKSWHqQI
	 iYDaqWP4P/zwIpv4fVYtPcp62WuQDFfnmTylMtQlAjcu74d6WfF2lie6rQ9k55E80Y
	 jwVyrJ2I5T3RoQ4FJWF6DB/PKvZAcbHzgi94UiMPF1/BDuzwJ58WV3MsbPAwrIB0BD
	 GXXwvxz9aUIaZbHH8cYR90KL6sIlQigiYe3rQ3KsehR9noDPzPrJRhTi3BaCGUFO1v
	 A5fUJgUgMGWvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 84251E00081;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] riscv: errata: improve T-Head CMO
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169895643053.22248.14459905412132338813.git-patchwork-notify@kernel.org>
Date: Thu, 02 Nov 2023 20:20:30 +0000
References: <20230827090813.1353-1-jszhang@kernel.org>
In-Reply-To: <20230827090813.1353-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_132037_747050_1236C828 
X-CRM114-Status: UNSURE (   7.27  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 27 Aug 2023 17:08:11 +0800 you wrote:
> This is a renew of Icenowy patch series[1], patch1 is necessary to
> make T-Head C910 powered SoCs CMO work correctly. patch2 is to name
> those instructions following thead-extension-spec.
> 
> Icenowy Zheng (2):
>   riscv: errata: fix T-Head dcache.cva encoding
>   riscv: errata: prefix T-Head mnemonics with th.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: errata: fix T-Head dcache.cva encoding
    (no matching commit)
  - [v2,2/2] riscv: errata: prefix T-Head mnemonics with th.
    https://git.kernel.org/riscv/c/c1c99e5f1b13

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
