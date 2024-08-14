Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6098CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kG2ic4oR5nDgjPkcBtdOxbQNPHE2QOz9aKqnL8USkVs=; b=siU7Yqur1kwmp3
	Tg2cJF7zW+QvMSgRwyZb6Vsw/K4RDvJkNeunhRgbNCo7WfTatxfxHPPtmZXwxYrNsBaz+HGtR35YV
	P6/ZsbvQCCUNVl2nq61yPCXvr8Q17LLbG8DLtSwL84/2XWF4hTdcxRfC1ruLHjJjRg0zYW7UfMUPY
	PIIIv1CJi1wZ4qtwvw397X8FJ2Q+aOv860WjIc6nKHBqS8KzAdWb9Gl7FRVgaXg+8GBo208UTiUc7
	33PaeINwitqgkNGstkWpOT134GgihO3dtCcSXDfg9tI9TTVePA70uRUX/o99bgLFW6BVFhR1Q/Agy
	VrUNdCprLIauvPnX5TQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEi0-00000007Dj3-3lk9;
	Wed, 14 Aug 2024 14:10:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEhv-00000007Dfu-0s9T;
	Wed, 14 Aug 2024 14:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B207661AA9;
	Wed, 14 Aug 2024 14:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8546AC4AF09;
	Wed, 14 Aug 2024 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723644634;
	bh=K3AQ07cuCgUyJCPRakco3p9i1a9jiXa67Ur23zs1j0c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NfV9y9qZfixgg3kwogSL9+LtAmZLeIaEZVKYrhxJMEUTY7DpDoMB7263I2Dw+ZDtL
	 vqHd8kDetJhkkykJoeAH2VMmK/2o3UeUdB/C8lgV4cwRCGQNBR+YoZ9u1AqYUYDj3g
	 DC07bNb/D5exBk2saq2ylhNbmhVJObqjdsJercZPNcgsQYc3xUmWcPNcMYrtbF6jiF
	 mZPhAEGb6B7WLU6AI6dKKxKCIO91OXsLQRBUda0zhArpoHMKzSmqL5H1SO3fSVPRo/
	 3gHQ4M2AR8BNLpR+eqcuwVEYuUOPKkiZ5MGyzvV4UQDC3sLQBGAzT8zMW1aL87FWbh
	 v/TOg3jOo5Wpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB08A38232A8;
	Wed, 14 Aug 2024 14:10:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] riscv/kexec_file: Fix relocation type R_RISCV_ADD16 and
 R_RISCV_SUB16 unknown
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172364463350.2278280.14691701821976528565.git-patchwork-notify@kernel.org>
Date: Wed, 14 Aug 2024 14:10:33 +0000
References: <20240711083236.2859632-1-sunying@isrc.iscas.ac.cn>
In-Reply-To: <20240711083236.2859632-1-sunying@isrc.iscas.ac.cn>
To: None <sunying@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, ebiederm@xmission.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhuhengbo@iscas.ac.cn, petr@tesarici.cz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_071035_400343_248EC554 
X-CRM114-Status: UNSURE (   6.66  )
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

On Thu, 11 Jul 2024 08:32:36 +0000 you wrote:
> From: Ying Sun <sunying@isrc.iscas.ac.cn>
> 
> Runs on the kernel with CONFIG_RISCV_ALTERNATIVE enabled:
>   kexec -sl vmlinux
> 
> Error:
>   kexec_image: Unknown rela relocation: 34
>   kexec_image: Error loading purgatory ret=-8
> and
>   kexec_image: Unknown rela relocation: 38
>   kexec_image: Error loading purgatory ret=-8
> 
> [...]

Here is the summary with links:
  - [v1] riscv/kexec_file: Fix relocation type R_RISCV_ADD16 and R_RISCV_SUB16 unknown
    https://git.kernel.org/riscv/c/2d1f51d8a4b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
