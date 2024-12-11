Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A23E77180
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsJ8P/DGWjqpXivHd9kOwrlpwEnTaswnVhI5cqUmrko=; b=O/yziqP0ZiGlUs
	be8n+o75ujUcWV4/ZQVGsNor97iBwGEL+GEKiEYjVb/C4R+sbECtrYdrJIdXS7TT/7DvUDMS1E4eZ
	CQbn8+re38TUx+qfcj70MhpoQkYmIiOCCpVktIKkowvsXU7Flc3VlS++npPUz/dyytQZzxb47oPZo
	pgoBFv6s5JuS/mDwLs2UNZEUKPQyFezrKImpLdinc5EO61LNkVo5FoZx/YxqhWPDMdeudN12Vkd8S
	96Oxkh6IlBo5FgrLANuXP2OaJMuxML0yFTz2ahCrkCxrQkFvs3woX9sledgxnxkyDp2klp7Q4l7i0
	A9P2ph/eLiA9y/Lb4Q7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOl-0000000GWzN-41ls;
	Wed, 11 Dec 2024 23:45:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGS-0000000GKx5-3u0A
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:33:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 073065C67D4;
	Wed, 11 Dec 2024 22:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B139C4CED2;
	Wed, 11 Dec 2024 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956384;
	bh=dfkE6O/egkW2YpK2IvJJiv33ml4HlWyuyxOZmVAxw9c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZvaMCh3EMlbzjJV5gz6GKVrjYMFfRsCEB0itM/x4pbq1+of24OYlFqoE5I0JX04Y8
	 W0WxYmXjG+uttUOWn1z8tvw9Wm/4xBI/gF+nIi+hS3jL01gSRT7CaP2RflsUkMOr1V
	 pOj61xt1kvg9nWPVgUq1Ej4SlLJonIisLTBdxm750YWAmRzm2onP7af9scPO30Jeak
	 iNvIihIP4CoD7N29Vqx89SWkRaPFvnkSXPDfRpYh212GYyEfkuaBYFF6rNte+nft8q
	 11wKmGfUABzhnUIzm3vDt6oYIEYNyGg2X4uIkYrjjawlifbrdRROY72L+y2a1joTB/
	 rTyJykfYjrFHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DB0380A965;
	Wed, 11 Dec 2024 22:33:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix wrong usage of __pa() on a fixmap address
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395640024.1729195.13342843889585643305.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:20 +0000
References: <20241209074508.53037-1-alexghiti@rivosinc.com>
In-Reply-To: <20241209074508.53037-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, usamaarif642@gmail.com,
 robh@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143305_007213_379EA35F 
X-CRM114-Status: UNSURE (   9.56  )
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

On Mon,  9 Dec 2024 08:45:08 +0100 you wrote:
> riscv uses fixmap addresses to map the dtb so we can't use __pa() which
> is reserved for linear mapping addresses.
> 
> Fixes: b2473a359763 ("of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [-fixes] riscv: Fix wrong usage of __pa() on a fixmap address
    https://git.kernel.org/riscv/c/c796e1872012

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
