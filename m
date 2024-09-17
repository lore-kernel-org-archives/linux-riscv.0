Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E35C3601A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkhxFIQ4rxDKENYmKCIOcguElhN1bCJEyAMPrrrGq14=; b=tNd7XaGHZIGeXQ
	q3EKdZndBySbbqVis/Dx3oC3rU9w4C/kQ5acHLht0sotyuX0cTli3FGPDy4yday4WcUR0V88lXQ++
	JifzAvMpbW3LgTOhOkpNGvvYGGBp4nYgaxcSs5y4ZxTdbBVZ495bZcQZzy6mXU3sqhzaX5J5YrjG6
	zyRvoUETuDXzqL7rU3jV8Kblixj2zSY1zPjPOxND2DkNl2ZKlA4rWJvMowU0aLB2RaDU3o1I1+yIh
	AKnpMlNswVnR854rySsYlIvg7Ux8fHAR26GjMRljw+YLMj/esW/DMKiol/LKYs9O4afnhl41SfWEc
	Kv14IoVL3CDkGkSVigGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXpC-00000006B3s-1qmE;
	Tue, 17 Sep 2024 13:00:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp5-00000006Ay3-3vZm
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D739A41477;
	Tue, 17 Sep 2024 13:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1EFC4CEC5;
	Tue, 17 Sep 2024 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578051;
	bh=Q6+9RPMnWXw7ty1d3wppsdJNDMw93d6I2iASc3TKGVs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CMzTIpXbmef+awfETv2iG2KiMB2Sb45MD9fjKeISVtRC0qQy1aD+sRJ60m3VRHL46
	 8IU9uf1YXHLUkpTmMkLTP72J6OGvisiwgEeBcQrSKfYs6tuyh55t8dSw9ZWAGb271N
	 xEet0IOPgoPEPFw/lPyMgusl5IAKVj87iFcHIgTR0DyZ0PXCBf1TQ8UwC8b2jdiZPE
	 6zMPLVmGjLVHKzk+KQfyfFo78nZCY8iCrtxKhzi/pkiZp33CFSsvpzqIfTMv2x0K38
	 8lNZ2AH5gJ+9ZZvwmWk2A2eiVzK+tm5fxK7T569IjBjlO1oYVGtMD1uZiJu3fii6sA
	 6mzcKhnYFLSOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFE63809A80;
	Tue, 17 Sep 2024 13:00:53 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] riscv: select ARCH_USE_SYM_ANNOTATIONS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657805249.126252.16379053409750992964.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:52 +0000
References: <20240709160536.3690-1-jszhang@kernel.org>
In-Reply-To: <20240709160536.3690-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, cleger@rivosinc.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060052_165582_8B18F6BD 
X-CRM114-Status: UNSURE (   8.24  )
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

On Wed, 10 Jul 2024 00:05:20 +0800 you wrote:
> commit 76329c693924 ("riscv: Use SYM_*() assembly macros instead
> of deprecated ones"), most riscv has been to converted the new style
> SYM_ assembler annotations. The remaining one is sifive's
> errata_cip_453.S, so convert to new style SYM_ annotations as well.
> After that select ARCH_USE_SYM_ANNOTATIONS.
> 
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: errata: sifive: Use SYM_*() assembly macros
    https://git.kernel.org/riscv/c/6868d12e0205
  - [v2,2/2] riscv: select ARCH_USE_SYM_ANNOTATIONS
    https://git.kernel.org/riscv/c/7c9d980e4670

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
