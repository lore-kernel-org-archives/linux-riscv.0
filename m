Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE90ECD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BfMZAlZLlXp7TyLvb8Gh6wN2NR4JSNhnmCAzochdEA=; b=pdowQKkiIPXo5d
	8tPlO0pZLnZZ/iHruuhXiO2RZFwcB6N7zhfbQPYxwjX5nHH1xWe/s7lnQe0/ITMdmOpIo5O922pr2
	wUsXPMOQkh29Uzqh/Dd6wVMjfzxFDD1MNka2V8mLaF58SziIAAq3vlog5GmI1LDVqpTEclhfns4WE
	hooQAAO8P1tK9iS1ZwRW9Hkuq4zvW+xVeUP9yKkFGQd5qUx5bPHy4mpnPamyV2MjrgDezUgsg/r8l
	GBAV8VhBY9ljTt/rANq0b0SJLV/dLHcZtGtqjBexJGHbGJ52s1R+Zulz/hlx+3NPjHB60rwZ/ol7l
	UyBtqsfs+VqOC58hapGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4t-0000000FJg4-3XWq;
	Wed, 03 Jun 2026 15:00:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4s-0000000FJbm-0N7J
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 15:00:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47EFB602CE;
	Wed,  3 Jun 2026 15:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB801F00899;
	Wed,  3 Jun 2026 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780498816;
	bh=5esXABQ9v1IkhyhfkHBvjiSAaiXKlrhHmgVnAOcCx0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RX7Z4jbhEtr+yf27l5vG/SqQtPyvoP9k25J9wYtm+iiuZ5bqp/0iPm+Un9lDIREfr
	 3lDCiEcw/8mGGaRlfbaTVj1W9STT3Nga1OTxwfj+lEuhThSZ7i4RZBaPnXjZ9gtm1G
	 GqD+Uio0JHZnqHOgVuAxyYr82Ke0gV3p/cQvhhYlr80jaaJ+a3OqKfy3ZWuIGrGzqQ
	 Dwhxd2ZRo7BTJj0PMTARF6RhMU1HD5AyiImlyJDp48ZhtSpBRwrfY8ZR9e4ACYJ7jQ
	 fRWKFTxMroM9wVLYk14y1NwrCFJo2iH0A7ATJtjY5If4WgvwUjmDjyVMfxXhea1eEV
	 kROk5hy+FRtwQ==
Date: Wed, 3 Jun 2026 15:00:13 +0000
From: Yixun Lan <dlan@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: defconfig: spacemit: enable i2c driver for K1 SoC
Message-ID: <20260603150013-GKC3727415@kernel.org>
References: <CGME20260603082338eucas1p2ec88154477479bf0547e5221e0919b07@eucas1p2.samsung.com>
 <20260603082332.3200814-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260603082332.3200814-1-m.szyprowski@samsung.com>
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

Hi Marek,

On 10:23 Wed 03 Jun     , Marek Szyprowski wrote:
> Enable K1 SoC I2C driver to properly probe PMIC chip on BananaPiF3 board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index c2c37327b987..08445df56006 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -157,6 +157,7 @@ CONFIG_HW_RANDOM_JH7110=m
>  CONFIG_I2C=y
>  CONFIG_I2C_CHARDEV=m
>  CONFIG_I2C_DESIGNWARE_CORE=y
> +CONFIG_I2C_K1=y
We've got one patch already which try to solve it in another way..
https://lore.kernel.org/all/20260526-orangepi-sd-card-i2c-v1-1-b92268bfd467@gmail.com/

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
