Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCE3C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3SCCJepJ68+HCeWlSU9UDSPEuZ06RqxyDtTaVggLwE=; b=VzCeq8+cxi55oR
	x6ZEBG0gh8fWh1rOQbUhrY7qbC7ozOoHSCcF0ETpZQqPGGaP1tF0RXFfC19HJxuVi+5r1AeIBMAGm
	VqBnD64HWXYYBv4IGWe1aMLzFOjKdRpXUf+qHI4MdWplbTlZIdLoNOXynOy7lLCwopG1+S53HLze7
	oZZ1WjXs5tWMBllA+n2ZB+tyCmWNpQn4WW2Fj3MmWwoV7T0xqVvYB/mraKUrbhgYzsfkWxBicp2J4
	p1sYd8WYKhqCbesxQCTyvm7xL7/hxUrnpAzEW1VFYfAnby3VFBnHeh7e8Tz6utJgE/6Zc6zGFkwje
	B5dpNmLjZJWClxK4KXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhns-0000000FtJM-0egU;
	Wed, 06 Aug 2025 17:19:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhje-0000000Fs8O-2CyU
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F113E6113A;
	Wed,  6 Aug 2025 17:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7EFC4CEF7;
	Wed,  6 Aug 2025 17:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500529;
	bh=8B0NliE6n4LX04m96CKEoounFlBMNv1G5wfUZ2Px2js=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dtfGF0JXvAFud8q/t+UzlW9sRz3VRGJF87Qexg5vE4OaYMrJb2B715zgsV1A+Tk/5
	 LBOLkfZLw/tv/rNIRNbDpiRqqXhkLjV0wMOPwUj+/09DvhKSmD07mEkaJmJOlUSllu
	 NpsfTmECkgqyNxtezLWWdhtJv63DDOdSdsxdIcW2x6mQP5swa0xi6in0VLUV9Q7EGl
	 nguYPEePZ/YujzBUT5O5hKBsrCK0dAc/NmHdguzZnuC+hGA4VfivNa2FtOc/5+F5OP
	 FTUjvKqSRjcewEoFk7jTFWmDpmIatyVCt7ETPBLkMl3s7tFJKz3fj+ka130OmPEjaw
	 DZlVrU44YrbzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0F383BF63;
	Wed,  6 Aug 2025 17:15:44 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V3 0/5] Add an optimization also raid6test for RISC-V
 support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450054334.2863135.1157154910946265186.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:43 +0000
References: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, song@kernel.org, yukuai3@huawei.com,
 linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhang.lyra@gmail.com
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 18 Jul 2025 15:27:06 +0800 you wrote:
> The 1st patch is a cleanup;
> Patch 2/4 is an optimization that takes Palmer's suggestion;
> The last two patches add raid6test support and make the raid6 RVV code buildable on user space.
> 
> V3:
> - Rephrased the commit message of patch 3;
> - Added Alex's Reviewed-by on patch 1-2;
> 
> [...]

Here is the summary with links:
  - [V3,1/5] raid6: riscv: Clean up unused header file inclusion
    https://git.kernel.org/riscv/c/37b36d582c02
  - [V3,2/5] raid6: riscv: replace one load with a move to speed up the caculation
    https://git.kernel.org/riscv/c/ae1e25a17cee
  - [V3,3/5] raid6: riscv: Prevent compiler with vector support to build already vectorized code
    https://git.kernel.org/riscv/c/eda46027e4b6
  - [V3,4/5] raid6: riscv: Allow code to be compiled in userspace
    https://git.kernel.org/riscv/c/e3493fde9c22
  - [V3,5/5] raid6: test: Add support for RISC-V
    https://git.kernel.org/riscv/c/db001a4e2eca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
