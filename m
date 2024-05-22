Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A91C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WO4grxjsgLqVZ4HahHEI2yVe4/LsW0QcxQrk3eue/uE=; b=TOX/1hCdANV5GG
	eBey6aanH/9ZcmEfgwlYHdJcJLwvDZgeUOmaRdkjK/gMuKUbLk15Ong+oNrm5AxUlMFE45DAKhCE8
	/G1x5aaV+4mTxfr5nDAQc0KqXayhlz6Atg645ZwJPo9OusdXoUok/jnSLbX4LWEOiHoWH7jIRfyuZ
	HJOjRTHxb0/my6s1jiijDAAs1gVSfDkF3/IpyFjxjsnHbSgH4dGhO8/dakJINZLBuPVD4MQdYkD+0
	aFkaQqK2iDpOM0KC5LY/N16UlYxRHNuF7+8HJaujdafPlRkxDF6K+WpAhAFIQdfXUDfPYo/xFuns/
	22F/suwJzkeL1w53qmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkT-00000004VSO-2bnW;
	Wed, 22 May 2024 23:51:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkL-00000004VMw-3NBp
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB1BE62C06;
	Wed, 22 May 2024 23:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D11A5C4AF11;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=Pv9zAXlOZhdJU+LhQMdDSGV7wh2k2U5Rp9fVDXFevds=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sKv5tHUHSN17DI/+rcYLvZuWe5/vsZgnPuv+RlKhMieMTyfbTVatLRXzT/ZoerP3V
	 wIuLrOLo7h2evX0P8IJoZVZawLXHO1SStHghvLai0e7NIuvfBrAsxlgspWSEqknKqs
	 TB+L7ZfXskH0yHiS9wEc/cEAny6TffgoMNr7++JJwk3I48EMP5xf2ArM5sPX9Ha+52
	 5iKtDim/rJey0rKm+EPMAaTh6KKaVCu6fVsWU0g0wh5jt9kKAZDFR0v+ixbeNP2oga
	 3ThJ1Ol1E5xRyiy/1qflawSvyyJDIK3DN8EIOdFs5++6Ojm4WXGj5KNpUKcjSM81b7
	 YWWyERrd168Eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C3D83C54BA0;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: stacktrace: fixed walk_stackframe()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190779.9409.5709949427639439601.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <20240521191727.62012-1-dev.mbstr@gmail.com>
In-Reply-To: <20240521191727.62012-1-dev.mbstr@gmail.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165150_100274_D798190C 
X-CRM114-Status: UNSURE (   6.54  )
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

On Tue, 21 May 2024 22:13:13 +0300 you wrote:
> If the load access fault occures in a leaf function (with
> CONFIG_FRAME_POINTER=y), when wrong stack trace will be displayed:
> 
> [<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
> ---[ end trace 0000000000000000 ]---
> 
> Registers dump:
>     ra     0xffffffff80485758 <regmap_mmio_read+36>
>     sp     0xffffffc80200b9a0
>     fp     0xffffffc80200b9b0
>     pc     0xffffffff804853ba <regmap_mmio_read32le+6>
> 
> [...]

Here is the summary with links:
  - [v3] riscv: stacktrace: fixed walk_stackframe()
    https://git.kernel.org/riscv/c/348212546af0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
