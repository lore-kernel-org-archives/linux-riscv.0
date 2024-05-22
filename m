Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB7EC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVwCL2yUrmSulTXu2acgnb5l4dNjKaDNbibrHRdxlfI=; b=KlJZ2kiR4M9em8
	Tk50n6NghqtC1QRGROXFsRaQvKKiJWjW+xOS9PPjZ+SIaBQ9mdNohd3V09Nm3JJz5pZ+NSF8qXPff
	K3tZCXbfgnSB7dUqPljjmkvCrengtzxxmV3nYK5onCkKFfo2cZsBV4aWC7of9VAnvj2Az3cGwnBp7
	2Lqbs5l1EpjZnaCzBdWCstz2DPUxOJTzIqvJuYCrFabhyxJm8umeY0OAH7t+7JViXLtXo5XxU7Myw
	eF3ncJR0ZiR42YfRJmZRMbGhjRzlrCWxIau7L8Xtd1rLKSlwufO057FZ+48qqkObeZ6Sj6BYX+1Hb
	c5XF66aT+qxm+jNoYCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkb-00000004VWs-2KO8;
	Wed, 22 May 2024 23:52:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkN-00000004VNC-0EsS
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2BB76CE1383;
	Wed, 22 May 2024 23:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7C00C4AF0C;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=Nty+d0O2k+tcTQfotqrEHDSwCA3ilUGE7inQCe2W3o8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eJ6yeDJpb7x/wkFNd67nxJKK7wx+jMvay4iawRRiXNsVYNj970j+MzX2xuGFszMqW
	 1O0K4M9HvcWxvoSaHBSt+ojD8yVfNKiNim163ETs9khkxu45zF7R3AuHD+CDdvrf+h
	 NeXBi2k9LKvuxIyS9E7ie/ALv2xe5Ch/1aNaVCcUAIA+BLe3bSlggJDmDJ3VnSRE52
	 e3Kr37DsFP3a51mEEY3nvzQXTW/2LKZUizTBPNOlIghfpdPLrjcsNV4poUmxN+rwmL
	 W/aWZd4FdHnoTrr5FUF/P93yy9WvcRbksmc3D+2DpXIcNRP8v5KULbee2tn+qav5kr
	 /2Jse6KsKlVgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B99FEC43618;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: uaccess: Relax the threshold for fast path
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190775.9409.16917538511707082083.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <20240313091929.4029960-1-xiao.w.wang@intel.com>
In-Reply-To: <20240313091929.4029960-1-xiao.w.wang@intel.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com,
 nick.knight@sifive.com, ajones@ventanamicro.com, bjorn@rivosinc.com,
 andy.chiu@sifive.com, viro@zeniv.linux.org.uk, cleger@rivosinc.com,
 alexghiti@rivosinc.com, haicheng.li@intel.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165151_449134_34EAA34C 
X-CRM114-Status: UNSURE (   9.38  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 13 Mar 2024 17:19:29 +0800 you wrote:
> The bytes copy for unaligned head would cover at most SZREG-1 bytes, so
> it's better to set the threshold as >= (SZREG-1 + word_copy stride size)
> which equals to 9*SZREG-1.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/lib/uaccess.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: uaccess: Relax the threshold for fast path
    https://git.kernel.org/riscv/c/e8c7995ea148

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
