Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AB8CCF9EB
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 00:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bNJBTgGwk8agOSoeo73TXttFa7NrZgvgOpKpLSepUE=; b=2wAXk0ZfiJq3YF
	MQfgFrHIwucHFc9J/DBswpBErnSjAyF63OVTBNwBDuxHhzLzePpxkLAB/Wd5Y/omc6VV9mEqyRtTU
	XhLxqK3d0T/bV3BtNCs5ZmNwDr+Yqp8f8v/mSc78XQblUlfmK76s7ioidWvq05kO+ty3vD/pRLhMw
	LSC90riFHj9HedJYpFss4JN0ECQcq/SbpTKQZadjbCLGHYrikCOaOGN+gnTNXs5841o4lzZkGPsAG
	UBob2NqPHJBc2K5/ULeTk3TmOLlQdQjhA8iuhVtA4L0M35vgwBQidFNs3DA2lkJkv0yFSGGriFX59
	H+EG3OIWD8JmM1ST/mfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXw7-0000000F1eJ-0slh;
	Tue, 28 Oct 2025 00:51:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXw6-0000000F1e1-1lSQ
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 00:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8673761DD1;
	Tue, 28 Oct 2025 00:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36248C4CEF1;
	Tue, 28 Oct 2025 00:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761612701;
	bh=B3wQzMLbOhQRfaLAzldS6M7Qq4VdvWa8daZ/dTvVZww=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BzgdYC84a6TWOsj1DTaLwaIkUE8gRYDjfUFbC+iMX9kGeZ9BLihTowzVTdIZbGN0C
	 ujp3Rt+NvmqNpUpHcgaJLK6tFVg5p2i2cTPJJPKFJ1KBs4ZfNdQHRnUJjCUuj8WVcI
	 Ot887XDYhmMjkbV9G2xLJqzSu5jWxf6GrTmzDP+Hjl7jBPJrc20c/NGFMDpuqQfPBQ
	 lFwMq8666c6aQ7ux1s43ckyLoCbQIGWV2+15NUkdgOJH7+7tj+kT2pIfoQUveZkmw1
	 xQsRWf6s3SetPnqtA9RExaZ1i+5fFiw4pp6FmLjdssDzRbN1Uq4Vj/NOpcgHHYtY3N
	 VanS64g6u51EQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CAF39D60BB;
	Tue, 28 Oct 2025 00:51:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix memory leak in module_frob_arch_sections()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176161267924.1638595.1882870898016863299.git-patchwork-notify@kernel.org>
Date: Tue, 28 Oct 2025 00:51:19 +0000
References: <20251026091912.39727-1-linmq006@gmail.com>
In-Reply-To: <20251026091912.39727-1-linmq006@gmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
 ajones@ventanamicro.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 stable@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Sun, 26 Oct 2025 17:19:08 +0800 you wrote:
> The current code directly overwrites the scratch pointer with the
> return value of kvrealloc(). If kvrealloc() fails and returns NULL,
> the original buffer becomes unreachable, causing a memory leak.
> 
> Fix this by using a temporary variable to store kvrealloc()'s return
> value and only update the scratch pointer on success.
> 
> [...]

Here is the summary with links:
  - riscv: Fix memory leak in module_frob_arch_sections()
    https://git.kernel.org/riscv/c/c42458fcf54b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
