Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CF0C76195
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuloOx9hoeReKJq4opBDDfr/QN/vS4rFfBr46cC+R94=; b=2jxcKGkSf4dN41
	beiQ1v/5wkzfdP3k6lajnTl2q0+djMAmD52ObCdW9d8eFDLTbKB3+7QAXseJoR0BCsHdY1GoUGysS
	KCzJBuIP2BzyNKm/mlaIK5738ThgWfMkgf7BLxy63oTL1ciqCz+/CIkeUYV5hNjHjLpLIWWcjAFIC
	T2Ud9FkHJW5nRzbKwZRHxp4QDagw8QDiyHPO2hAzWd94/eBt0muN62vIXVCOly84/SbRc08kAsjz5
	A0sMYapwPeYImN8k/1DmOgSF9MohtX9G8yZE2gc5YFLE1OdWgW5CnklyAgkNaLTa8khueGCqP9MWI
	ZRHmBaz5h8W3hZJsivAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfS2u-002yDn-1O;
	Thu, 23 Mar 2023 21:00:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfS2p-002yC8-1r
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 21:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3F502B8226F;
	Thu, 23 Mar 2023 21:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E70DDC433D2;
	Thu, 23 Mar 2023 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679605221;
	bh=s9bXoRFsk51mtRO5vA9hAmomeuYjmlnifQIlKFwqLRA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hEnHnpJu/YjO8wo/zmmNAKzwCotV3HbLsjEPtJR/hrPYzD7HNBCmLBQiEEjKkCJ5N
	 eo+HEN12pWFCTu7e/dq1LoiVRq5d/qGnDgZ3AmajDl4otmFh+m/WPePz+9EQJEu7IL
	 bM3Tp/ls5/0+i3WRy7fhqnMuqyx0+jSAbebi1/0ctJOPVbeYbq2AMH4cHW8mXT33VW
	 NHFs6C0osOz8zNRC+B9s4i7W0WjZkWjxfAf5wQkb8vJ7VY1mIa8ALY9VJGZN6HcPHX
	 NYQkV8YNpbVUuuACHIn4+z/tnO3TDqWyImzUZJ9tJEx6WAR2D3wtsj0i78xU+6A1i8
	 XclvRqGIHux3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3605E4F0D7;
	Thu, 23 Mar 2023 21:00:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: mm: Fix incorrect ASID argument when flushing TLB
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167960522086.10481.6194294455098619740.git-patchwork-notify@kernel.org>
Date: Thu, 23 Mar 2023 21:00:20 +0000
References: <20230313034906.2401730-1-dylan@andestech.com>
In-Reply-To: <20230313034906.2401730-1-dylan@andestech.com>
To: Dylan Jhong <dylan@andestech.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, sergey.matyukevich@syntacore.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, x5710999x@gmail.com,
 tim609@andestech.com, peterlin@andestech.com, ycliang@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_140023_761496_3B042F66 
X-CRM114-Status: GOOD (  10.04  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 13 Mar 2023 11:49:06 +0800 you wrote:
> Currently, we pass the CONTEXTID instead of the ASID to the TLB flush
> function. We should only take the ASID field to prevent from touching
> the reserved bit field.
> 
> Fixes: 3f1e782998cd ("riscv: add ASID-based tlbflushing methods")
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: mm: Fix incorrect ASID argument when flushing TLB
    https://git.kernel.org/riscv/c/9a801afd3eb9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
