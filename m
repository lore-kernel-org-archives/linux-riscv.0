Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EDB606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 03:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hC8Ykn97;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghpW+w5J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6YN+MWTswvoeaMGKOhQrBnCoFYok5bdbBRxEqtp+w8o=; b=hC8Ykn977rFDF1WhFKrmBX+vBt
	8TrwazAiU7f3gDn6MCKWl+f82QtWI1q9mBsIpGHWZlMH8QQkAfeGvbk/C6V6gtH9hQ48TkIF9r/DI
	AThVGSiN8o0tNeMx4UQx4Pmjp3+B2iOsJPpEt2SwlgikHII+YCzO8YdvU1pYZlOhZx2lUaA8kKbHT
	t0zkvWgvOo6tP57MLekHi1nnDtUjzMETUgvcR7e/jc1xrjRg0Eto2Wmrfx7xKfHeoxIBwToGWBAc5
	tam96QQquA4KmSnNdeYChmX9S/b/NgISFep+58L+GeTY+aEL+7O1go/CsjjovEvlgHvWySDETu1Pg
	zvxFC4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWWo-00000007enh-08Vc;
	Wed, 18 Nov 2026 03:40:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWWm-00000007enb-3mGG
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 03:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54D4860239;
	Wed, 18 Nov 2026 03:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061831F000C4;
	Wed, 18 Nov 2026 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794973208;
	bh=nxlrqYDPmgF72/xL2i4J75YGw/VlBLqXYNwjkYeKScM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ghpW+w5JF+RqNEoUnukjPeRbHBTsONhE9hel0JvVqM+XTuOVcpx/5kp8yVgHfdHVp
	 RiEOiQ+wlQZpzbluqX/1ExiVz+gCavZdmoSi76QMI+Qa13CP+sLb39oS7mT051yWt8
	 /8gxmMcYLQx3aeR9U6yyuhtbdPcIuQohIL5Mvj9Czfnat9lfJwc8k+vovFo/HRGUq2
	 CR8yWBNpQ/QvT/sUxp3LKZ4kKgcMGsZgXzQOs4ILsXf4fw3FNKwolA5URPd2+8IZ1r
	 fGud3CumLRDRqHnVfSRFWjDage2hvFK99LGcfaiOXEKwlXYgxhFGYdRvz7LESVp7qo
	 rsa81iM49kcmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F152C392E983;
	Wed, 18 Nov 2026 03:40:07 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] riscv: remove RISCV_ISA_EXT_BUNDLE[_VALIDATE]
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179497320678.1446207.12594230734069147905.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 03:40:06 +0000
References: <20261106190559.1906130-3-conor@kernel.org>
In-Reply-To: <20261106190559.1906130-3-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, jszhang@kernel.org,
 andrew.jones@linux.dev, thecharlesjenkins@gmail.com,
 guodong.xu@oss.qualcomm.com, linux-kernel@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Fri,  6 Nov 2026 19:05:59 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> RISCV_ISA_EXT_BUNDLE actually made sense when it was originally added,
> since it presented a simple interface where users (be that in kernel or
> userspace via things they are presented by the kernel) would check the
> exact extension needed for a feature, rather than muddying the water
> with parent extensions. As a result, the kernel does not track the
> status of the parent extension in the bundle, nor expose it to
> userspace.
> 
> [...]

Here is the summary with links:
  - [v1] riscv: remove RISCV_ISA_EXT_BUNDLE[_VALIDATE]
    https://git.kernel.org/riscv/c/642fb67393c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
