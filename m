Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656EFC3600E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6X0Zxr2lhyoIIQXTkT1RNTTRilids98s5iVP0aYcMhE=; b=eEGpOssGIF4+V2
	j61LVK7d2Ne4XFyjvemZD/xZ6QMW6n1bRp3T9ll7UGgr2XNAtz8U86h4hxtXYJku3MCyQIEhWJieI
	6ytGcf0yiNKiEpGcly4EPucW8oBVZ8PPp+Jw1n/v8GarYRS9Kd2lK2gv98Yvq0N3IiwJhv4Ub57aw
	yiRDOqLf+dW+k8c1TCV4m/vfTcNp7Fsh6bEfyBGaO9FXssd+T9dqAE2BiFIda/KPEdSZWNFQybJsm
	FNa6pa20mVx2ZlNwrsqYNohGTh2yTWOlDnXmIPsaEul71ed8QN67uQK35+9Blhqt76En0eTE+PTOK
	8rv1F59RV//lYABzMRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf18-0000000A9x9-0vQS;
	Thu, 27 Mar 2025 04:38:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdr8-0000000A4gX-09WV
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6526243A50;
	Thu, 27 Mar 2025 03:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9DAC4CEDD;
	Thu, 27 Mar 2025 03:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045873;
	bh=Zah0DPor/lTbT4fD9DmOugy4W028mG/0HwbpEZms31E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ogUdIIZU+dwA2y4NtWJsdlqF185ndDJeermdAeR/j+4718wF8KaCDC6+9zZiRsY3j
	 wb95J2N7Sgg63soY8TGByX6WL577wgjrM3JrHKeMOd3AzJMjCakbokfCGoZ7GaSndI
	 5MVGxQTEUcGxtKbyFSCKTQbwguuWsePQ9DoK7kXF/gf/yzeNu1Pj+ltaO9o6ObHFb9
	 OX71dbFuPm6dJdEFjcUML50+1X14YfM+aYaYeDgUHSLCkaRxGI7yQdZhbLCLdMkkDl
	 /Erd35gkwG5t9hTfKS7nXzq2Xpk1V07byxePBZkH9FN0+RYz5hqRPqmFJ6ww190Cb8
	 iW/VsqTpH5KLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A72380AAFD;
	Thu, 27 Mar 2025 03:25:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix missing __free_pages() in
 check_vector_unaligned_access()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304590976.1549280.13819894845523945095.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:09 +0000
References: <20250228090613.345309-1-alexghiti@rivosinc.com>
In-Reply-To: <20250228090613.345309-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202434_096997_76323826 
X-CRM114-Status: UNSURE (   9.62  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 28 Feb 2025 10:06:13 +0100 you wrote:
> The locally allocated pages are never freed up, so add the corresponding
> __free_pages().
> 
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Here is the summary with links:
  - riscv: Fix missing __free_pages() in check_vector_unaligned_access()
    https://git.kernel.org/riscv/c/33981b1c4e49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
