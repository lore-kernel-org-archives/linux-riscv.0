Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EF1C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ly7t9D3x9QSChwRQkNCLvLesbkhfOiVkG8ixlnx4Xoo=; b=az8/AoUQvWOqkk
	IatxWDDaW5XrVqe69AKjxmjazHvlPPFtAr5XjRgPPk+D8EageEaN2ofaz81RFBWI5vMwRk7u9s4Q/
	sll18XJbMFAfyd4cbCBttpxJq2DAEtGZrY/H5jXnlGDdjhTD/vooEXHfCZtPUkw1dBWEO91J3JnCM
	3w70nPPoJ5yVAxLp9kMGQS3xe1122B50fn61O0J7RVnVB6BEL2mxDFPnGq9MbbizXhZc8Z83VhB3u
	zjQnVMQuLcdC8fvkZK0h9nmO4/Xr/afypgNHyUH0Q44bZzWJiWacgZodpndEFvzXFw7IDzKej6FH9
	VHZFrJ3tYFycemcwWbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOp-000000012rV-33s3;
	Thu, 25 Jul 2024 13:20:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOh-000000012kX-1euM
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2757F6140C;
	Thu, 25 Jul 2024 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C346C4AF19;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=pv1EbBB+Diu8zt1u9Ud8mj6yeTOIaZMPy0uWO7Z+kM0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N7sBpavN9QprHaBwp7OcgJA6SimgOaKnMGDjQoG/M3iXdc83uJMz0+lt69EayLkYo
	 V3uLsHtVGp41mCiafbQbtwuBrxIjqxXRf6wV6tznTJ/9FshdecAi/+TbechdKoop1E
	 piabRVX83H/s0z5ZQieqc6FEZRadq6xJ5dUmaX/GnKmRmQqY0E/O3p4V3YCpSJs6Qu
	 x9JcZWSf9jc5OCwbVP8B6Qhte1xPPsychUqZWhVtQO0n7knVa9tS5o/fdHFWWk2vZI
	 vhLrs+FNIIgzVTO+CkAJ93AYhd4+OdWj9UJYlvzEl78k80IlwdCONfUWjhCw7H6GDJ
	 aDyb5+/HnpmFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7063CC4333D;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Improve exception and system call latency
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363945.6240.15239605352830042623.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240607061335.2197383-1-cyrilbur@tenstorrent.com>
In-Reply-To: <20240607061335.2197383-1-cyrilbur@tenstorrent.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 antonb@tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062043_625579_B381B4E2 
X-CRM114-Status: UNSURE (   7.91  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu,  6 Jun 2024 23:13:35 -0700 you wrote:
> From: Anton Blanchard <antonb@tenstorrent.com>
> 
> Many CPUs implement return address branch prediction as a stack. The
> RISCV architecture refers to this as a return address stack (RAS). If
> this gets corrupted then the CPU will mispredict at least one but
> potentally many function returns.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Improve exception and system call latency
    https://git.kernel.org/riscv/c/9eb7421003d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
