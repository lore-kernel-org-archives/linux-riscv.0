Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DA7C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lH9pMz7yTlvHa9yKZxYSCzTIgA+t9NWV3TdflRrFHIA=; b=z3qew7+H4vBUkE
	j2kVpKoNk4HRx7z7rglUyEYay+8pHQVcPvrZgeKLwNZC3S/U25vW3GG9+ILnKvjHKh+m/hVepguCk
	QgBltFEgtKhtFD475bcRkdrma54wbnjLv+SViscHTFT+lxYISAFmd0AT44S2I2qMl/Yvniyj0GDFm
	RMmW0PiktJNfShMWdqSXnm7nDmWJhh6GmsUMekAyTQhHA+xyObO3TJE/O++a9YOfV3rgRFprH+zY2
	YxfHrlWEbIC2FAonALJJ1YS4+Ca1QYLdwnN1YRAqqYLY8mMubdueWSTcPZgzvdEFYZ0Y56FDn51hj
	GA2L4kCeQwYomN/m1X1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbg-008OeH-2k;
	Sat, 20 Jan 2024 21:10:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbJ-008OFf-1r
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8D6B1B8094B;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E057C43609;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784999;
	bh=Uc9RmMV/bChQHcwZy6eVR8V+6YZdJL9xxLXYJdzSFVk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iJI69Cs1UJUXFrDB1btlsmANpWWvbJ99kvEPHdb56qHFlu1bOBTkFRdZq4Ckr3JI8
	 QHT0BnkadFAbz+TNz2sgLuhFWUqfxowUW7W+ZVz4S3rlltTYMg7Y224NGZ7Z0WuT5H
	 JZmcRmlbghoIiCh5ek6oAGFAx0Xc8Or/vVZLO1B7GPdoGQxhB7mtw/RLe3EUuXaByU
	 nEuPVTRQYF5W91pG2W4SfEkQMTQmDH6AXY86UWVlcdlm91iHhzLQDhm+dGsGAB0R2J
	 ghXBKMjYzrhkbQFItYrWb0vVseuAA2gn3lzGaC0IZwNL6Bokpk2W1ObgxCLhYWVS+F
	 GgYGa62h8iyVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B217D8C970;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: lib: Check if output in asm goto supported
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499917.24348.742461114194301217.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:59 +0000
References: <20240118-csum_remove_output_operands_asm_goto-v2-1-5d1b73cf93d4@rivosinc.com>
In-Reply-To: <20240118-csum_remove_output_operands_asm_goto-v2-1-5d1b73cf93d4@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_131001_899495_D2AE40B4 
X-CRM114-Status: GOOD (  10.20  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 18 Jan 2024 14:36:45 -0800 you wrote:
> The output field of an asm goto statement is not supported by all
> compilers. If it is not supported, fallback to the non-optimized code.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: a04c192eabfb ("riscv: Add checksum library")
> ---
> The OutputOperands field for asm goto statements is only supported
> starting from GCC 11. Split the asm goto to remove the use of this
> feature.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: lib: Check if output in asm goto supported
    https://git.kernel.org/riscv/c/4525462dd0db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
