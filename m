Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC18606E538
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vg1DKgiW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvnYIKWg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0KF40oN/7qnY/uKmdkK/anniEZM2xB6k5I5hkl8F3Ww=; b=Vg1DKgiWGdHCjNckVzkrzU9qkz
	mjmRpvpe7A+VD292mwTKilXJijreMSuM/JZeluXa6SkKSDJYp+OaUnuwV62rPYSLQhw6x4FSzVvLj
	QPhJkyft6jkm9NWOddK3/XbXh0WqSrl0T9HLlJIK0Z4+vqXz+sW3bJm3lQHnlOn3ASyE7UuRVbBco
	9ki7P/MIo4mL3mtV9Mp9yohBBxsyNAgcqqpqGK0es7p7y4ENww1SWEG4IdCa2wn4YRJO9njEka+rV
	Its1xKnUaONitehuLZ+M6YSAAjwDuRzqWWFXqubBgFkdz48dgIkSJxixpPqWP1fhDC+StF0A95nPm
	hUxFTYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqn-0000000F0PG-2n8q;
	Sun, 01 Nov 2026 22:16:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqS-0000000EzVM-2TLX
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F49C43386;
	Sun,  1 Nov 2026 22:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7601F00A17;
	Sun,  1 Nov 2026 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571368;
	bh=DTyMWj3AT6PQDRViOTg3lLSY2rCp6BBYDI+KtV9uL/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TvnYIKWgK3K56H8k/lBX0xa6If+Qdq7bQM8xoOVGOkvcaM1m/O89XuHXlGFJBFKBu
	 e8JY7A+laExsLjix/LjcHXZMnuXA8l78XdI18TWfUAD27sdRQG0snyfUKSkOlHOsYd
	 06NQ94qv3lBfhpD5ug3r4k//Uzh3XwNCJBIIAsnDTD+2cSbLdDYsrUGmeWLAptJ6HU
	 mX+fGPKLnHUGiIXNay4F4UuURMKmW5DXXx9tuMBm2SmaSdzFTHEgspetliWlmeNI0k
	 OS+rhLhqhRe5/HYd8bgOu4C7Ql2zlW2/ledVaUcrxmQCt6Bz4A2Z/Di2ohAmE95OpC
	 gPTG3mFDhia4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 035F638003B8;
	Sun,  1 Nov 2026 22:16:08 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357136654.2624073.6255795227860356343.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:06 +0000
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-riscv@lists.infradead.org, daniel.lezcano@kernel.org,
 tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlan@kernel.org, inochiama@outlook.com, radu@rendec.net, pjw@kernel.org,
 samuel.holland@sifive.com, palmer@dabbelt.com, anup@brainfault.org,
 docular.xu@gmail.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, conor.dooley@microchip.com, ganboing@gmail.com
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

On Fri, 18 Sep 2026 00:29:32 +0800 you wrote:
> When testing OpenSBI with the upstream Device Tree, the CLINT controller
> failed to function properly with the irqchip.riscv_imsic_noipi boot
> parameter:
> 
>   Platform IPI Device         : aclint-mswi
>   Platform Timer Device       : aclint-mtimer @ 24000000Hz
> 
> [...]

Here is the summary with links:
  - [v3,1/6] dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
    https://git.kernel.org/riscv/c/73329198cdc2
  - [v3,2/6] dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
    https://git.kernel.org/riscv/c/c9bae665035f
  - [v3,3/6] dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
    https://git.kernel.org/riscv/c/08257b5b3d38
  - [v3,4/6] dt-bindings: timer: sifive,clint: Remove spacemit,k3-clint
    https://git.kernel.org/riscv/c/5397ba147c28
  - [v3,5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
    https://git.kernel.org/riscv/c/b424b3b0ab92
  - [v3,6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
    https://git.kernel.org/riscv/c/cc6371a7f519

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
