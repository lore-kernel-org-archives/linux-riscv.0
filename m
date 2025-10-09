Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7069CCD185
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SharC0WCZZ9vWEltkFbQVd+vzsNT4AiDcvpVvL/vhSs=; b=skXppTu8PcDQW5
	XbzE1ACLR0b4GQ7/teGE/+H4QKoKSJnuUxHSa4JWgeOzEZiscA9kvPRo8bgYDrzTybFmXjzSVYNLV
	HVnk21pHOpNa65/Mc9fcIFjy1WBW2btXFgPJnFEstvVPyz4wrJzZJHmTobM6h+GRQkKib2EnImLno
	azZlyWpMm3XHO5slhEBpfShyc2CXPH8scHr4OZw+Jc3rWPdBatG+VR/ZzH4rvjW+5ciuRLusJrFH/
	N9cPa01soOji5ITyEo8Mh6/xqPNm1w6qfboAz5tUF1TPcw71mOFMo6mWM1wvOz0J/gYb+rJOkwXhU
	bslNZut2ynrDLQT6t27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7i-00000004uVB-42Jk;
	Thu, 09 Oct 2025 01:07:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7f-00000004uSs-47iH
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADD0A44EA4;
	Thu,  9 Oct 2025 01:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE13C4CEE7;
	Thu,  9 Oct 2025 01:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972031;
	bh=gUKpBW4KllJ8CoUkDtY+/1hxh/FTHD8ZfTIsKaPto2M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r8qUEJcO3jnEk4AEiYY28zdkpGDHV2VM+kWqnOwRmihbEk2CYz5+e5Gj6nxa0V1Wj
	 +6A3gj010/mMOlreXhP8GxlsFMxpVKEVQ0p3rHmtpC3g6+KpJerMpVJ5atk3851f70
	 y8vgKiNpAH6aj8xqCZJ7s3fRcuioMBsh1BE0I5zxo2xTjp2G65rhAROGRSxX9SHPuc
	 B4aR9UUmuxVKZ0klrFsM8By0HwnJqa/pA1saKNT4NMKb14RHQcsCdpJsPFWOFnpMS7
	 OzxzB42kdW7kqCrEFuyJaQWDQOHRIhb7ME6vA6yu4efvIXfq5c3b2cd4Rf+KT4SLkB
	 cKuDtu4wGX3jg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D1F3A41017;
	Thu,  9 Oct 2025 01:07:01 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] riscv, bpf: Remove duplicated bpf_flush_icache()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997201975.3661959.14473142112064760286.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:06:59 +0000
References: <20250904105119.21861-1-hengqi.chen@gmail.com>
In-Reply-To: <20250904105119.21861-1-hengqi.chen@gmail.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: linux-riscv@lists.infradead.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, bjorn@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_180712_044619_5FED1561 
X-CRM114-Status: UNSURE (   9.58  )
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
by Daniel Borkmann <daniel@iogearbox.net>:

On Thu,  4 Sep 2025 10:51:18 +0000 you wrote:
> The bpf_flush_icache() is done by bpf_arch_text_copy() already.
> Remove the duplicated one in arch_prepare_bpf_trampoline().
> 
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/riscv/net/bpf_jit_comp64.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [bpf-next] riscv, bpf: Remove duplicated bpf_flush_icache()
    https://git.kernel.org/riscv/c/6798668ab195

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
