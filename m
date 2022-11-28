Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13F0C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 23:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAXzh51ey4xb+vZNpKZcFkl6gbWfLalGh/SY2jQOZi4=; b=Hj5OxwUA+31KO8
	tjv5cCqjJANRSZhAvTb1VSWhE99HngQeAVyZnsO6Um4Pv/KwhFxB3IuzpmaXB4wmca7cMzOxf8Vin
	cuwOcF9wUP6ojsD+DrnxgXantX/mvs3nV84v4+2Xl4DhUxxcIYKuCrMJ+DVTk8aqagPC0SG+i+ac6
	9LK2DMDZ2yynfX5fYfy9q4XW1sgHvgIAN+CjSML23/Eg7rCwnEH2/8Wd8WUYUxVe8v8diNqKCXGXr
	mVoMfQ/UOqqHdutTS6Q8PoaHKl4Xcjr2n6umIvAVhGLiySXa8cGXyFWwKVbDZE3sSKkuz5oAk5iDx
	vAjVy7S2CWBiHDSp0OTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznjX-004ogd-V1; Mon, 28 Nov 2022 23:40:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznjV-004oeM-Ke
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 23:40:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 453966126D;
	Mon, 28 Nov 2022 23:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9514C433D7;
	Mon, 28 Nov 2022 23:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669678815;
	bh=6mPlbaUReAz5hkyqzULKNUBalSvtA+axzTczmuk1Snk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WMALrFjvnJ425z8bodXqzHP5ZOCjr9cmW3ca3LKTaCRqXvYMAMBUC4QODhGKGY77C
	 HPAwyXlqZj0izpNUjh7wKI4BnKuk74KcWjWGXNR3IiBkpUi/8eMZD80awcjH56XvGi
	 EdM9WmRCWKHzcLcyBo3Yd5btygOgfPS2nuz02iA57xCzR8sOjA0NT/VwXovOTK6NbA
	 mpdVeiQ629ubF0oos7LD07R7v47Bg41UT6ZqJazt7TSkcQBCrD9T9/CKKDbII+mxxB
	 Eumpm+knDh7q0BCFGqEB/ynyVNKW3L970EOcfd19ZOqSbuAVr9+flH2rBwefZ3Y1s0
	 H4E1XUAeUEwpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81601E21EF7;
	Mon, 28 Nov 2022 23:40:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix NR_CPUS range conditions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166967881552.1570.15037145347501399600.git-patchwork-notify@kernel.org>
Date: Mon, 28 Nov 2022 23:40:15 +0000
References: <20221126061557.3541-1-samuel@sholland.org>
In-Reply-To: <20221126061557.3541-1-samuel@sholland.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, apatel@ventanamicro.com,
 heinrich.schuchardt@canonical.com, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_154017_746683_41DBFBB2 
X-CRM114-Status: UNSURE (   8.67  )
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

On Sat, 26 Nov 2022 00:15:56 -0600 you wrote:
> The conditions reference the symbol SBI_V01, which does not exist. The
> correct symbol is RISCV_SBI_V01.
> 
> Fixes: e623715f3d67 ("RISC-V: Increase range and default value of NR_CPUS")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> [...]

Here is the summary with links:
  - riscv: Fix NR_CPUS range conditions
    https://git.kernel.org/riscv/c/1d6b5ed41f8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
