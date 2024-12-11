Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6299E77182
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kbdxBHkgfgoKSuW4j4Wpo5bcdjWh9rVG1IDPBSJsXM=; b=4TYuIafs+fcJkO
	OhFK8jum0IOlpza/nCsXcg3YekO7vAA2RArsPOLelXQlGgsa2p7X/HARMhTEX8c8MZDAKgWiv+YWn
	ReVR7CNeAOCsIJ52RErRnvjgcOy5cniz+EyxtWAMw1r9frwmDfIwFAFRb3pFHX1tuc8T5jSpVAd+d
	WPqc3Pn+ZBbkyZ/mBR176uwnb8lQ6vlhkgfWZYOjL1ndyW5o+btu08m/RO82CsXZYoysNOFDpCoc8
	7957L+5ISCCN4sFPs53kgsjcESACLl7kopKihRoY8AnqF5z4z+r+Sn1IUppAZKlvINqHKpr72cKOm
	9SE8M3nxBJn1HK7IDriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGv-0000000GLIn-1zB9;
	Wed, 11 Dec 2024 22:33:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFr-0000000GKTz-3sg8
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05DCE5C678F;
	Wed, 11 Dec 2024 22:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CD1C4CED2;
	Wed, 11 Dec 2024 22:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956347;
	bh=u4gaXs5sosKWY77rmkfUwUca79BA3tp4W9GgBMx4WJM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mt21d5jKVhkwSjxHePxlM4O/zLpsGeiRd5tjyK2pX0BJTm98heLfhm4LJOYBbfwZa
	 atA+ZiFZbqY75h4AxHIgC/2D/ZDPVaj88Q1VIPtRxek+GeuHfna2eGz2IcTu7E2bjF
	 y+8Y/884d5ESblaH6xap/fCr939WefZ6WXlf3u2jHPjxUjx0H6/BcBNZYsujX1rhDZ
	 rsTDJm+pOrnde3dqEJnLiOkbyX+OwHMfU3XQn3f+uTAfMXXMKEt8ozQzF8UdLES1WW
	 E07AquHPMxaLvuLu+zuiGq5SPDEJll7lePXJFRX+UNYglftZp2s4gTIYeuYtmaZ8Zx
	 Uw+ir5YffFaMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70A6C380A965;
	Wed, 11 Dec 2024 22:32:44 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] pinctrl: k210: Undef K210_PC_DEFAULT
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395636298.1729195.9726718788225234944.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:42 +0000
References: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com>
In-Reply-To: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linux-riscv@lists.infradead.org, dlemoal@kernel.org,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143228_009941_3C86F35E 
X-CRM114-Status: UNSURE (   7.75  )
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
by Linus Walleij <linus.walleij@linaro.org>:

On Wed, 13 Nov 2024 15:12:01 +0800 you wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> When the temporary macro K210_PC_DEFAULT is not needed anymore,
> use its name in the #undef statement instead of
> the incorrect "DEFAULT" name.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v4] pinctrl: k210: Undef K210_PC_DEFAULT
    https://git.kernel.org/riscv/c/7e86490c5dee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
