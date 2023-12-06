Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96688C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 12:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnyLoQyrtFOh2wxfpktMWuyTj1YApphiJefT9zhdIpM=; b=Otg//DQvPrLdxh
	CwXI0xBr5PXqc9EjQB99ePoTuCzmY42UliuUhRKEiPGMsFkW/VT5HQCk3C2K5RA5jcCjA7jzujVa4
	gRtieWewggKu4MTgcUzXqdNoVAiuo7dDiCn01bgLBTWVzNsOvdDNOpSzPYBpRsc7mfLKi0Hc3+9ry
	ettPBprthJIemSSyqubCut+OzP2L5CleebnOSD6no+wXL/oty9NKpUjZVjXPW3GE4O5E07WeTafC3
	KBR7R+1DmhEspKmImQGHcna2bdwk2ZRWPYHBXPAODfTD7ZY4ZnDiW1GlyAd81IsHZ+wrn074weZmW
	Biq9f+G1VTXdso+8exLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqjV-00ADyr-1W;
	Wed, 06 Dec 2023 12:10:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqjS-00ADxr-0m
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 12:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 88B57B8205C;
	Wed,  6 Dec 2023 12:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF7C0C433C8;
	Wed,  6 Dec 2023 12:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701864623;
	bh=gn8ZFivOx3JYbnVo0rAf9BMy03aMxyahn+MLX+I+GU0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ko2fyFjFPFkwPUVVczU0M1B8A1inpi10GUzx9K+UKGHWCnCpcVlFXT6dozPSAesYD
	 X8TZk1Q7enwo6BdNbLkj5r05Ncsf40Fgj5dag4gVv/jDLaxpEnT9p7JF6goKEPfs43
	 vGXpEtV5FfmAxCXrx+K/8VXlOkcV0lQ/3ZxFn983HGK6T1IqVZjJ3V6/CFZJeqyfFP
	 LAxCPUClaVAUz+rqXZNn8dO2XN9Wr2GEHGnBtZp8D1JsQAYyxLf/Z9IDIC2aQ7Vv3d
	 mlSSlbuq6QfZm2xugFK46bzpEI7DRCyi43OrLh2jilNY1YQrWmPOG57msmtqTvoMCW
	 1fNUpdVa2vUww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6D47DD4F1F;
	Wed,  6 Dec 2023 12:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] riscv: Fix issues with module loading
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170186462381.31416.3360582134576570262.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 12:10:23 +0000
References: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
In-Reply-To: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, re@w6rz.net,
 samuel.holland@sifive.com, schwab@linux-m68k.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_041026_447718_9B13DB95 
X-CRM114-Status: GOOD (  10.33  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 27 Nov 2023 14:04:58 -0800 you wrote:
> Module loading did not account for multiple threads concurrently loading
> modules. This patch fixes that issue. There is also a small patch to fix
> the type of a __le16 variable.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Changes in v4:
> - Make functions only used internally static
> - Free data structures on kmalloc failure (Andreas)
> - Link to v3: https://lore.kernel.org/r/20231122-module_linking_freeing-v3-0-8e9e412a3305@rivosinc.com
> 
> [...]

Here is the summary with links:
  - [v4,1/2] riscv: Safely remove entries from relocation list
    https://git.kernel.org/riscv/c/d8792a5734b0
  - [v4,2/2] riscv: Correct type casting in module loading
    https://git.kernel.org/riscv/c/4a92a87950c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
