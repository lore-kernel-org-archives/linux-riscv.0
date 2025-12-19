Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EE1D74964
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6g3z57Ij+j+gj7dIC0u1MlQ5pHp6J+oFn3ckKseCGI=; b=srF4HSjyMGxHbO
	47N8vIi/GmQsNtd/5/+OUvgoUvSs4PopqOZdsqNT/Tf767JE+jafwKDMfoUqXFEm2Ra3/LfDiqeKP
	pT7fZiBqyEaS/wXHV6VeHpbXY0VYolfGOk52g9A1+5Wa+quDKHz+FZKRKOTsAVN2302ev9OEECBKs
	hy5sVeYEK9uxZx1KcLPr2rZ7o0b1X5GMsh4uS0JWHAtnL6sLDlXjJfbh/AMjd0cUkDJVCLkcnis0W
	4+Bcd6YghgvpC4fv6vRQQXnbe74TyP+s6nUS+sK+inw7vnC6kmVkhziDCbyMncNDGNsNdLEn5HSKN
	+070qde+bg53ysQX6PDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVcM-00000009pP0-0lD8;
	Fri, 19 Dec 2025 08:13:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc5-00000009oz1-1zYc
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24BEA4440F;
	Fri, 19 Dec 2025 08:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01EEAC4CEF1;
	Fri, 19 Dec 2025 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132005;
	bh=J3NfC8i9MKxrVgFTXBRYcoZRhSndcZg4ZT/YfzfylV4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gCqUoNwyUIvDPMTLk/cPSJnRKgcaIRyAB6+da8V5IFd8z8q6B6SQnFxyU6BNrqk0u
	 /kAX1HWOAk9uyRNTkI1muPbgz/TYFKOmTEuOXj0gkyzw8dVrpg4Ijhe+697yaQiUZL
	 TSRVMcS53WPMn3cwMPxQO2qopW5d6usXXl79VHAkbOZE8Is44DyyTPyh4cSD/dKJ+4
	 0GW1nlaJfIAbbu6rqWw7nPndlvDoZgeW1z2oe1tnYAAkL+2zl46XXcgak9UBvjeIah
	 tEPRHstAZfPwPvQaHNVjnu1qir6eo59WSdxaOfOTy9PnLqdV4sf8w/23XGxZ8yHHat
	 tXGzx3UBh4Brw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3C785380AA50;
	Fri, 19 Dec 2025 08:10:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613181379.3684357.14380947909185500489.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:13 +0000
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
In-Reply-To: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, saravanak@google.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, samuel@sholland.org, maz@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001325_554881_11BD0F70 
X-CRM114-Status: UNSURE (   9.48  )
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
by Rob Herring (Arm) <robh@kernel.org>:

On Fri, 14 Nov 2025 11:47:54 +0100 you wrote:
> The Devicetree Specification states:
> 
>     The root of the interrupt tree is determined when traversal of the
>     interrupt tree reaches an interrupt controller node without an
>     interrupts property and thus no explicit interrupt parent.
> 
> However, of_irq_init() gratuitously assumes that a node without
> interrupts has an actual interrupt parent if it finds an
> interrupt-parent property higher up in the device tree.  Hence when such
> a property is present (e.g. in the root node), the root interrupt
> controller may not be detected as such, causing a panic:
> 
> [...]

Here is the summary with links:
  - [v2] of/irq: Ignore interrupt parent for nodes without interrupts
    https://git.kernel.org/riscv/c/1b1f04d8271e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
