Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455BBC6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkxxXTvV7mkX5VyWbcMOrlgjyGn/aSvY4R8ZqFSrdRM=; b=JYsZ3zv5kxZWmL
	gx5zO2KK6jAf5NWjCRzk5LKdYCmmFImCqY+1myx3B00plh/z8ZF2iEM5ApbFt1A+xN/AH0Ao9zkEq
	Sp45YdySRMmTGHfwl1fnXZvqtRJ7fLhKjLFCB30Z4b/9Y4qfTEbmxKMO9AqN9XY4qtaBypWab6IYT
	eCxu5C8qVNvBMspaf/QwOpJeQb4xJf8nSh4QPhcyLFbC+7zJ7zOxetIHBjtrM79TLECkpITvEGx8E
	bfgoIPx2kTkXT36X78RmNh3XxNBguP1uxXYEh1vcnsQk39ikNDE4bgeuKog0JNSMTXVybzIiE0EJq
	Vnb6Gr30d64Yx4F24Qdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeQ9-002S4N-SH; Tue, 07 Mar 2023 21:00:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeQ5-002S0L-T4
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 21:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0EF37B81A1D;
	Tue,  7 Mar 2023 21:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC62DC433EF;
	Tue,  7 Mar 2023 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678222819;
	bh=HP/iESxlKTfigJOM2xhKZUHcLRR37rzAQsNdivpsmiA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VJK26HQ+sBCvTQUIK0ZTuved47sV8/f9Syou9ETQByu7NGFIMuu+/ryskiUffNFb+
	 c0kmPDNLtpc+i6cjMm01I1qqfPX8tbDMt8Ad6Eic+IMGU0zvLdBvsgwkPkYMCD1yFa
	 fMeHGb8Q1u0M44igf//bQ2Rb9hX/W0lM8Hu6Fe/FY5ZZeWQ02j0wu3kM11UOMV4U5g
	 B9/qvKPuhNmL/Sc+2CEZUyVR82QzqgVQUmULKgQ+G1rjCfdA9P5HHslXNQDWbu1ocy
	 1g5/1O7bM8zkPbPClXtEOaClxOzr5iy2aGslNwnZqr9CFP3flVU3NP0sZYNWq+hwtb
	 yKant4vbgkvMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F0CBE61B64;
	Tue,  7 Mar 2023 21:00:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: fix taking the text_mutex twice during sifive errata
 patching
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167822281950.12297.8704472110602279050.git-patchwork-notify@kernel.org>
Date: Tue, 07 Mar 2023 21:00:19 +0000
References: <20230302174154.970746-1-conor@kernel.org>
In-Reply-To: <20230302174154.970746-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, paul.walmsley@sifive.com, zeha@debian.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_130026_119239_F4C70111 
X-CRM114-Status: GOOD (  10.72  )
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

On Thu,  2 Mar 2023 17:41:55 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Chris pointed out that some bonehead, *cough* me *cough*, added two
> mutex_locks() to the SiFive errata patching. The second was meant to
> have been a mutex_unlock().
> 
> Reported-by: Chris Hofstaedtler <zeha@debian.org>
> Fixes: 9493e6f3ce02 ("RISC-V: take text_mutex during alternative patching")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - RISC-V: fix taking the text_mutex twice during sifive errata patching
    https://git.kernel.org/riscv/c/bf89b7ee52af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
