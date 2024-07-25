Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564E0C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LF8itxNJmWUy/GSGwWU+sA8gnErp5qIAxy+0tmjhKn0=; b=FxR6DtfcGA/GDB
	2A1+OsanXLx4EdmljKXGyWO4WXx51ZFdgGrugOeqQwXifpZJ+orfXIh5fyqJtyYy7+/HWw5+diuBl
	aHeBG42AOpE6B2AlOo4Lhp4pRopSxI2pxNBSyCLD/ZPk8eunCXLcVRT2f60nD72Sbm3T63xJ/moON
	9zec2Ixq1/jHawB266Gx+J6GpYoZ0Waauso61CnGbZ6D+XU6y7iAGZzxk3xl5hPcPiHPslBHWrCPM
	T4n9GrcFvgZCqQeiUmt+8k1tiZsJIXzYMzPPrR3jTkiN1tt+n3DZ0pOdtgF/9IaHUv7hVW7Qr0UTG
	MVwzvFvIjDPPPsVjTfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzUV-00000001H4i-0h4e;
	Thu, 25 Jul 2024 14:30:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOh-000000012kZ-2A9e
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E20D6140D;
	Thu, 25 Jul 2024 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CDBEC4AF15;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=TpI1ixtnkgK6069tyFCaTDiH2JIMGFEYHPdFbLBMSYQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P4znUMVW3nVwf8QCbMHEF386qnVMNPF2hpPk5cDnaT+hL49ZqkHRdyRIR0f1j+iE/
	 sJrH5EO7OXKVwBHjd30bqAOMfLl14WXce1GRo+RswGCksVr/FfypVg5pdhdoDvIrh7
	 Gt+W2zDU+9iH8DvjHeeHT6xtwN0IZbP6wuJbPYKtuVRy91eaFTMtMbPxMUbnZoyODw
	 JkUdmP+wpv9Q4hmQCKWNyfBtSyQu/uq5PaalAnn7h5f+rmysWcrK8y2zweh9XktVtW
	 jNlJXHdIse0aY7Xl1cEDU5005+MKR1i17kPwwQjtxhUd/KBaCWVBWY29T40w7cgxg0
	 W55c7Tvkc+Aow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65997C54BB5;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] riscv: boot: remove duplicated targets line
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363940.6240.8844559149155554407.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240613153053.3835-1-jszhang@kernel.org>
In-Reply-To: <20240613153053.3835-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062043_716877_251AA014 
X-CRM114-Status: UNSURE (   9.70  )
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

On Thu, 13 Jun 2024 23:30:53 +0800 you wrote:
> The "targets:" is duplicated in another line, remove the one with less
> targets.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  arch/riscv/boot/Makefile | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [RESEND] riscv: boot: remove duplicated targets line
    https://git.kernel.org/riscv/c/8d22d0db5bbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
