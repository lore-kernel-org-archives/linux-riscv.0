Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F51C7618A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 00:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiWhQWDH4PU4GCXszh/jHgf48ej/gcjO+MVFsnNa90g=; b=jKKMxTWMtb+zc3
	vTELEadQdVCsx6hFBWNiFdp8I3YFdtfI30EGCpCAo3SzDfj4Dd5AmypY+PB4pWMmF7LFZ5stp+/HL
	TBFjcV9dBaUXQbUpubxoHcKVO+qRzFaisIk9M6n5S2AsSsJyH2/UYXOkGXczh1OpAJKNQMr6quTSu
	2OYC5vMdAjBwkIyXaIdgoocML50K79CarqundYUTFaSLHbaVopf/EVZTGh1kcrlcoX7pxWP607+xK
	yCRqKnTb3SJU50kytNF87r0XIXjDtB7XaGxvYZBpxsaMvS6k8S9cKjul2sgz/oMlPyzJYOjinh92H
	Q6hAmm4o5ZoYDoGpXIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcxzF-000Rrn-0V;
	Fri, 17 Mar 2023 00:30:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcxzC-000Rqo-2J
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 00:30:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7B5A6216C;
	Fri, 17 Mar 2023 00:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10200C433D2;
	Fri, 17 Mar 2023 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679013021;
	bh=V0IabrJKAckqatzfWKd53XjvtYMa+qNDmLlYwdANX3A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cfNJNC5wcGQTbw3i2g3R/aqR1Ts0Ffzt3JVxypv+UAev+46X4ns/a6XZC2Y3uwpoB
	 AdcVhP0cjOiXeXt+GlRKCczsk5UlA3ZqfCF2U8VxoI/nS4foYvG/Iav5XE94NixHBN
	 pryqrU56fJ6SWLDc2ktcX7EpCnjO7Kyy6PW8kc3HWO7Lnp8CxYcENVkMT/byajmkET
	 Wjz3povjrwm3zwuuAqAGckeGAP+zDkLCmIMhSSQBZC9zhwpjvGfBjyOONQSvgshbYP
	 GIU864Tk0LPPI9YgQrVFc5RgDwCmktwwyz6BxxpIyo8WeB4bze3bZlY4irh4DwmGT+
	 UieqwMi4iYWeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F01EEE66CBB;
	Fri, 17 Mar 2023 00:30:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Add PTP support for sama7g5
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167901302097.26766.6833385103104590996.git-patchwork-notify@kernel.org>
Date: Fri, 17 Mar 2023 00:30:20 +0000
References: <20230315095053.53969-1-durai.manickamkr@microchip.com>
In-Reply-To: <20230315095053.53969-1-durai.manickamkr@microchip.com>
To: Durai Manickam KR <durai.manickamkr@microchip.com>
Cc: Hari.PrasathGE@microchip.com, balamanikandan.gunasundar@microchip.com,
 manikandan.m@microchip.com, varshini.rajendran@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com, claudiu.beznea@microchip.com,
 cristian.birsan@microchip.com, nicolas.ferre@microchip.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org, edumazet@google.com,
 kuba@kernel.org, richardcochran@gmail.com, linux@armlinux.org.uk,
 palmer@dabbelt.com, paul.walmsley@sifive.com, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_173022_795726_73134CA2 
X-CRM114-Status: UNSURE (   8.20  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 15 Mar 2023 15:20:51 +0530 you wrote:
> This patch series is intended to add PTP capability to the GEM and
> EMAC for sama7g5.
> 
> Durai Manickam KR (2):
>   net: macb: Add PTP support to GEM for sama7g5
>   net: macb: Add PTP support to EMAC for sama7g5
> 
> [...]

Here is the summary with links:
  - [1/2] net: macb: Add PTP support to GEM for sama7g5
    https://git.kernel.org/netdev/net-next/c/abc783a7b0ff
  - [2/2] net: macb: Add PTP support to EMAC for sama7g5
    https://git.kernel.org/netdev/net-next/c/9bae0dd05e61

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
