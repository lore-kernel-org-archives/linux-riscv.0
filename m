Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585FD6072B22
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aqEk5QOK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XNxYgn1c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o6NaamNsaRGLHsZB1HCafOL6LNR10wcu0/hSj5I4M4c=; b=aqEk5QOKu9wJvADXRGIG9JXSIl
	XSDKRFn0g+ZgGZuA8vci4SwhxtfNsfAot2aK79+4InnYP4cq1LQprvk2U3EjyFgiB69gmw4Zt9GHS
	NoeZuaeSzI4DfJHcMkrR/3eLkHzK63v7pUj/ntvakJ9CrYzksd30BdBqbP+Z7rH/MCtGWLuabPO/k
	aHcSEjcajCFu1Ra1gztJ1Vhxgr+Kc0I21Pt2+/o6RXY2S8qgfSsvnADwFXl1IjKI9HU3Mhy5JCloD
	dgPsIpweA4PNKTkP5PQnjQdDR9bBFXMeVMs4XiSA25OfRZa6z6Gkp0LNuyvNRDjw4UPl5juaMmfD4
	KE/AvYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr4-0000000F16X-2XAl;
	Sun, 01 Nov 2026 22:16:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqm-0000000F0KR-23UW
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ABCE6061A;
	Sun,  1 Nov 2026 22:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5F71F00A24;
	Sun,  1 Nov 2026 22:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571387;
	bh=rAJ8RZ06DBUIxOai16Zk+EZsC0WH9KSq0EKHRtQp2Go=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XNxYgn1cUplcs7rMKZov+gVfZttekYqS9yQpibvTc0mS2GfcQ6qWF/XvEAF0BQrr9
	 78IOIiwVcitvPD3bCArlgVMVvVX8S7U31tAShHABo3SesCDuJWDNifsIDdXVK4uUH+
	 h2FEWa6InFp/DtcXtMNv4GnbPi9toKoUpfyXZPmdetpom7ggOyX3/PBjJ3VkFBPvb6
	 FXOH562IuRe9Ck6rt9dRTMD7hZTKgUTodyDzqDid1RP5KPf35gW3EWpqNJyIVwN1+v
	 yoDAuy54ujFR8gtcI7VTMGgepWJrnXj6dNDcTxPk6Fl0xpb3H4ffIZqyH0RnRVm+qs
	 hGKI/CcgZurhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 405F738003B8;
	Sun,  1 Nov 2026 22:16:27 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357138580.2624073.12710670293488013963.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:25 +0000
References: <20260915-kx-i2s-dts-v3-1-cf0b90882a97@linux.spacemit.com>
In-Reply-To: <20260915-kx-i2s-dts-v3-1-cf0b90882a97@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, dlan@kernel.org,
 weijinmei@linux.spacemit.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-sound@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, arnd@arndb.de
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
by Yixun Lan <dlan@kernel.org>:

On Tue, 15 Sep 2026 11:23:16 +0800 you wrote:
> Add the six SSPA-based I2S controller nodes for the K3 SoC.
> 
> i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
> divider, so they use the published 7-clock layout (sysclk, bclk, bus,
> func, sysclk_div, c_sysclk, c_bclk).
> 
> i2s1 uses 6 clocks (sysclk, bclk, bus, func, c_sysclk, c_bclk) because
> its sysclk is driven directly by a DDN (ISCCR0) and has no separate
> divider stage.
> 
> [...]

Here is the summary with links:
  - [v3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
    https://git.kernel.org/riscv/c/c37ee906b45b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
