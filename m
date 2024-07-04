Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B34C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxD06dA7M352uvzqpK+UsEXsryTVAvFklPlETSA32mo=; b=IWiOa9fci4i7Sb
	MoK86MBwmcoQHZg4VHb6oovCgsFdbg39Lbe8T84gcqoVlggUWP1iYraPKlfIhvudMy1wr+vOAvd5H
	mnBpjxvzR3chSmxpyznjxdrwCFfejBnbjB0iawULGka9r/F7FDJLpnsptaNwzRet0/I+J70gNWDhR
	jSVMrKk/guNOsvciAsO1Gn5ZYcNOgEjycMSlt95AQyW968COLFVl8BGHzhJaAARa5QG7k+IO7o7KI
	iR8Nsw/o63KuXPtTVYvE0WejR9NpKvKC7dfz8O/66f8TjCxvWk1kjDgdQmjFrr5wrhYQg3K/OEvz4
	o7f8Z7WfH6x3PBwu5qaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMFJ-0000000DEsj-2Pji;
	Thu, 04 Jul 2024 13:11:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMEl-0000000DEXn-3Q69;
	Thu, 04 Jul 2024 13:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1B3FACE34C5;
	Thu,  4 Jul 2024 13:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2A1DC4AF11;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720098657;
	bh=lJXnONd5ISVvmE4QQ4QJTEc1T2lWaVBV5IrBFXcFzSs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Vpwd2tcYqNgW1dMG4DUsuYkKBIfDlCn4PVslQ+vVDvZ3zq5iOcb6vvRYYnY6zPLqm
	 b7qRPNJMCF708+0X9bllMigap/i9FHO/+hiquNIRAZExPqCwtGbOBjIJuQ7OkQnqn0
	 sPH8SB9WW3Zr18pR0U7e1oUFPHWfJ1HJqEs8ZH2+2KSpcEudv6FOxA6WTWsch9b6Or
	 Tab2z58GTWX2feeNdjzi6LpoNRXkbTLsvakMu53Ah1izJcjwti+u6cCNBmIy7ILBgZ
	 8q99pCDwKY1JTEl8QytqRgm64Qa8FzCXj9BCjgdlSwIP/Xyncj4Y/MSAwHIEK4Njwe
	 nAqxfUSP9Im+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D4BA4C433A2;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] randomize_kstack: Remove non-functional per-arch entropy
 filtering
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172009865686.17306.9398253862841269029.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jul 2024 13:10:56 +0000
References: <20240619214711.work.953-kees@kernel.org>
In-Reply-To: <20240619214711.work.953-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, liuyuntao12@huawei.com,
 mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 gustavoars@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, leobras@redhat.com, imbrenda@linux.ibm.com,
 pawan.kumar.gupta@linux.intel.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_061100_108552_5F5E38D5 
X-CRM114-Status: UNSURE (   9.84  )
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
by Kees Cook <kees@kernel.org>:

On Wed, 19 Jun 2024 14:47:15 -0700 you wrote:
> An unintended consequence of commit 9c573cd31343 ("randomize_kstack:
> Improve entropy diffusion") was that the per-architecture entropy size
> filtering reduced how many bits were being added to the mix, rather than
> how many bits were being used during the offsetting. All architectures
> fell back to the existing default of 0x3FF (10 bits), which will consume
> at most 1KiB of stack space. It seems that this is working just fine,
> so let's avoid the confusion and update everything to use the default.
> 
> [...]

Here is the summary with links:
  - randomize_kstack: Remove non-functional per-arch entropy filtering
    https://git.kernel.org/riscv/c/6db1208bf95b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
