Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E32C36002
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgiHZjHlLyLnYS2zw3TsA5dQMtbzjNIca5oa2m847pE=; b=udFUa5ZWMGAFYy
	hjmzhmoQhBpSsR/0OrF7lYgUeqcU0mBVKkMWK2i19wDxl2pujc/MuySSfW+FD+gTcEugXojsE4wqi
	Ibmwrss4UjkJNF0WVBWkHgwa/+bLwKqtMgW/voJ33IMPwREnC1t0G3pQavvkkiSlqnx5GGBY38q9D
	ESwH3miaja+rnGC7HseApuB97aUZEWCGSZaetayJZ8YtqVz8k/z8ytyEh6LMCda/sTD7cv56q6/cQ
	CWVaJMSqGAMWUd9+8eEW8gM+H84l9EHpB1BhKy0JDQDY1e+yH0+/yPt5FqTXXkYeM9n0Py8hi7nJV
	pDZ97cL/hk4hzxi1EEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf16-0000000A9vd-0EGZ;
	Thu, 27 Mar 2025 04:38:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdr1-0000000A4X4-0Anu
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65AB8A41A94;
	Thu, 27 Mar 2025 03:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2840AC4CEEA;
	Thu, 27 Mar 2025 03:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045866;
	bh=rRGPHntCI5ufL3M7BTsFQsuw1E2nMHQrK6+g6kmHRAk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=os8dXTtgsvcqwphdWQLnPJ0nOTYsYaLGUaKhcwbDo6TcgWHMpAD+wtDsTbaKt+rql
	 BrTaaiCG73kRb4GAe0iQvoUMpKdC3NJ4v1tV6eBAHzLQmVwb+7WMAVdNCgtZQ1gG2I
	 coeLuGwlKd3CbcPwTc5tDX1upHt7xKtAlxnERDMb4cX36ux80SouTZHjJMea/9oCZP
	 UfxA/3XOLV9V98jBe7OycMErxG+FtlZDLtHchcOj7Lbxl23mLO5r+Dgi+QBTcY5VCC
	 YrgSld1g05BwWrCP4Q7OuLCqyMxBdpXmbHNTJeYHAD9VyLAO1OKoEvR4HTGNKSoPmD
	 7/GD3ernvoRRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE322380AAFD;
	Thu, 27 Mar 2025 03:25:03 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2]  RISC-V: clarify what some RISCV_ISA* config options
 do & redo Zbb toolchain dependency
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304590249.1549280.530219919332605945.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:02 +0000
References: <20241024-aspire-rectify-9982da6943e5@spud>
In-Reply-To: <20241024-aspire-rectify-9982da6943e5@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 xiao.w.wang@intel.com, ajones@ventanamicro.com, pulehui@huawei.com,
 charlie@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, samuel.holland@sifive.com,
 pulehui@huaweicloud.com, bjorn@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202427_173102_7655B22F 
X-CRM114-Status: GOOD (  11.02  )
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

On Thu, 24 Oct 2024 11:19:39 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Since one depends on the other, albeit trivially, here's a v4 of the Zbb
> toolchain dep removal alongside the rewording of Kconfig options I'd
> sent out before the merge window. I think I like this implementation
> better than v1, but I couldn't think of a good name for a "public"
> version of __ALTERNATIVE(), so I used it here directly.
> Unfortunately "ALTERNATIVE_2_CFG" already exists and I couldn't think of
> a good way to name an alternative macro that allows for several config
> options that didn't make the distinction sufficiently clear.. Yell
> if you have better suggestions than I did.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] RISC-V: clarify what some RISCV_ISA* config options do
    https://git.kernel.org/riscv/c/6216182fb776
  - [v4,2/2] RISC-V: separate Zbb optimisations requiring and not requiring toolchain support
    https://git.kernel.org/riscv/c/9343aaba1f25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
