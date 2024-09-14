Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B228C02181
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6xXUx0EAtMlVnbG0GMIk2r5I3NCPAk3U0IGwE8RpRU=; b=fkjub+I2I58rs0
	2wlN5qfqQK76b7SbrE5d+0q9XDRizZJLjIBRT4Vf8tJiXCX5P3H9YsYfJ9e3kIaE399brcVef9xfD
	F3OHDlf039tEph+ctGp+DCJBobr5NqhBCcXUNptq3bS/OtmfMhzeCxTzFlaqb6o/EGZNPN3bnoa+X
	9N/KBriFgU+9TbuZpOLasuO9UlyiP2NGax+HRwuDyYeeCaF4LsCmSGPDbhyhg3uKLi34pe6M+FNgI
	kvFEFdryb5nDpUDVmCLsD06mcW4SDwnVpACuixgninE7gVIKkp0w4uhADsc9NQgX1hUZhict97Fq0
	IxAux0CBlyiFrfK4opTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spNu7-00000000Kvs-0C9k;
	Sat, 14 Sep 2024 08:13:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spNu3-00000000KvI-3Rvc
	for linux-riscv@lists.infradead.org;
	Sat, 14 Sep 2024 08:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06B8EA404FE;
	Sat, 14 Sep 2024 08:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E34C4CEC0;
	Sat, 14 Sep 2024 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726301590;
	bh=/2SevD51AcV5pVbvRLnt56xDTvHbzz40ZtLBxX4HJQ4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GgpTdH3l75heIogZDa3tqbkaBULKvauLr8695+GhRAaE8oGLVk6GRi6NvGDfTyrBs
	 ZGMJLu5jB3XBys1IUGSC3RAcLwEQOcp6rwJs+c3c4i4PS+WkCjy9yB9fiD5NkHsd8z
	 900xT8f0d0pDfdh5XLcn+HeUTrJXLG/ReFpt2gabul7S2A3T06nmHJRoBww+LeZovn
	 rghF+p+35Wu4TbZueHtcCVCQT9oLKz3i31ozKLVL8PR1pyRTnXhyUQoI3tV2if3DUt
	 +89/Cx49Hj0quN6ouVWPqjenDe90njlwhuU2kxqG9gZEJ7FU/qH00pAr6fL0oZ0pRW
	 dqIf/aJ937mtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2E73806655;
	Sat, 14 Sep 2024 08:13:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: Add missing licenses
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172630159149.2498524.12159135435898265005.git-patchwork-notify@kernel.org>
Date: Sat, 14 Sep 2024 08:13:11 +0000
References: <20240729-riscv_fence_license-v1-0-7d5648069640@rivosinc.com>
In-Reply-To: <20240729-riscv_fence_license-v1-0-7d5648069640@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_011311_943346_77FB75FB 
X-CRM114-Status: UNSURE (   8.39  )
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

On Mon, 29 Jul 2024 14:00:01 -0700 you wrote:
> I was poking around some files and noticed that vmalloc.h and fence.h
> were missing licenses. This series simply adds in those licenses.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Charlie Jenkins (2):
>       riscv: Add license to fence.h
>       riscv: Add license to vmalloc.h
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Add license to fence.h
    https://git.kernel.org/riscv/c/097c72e1f2b5
  - [2/2] riscv: Add license to vmalloc.h
    https://git.kernel.org/riscv/c/4ffc8a342298

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
