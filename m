Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D1BC47DA6
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvKnIWNNF4pLGLaOhr/Qde7De3qknBwhf5DksUkwElE=; b=JiKK/c78Mwvvk6
	aYb02h+erBFRXu50BA+hOwWB4Xjh/mdu67H6HcZxDbZX/qUofOWlejDk5F+JDxCHiuxDxS0oA7xdz
	7FLXoYwH0yKoccJ0HaAd+bh/xvcOFidjva9wQj+SXNNu4Lpy1h2VkGFZqvqAZslCgTmm7jFzwYTeR
	Pl8QeNoN2E61+0txmz1qlpJYi3WMj9EB+mF38/Ut7wycs2vtc0Ly6b2zlC7fW9xDZUwRlzBOmRK7s
	eP4EGiJBE5/P59zjGQhYjMPisvEa2QtldYu8O4U11p2NLP8sXkYyEa9eyyE9jUjQLZa6pa9TWnT1G
	ZS3phZZSnZPfeDzD0fow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwON-000KMq-38;
	Thu, 11 Jan 2024 14:50:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOF-000KGg-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B910A61AE9;
	Thu, 11 Jan 2024 14:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7DA3C433B2;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984637;
	bh=gdgtNpyL3iGYpN5fWGoWRuJ8Tt8QZwxXPQpw0xnUJ6g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Aq36s6XHWAapk7vNTgj1jWLUkf2EPJwSCz2dwnb24J+GQlMIe0827n+P+ELynHfdU
	 O5NtyLaHcUK8fP5GsyOU73TJNwxr8DChoQRYNi8NS1lgcnqmORtXclWor8WWvzi0kR
	 gLasGPPMysgi02WkD4SYV6Vy0+SePqrcaszLe94uoPhoZCtcRqWtsNs+w47NeKeDAG
	 cPAnFYoNOTSZjNK93f6YYamQ82/wwmz8GKNIsDr4Ds2RgfQvdMjvI5N1aBNmyMPVix
	 DFUIGwwxhtsr6Z6LX0J7IQbINGUA3FPplzFUFnxuf/sfMfPPrtDQUW44oua91/eI4Q
	 nk8CURcV3E/Wg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B20BFD8C96C;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] riscv: hwprobe: add Zicond, Zacas and Ztso support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463772.20080.16524587804054627963.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231220155723.684081-1-cleger@rivosinc.com>
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, corbet@lwn.net,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rehn@rivosinc.com, gianluca@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065039_909755_90A38E87 
X-CRM114-Status: UNSURE (   8.85  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 20 Dec 2023 16:57:16 +0100 you wrote:
> This series add support for a few more extensions that are present in
> the RVA22U64/RVA23U64 (either mandatory or optional) and that are useful
> for userspace:
> - Zicond
> - Zacas
> - Ztso
> 
> [...]

Here is the summary with links:
  - [v2,1/6] riscv: add ISA extension parsing for Ztso
    https://git.kernel.org/riscv/c/1ec9f381e848
  - [v2,2/6] riscv: hwprobe: export Ztso ISA extension
    https://git.kernel.org/riscv/c/5b4d64a819c0
  - [v2,3/6] dt-bindings: riscv: add Zacas ISA extension description
    https://git.kernel.org/riscv/c/cd7be4d02f41
  - [v2,4/6] riscv: add ISA extension parsing for Zacas
    https://git.kernel.org/riscv/c/188a2122c827
  - [v2,5/6] riscv: hwprobe: export Zacas ISA extension
    https://git.kernel.org/riscv/c/154a37061229
  - [v2,6/6] riscv: hwprobe: export Zicond extension
    https://git.kernel.org/riscv/c/3359866b40a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
