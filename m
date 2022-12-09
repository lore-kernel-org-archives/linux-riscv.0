Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B0BC001B2
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxR2ul+C8c5/Yt6plkRFpidTI8NaL8UPcQQgoabvRZQ=; b=T59LEPYQy154uS
	ddv5WUa2B7+r9rkq5ZIeRcS2QkBy4oZgFWRj4VVFl12l3TqtJP22NC2YDSyPoPmjQLlCSHLV9lYiR
	5ANfUjnDeV9gsJcvYG/7Qdz82ey6rCCWtYizAAx09PcPXfBMnvWCpotRNaJwH6SSPmlOrVkJnVlUq
	JiqXGjoUGLZRq3M75FFKXv0DDCDnSensUsxtVIYhX/qPKITXOD0O6TzgJ5d2lkPfUvLZl8FXVtA/s
	WLO/kG9L4iu6GEpS/r0ik97GvIismVt0XITPwoDkd0+7RKTmb967j4CI5IUOq6khtBKkEDThPOvIx
	Pih8RvmNHFMR0+InhZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3SDc-00044y-8w; Fri, 09 Dec 2022 01:30:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3SDW-0003yF-B7
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:30:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 34102B826F6;
	Fri,  9 Dec 2022 01:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E419CC43392;
	Fri,  9 Dec 2022 01:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670549418;
	bh=XjQfoNgG2GiBY7jADESEO1zAcbSoAJAF8r+mKWMXI44=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VCFTcA500RiRVb3k1OLCZE9KysbeMc0XG4FVUlDrdJdioIbiXxTFaQbtfTYj6hgcU
	 ls5dRn9ZCg3U4wkr1i4Hi87ueFnHVZcnd3WwnJtJXbyXlPknJQ3u6uvwLs62FS5isX
	 TxXxu+GBgtP6ZkDoS37IE44ANlI/f/jNgdAHO1Ti0HnnFcqbcK5N7vav+8+by3uPZG
	 X44OfIwmUgMwLsmDp772AHksWOI27iFed8b8oXCoVc1fmlIG7UzhDD1U3romgceMg+
	 0vIgf6SlgxqsC6GOV1t7s7Ak1KjKkWs9U2DkXlwlQ2e23EPcEmSG8GFLbIuQFfzqM0
	 gxSw4AF2aN7uw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC219C41606;
	Fri,  9 Dec 2022 01:30:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/3] Add PMEM support for RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167054941883.3046.11002142340745112697.git-patchwork-notify@kernel.org>
Date: Fri, 09 Dec 2022 01:30:18 +0000
References: <20221114090536.1662624-1-apatel@ventanamicro.com>
In-Reply-To: <20221114090536.1662624-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, atishp@atishpatra.org, heiko@sntech.de,
 arnd@arndb.de, anup@brainfault.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_173022_556690_92DA9EB8 
X-CRM114-Status: GOOD (  10.21  )
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

On Mon, 14 Nov 2022 14:35:33 +0530 you wrote:
> The Linux NVDIMM PEM drivers require arch support to map and access the
> persistent memory device. This series adds RISC-V PMEM support using
> recently added Svpbmt and Zicbom support.
> 
> First two patches are fixes and remaining two patches add the required
> PMEM support for Linux RISC-V.
> 
> [...]

Here is the summary with links:
  - [v6,1/3] RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
    https://git.kernel.org/riscv/c/b91676fc16cd
  - [v6,2/3] RISC-V: Implement arch specific PMEM APIs
    https://git.kernel.org/riscv/c/a49ab905a1fc
  - [v6,3/3] RISC-V: Enable PMEM drivers
    https://git.kernel.org/riscv/c/497bcbe3ce04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
