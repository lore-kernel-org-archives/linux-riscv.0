Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B64C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 00:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxraPC/u1kO1ovywnYlSv8ZqY1rK+lArYkr964DVOms=; b=vS2hz5zTxof73m
	8FZWkYRvzCks+JvPHepthgugyAgUYAPfDp9RWolWbWLGE0vJZ8GbCumZXLKp1fhBJtBab3FnKJGL8
	vENdxwvcXTmnBKf3URz5zWD6pXdsRc0bdb4ajmeZTA6IbcYuT4fPIkgOX7mw81bFlY/vXi9hjf/zS
	uyQc+anuc/wsD0zYjKOmSMd2Xlj0IwETeWKX2YR8APoMzp7iUijzSMhmSC8+4a2Eeb6lT7yH/cX6h
	fKgGr9ChqXg9WjDFqbODfr49z9Jh4Pos+fRkyrbxs9eeuaF/C9V6jt7N107gi3jwoePfeHaD7tzkw
	W0B707VtWk32PewJLZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylX-00BWmV-2z;
	Sun, 12 Nov 2023 00:55:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylR-00BWhA-23
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 00:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB32460B86;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 501B7C433CA;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=4kucImHj71DNjO8Fkep5OM38QhqpmGmPU6kfG3O+HvQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KJZqZgPypH6bl6tdJ8y+foaDKgEsdcaal1SW8veJmtRw0j5Snnn39t9y2DxQ/3M21
	 3uYon1iK6oQHrO4wGuU3H7Vsv4B5lRU/fap8GYtVjEHlKGyjQy/Dzlee9Qo5euSnR3
	 BOnlsgA0QRY6fqVor4PRh6UjVh+aFChziRmt+stFYWFVrcvf4KLl2ZWhx6Rs3R6B/O
	 i9YZbn4JZX4jGrv/+B/EYsV9wXMNhI93Qs/X1t2giuKudncvtG/0ZhyWY0X+KGZXx0
	 7RzkFgwfkgJRxbkKmi1V8VkMYAjB7TiSZLk/qTwnDczaC0X70OeGKF9IV81rDXMdji
	 2jVC3BbyYJwsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 32760C4166E;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/6] riscv,isa-extensions additions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054620.11360.8786420869587397898.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231009-approve-verbalize-ce9324858e76@wendy>
In-Reply-To: <20231009-approve-verbalize-ce9324858e76@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-riscv@lists.indradead.org,
 conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, daire.mcnamara@microchip.com, geert+renesas@glider.be,
 magnus.damm@gmail.com, kernel@esmil.dk, jszhang@kernel.org,
 guoren@kernel.org, wefu@redhat.com, unicorn_wang@outlook.com,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_165549_742646_D4180B0A 
X-CRM114-Status: GOOD (  10.38  )
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

This series was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 9 Oct 2023 10:37:44 +0100 you wrote:
> Now with the RFC tag dropped. There are no changes here from "RFC v2",
> other than the addition of tags that were provided along the way. I have
> not added "Zfh" to the T-Head based stuff, as I can't actually read the
> documentation that would show that they're encoding-for-encoding
> compatible with the standard extension, since it is apparently only in
> Chinese.
> 
> [...]

Here is the summary with links:
  - [v3,1/6] riscv: dts: microchip: convert isa detection to new properties
    (no matching commit)
  - [v3,2/6] riscv: dts: sifive: convert isa detection to new properties
    (no matching commit)
  - [v3,3/6] riscv: dts: starfive: convert isa detection to new properties
    (no matching commit)
  - [v3,4/6] riscv: dts: renesas: convert isa detection to new properties
    (no matching commit)
  - [v3,5/6] riscv: dts: allwinner: convert isa detection to new properties
    https://git.kernel.org/riscv/c/c3f7c14856eb
  - [v3,6/6] riscv: dts: thead: convert isa detection to new properties
    https://git.kernel.org/riscv/c/0804f3bec9e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
