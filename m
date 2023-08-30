Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D2EC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 20:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5kApT+4glaI8nmqvnSJoll4P6FYMWRqPcq59nXE1Ws=; b=zIuphnZoCC1b6h
	shZoP6VtacPl7WVuyEpOmnmFLle0D3VfF+gcBM41tYoY2nmJzghoNGUfSx/dpDc9FH1RRHTMHRCyG
	piXFt17hHi4iH9+9MVnCtqe61PyurO6sL0Ztu3fAzKMqGAaFm1nQbXEbNxQWxGr5kW/l4YnkwlXm0
	YwLA31jPM9TptFg99o12oIVAxNXx40y6NBrviCB90r4N6PoAjROTek2xwlNPMgXTqDvIKfMOnMGm2
	VHHF9gDmXUN5n836wnQyThInS8XFNMTcth6cUNjAdzyCTlUQiJOJrKhjA+JvXAAM5KbLTpf8fCPnP
	OBVg5U3LiZLRErPKKzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRpm-00E8fF-25;
	Wed, 30 Aug 2023 20:30:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRpg-00E8br-11
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 20:30:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 05157B82096;
	Wed, 30 Aug 2023 20:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5A21C433CC;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693427428;
	bh=fT1Mc6iM3dqocvtN8cReW8mPxlD54Nebe5kr7PnolHQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QEXJRGCI+yA4MZknAHLf84uVIKAe2ub/RFF4NFCRCYjlSGyfCRoQGMyCNriD/KK4Y
	 UGhR82QPShFIxdaY4z6aozifmaRHLcp2deSgra4uYuT7zt/9VqdN9TYqcIcSqMLM3Z
	 5jCH1eeXa2xtiJUC7IfYF6YfGcRWXMXDpvsqtiv1AmlPGYjQPVkkN7XIdZloxGV1ao
	 RlhOaZnNhgj0cjH2AE02z1e3QJiyt5MileETj55ypgaAgLWEdfbnf2bBhefnT7qn0Q
	 N9+N7Fbx+t6nywfy+ijZbDrKFfRua5wZn1O6X6rRP+yBQsU/EnyRCJapdfa4brmGEU
	 1q2pmbKoMVuIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C763E49BBF;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: signal: fix sigaltstack frame size checking
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169342742856.1913.346835695901191456.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 20:30:28 +0000
References: <20230822164904.21660-1-andy.chiu@sifive.com>
In-Reply-To: <20230822164904.21660-1-andy.chiu@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
 prashanthsw@google.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 heiko@sntech.de, conor.dooley@microchip.com, vincent.chen@sifive.com,
 mathis.salmen@matsal.de, guoren@kernel.org, abrestic@rivosinc.com,
 vineetg@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_133032_495625_9FA4A7DB 
X-CRM114-Status: GOOD (  13.97  )
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

On Tue, 22 Aug 2023 16:49:03 +0000 you wrote:
> The alternative stack checking in get_sigframe introduced by the Vector
> support is not needed and has a problem. It is not needed as we have
> already validate it at the beginning of the function if we are already
> on an altstack. If not, the size of an altstack is always validated at
> its allocation stage with sigaltstack_size_valid().
> 
> Besides, we must only regard the size of an altstack if the handler of a
> signal is registered with SA_ONSTACK. So, blindly checking overflow of
> an altstack if sas_ss_size not equals to zero will check against wrong
> signal handlers if only a subset of signals are registered with
> SA_ONSTACK.
> 
> [...]

Here is the summary with links:
  - riscv: signal: fix sigaltstack frame size checking
    https://git.kernel.org/riscv/c/0caa0b447398

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
