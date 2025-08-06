Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66095CA0EC0
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCWbUUSHQKSO/CIMZErbbV+DXTZnWKnGvyl+NthkVKk=; b=mzzdKKBatTlEXK
	6ZUWtr/71rzC2RwrboajjrCcyFhYl2lLej3iwsX4wT4gkF+emlMcwD66iAHFGgKhgKoLbGJw4Ru/j
	RY6HVqQMEuDxf4oX4T+FKhddrIIUhx/XzSgVLGeD3FGtaf7WWW4om1gM4sDhr5H9mp4za1WbW2CVD
	la6/nJF9F43UqenhdOpmh8Qc9NZb3qymyZAYqD2c5aTcmGQ/AhZhumwZOiUgdae7PxGs6ZCFzST1m
	f1+uylI8LPiZjCG4FahDJsjaKUe/rsIZzRXqpIQ3RZLHR7V6jQOh0FkmkIgLqmI7MY5CS2ZC4f+rN
	cP3exdmDQMCgIQidkTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhns-0000000FtJr-3Jf8;
	Wed, 06 Aug 2025 17:19:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjf-0000000Fs8n-3nz7
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5871161140;
	Wed,  6 Aug 2025 17:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2350AC4CEE7;
	Wed,  6 Aug 2025 17:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500531;
	bh=dP7LyJUuqyT/LSIjq7xZNcRuTUR3KNybdoTzyNUZlc0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NVnFYxq4+64ZbTuTkRxzPZd+V9z/QGfybK++rPtLHonfQu4qIXoV4XNXJDM8BsJLw
	 Y25OUy64NbX3NbHfc7LsoGKJaC9kSP4/xazcIQ5CLBYqyW7Y/pPivZ9fhBP8pzzsj0
	 ANBzHfSPrasxaqPbgb3QbcXyX0pzsy6iBr9Pex8Qad9X/IGhME/4UVahmBfHlu4uB3
	 tSZZ11kygnjAiz1cae2EpqvOiLlO4Ue+eIBc1NrewxhclzTn3IFAlPuNb6y9BWq630
	 IFzSEP1yj5huksV/s5bpDdbo4nbXBIMvuZY9AL/kA+tCsUbqY9kO+sH/6Og1SoZkIG
	 XnYVJ4fPGtc9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D0E383BF63;
	Wed,  6 Aug 2025 17:15:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/7] riscv: Add support for xmipsexectl
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450054474.2863135.5887102129908490866.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:44 +0000
References: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
In-Reply-To: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, corbet@lwn.net, palmer@sifive.com,
 conor@kernel.org, djordje.todorovic@htecgroup.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, conor.dooley@microchip.com,
 alexghiti@rivosinc.com, arikalo@gmail.com, rvishwanathan@mips.com
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

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Thu, 24 Jul 2025 17:23:24 +0200 you wrote:
> This patch series adds support for the xmipsexectl vendor extension.
> A new hardware probe key has also been added to allow userspace to probe for MIPS vendor extensions.
> 
> Additionally, since the standard Zihintpause PAUSE instruction encoding is not supported on some MIPS CPUs,
> an errata was implemented for replacing this instruction with the xmipsexectl MIPS.PAUSE alternative encoding.
> 
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> 
> [...]

Here is the summary with links:
  - [v5,1/7] dt-bindings: riscv: Add xmipsexectl ISA extension description
    https://git.kernel.org/riscv/c/06d48c2c4f83
  - [v5,2/7] riscv: Add xmipsexectl as a vendor extension
    https://git.kernel.org/riscv/c/02b01dfaf4fa
  - [v5,3/7] riscv: Add xmipsexectl instructions
    https://git.kernel.org/riscv/c/d85071f97570
  - [v5,4/7] riscv: hwprobe: Add MIPS vendor extension probing
    https://git.kernel.org/riscv/c/20b80c735c05
  - [v5,5/7] riscv: hwprobe: Document MIPS xmipsexectl vendor extension
    https://git.kernel.org/riscv/c/c714fbc023df
  - [v5,6/7] riscv: Add tools support for xmipsexectl
    https://git.kernel.org/riscv/c/378afb53aab2
  - [v5,7/7] riscv: errata: Fix the PAUSE Opcode for MIPS P8700
    https://git.kernel.org/riscv/c/838218910ea3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
