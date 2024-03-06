Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333DDC54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 22:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMWPcAS1+gkxETicaGIHNuB0p9DELE0ImVDCJ3bYtuo=; b=C0ln/Lup6V0EJs
	J++hE79aVbJuQLNoL7yZsKN35ClsikbmKgYMDFVYorIJYoBx2eS+uVXk1RLv+awnIEAfY4iPjN7WY
	4YIJm/tND+oU83i8fdkWs7JJ3aP60pEOJ5n7VyC5XiUPckwYG6VYjx3m5+Qwij7soxtvXpU5ffxFi
	wpzflCj0JHUCN/3xXikmxbr+A8lczgt9YpFYIRVkWpfa1idniYlqOCX7tDy7qBwRCzFl53tYKKAnb
	gYuG8QrY/sFKLNfARgRdMmAqNfgdcQnyxRFgwVh2rCWZpS891/4iSgnGhwYjXsUFFM6KU+c7daizY
	9isRfVilLWG0OZaX/CLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhzwA-000000026s7-2Atw;
	Wed, 06 Mar 2024 22:40:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhzw7-000000026rI-3HiX
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 22:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16E6B61B0F;
	Wed,  6 Mar 2024 22:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACA27C433F1;
	Wed,  6 Mar 2024 22:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709764830;
	bh=AEovCiiEXVApMoLVDcg5c4GHI5Cl3cHsFPUm+rDkwAU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s5KWhNTA0B37vZARTbe3FnPyfrscIhrgVJeAE7ArWE+INoia81W5brE+KrUqhfASi
	 mcT/1a/2j8PHwHO5oOMxxXNONqdJiMJiwKthFZOdz4gdDaL7RrHSb72rH+hHGurXmR
	 n87I6DnaLfLfQSMTcGATB0f6Kw1sdUb4w6oZDTNNmBC9P5Rexn0fAIbzeUkOLDxsFc
	 cocO4Vg2I0aiUqs3TplON8l7JhYBi0OhoJU2tvZ7FTGJ9SxsC9zUboQerCkuzrGAsJ
	 qPKmKlb+Vo3YXPamsW16rISA2XYDn0OXSq/ULW24pWNAi5GNufr9SerZotEkmHtOXZ
	 Trlkw8tOPjDew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86753C3274B;
	Wed,  6 Mar 2024 22:40:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 0/1] Support kCFI + BPF on riscv64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170976483053.9451.12256048383404087701.git-patchwork-notify@kernel.org>
Date: Wed, 06 Mar 2024 22:40:30 +0000
References: <20240303170207.82201-1-puranjay12@gmail.com>
In-Reply-To: <20240303170207.82201-1-puranjay12@gmail.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, luke.r.nels@gmail.com,
 xi.wang@gmail.com, bjorn@kernel.org, samitolvanen@google.com,
 peterz@infradead.org, keescook@chromium.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_144031_895505_2636A349 
X-CRM114-Status: UNSURE (   6.92  )
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

This patch was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Sun,  3 Mar 2024 17:02:06 +0000 you wrote:
> With CONFIG_CFI_CLANG, the compiler injects a type preamble immediately
> before each function and a check to validate the target function type
> before indirect calls:
> 
>   ; type preamble
>     .word <id>
>   function:
>     ...
>   ; indirect call check
>     lw      t1, -4(a0)
>     lui     t2, <hi20>
>     addiw   t2, t2, <lo12>
>     beq     t1, t2, .Ltmp0
>     ebreak
>   .Ltmp0:
>     jarl    a0
> 
> [...]

Here is the summary with links:
  - [bpf-next,1/1] riscv64/cfi,bpf: Support kCFI + BPF on riscv64
    https://git.kernel.org/bpf/bpf-next/c/dfd646d117b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
