Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24280C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 04:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuhaaVrtk0QBIO7EY3BOM0rX4dlay9TuyltLddm1LjA=; b=RXuzjVem5WBxD9
	s4fneQj5p6fHHdISpe+FlrcyblLklBU233FSExSMeql0JfHLNFk2R3mMItVhFoG+VhvTQB4fz5hJo
	ObMSS06IIRad+uY7enUr9hKI+zZa5zaAEcbmn6czKZUD9fgs5WYkLggqXfGytm/Stfn3xyfWA/Ys5
	kx9BcYhvEw3Q7JvFyTFsiOcL6SY+ZF+VC9mEMwHxtL3ubAbh/JBQ1k/9mzse81pyjO1RzWyh0+DwI
	fAjQ01k/XF3quesONdK8UxpAdPn+o4zoZ+lRC2YMU29wPmmaZWTIBZWa/IosKwxUQY3EboilIxRMs
	2nT8JZUTtAkh2P2NHZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3rLh-00E1in-E5; Sat, 10 Dec 2022 04:20:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3rLe-00E1h0-MC
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 04:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8DA81B82A79;
	Sat, 10 Dec 2022 04:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37B8DC433F0;
	Sat, 10 Dec 2022 04:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670646022;
	bh=u7IBemmNgnDXR9JHwEtZxu1zqf1Kb60A909mP21RLUg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b5wjgekzrhfeOuyo2uBHPbt/m4YsHlgH6BOohMvIIlDu22Q/u4hIdqB2aCzex2pqp
	 mxTxrrrA10YD/vWpP8doCTSrz/m35/cbe3goIN/IGKaQrp6lB4t/hUtOeBxlreoaqG
	 XN/N4WH6RIUUydrE1LB13iXTuhkn7KqMh7VKKcy15NWasWiVqtJ9m+WxqWq1Uiq0cy
	 1KEE8NOQ5YiBY9v2ealCl7MAZLt+Z4Y4StwejhimWfWA0FVQFMxTZ7kg6t2oxdwUqI
	 a9ANhHU3h8s+oziajsahAoYLXwZDzmHEMy6zX2/GBRH6RXu4sMycPuOY6Fz76p4/lw
	 5HiIn865viqnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25E23C41606;
	Sat, 10 Dec 2022 04:20:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] riscv: Don't duplicate __ALTERNATIVE_CFG in
 __ALTERNATIVE_CFG_2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167064602215.29562.3780956088196198595.git-patchwork-notify@kernel.org>
Date: Sat, 10 Dec 2022 04:20:22 +0000
References: <20221129150053.50464-2-ajones@ventanamicro.com>
In-Reply-To: <20221129150053.50464-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 conor.dooley@microchip.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 prabhakar.csengg@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_202026_895780_EDDB08E8 
X-CRM114-Status: GOOD (  10.15  )
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

On Tue, 29 Nov 2022 16:00:50 +0100 you wrote:
> Build __ALTERNATIVE_CFG_2 by adding on to __ALTERNATIVE_CFG rather
> than duplicating it.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)

Here is the summary with links:
  - [v2,1/4] riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
    https://git.kernel.org/riscv/c/2ba8c7dc71c0
  - [v2,2/4] riscv: alternatives: Don't name unused macro parameters
    https://git.kernel.org/riscv/c/7d52eace1bf5
  - [v2,3/4] riscv: alternatives: Drop the underscores from the assembly macro names
    https://git.kernel.org/riscv/c/bb2efcde5946
  - [v2,4/4] riscv: Don't duplicate _ALTERNATIVE_CFG* macros
    https://git.kernel.org/riscv/c/26fb4b90b745

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
