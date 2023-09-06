Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CB3EB8FB0
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilNx7rEAWybxefaHqsFPZFt0ExI2ljM6ljY+pTPeO08=; b=VOTFNpIjAcb34O
	MtObn/yqs95CvDlG1zUX9qB/8QknoHxp61SJTDydfCbVx9PYpRyqybPhLgEmEIRw83o1LjFWY3Jgy
	N3bkQ2GYHl8Lq+Ueov3yXnvK2AKQSQg18wViY5x1Or1hRsjJJmrDYJ2hinmK20EYGmMAE9KVrYgsl
	RyGgqnsGmCJcxp545q5h/y3iPFabkkrMHZvQnfjn9DT9LeMI8TjYyQjh8h6xwR9zlmyursZ1sn98i
	VXa8ws1iGGr1f8mwb05Bk9Lt0ggceC3ycALD4rgiMYBT1bhxWqSC4IIhF/YFqq8PelfIpLh71U2XW
	FPf0/q9GX5GmyWLtNvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdick-0076FP-2h;
	Wed, 06 Sep 2023 02:50:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdich-0076DL-1x
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 02:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1988C60ED5;
	Wed,  6 Sep 2023 02:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7460C433CA;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693968627;
	bh=lTNLwQ7okag0fOcjp9NfJ2YNfkn/HkdbRQdwKEU1NEE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cWJ/3/8tTZtivtzRaZy3EmmqrMzo3rqMAy4h+GSKAXTq7UoMPw8wl2fxVo2NjMqG+
	 uU76O2irK/j8GSbZ8wW0iO8QzzOfYPST8vYv6xJZRAAVBH9Q5xuTjlA6ZZH0Fc9T9l
	 RA5jBb65hO8qJXdbYdh+/k10t3Le7jkduiIRcwnCvnrdsOGXSI7k7PZqe+J4pLxJ7f
	 8BVEsIszxYsqrtNCQwc+Mip2Z8gP7GgR+77JCWpTw2m6PncqbrZJaCC1Kr2X3/sXA3
	 SP+/N/6LVwk0MeT9hm/tjK2PQq6/OkLyYwXmGzDge60zVniDtH562IhA0Cn8yMlICH
	 kHBEOuwVC1L4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97A54C595CB;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Kconfig.errata: Add dependency for RISCV_SBI in
 ERRATA_ANDES config
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169396862761.1987.8028551010129102757.git-patchwork-notify@kernel.org>
Date: Wed, 06 Sep 2023 02:50:27 +0000
References: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_195031_688524_32396BE5 
X-CRM114-Status: UNSURE (   9.14  )
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

On Fri,  1 Sep 2023 12:03:20 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Andes errata uses sbi_ecalll() which is only available if RISCV_SBI is
> enabled. So add an dependency for RISCV_SBI in ERRATA_ANDES config to
> avoid any build failures.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-lkp@intel.com/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> [...]

Here is the summary with links:
  - riscv: Kconfig.errata: Add dependency for RISCV_SBI in ERRATA_ANDES config
    https://git.kernel.org/riscv/c/005846ea7265

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
