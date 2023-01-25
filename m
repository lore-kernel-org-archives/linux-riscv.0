Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4D6C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 05:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wP0U4N3TQ89G/6z5lBC0llHz669y4nHmovurqXdgzKM=; b=HE97oF27MiiTw/
	oYx+E7kygg4d6+nom7kA1yMkuaFyUHiASwI8mMBInpbGSW7Tj8rox8RWF5FQVCyzxITgosN7PMGAV
	Ag1UbrAgsssH1jtnBqYiOJVMRh2mIvq+QkU+rQwnYzS0SnPbWb5S6IWgcQnFAkPDkpAadJbV/FE/u
	r9gFsAWETDVTV+SyilhAEsKnGN0TwLKu3zT5eDVTMLnTJNs7znzW/4xJKsLUTjVN/zwlhy63jHcan
	nZLTcrs6+uu/nop6n3XNOT87dtqE+p2Cp1WdgZ0nHP9IhIrgIAdyehwg9aOcBv2OQBz70poBj3V5f
	KTVCuc6MGWygn0bFxUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKYft-0065bS-B3; Wed, 25 Jan 2023 05:50:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKYfq-0065b1-Ci
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 05:50:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C47D6133A;
	Wed, 25 Jan 2023 05:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06A3DC433D2;
	Wed, 25 Jan 2023 05:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674625817;
	bh=kE+DFWqR6+E2Trkr1Q/Hb+ZWWUvxp5eQEotCvRr3K7k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r/joxOp1DUbQQJsrp1kNI43xlGu1i6GEfFwAS679TOLEqe/Ro0O0HOjV5Aabr9B3B
	 T3s6zZM/BkoiwOFg0z/RZoSUVUA26x4F+wur/gJzhwvpwzBveQ1llQzIf7MXhqz1h3
	 0jvvLNPbqZbi9HY8Bz/seBW3BKhtZegO+v3p5kReBlWnsPUg86McEHvFr6wTGNpcgv
	 +1kqxs2ojo+rX//AZPxKcQkMx0I57wer1Gqu3mv3Vw1thM33Qsid9QI52Z578pTRq9
	 toOiUxrrar4ITr1PHPPLrbG95dUjiSTrqdUO1EVW5HXdkyo5eoteZ5Gfyy0ePzUHn4
	 hjRVrTDkERfbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E178CE52507;
	Wed, 25 Jan 2023 05:50:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv/kprobe: Fix instruction simulation of JALR
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167462581691.3015.5045414056306333462.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 05:50:16 +0000
References: <20230116064342.2092136-1-liaochang1@huawei.com>
In-Reply-To: <20230116064342.2092136-1-liaochang1@huawei.com>
To: Liao Chang <liaochang1@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mhiramat@kernel.org,
 guoren@kernel.org, me@packi.ch, penberg@kernel.org,
 linux-kernel@vger.kernel.org, bjorn@kernel.org, chenlifu@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_215018_489091_3A25E376 
X-CRM114-Status: UNSURE (   9.80  )
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

On Mon, 16 Jan 2023 14:43:42 +0800 you wrote:
> Set kprobe at 'jalr 1140(ra)' of vfs_write results in the following
> crash:
> 
> [   32.092235] Unable to handle kernel access to user memory without uaccess routines at virtual address 00aaaaaad77b1170
> [   32.093115] Oops [#1]
> [   32.093251] Modules linked in:
> [   32.093626] CPU: 0 PID: 135 Comm: ftracetest Not tainted 6.2.0-rc2-00013-gb0aa5e5df0cb-dirty #16
> [   32.093985] Hardware name: riscv-virtio,qemu (DT)
> [   32.094280] epc : ksys_read+0x88/0xd6
> [   32.094855]  ra : ksys_read+0xc0/0xd6
> [   32.095016] epc : ffffffff801cda80 ra : ffffffff801cdab8 sp : ff20000000d7bdc0
> [   32.095227]  gp : ffffffff80f14000 tp : ff60000080f9cb40 t0 : ffffffff80f13e80
> [   32.095500]  t1 : ffffffff8000c29c t2 : ffffffff800dbc54 s0 : ff20000000d7be60
> [   32.095716]  s1 : 0000000000000000 a0 : ffffffff805a64ae a1 : ffffffff80a83708
> [   32.095921]  a2 : ffffffff80f160a0 a3 : 0000000000000000 a4 : f229b0afdb165300
> [   32.096171]  a5 : f229b0afdb165300 a6 : ffffffff80eeebd0 a7 : 00000000000003ff
> [   32.096411]  s2 : ff6000007ff76800 s3 : fffffffffffffff7 s4 : 00aaaaaad77b1170
> [   32.096638]  s5 : ffffffff80f160a0 s6 : ff6000007ff76800 s7 : 0000000000000030
> [   32.096865]  s8 : 00ffffffc3d97be0 s9 : 0000000000000007 s10: 00aaaaaad77c9410
> [   32.097092]  s11: 0000000000000000 t3 : ffffffff80f13e48 t4 : ffffffff8000c29c
> [   32.097317]  t5 : ffffffff8000c29c t6 : ffffffff800dbc54
> [   32.097505] status: 0000000200000120 badaddr: 00aaaaaad77b1170 cause: 000000000000000d
> [   32.098011] [<ffffffff801cdb72>] ksys_write+0x6c/0xd6
> [   32.098222] [<ffffffff801cdc06>] sys_write+0x2a/0x38
> [   32.098405] [<ffffffff80003c76>] ret_from_syscall+0x0/0x2
> 
> [...]

Here is the summary with links:
  - riscv/kprobe: Fix instruction simulation of JALR
    https://git.kernel.org/riscv/c/ca0254998be4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
