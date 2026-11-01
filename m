Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332F2606E531
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pgfGz01j;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0LE7Vcw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hFs+kSeqixRDK/Ki9JsO9IyDlBOwZvChR5BKFK6nQnU=; b=pgfGz01jmy2vnGnFcYKS66lD0z
	zh60bwXSjRJW4XxvpR15oZbu7Y12A6FZv6/L3hnKkmBqD6+h5Epa9trio81PxkP+botgVzypD6sDY
	Dn/QXVaIFGw8ZrKvHfey5QRgm3svmeRsvpsVdJ1bmplQQF0sDaKWSvjZyYr8+/MZyi23eyPMUJ2EH
	Zpwwtv00jINSBIazXL5XQqsLx7pNl7AqPu1ZMaGTktHIzqIsevOwWq0n9UHKZNaNE3e72Bq47U8/C
	lmB6KDF+DhcYKRd+XnV/DMbRW5g8dBHJ03xVa/n334btnLxuRzaiSDIybsUlkswN4csDo9UPtTD2X
	bRyyPcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdql-0000000F0Km-48sH;
	Sun, 01 Nov 2026 22:16:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqR-0000000EzRP-0R49
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A44BC43FAA;
	Sun,  1 Nov 2026 22:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CD31F00A1A;
	Sun,  1 Nov 2026 22:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571366;
	bh=yOwhJ8iDL21N2rFwqgTxPabO0jpqD6bOtJ0oq4rMTEY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Q0LE7VcwB0OXK/2Y6z32l5qP7D/ewhp+oWwewGqagBkD7PA3oBQEfvIAFSIg0j0Hm
	 YwanWNzZMBC2YMXUDPJ+xa/rIhgppb+7fmRQATIZWZMKSfCDr90GE1TkQs1SvJAwuW
	 BLtcRrtwquF1DU2Y0/QIxvAA8JAZhBDTyXKvDPm87PAgQPRatk2uz0Si9f4C5Ht7LH
	 a8fYyF3qPbauZcAZwd2htXK3GZk/fAYy/yCkMCwCmfqDR1mwFieGqtn/HM3d0l/BZk
	 rJpovg0xI5deH3U7urjuBM5a3GSiFdwOH9b1RTXB8f63s+Cjgx68nWhP1BbRAW4d/t
	 7dXIE8mxGhQFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D29D38003B8;
	Sun,  1 Nov 2026 22:16:06 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] irqchip/sifive-plic: Avoid signed shift in interrupt
 enable mask
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357136504.2624073.16513286116615894552.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:05 +0000
References: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
In-Reply-To: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: linux-riscv@lists.infradead.org, radu@rendec.net, tglx@kernel.org,
 cmirabil@redhat.com, linux-kernel@vger.kernel.org, lzampier@redhat.com,
 pjw@kernel.org, samuel.holland@sifive.com
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

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Sun, 20 Sep 2026 21:06:53 +0800 you wrote:
> __plic_toggle() builds a 32-bit interrupt enable mask using a signed
> integer literal. A valid interrupt selecting bit 31 evaluates 1 << 31,
> which shifts a signed int into its sign bit.
> 
> Use BIT(), matching the equivalent mask construction in plic_irq_eoi().
> The resulting mask remains representable in u32 on both RV32 and RV64.
> 
> [...]

Here is the summary with links:
  - [v2] irqchip/sifive-plic: Avoid signed shift in interrupt enable mask
    https://git.kernel.org/riscv/c/0f214e5bbee5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
