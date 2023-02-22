Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AA6C677F1
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/zhrkEyBDiR7KUCLAMy83FMlSXtBpIbmCbjiD1zypI=; b=i84QkG1WsKqh+b
	B/fNUKUa5BCTkRDtCPuPuXccHenJGA3XZZJEZ67OZlW4kx8XoJWUC8MDPo6lO5s9ScGvzeuHiQj0W
	9MTbEyFdnbNILmX+TrDujEOcTz8d7q6ju+3XUfjxfNQeHby7D2SsptJ3dctPdxvqHZtPeK9LBINzA
	rJTOEY7Ba5axbQKqVAseyfJhPhLqKnojuRsOwMvWVCZgJq5ejK7E3QdEXDpZNzPGRBiW1s6VNAtdB
	YFH7g3WOAqlg6RV8YKCoM43vHR6NfHU5iXEEJLI3fmCT+BtUoSNU6jvkLmhoWpz13C8dM7axnVwh2
	gNWKPz7yrJd7OdAl7naQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbh-00Cm9M-E0; Wed, 22 Feb 2023 15:00:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbZ-00Cm57-3D
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 15:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B795614AB;
	Wed, 22 Feb 2023 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DD4EC43327;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=k49hwiojMse+SILSm7wXkYRQsKlXvLYPko86V0/k+1w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NsBQv1iF5XGBWnhqMvfgdOBBfruxqjYnWOZPDLahhOzcgctAILnkUEdpeId/rE0R5
	 MA8rykfly0b3B6xyWbhRq1AUgWgRqGXY38G2kNcfzzyiP1Ata68gC6322snXJ7zye2
	 2S899zp/Cj1Wc5fBAQ7m53wuZPOpZ+G63xIltTjK4PeROC9SrWr9RqlI9P03DyUfyw
	 Ggi9Dqx8gArhkkZvbmO6Ki2rspAmBsaBLW62RI9HNL7QJ4K5fy2fhNAzgOqIWkm7QF
	 rueQd5GvQgI3wyu3x7cnc4w3XB7zu8CKAktPZoH9qoOOnaFPo38YxPOyucplFTyMHU
	 Ka+/2QLEcrSkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7366DC395E0;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802246.24438.6348358989304321260.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230212194735.491785-1-conor@kernel.org>
In-Reply-To: <20230212194735.491785-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, samuel@sholland.org, linux@roeck-us.net,
 ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_070025_225597_3D96D0FB 
X-CRM114-Status: UNSURE (   9.44  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 12 Feb 2023 19:47:36 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Guenter reported a splat during boot, that Samuel pointed out was the
> lockdep assertion failing in patch_insn_write():
> 
> WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x222/0x2f6
> epc : patch_insn_write+0x222/0x2f6
>  ra : patch_insn_write+0x21e/0x2f6
> epc : ffffffff800068c6 ra : ffffffff800068c2 sp : ffffffff81803df0
>  gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : ffffffffffffe000
>  t1 : 0000000000000001 t2 : 4c45203a76637369 s0 : ffffffff81803e40
>  s1 : 0000000000000004 a0 : 0000000000000000 a1 : ffffffffffffffff
>  a2 : 0000000000000004 a3 : 0000000000000000 a4 : 0000000000000001
>  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000052464e43
>  s2 : ffffffff80b4889c s3 : 000000000000082c s4 : ffffffff80b48828
>  s5 : 0000000000000828 s6 : ffffffff8131a0a0 s7 : 0000000000000fff
>  s8 : 0000000008000200 s9 : ffffffff8131a520 s10: 0000000000000018
>  s11: 000000000000000b t3 : 0000000000000001 t4 : 000000000000000d
>  t5 : ffffffffd8180000 t6 : ffffffff81803bc8
> status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [<ffffffff800068c6>] patch_insn_write+0x222/0x2f6
> [<ffffffff80006a36>] patch_text_nosync+0xc/0x2a
> [<ffffffff80003b86>] riscv_cpufeature_patch_func+0x52/0x98
> [<ffffffff80003348>] _apply_alternatives+0x46/0x86
> [<ffffffff80c02d36>] apply_boot_alternatives+0x3c/0xfa
> [<ffffffff80c03ad8>] setup_arch+0x584/0x5b8
> [<ffffffff80c0075a>] start_kernel+0xa2/0x8f8
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: take text_mutex during alternative patching
    https://git.kernel.org/riscv/c/9493e6f3ce02

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
