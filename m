Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A969F45A19
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/gmKDk40imn7o28TXp0VhMFpyQ96p/hiEme4cEg5SY=; b=Htd+X0NOaeIwJL
	DrNGQZvDwaWAExOe0+l2370HdOpC9gzYDZKxvGq46hIBaCCbzRmZj2sp4/Yqdg0+1+MKyIqgfAt3I
	hE+Ud4mJp+mUF9Nqjg7dUl0jSfsXgDGTwT6Zwlr125A/Fz/NpkwIrAWSkVnEwq7xfQ/9c6UyM7SX1
	uqkqs1FCzO+2xzfE77/JhVkgl8XxkRdZaag+GbHKyzvf/xJYOseqLJtp39gNrrANI2/0FXGpgGjez
	UyhKFPg5fXyWjUcHLoSk8oO1u5Yjiz57OYPAYWcujBMwKq493SgZevWKt3EFElpqSnbL1W62zenOv
	YpOgRGwCnLSeNF1FL3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTjD-0000000DGre-2Fcq;
	Sat, 11 Apr 2026 08:30:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTjC-0000000DGrY-0l8F
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 08:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D0CD60141
	for <linux-riscv@lists.infradead.org>; Sat, 11 Apr 2026 08:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98834C4CEF7;
	Sat, 11 Apr 2026 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896205;
	bh=sNa47R7FO11+M8osg2I4wKoZye42hyF1yBwYH7np4TM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBApDLJnqSTwpOUQA1e+zJVoyHFke2u+qArjGacFUiTnrO8eHobq/HuqA5CpEUU+z
	 RJSq01NLOwIm52QKdZV79xpMMtdFrjaZrL8ybYxotbZREu0ph8YgJWmJAtcN3PGRbn
	 DJVEc/8XW0fJ1M1Wvu3o0ZNmoreowkuXTTMGYVSAvSh5FEJB1w7F45VIWd4rMPhWRv
	 UAxHDi4QHwN9CPLqxYkl0RI5fyWfvrrQnEtlL2Wip0El2GP5Ce9l1HKL8MiyO5r3BY
	 AG/3f1pds8sX4oG49eTA18DoAV3uY2cXU8IXSZGxSPBVHR4WHkKCr3/4lyaqnySTUa
	 Gg/BfW7ZvMoYQ==
Date: Sat, 11 Apr 2026 10:30:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V devicetrees for v7.1
Message-ID: <20260411-loutish-hound-of-attack-8e2576@quoll>
References: <20260406-bronze-anemia-a5b3a254f46b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260406-bronze-anemia-a5b3a254f46b@spud>
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

On Mon, Apr 06, 2026 at 11:26:24AM +0100, Conor Dooley wrote:
> Hey folks,
> 
> Realised as I was tagging this that the tsu clock and gpio interrupts
> changes miss the pic64gx and should have been rebased. I'll send another
> PR later this week I think, with those two fixes. Nothing is broken by
> the two fixes, they just didn't fix the newly added dts, which is why I
> still feel comfortable sending this, particularly given I am pretty late
> already. My excuse is that I was sick all last week...
> 
> Cheers,
> Conor.
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v7.1
> 
> for you to fetch changes up to b0258f69f1e0ed98e8506706da9ef538389b27ea:
> 
>   riscv: dts: microchip: update mpfs gpio interrupts to better match the SoC (2026-03-31 15:51:52 +0100)
> 
> ----------------------------------------------------------------
> RISC-V devicetrees for v7.1
> 
> Generic:
> Add binding coverage for Supm.
> 
> Microchip:
> Add support for the picgx64 and its curiosity board. This is a PolarFire
> SoC without the FPGA.
> Add the missing tsu_clk for ptp on the macb on PolarFire SoC and resolve
> a long-running problem with gpio interrupts being incorrectly described
> on the platform.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 

Thanks, applied

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
