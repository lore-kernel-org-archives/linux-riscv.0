Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2523AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7e/JhiSDmLLL4zFvwJyn2EhJ+7O5pnTWs+8qVfKKwM=; b=DvlRZiK0QMHw2i
	zScQva5SycNzk/AEOljNjKSUmGG/TAdROUCGpCpykX8C7PskvO/wszDd8T32nfbGjYhCHgRR5itaF
	1R9CKQoU56feQi5sfo9HkLCjMlX/ta0AfhP5LUObFv296N+6OZ5Mm1lyjgf8wATMic3vqhtQ6jwGH
	jZYNYY+8jknUUoH9SpL5Jm6Y37ZJp6gQMa9B1dW7/KkbhZ/+mQV7K1ka6H1Eozcq1omMQvJ3Xq6W1
	UOD1lhZW4Iin/tnie6mV/eCuOaGlHVkECVV9JbL2HVeE/amrk6CHNnIcDoDADKtwDsibfiA8pMlD2
	1Mb/5/Q5cvHCVFytemyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015f-00GveF-2R;
	Mon, 06 Nov 2023 15:00:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015a-00Gvaj-1c
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 79A1D60F6E;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D85EC433C9;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282829;
	bh=jvQKi09JFh+xECjRmHqfonml/yTiggDMNwY2KkFuUvk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gUnImXw2ZZD+b8Tnrv7wW4WA7lgCTfR1z1Rpv/iHn+QpCFwG8JFeXfXV1UHwoyw6n
	 MTvJjKmA1VzjX5/e69RamPQDqaEkNQ8VwXuHJiITVGVPsew6sly4666s3s+h8U+jSH
	 M8U+FMvtbp/f03EDV3DF4V7TASd6bwZTyeFSwEIL0wggciwjjYXiMAcJLyCFDTZgdk
	 Lgh0wJ1y6PJL/UW0CeCahDlQvcLd+cBSvJ2500m9KAD2hkUDdYQgPiHmYIehVUZ5sQ
	 myWIhqqM+HxL9jU0rHyEDra80o9XcxqX0a/fIr9nJ7Fm0oZ3GBdT+qzCaUOoI0VTds
	 4t7h3CT+Nwi4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03871C04DD9;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RESEND PATCH 0/3] riscv: vdso.lds.S: some improvement
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282901.16503.13019808692096300065.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:29 +0000
References: <20230912072015.2424-1-jszhang@kernel.org>
In-Reply-To: <20230912072015.2424-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ajones@ventanamicro.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070030_610473_6E4580BF 
X-CRM114-Status: UNSURE (   8.88  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 12 Sep 2023 15:20:12 +0800 you wrote:
> This series renews one of my last year RFC patch[1], tries to improve
> the vdso layout a bit.
> 
> patch1 removes useless symbols
> patch2 merges .data section of vdso into .rodata because they are
> readonly
> patch3 is the real renew patch, it removes hardcoded 0x800 .text start
> addr. But I rewrite the commit msg per Andrew's suggestions and move
> move .note, .eh_frame_hdr, and .eh_frame between .rodata and .text to
> keep the actual code well away from the non-instruction data.
> 
> [...]

Here is the summary with links:
  - [RESEND,1/3] riscv: vdso.lds.S: drop __alt_start and __alt_end symbols
    https://git.kernel.org/riscv/c/ddcc7d9bf531
  - [RESEND,2/3] riscv: vdso.lds.S: merge .data section into .rodata section
    https://git.kernel.org/riscv/c/49cfbdc21faf
  - [RESEND,3/3] riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr
    https://git.kernel.org/riscv/c/8f8c1ff879fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
