Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2737AC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPxoDrptYvfB72xWSJ636Qv+eFSC9sc6uvN1XTOZOXQ=; b=B5KDKIET4Vq+AM
	o+nIbMNe0XGdwRB3rC6ELgQX4eTqa9/i9q7bkn7KVFLylcNQDVfiPhboVlz6lxUhxir1/X8OfO3N1
	gV7jaRwVktGZjr5IrYWFC6yQytlCaUnr0UIx8+zpF9DLK/V/G2mC0cIp2KmbL0eKId8BrCa0Yh5eO
	VSedb09QEcqV9OPqN9om0SRlDGcWUEiq5gD5lm8nECqWNSQb+MJLlRTX2MNqEq8tH0Ikwv4ENYh4u
	Ir1bkIv3ELceVSeXQg19UjXLnfIVTq2xGCuMh0LnInFZ7MTX83j7yUdWr7hyRVMDf9rQx3GV2K5sX
	YYwjvrmHzvvuwXu2pHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6si4-0000000G6ke-2REz;
	Tue, 14 May 2024 14:00:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6si1-0000000G6i8-1hwn
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:00:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D2584CE128A;
	Tue, 14 May 2024 14:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DCFBC32786;
	Tue, 14 May 2024 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715695242;
	bh=q4VWeFDoYuUSIevq7piqtaLyouhlVQEVm3uHhS2qql4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SFDHNYghZQwpvf3B9Oej71J/1ka7QsDyj6yo/Fhb5wd4Phj4BLWY+CZizo9p583Cc
	 sy7QQSqt3Q0d1tFdVPbgoNETnuXN1MBw7KJU2cDdhywfH2eARKL8575WxSkjkR2a9I
	 hhb7XD4EJKyAs0OE5fidHtBMkOlr1R7mgsepE25qyaHVCXhgTruKv2z9sQiYUxoBL7
	 iO2JYaeu/UOi25d3fPhGWSC8UIISr0e5k8OzBk3QPeoQt2FRSmA62RN4w8Us1O5pTH
	 DoGoG8qr9VO0amBU5UVTVhPUOlzGcNarikz09hKjHceh+04aocgbBOoo5dmQK6Mx31
	 mF3pbOVG3Omjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30CB2C3274D;
	Tue, 14 May 2024 14:00:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: defconfig: Enable CONFIG_CLK_SOPHGO_CV1800
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171569524219.4793.14427180278508799172.git-patchwork-notify@kernel.org>
Date: Tue, 14 May 2024 14:00:42 +0000
References: <IA1PR20MB49537E8B2D1FAAA7D5B8BDA2BB052@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB49537E8B2D1FAAA7D5B8BDA2BB052@IA1PR20MB4953.namprd20.prod.outlook.com>
To: Inochi Amaoto <inochiama@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_070049_725376_73F906DC 
X-CRM114-Status: UNSURE (   8.71  )
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
Cc: aou@eecs.berkeley.edu, dfustini@baylibre.com, rafael@kernel.org, unicorn_wang@outlook.com, prabhakar.mahadev-lad.rj@bp.renesas.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, svenjoac@gmx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 11 Apr 2024 20:12:40 +0800 you wrote:
> CONFIG_CLK_SOPHGO_CV1800 is required when booting the minimum
> system for CV1800 series board.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> [...]

Here is the summary with links:
  - riscv: defconfig: Enable CONFIG_CLK_SOPHGO_CV1800
    https://git.kernel.org/riscv/c/92cce91949a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
