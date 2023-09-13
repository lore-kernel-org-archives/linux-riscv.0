Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C78EE3F39
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 00:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ed3HOogKdVrFQDnJ7tll/E+i/N6vUiq8SZmGNA3SOGo=; b=YZ+SLSUzmHVbBZ
	Fm3EWWuZch7+v5sU6Jm/m2stIC4SdJ8eqK7vs969yb/Nc+LbQ+lKKmEtd9wHIdEFlTEyIEqfhHgAV
	VgvAzxWsmCxXIGpmQg79rCwzjQb9DrNLrnGq5E91ZyBV6rMAf4RK2T1kA9mElShDm7J6iVDe/P4WA
	B9RxMjoMmGWj6d6oi0Oe29uDXc2DKVXklh55GuP7KL2GZ0eNUFGznLuj4Vi7Vr9XWbHaVdCFAxccE
	jyeAzDbNzmyHOcZL04zB7kXTjQ9SdIGa+Wv68X+P8yZH+FfYlJSe1aEgBq8+xRUyHL7R+pg+vySWs
	x279xAsbHofmqhVxC5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDsZ-004LtK-10;
	Wed, 13 Sep 2023 00:37:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDsP-004Lqx-0A
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 00:37:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 67D19CE1FA4;
	Wed, 13 Sep 2023 00:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E27FC433CC;
	Wed, 13 Sep 2023 00:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694565420;
	bh=DassFrV4GUoJbluFUJM9wvLSs00AbML7c24OEQapaI0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hDNbK8sfOrFS0E8sFJYCxmD8I2ydTGlkRcCLRde0Z6DOXGO+2h14PlMIMqAYR7lN5
	 d8/kWd/2R0lV8jhCwgucoEpetLJQGJHW3QS5c/cFwO0Nd99mHYohkysklumpSQiZsd
	 lpMw4F0eHSi1GxoNYmXosMA5EzDBzR3CarIxHm+TV5chUWmECyqVNlGbkzYohUkajw
	 d2ueKcNdG+SiiyBZmejwjvZF0zB65nhfj2UFMGVVcODaP8pAs8+R0GDtEHebe6bFhF
	 vJbIYgikCzMTMj5PEVfje+YPvMQCOiKERUWUvzjwx8bGHa1XPNgBKTW0g+p7gbQHxv
	 pk+OUgs1AVjSQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 424CFE1C290;
	Wed, 13 Sep 2023 00:37:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: errata: fix T-Head dcache.cva encoding
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169456542026.30716.1328389839537461006.git-patchwork-notify@kernel.org>
Date: Wed, 13 Sep 2023 00:37:00 +0000
References: <20230912072410.2481-1-jszhang@kernel.org>
In-Reply-To: <20230912072410.2481-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, sergey.matyukevich@syntacore.com,
 heiko@sntech.de, dfustini@baylibre.com, linux-kernel@vger.kernel.org,
 guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_173705_282887_FB58FCA2 
X-CRM114-Status: UNSURE (   9.59  )
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

On Tue, 12 Sep 2023 15:24:10 +0800 you wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> The dcache.cva encoding shown in the comments are wrong, it's for
> dcache.cval1 (which is restricted to L1) instead.
> 
> Fix this in the comment and in the hardcoded instruction.
> 
> [...]

Here is the summary with links:
  - [v3] riscv: errata: fix T-Head dcache.cva encoding
    https://git.kernel.org/riscv/c/8eb8fe67e2c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
