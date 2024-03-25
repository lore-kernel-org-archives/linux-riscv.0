Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C696C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 04:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPQwEsnceHubyUAFmA261PpkEbBHFKlGZ+xaKuatgYM=; b=Fhcq528ZSe/vNO
	D5El2GM+UhDhoULdf0snaFEyNTVJWzAKsiEYEXd5eXZq7TdxFZDrXlyWdfnPcGoceBAYk73nXtGND
	4UVXDKxjGybpILtHeXJFjcwuqHV7a7NZillqCbRO4wRvj4GdaR0LbcC7ZS+qaIbqoP0IAsNFL988D
	aLv3Ifq2jGE5GOjlEMyX1NSO//TA7DsOET2WaUOEXu7Kg0glxJ6p/6NXxztvu3SW8dARHr22a444p
	17+Kbe7zaYZ7VP2b/QeRfBCXnthcblt6Vedks2S9I5nup0DfWATUiVXzgt2D5m/2DbQzdxiwqi8ea
	128q4m24ioH2TIpp0LfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocB7-0000000FEUc-2kDP;
	Mon, 25 Mar 2024 04:43:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAO-0000000FE4m-2T5R;
	Mon, 25 Mar 2024 04:42:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C146D60DF5;
	Mon, 25 Mar 2024 04:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7D52C43141;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=4yStfrK4SQVUbj2aqcQE+48u8AfaMFrS4+tHEELssTw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZCEzRCyze7tj2dRAQEKT/yrQWS3Pqn4bPaxgQKZdu9YbhUtZLJD0OydpAcdL20PC4
	 7iWeNBDav2s+KtOjaj7l27OB0sCln5/g9V5SXAhjhM7EBkT+L/FFYX1S4pcK4XwWRQ
	 pBtQ6pxqVCSVdLLo8XRAXV45QE85EquJCd+GGNsSq4aDXrJ8fipEZWgCqfrqGbzsa5
	 oRYEe7vAr9h4RbHDCPMVAVMXcT3uCr2OT6NCXc2+AgDiyEYVn3ZkL0eQXFcRH4bldD
	 F4bUwh+2thCfZ6iLVZBp6HqT2GbT5c7VdFpeMjQyP5Lvmvg7/udPNRbiMi7Bn4c6f4
	 XPWJGMvrygDww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A971DD2D0ED;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] arch/arm/mm: fix major fault accounting when retrying
 under per-VMA lock
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171134175469.18749.11610415936860732367.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <20240123064305.2829244-1-surenb@google.com>
In-Reply-To: <20240123064305.2829244-1-surenb@google.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 willy@infradead.org, will@kernel.org, catalin.marinas@arm.com,
 palmer@dabbelt.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
 agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_214236_901761_B4657459 
X-CRM114-Status: UNSURE (   7.63  )
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
by Andrew Morton <akpm@linux-foundation.org>:

On Mon, 22 Jan 2024 22:43:05 -0800 you wrote:
> The change [1] missed ARM architecture when fixing major fault accounting
> for page fault retry under per-VMA lock. Add missing code to fix ARM
> architecture fault accounting.
> 
> [1] 46e714c729c8 ("arch/mm/fault: fix major fault accounting when retrying under per-VMA lock")
> 
> Fixes: 12214eba1992 ("mm: handle read faults under the VMA lock")
> 
> [...]

Here is the summary with links:
  - [1/1] arch/arm/mm: fix major fault accounting when retrying under per-VMA lock
    https://git.kernel.org/riscv/c/e870920bbe68

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
