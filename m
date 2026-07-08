Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F510C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRCCTs4zLpW7a17Hbg8xR7t8jztvMoCsD2aRGL5zLHk=; b=NGsEpBHmXHDwXM
	X9VRAL8iAvUoisp1EWx0nUPX0mnXS2vWhEEnTln/mgRF3Pkal4V0FDVluRGGGG0K45wvydUsC1UI3
	zRWg93QcskexKlL+puGCYjZsWU/kalQkXJh56LD0iymTzMb1mIb3D42/S2iz4yOLbPe+3NXen/AhB
	K2UbvSKl2eJ8vOrEVurSTzrr4P+zruSPPw3HmYYyvAVQihayrungSP/bip1HG9/OoXxFJMrR93WV/
	GKBUKRJHD6XdpAhVdnYFAAUlwt7idh2BtHM1ikY9oDrA5K43g0gZh3QRQxk4VngrUUbPloktbh5vb
	SJ9p/yzpq13+sGgL7XFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVdN-000000002Uq-1ycJ;
	Wed, 08 Jul 2026 17:00:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVdL-000000002Ud-209m
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 17:00:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AC47600C3;
	Wed,  8 Jul 2026 17:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15791F000E9;
	Wed,  8 Jul 2026 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783530025;
	bh=c+9/nNYjkvw0jgf1j3Gv5o89wJBSkJjLM95B716OQQQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HCeM0wDY15E/tfFBnPMEbpinf3jUnu6sLOcrDRcP7xct+vgE/zvGyQRqtaC9R2pj6
	 v6hcmLN/XY/M0vVJLAm4gcJhiqpYvPm3zncgmMEb2Bxc+ag3YAEffoUDPk4nYKKVhV
	 pQB6JsfSfLPMSz3+Ntg2STMsws+ADpTuVKLJFLoen7tr/SqH5vAtOCWu/TiJDQJBwE
	 L4syWn53xAzTAgK8uiPTi7Xw9VdqpUFcAA4Jty2y49b5MLb0PTn2ie7vqCov12VxpM
	 j//n751hV98KrZ+jc9kJuyhky96ryLExTgiMj9lRLkdACIEPUS+p3MUpamqN8IEhab
	 FnE8TTELk9meA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1A4523938446;
	Wed,  8 Jul 2026 17:00:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] selftests/rseq: Fix a building error for riscv arch
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178353000492.3027451.2869777955092824432.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jul 2026 17:00:04 +0000
References: <20260707082348.36896-1-hui.wang@canonical.com>
In-Reply-To: <20260707082348.36896-1-hui.wang@canonical.com>
To: Hui Wang <hui.wang@canonical.com>
Cc: linux-riscv@lists.infradead.org, mathieu.desnoyers@efficios.com,
 peterz@infradead.org, shuah@kernel.org, paulmck@kernel.org, boqun@kernel.org,
 zhouquan@iscas.ac.cn, ajones@ventanamicro.com,
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Tue,  7 Jul 2026 16:23:48 +0800 you wrote:
> RISC-V rseq selftests include asm/fence.h from tools/arch/riscv,
> but the rseq Makefile only adds tools/include in the CFLAGS, this
> results in the building failure both for native and cross build:
> 
>     In file included from rseq.h:131,
>                      from rseq.c:37:
>     rseq-riscv.h:11:10: fatal error: asm/fence.h: No such file or directory
> 
> [...]

Here is the summary with links:
  - [v2] selftests/rseq: Fix a building error for riscv arch
    https://git.kernel.org/riscv/c/a2ac823d8a22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
