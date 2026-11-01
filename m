Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E526D606ECC2
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQPcXkKw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FILr4eAK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pfpbSb6ODkSr/GaQFOJ9PRBqaqsJzoQ06fsX4SfBkzY=; b=FQPcXkKwlHQwfvNThTC8D/05RZ
	YiDf3JAxeahc7fMromow/4WcMqaPtzjQY1v/yrmDinGy6li+MXOo5z6tJaEZm1sYw57g8ahYPYbD7
	OlTMvx2jULdG443pDkyi1TKWjBOeBr3qecUaAp4U/w4nq7CtTXTcgkG0F4fq/FOg6A4ph/KIabVGR
	BcEPajhikB+E6hj/OpHgZpipjRe6NvRBLgYljhfUubbkGEKdm0xZe4H46G5dt8HS9Nnpg2r0UijyF
	0mMa3PhRLzL8pnCDju2gU4kxsuFSv4gKq9pfsDDu2+Zz7vcSuRKGyy0OYPljT0aYLxvlCiblCmfpG
	anpBuGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdql-0000000F0Jm-2VkT;
	Sun, 01 Nov 2026 22:16:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqP-0000000EzNt-3AT7;
	Sun, 01 Nov 2026 22:16:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3018944033;
	Sun,  1 Nov 2026 22:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECB51F00919;
	Sun,  1 Nov 2026 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571365;
	bh=ZBbWyt1tVlT8vsng1tUZth+SHT9mZ3wIi2BBqX1Sd68=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FILr4eAKrrpVTY1w+0lPnmpm4m+KvSLrl1sI3qLC6vcTCXawxNaX6GqkUyiku2N8g
	 lSaWKAfAnI1XlRfVF9lnSnyVCerEMHgjtn517BWK4EO9WUPrVqt6SLDsCV7BzVCqjZ
	 cSQEfzyYjr1CnowfD/wxZKufFzlOXp3QTuyBM9pjdtkgMOzeW3qpLSd39GREJYBd3+
	 GcPvcSv8rh2pGUVKzlYQVzgfErpTGhd4NvBEJAh0VpIWMt3PNwVujLLLxwc2d4Ogfc
	 Vs19Xseip7SCtUvLA97omV3Nhf2wU3N3dBTnfASZIsbZSaa3V5IHAJDmRRc9WXQasM
	 IWbAGr85MFw7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 031D338003B8;
	Sun,  1 Nov 2026 22:16:05 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it
 consistently
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357136354.2624073.14746852216689780189.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:03 +0000
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, daniel.lezcano@kernel.org,
 tglx@kernel.org, radu@rendec.net, anup@brainfault.org,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, minghsiu.tsai@mediatek.com,
 houlong.wei@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, tip-bot2@linutronix.de, nathan@kernel.org
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

This series was applied to riscv/linux.git (fixes)
by Hans Verkuil <hverkuil+cisco@kernel.org>:

On Fri, 11 Sep 2026 03:27:08 +0000 you wrote:
> This series removes the implicit assumption that RISC-V supports exactly
> eight IPI message types.
> 
> Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
> BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
> separate IMSIC_NR_IPI definition set to 8. These values happen to match
> IPI_MAX today, but neither is the proper source of truth for the number
> of RISC-V IPI message types.
> 
> [...]

Here is the summary with links:
  - [v2,1/6] riscv: smp: Move enum ipi_message_type to asm/smp.h
    https://git.kernel.org/riscv/c/1ae91dc397eb
  - [v2,2/6] riscv: sbi: Use IPI_MAX for SBI IPI muxing
    https://git.kernel.org/riscv/c/2a0d49514f29
  - [v2,3/6] clocksource: clint: Use IPI_MAX for IPI muxing
    https://git.kernel.org/riscv/c/f6326e26f602
  - [v2,4/6] irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
    https://git.kernel.org/riscv/c/a89546503a0e
  - [v2,5/6] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
    https://git.kernel.org/riscv/c/5b104000160d
  - [v2,6/6] media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
    https://git.kernel.org/riscv/c/d1d2645e755b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
