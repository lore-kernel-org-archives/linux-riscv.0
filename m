Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A92DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 22:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s83EsR0pSlFrYq2ICmpCsoL3uQi0TkkSf2vcwxl0zz4=; b=bH/vIOtjZzHFak
	yATNlVTF8yrnE8px6DihejMWnAv6x+rno27dJToizEdIJLsJ9tbZ2tRha3qxyDynYU3Sx4Yw63fAC
	LdTDppKSTxmgwJlgBc1v0Jhl25mOOyWS/Pq9NwbfcP5cGqvd7XBl4FikIISfvXbe937SRRdQqRcJF
	xuYvL8QnDPoU0Pzx+Bb7wRceaacpXUSH5/tml8Wcm6Xv/IKgU+IZbI+xpzJe/FVQSn8gHDyHM+esV
	hY/Dm5ghuhB4n/QeS17MaULY/pYWjISO7e1XXsOBxXOVGIehGUXc/VtS1eCR9JXcc+EJ0LwGphSLb
	Y6YSi7/vrZC4fa2cE0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGNJ-00Ao3G-7H; Thu, 10 Nov 2022 22:50:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGNG-00Ao1v-DJ
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 22:50:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF71861B72;
	Thu, 10 Nov 2022 22:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55259C43470;
	Thu, 10 Nov 2022 22:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668120616;
	bh=M9LAVYZ92Xll7tzRG+y7J0TmMOHu9UY1fOYopwYmZt4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Oa1rCgaNhIhQdb8PE2MFAjrFYbwvbhkuXGRx2MghWoNI2X1I6Xa0v2UpQGYG2KqNa
	 7dvJngTKnR58Svu/JR/O7BdIgOB70XTMX3i6Hb3/DVn4ueD12XC4P9ACzUTb8CpCXQ
	 zZgCMjJZfjm6zpkp94kNLfAuRfN1PBxqxOPwr1mqJDS5lTAQ4P0y3lOdhiBCLj+WvJ
	 HOAxru9PLRPEDUKR/cnunk0CxCHE4jMsv8T/7txoZxlT7Ks73fcBVFWf5pih07fUur
	 aENYbtp2r4p/FfeOUolp7vwzelvPqqjJsWw+HiKuTU+ehWXnh8Prh6CT/wEwwYIM19
	 ZLx8PhkbzOXmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25CA3E270EF;
	Thu, 10 Nov 2022 22:50:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: vdso: fix build with llvm
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166812061615.32242.2820818026881124201.git-patchwork-notify@kernel.org>
Date: Thu, 10 Nov 2022 22:50:16 +0000
References: <20221031182943.2453-1-jszhang@kernel.org>
In-Reply-To: <20221031182943.2453-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_145018_527250_70BB5F19 
X-CRM114-Status: UNSURE (   8.51  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  1 Nov 2022 02:29:43 +0800 you wrote:
> Even after commit 89fd4a1df829 ("riscv: jump_label: mark arguments as
> const to satisfy asm constraints"), building with CC_OPTIMIZE_FOR_SIZE
> + LLVM=1 can reproduce below build error:
> 
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> In file included from <built-in>:4:
> In file included from lib/vdso/gettimeofday.c:5:
> In file included from include/vdso/datapage.h:17:
> In file included from
> include/vdso/processor.h:10:
> In file included from
> arch/riscv/include/asm/vdso/processor.h:7:
> In file included from
> include/linux/jump_label.h:112:
> arch/riscv/include/asm/jump_label.h:42:3: error:
> invalid operand fo
> r inline asm constraint 'i'
>                 "       .option push                            \n\t"
>                 ^
> 1 error generated.
> 
> [...]

Here is the summary with links:
  - riscv: vdso: fix build with llvm
    https://git.kernel.org/riscv/c/50f4dd657a0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
