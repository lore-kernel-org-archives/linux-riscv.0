Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA03C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lv6dvr9BXpRsWZNig6+u+O6gvQ6j4qhxXPU2XtMntHs=; b=BH7eQLFWZCHWJd
	YzYBT3JZtdu8O686tpuQ3UZUclqyO68Y7q6MWdMA1XMAjC0jWUhlP1m7q9t9fFj/1Jv4K1nLFkmtW
	Z/E+ThEL1hqeKJSb+XasGtVEJ58dJ9O1ELN+8+NXb26vrK3NmuJvuw4zkudDTHuu4cu6vIxGhAJpp
	Nc+fLqRGgEtnelhFAxN+/RR+MXnCw18pJOkxZnbD1tAiICkTZcvS0ZT5RFAnHs+yf01WzHI4UjK19
	q2LzattmGJIY15JWc1VVNDFUdR6YhdGLBtjJBcU7BJenPeQ8JlT+979EjdcUPUlBcGdALBZ7A8sdj
	gP6wWZu7oPO7hkIfs6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWih-00000009DPa-3ZXI;
	Fri, 24 May 2024 15:20:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWie-00000009DOb-2AFU
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 15:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EAA39CE1915;
	Fri, 24 May 2024 15:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47A0CC4AF0B;
	Fri, 24 May 2024 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716564029;
	bh=vR6kWNcmgmnay1FzN1W6NB9KmF3ExsMOtwMXfEfWinc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kE7q2jvU+AwS13D4A/A6X4lIq1dK30k/TnG66TxqzNlTiOfhW2TwhrkqPVtf/ZcSy
	 60b2nvKje6jHsVi4yM2OLsM25HtVKtBaGAE0cr4mned5IW3G/IwBIT/AXRmJfa/zh6
	 NI+dQZpqatkcP1IIFNwox+RtpXPI+OwCh3PBl2Em+oyS9RvXnM9wP6LlLFX7Sx/w8I
	 0Zr7GjSjllNouXPd67zDpUAQGRUow1m0WnFOXcV85KdrSQWkJs/Q3TWFueBpDN7AZ1
	 qVehSycK0vfYmEw4Hdep1bwi5LAEtPymVrzVdryDI2axKA4xpBZRsw9ksZnIMM4OFI
	 FkiItw3Tn0rgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38948C32766;
	Fri, 24 May 2024 15:20:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv, bpf: Use STACK_ALIGN macro for size rounding up
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171656402922.10818.170029478847606118.git-patchwork-notify@kernel.org>
Date: Fri, 24 May 2024 15:20:29 +0000
References: <20240523031835.3977713-1-xiao.w.wang@intel.com>
In-Reply-To: <20240523031835.3977713-1-xiao.w.wang@intel.com>
To: Wang@ci.codeaurora.org, Xiao W <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, pulehui@huawei.com,
 haicheng.li@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_082033_010442_DD9FDC78 
X-CRM114-Status: UNSURE (   7.25  )
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

On Thu, 23 May 2024 11:18:35 +0800 you wrote:
> Use the macro STACK_ALIGN that is defined in asm/processor.h for stack size
> rounding up, just like bpf_jit_comp32.c does.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> Reviewed-by: Pu Lehui <pulehui@huawei.com>
> ---
> v2:
> * The patch targets bpf-next tree, rather than riscv-next. (Lehui)
> 
> [...]

Here is the summary with links:
  - [v2] riscv, bpf: Use STACK_ALIGN macro for size rounding up
    https://git.kernel.org/bpf/bpf-next/c/e944fc815274

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
