Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A74CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XYB/sfHClF7XoYzH4YmlVRQRBwN+EVNDn5m5iMAing=; b=N6ystpO2xoFL1Y
	tHO3DYWzKxBhcdT2G3EtjcFFuFNFpONznXwLEQB6tRiZsshCkxRPfeTpat9IWjFx2SmRVbMisr38B
	BGhkh1AgrBWT9vmQEvnNy9XFAjFnTZxMSnZIAXou8Ur3gMwNzukv/o+tj9QmsB4iPhk3IbxAG4pPs
	ws9i1MWkKTN6F6xJYhX0gllTRlkHxUjk8xgaPBx2Mia03agZpMs7rO2TTDd4IcqSQeHc3wteBUQo1
	i6akhMfPDNboG2FX5287t8/e9zMvB7hWChM6KExBXBx8YHbrk17nP5LyXVS6WImWjV3GDgZB1V7Vg
	Q4JgMP2Zp1IlISYHdx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSwt-000000045F1-3ITw;
	Thu, 04 Apr 2024 19:40:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSwq-000000045DK-0V85
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 19:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2D3A616BD;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 302D6C43390;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712259629;
	bh=LF5HTKzkZrD0EN4i5nxerZtQ/C00sJAstrTwpuQo2Uc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gYyGxFmwRRWP4qfzFiZBtDZWTv3yQXSRvtHrVZiFJSyagXx9AfWjQJp/yrznoG8Sc
	 ZAra35p5W7jcn08ZjcqrSfLP+4On0PkPamZRz9nNUYpQsoRUEf4VUtpzPKF7CqYVRB
	 ZdnSdBPB+MEHeWAajIC0xOAb610ijKquwfxN7FSh5OTwSQ/XuE9lC0FP35mGJR8/+3
	 iog/b0I8WIf70GkjmeeAtbqFjSVPePX9WwmkKsqWqqzpBj2Sx7uIKTBaOsRtRXqfjL
	 +oK9AIdKuMYir8B2Q5l+QSdQBj7KddY4+ph2aFHGn7AZ9PhXp2F1buvEBOuh8nXaog
	 XsO96DmmuJ/sQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1CF6AD84BAD;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 RESEND] riscv: mm: implement pgprot_nx
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171225962911.17194.8100978585103376658.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 19:40:29 +0000
References: <20240325105456.1338-1-jszhang@kernel.org>
In-Reply-To: <20240325105456.1338-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 hch@lst.de, samuel.holland@sifive.com, alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_124032_245909_9EA355B2 
X-CRM114-Status: UNSURE (   7.73  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 25 Mar 2024 18:54:56 +0800 you wrote:
> commit cca98e9f8b5e ("mm: enforce that vmap can't map pages
> executable") enforces the W^X protection by not allowing remapping
> existing pages as executable. Add riscv bits so that riscv can benefit
> the same protection.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v2,RESEND] riscv: mm: implement pgprot_nx
    https://git.kernel.org/riscv/c/0ffe1ae7026d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
