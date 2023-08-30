Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FFEC83F18
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kR9O7M83/KNS0kRdqX46vjhWLRmbhq8IGdg2K/1e4Ek=; b=xAUsrT64BshHYo
	DypAa1tyh3ebJhCTkm4W93FdbaZgOrHDMlmha/NkR372SSw6UhK3bcbdGOu4Za1YocBoY1KAucOK5
	jVlCzQkVxr1nNvGrEQYYO6Hs+w3DE+EJ+RDzAcup02SHoP+8zBu9bAlCpma4BefiEueje446cKzWV
	1AsvFB4njXwCjovKpxzLTjWH94VxlbKjflYpmeoImXd1bDViBsxOt1n/8feOhgH177M4ua2fJaHIW
	jRzq0V3o8EVYqbaKNbsRJJ5COHB25AV7MG3gBPf6pPZfothI7Wk5zhb82NHpGGeCDRb1iiqv7iGP/
	YHV9HOAKYwHm+c/ROvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL83-00DXov-2S;
	Wed, 30 Aug 2023 13:21:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7f-00DXXk-2s
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 10C8C6221F;
	Wed, 30 Aug 2023 13:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D91CC4167D;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401635;
	bh=NnXmR/Vu6hliz+knSoM4OBxXMSCfHdJvn6wZbCXV08E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WoCIcd/7Gz8XtAUKrRT3tTeOudTLfwwuW/6gEZWiftCpN3XML53ZmVmHKEGrndces
	 OFtSQE48zpmuEgvNuaSrirq5FD9epTiGQjpRrsdYRvP23U/KRg0jhqBmxc/JZMvBIN
	 RyslOVWlvKijZmru4s6tUAZpw2E7IBpCo8SJALVpGb+J3fhnqiWIKgXjHWLoWYOC86
	 DkrEoYTTemGDayVtGmU2SBfjIC4YNO/pV8fbOuxHqKggL5MsY0G4Aj8bZSrXeavDXZ
	 s+iKHzyPnPmgFtMYX/GTBfmxQjVT5DCOOd5BjPPpZhcWxbOcfFRlSMR0nq3YSqiTdm
	 840H18kjxU9Qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EC584E49BBF;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: remove redundant mv instructions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163496.19859.7165962151794268511.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230725053835.138910-1-namcaov@gmail.com>
In-Reply-To: <20230725053835.138910-1-namcaov@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062039_987625_A900C27E 
X-CRM114-Status: GOOD (  10.23  )
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

On Tue, 25 Jul 2023 07:38:35 +0200 you wrote:
> Some mv instructions were useful when first introduced to preserve a0 and
> a1 before function calls. However the code has changed and they are now
> redundant. Remove them.
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
>  arch/riscv/kernel/head.S | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Here is the summary with links:
  - riscv: remove redundant mv instructions
    https://git.kernel.org/riscv/c/10f763532d58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
