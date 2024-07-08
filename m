Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B421C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 13:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TsnAmeBP1fTXPFb9eGgnrfKcfLK8XUBR64JyqbtwGg=; b=p2WyoybFvWTZIj
	5AxHQ7O7vt/2ZYb/7B1z9FJ3ibmLY4CUzU0geuDaQfBDA2hvoNxyOCURJcl1i0BAcumOUzRducbhz
	XpaXtHVb+eGwApGBEM+b7TD4I3KWBB5MH2C2JxHrWKQWPS8Ra1ldxrYrBy376r20tVwVo620M7rAE
	LElQpYfnLoGep8baFw7CkrtjjwTFWFvgvtTfqMuscb0JhNXkdrwk6cL/VLq4n2qUTqRIMl0VZ/FPL
	jUdX/2ZXp47KeL+l9Ylsmxj0rAfE+fuET3T3WkJDFt5DMD3Zei8nkJ/Nu5I5PnDXiDmoJQpSs1ffT
	+xrTo7CwPzwDan8aMeZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQolI-00000003yRK-0euk;
	Mon, 08 Jul 2024 13:50:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQolE-00000003yQa-3vJ9
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 13:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D3B9CE0BDB;
	Mon,  8 Jul 2024 13:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5484C4AF0A;
	Mon,  8 Jul 2024 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720446629;
	bh=WnvZTNr1rDc08yZk/OoeLaabq2dA2AD7qw9cOWofT4U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dschPgrze49j5OHJp2auz1anudegCLHA4Xf5r5CMQ/RMopH12Hv9OJvhxu6Zdp/72
	 pI8whWPGdR9qpZOkDVvb3Mmlbyv27rJ2JUX665HCFvZSOrYT6fpv0/gkuBfeC3vZfT
	 rojxBfey2gA4um/CRZsvgU1ZZl9/5vwdVhqLrfX1BvVsvYDws3YPYIWXubVrgnnHhd
	 K85u7mfqkN8gbLoRZzjOX+2wnemb0EbHROR5KqMWv4fC4EQxDjh+iMwE5CcPt2IeEU
	 SDmpRJNuA0a2InvWwooFQ1iFuL2Xo/wArUhFFQ0pwz5kXzpFx+5s4xdAfHt55IhPE6
	 Z/D17BIh1IAHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8F336DF3714;
	Mon,  8 Jul 2024 13:50:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] riscv, bpf: Optimize stack usage of trampoline
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172044662958.31520.14859964492304138069.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 13:50:29 +0000
References: <20240708114758.64414-1-puranjay@kernel.org>
In-Reply-To: <20240708114758.64414-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org,
 pulehui@huawei.com, puranjay12@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_065033_171790_50D716A8 
X-CRM114-Status: UNSURE (   8.36  )
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

On Mon,  8 Jul 2024 11:47:58 +0000 you wrote:
> When BPF_TRAMP_F_CALL_ORIG is not set, stack space for passing arguments
> on stack doesn't need to be reserved because the original function is
> not called.
> 
> Only reserve space for stacked arguments when BPF_TRAMP_F_CALL_ORIG is
> set.
> 
> [...]

Here is the summary with links:
  - [bpf-next] riscv, bpf: Optimize stack usage of trampoline
    https://git.kernel.org/bpf/bpf-next/c/a5912c37faf7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
