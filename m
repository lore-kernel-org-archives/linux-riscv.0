Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53B60701EA
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lA/12QI9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b93Tisum
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XeL1MmVSiBD7fIOCY++I8G5gvVBdxV5GcBwRxs4nfDo=; b=lA/12QI9osmEFk6kMYVG2HzcKi
	riZCocaXdhjEPk3m1eLl9LGOlBskO7ltlVkFRHRQtXQnDjAsjIugfgSNVSpjcLJix4G68+9CUCQex
	kHsdnCSk/vueTzXaMtp3XY97E4Om9lPzU9wYVjW+KIIASN6xXjifFUvT9tSPE3q46o8oojrL2MQVR
	xcxp/KndOFoNMhEkHnbCtDZWNUPgr7949rbxsxsVJNebRpfAqfT2exhTg14QtK/G/56sYTioHf+dD
	nKIRpDapvbGAOFLuR9rc/90XSwH95pvE8Px+HXA7pT95QbO0mDQJFrOglMWmgKzrN9jN9QysTAHt+
	OpkMUwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqu-0000000F0jB-3UUy;
	Sun, 01 Nov 2026 22:16:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqb-0000000Eznx-1mzl
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F1C444001;
	Sun,  1 Nov 2026 22:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E473F1F00A22;
	Sun,  1 Nov 2026 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571376;
	bh=Y2PM7PaXPlUtwF7G8UYPMk8Ond4TLwOL7+2XwT/8nDE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=b93Tisumf6w7GwGg8JsDtZTrtSbJIwBF1ayU27ZD9hDVNCKU+qHGncd2hKM6zZeEE
	 jqomQF87URgdYK6poFOsR7kRwDChp6ccHh/bHjl9SrnVqpaxdjTQuZcMjisuMRbwBa
	 8XGe+/7YUCA13wsqzPzmfTYPvAyhD6EnG59ZBNv+/suxVtJ9hEBYgi5Jmc1KVs0kwx
	 bb3J2bs2zH9njzILt2JEGLSf3CPj4Sz/jrt8R8D19hpYS25c4F54gOQIW+OZzODjHg
	 CQtQL42bgXBw4WrzOMtlYI14bZwlPgLM+40OhowN0JkJluG6I2TDV4KM6/AVlWy/PT
	 yoYfcdU5IiCvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D442738003B8;
	Sun,  1 Nov 2026 22:16:16 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/5] Enable Bluetooth and WiFi on K3 Pico ITX
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357137554.2624073.2079736918807982610.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:15 +0000
References: <20260928205012.3689405-1-aurelien@aurel32.net>
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dlan@kernel.org, spacemit@lists.linux.dev
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
by Yixun Lan <dlan@kernel.org>:

On Mon, 28 Sep 2026 22:49:05 +0200 you wrote:
> This patchset enables Bluetooth through USB on the K3 Pico ITX board and
> adds the rfkill nodes for Bluetooth and WLAN so that the devices can be
> activated.
> 
> Note that WLAN support (patch 4) is only useful with the following
> patchset, but they can be applied independently:
> - https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com/T/#t
> 
> [...]

Here is the summary with links:
  - [v5,1/5] riscv: dts: spacemit: k3: move USB3 phy to board level
    https://git.kernel.org/riscv/c/a87ca1e5b5d2
  - [v5,2/5] riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
    https://git.kernel.org/riscv/c/2b9612eceb96
  - [v5,3/5] riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX board
    https://git.kernel.org/riscv/c/ea5cef6d5f3b
  - [v5,4/5] riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX board
    https://git.kernel.org/riscv/c/2f3b7240a4c2
  - [v5,5/5] riscv64: defconfig: Enable BT and WLAN support for SpacemiT K3 Pico-ITX board
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
