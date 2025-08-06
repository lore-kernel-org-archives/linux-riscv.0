Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ACBC87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIn2D6yfg62phZOzHXpBK/vHAsa1XDGLxCg8lwe1aFQ=; b=P/EV5UpuFGTpEd
	8KvIbbUaMXhwGIlUGFSNvwgizqbVuccdimNlhK2V4JXlrWOGiUVIteIvQsYZ7DZckbM//4FIoKKZG
	noC57qdYYy9zpAkNytM5Y4oJpOS9cn+/yCcpSxjpT0Qr/0XKxxm9ih77cHuuHCu+JcXihF99zCBmR
	sZe7f+M1LBAlc+SryyCu3KrJ2oMsvVAtIowNK2JqWNRIzh+GZOxjvzjDnwhnT8rApIRHzIxxZSYsM
	SEs0uRCCCsvUOtXWRm+KH8+cC6BS4oNajBdMxnzUwGcAGkW0kJYCTsaZzQ13uVpFW0TWbMk35xghX
	pUsGJwl0qQ44xiseCbHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnr-0000000FtIn-23NY;
	Wed, 06 Aug 2025 17:19:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjc-0000000Fs7A-2BXj
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4451F43DAC;
	Wed,  6 Aug 2025 17:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7D8C4CEF1;
	Wed,  6 Aug 2025 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500528;
	bh=Ff2V9hy6utcP0CCY2uNq0RzaFNn4ugm5oNFnC12dD1E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S+6+RClezduuYHOrMuwc5cHo83I4YylhhQOHQFrZopB8tYgZvc0fuBHgjLTVg1o+J
	 qT9GcoseKGxuscYoE/KJmR0w1Cg0Cezb5JongGISFGRTKvrTs3Q+qq8FrONH/pOc7g
	 oX2HW5de53IC9aH5GuZafVVBGx4g/aB1xXklIv1exxKsmbNap4tE9gYRtBJXBgBJJK
	 5pG1HsYrxYSU4k1Udh6ZJM93gSHZFP71kTUt8j1p6298DtitU95taXPq43Gjjgdk50
	 9Fn6m5rTyzYNCOiw2/RHWP85y3UOUFOm5/Vz/kyShu2eIFB8llK9aLL9ub3rQ22fhu
	 e/RjVLy6SQOsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CAB383BF63;
	Wed,  6 Aug 2025 17:15:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] riscv: minor thread_info.cpu improvements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450054199.2863135.9619865736779982038.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:41 +0000
References: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
In-Reply-To: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
To: =?utf-8?b?UmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, debug@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101528_594401_253C34C4 
X-CRM114-Status: UNSURE (   9.05  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 25 Jul 2025 18:54:08 +0200 you wrote:
> Hello,
> 
> I noticed that we give thread_info.cpu two different names in the
> assembly, load it as a wider type, and store it suboptimally.
> 
> v2 is split for easy backporting.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] riscv: use lw when reading int cpu in new_vmalloc_check
    https://git.kernel.org/riscv/c/5fcea028d8b8
  - [v2,2/4] riscv: use lw when reading int cpu in asm_per_cpu
    https://git.kernel.org/riscv/c/47e006cf9789
  - [v2,3/4] riscv: use TASK_TI_CPU instead of TASK_TI_CPU_NUM
    https://git.kernel.org/riscv/c/a1984b2541b0
  - [v2,4/4] riscv: pack rv64 thread_info better
    https://git.kernel.org/riscv/c/9b3a86b7b14c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
