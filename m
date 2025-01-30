Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791E2C02190
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V44CXMfUgFM+yyiWRkeQYVSmZ9EES95D83PbqXcGezM=; b=ZEJoggCoiNsaXV
	L6dv+OCZuBms5ATPL3bWbATOmY2QpeGjrgvAnEV4SeEuolcmDjNOg+Igfp+2hCP6njthZEZylINnq
	cOKqVAN647J0WBpq24iJghzpAv/fbepGi7XhkmpX5JKuylC0zqh48/FmieymaKeWRpL92vFxpOW8g
	6HhmwYaqOa9NeyAsw1hSDfuR7f72UVHpE6TKKzGFXv0yQDx9E866D/zpTNxq4u7g55a83Wab7z9Xp
	Xt8WN9SiNkCOpI9/9d81KllBiRjot7xt34aVLQUq5fk/7zBlhfu9fvDb2yU8+BAUC6Etkp1wQODcW
	exEG1FLAd4wiviO4f+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVFI-00000008wKF-1SoB;
	Thu, 30 Jan 2025 14:10:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVFF-00000008wIS-3YRF
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 14:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF794A41AA7;
	Thu, 30 Jan 2025 14:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C027C4CED2;
	Thu, 30 Jan 2025 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738246212;
	bh=kXMtPvKQuZHL9xcm4hq3kkVSDGMX5Os3i3OJFM8PSIo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FC/e0Ajnb6yigUYE+68RWjMmE2hdLowFH7ZjlxuOc49+h3pHnNVQIv92HciGk/veu
	 l1jqLQaZr2jUbt8dQGfDtinIahleHwrW28sIiDWSodyN11u5+4iFEsHoLTP3r4pbWk
	 Db3LcSsWuclPXhWwqvS+dlaEHsD8NPXMYUYitlRZJtnFFFh7Er53eerdaLXx9jRc3R
	 HNgtRa+x/qFi+HCxmQHcJn/jH1KwsWku+nTy3G41+eSbMYj5ydbcK51rCieBsL7Uzs
	 EphNuo4965I9C7qr/gTH7RETVZsRASw04DpP6gu2lNstqCuy5XmXqCkncugX4n91pY
	 j0A3fEdKN4KZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7136E380AA66;
	Thu, 30 Jan 2025 14:10:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v11 00/14] riscv: Add support for xtheadvector
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173824623824.971083.4395426797923401446.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jan 2025 14:10:38 +0000
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, jszhang@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, samuel.holland@sifive.com,
 corbet@lwn.net, shuah@kernel.org, guoren@kernel.org, evan@rivosinc.com,
 jrtc27@jrtc27.com, ajones@ventanamicro.com, cyy@cyyself.name,
 andybnac@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, conor.dooley@microchip.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_061014_023185_4245B994 
X-CRM114-Status: GOOD (  10.01  )
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

On Wed, 13 Nov 2024 18:21:06 -0800 you wrote:
> xtheadvector is a custom extension that is based upon riscv vector
> version 0.7.1 [1]. All of the vector routines have been modified to
> support this alternative vector version based upon whether xtheadvector
> was determined to be supported at boot.
> 
> vlenb is not supported on the existing xtheadvector hardware, so a
> devicetree property thead,vlenb is added to provide the vlenb to Linux.
> 
> [...]

Here is the summary with links:
  - [v11,01/14] dt-bindings: riscv: Add xtheadvector ISA extension description
    https://git.kernel.org/riscv/c/e576b7cb8183
  - [v11,02/14] dt-bindings: cpus: add a thead vlen register length property
    https://git.kernel.org/riscv/c/bf6279b38a4b
  - [v11,03/14] riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree
    https://git.kernel.org/riscv/c/ce1daeeba600
  - [v11,04/14] riscv: Add thead and xtheadvector as a vendor extension
    https://git.kernel.org/riscv/c/cddd63869f92
  - [v11,05/14] riscv: vector: Use vlenb from DT for thead
    https://git.kernel.org/riscv/c/377be47f90e4
  - [v11,06/14] RISC-V: define the elements of the VCSR vector CSR
    https://git.kernel.org/riscv/c/66f197785d51
  - [v11,07/14] riscv: csr: Add CSR encodings for CSR_VXRM/CSR_VXSAT
    https://git.kernel.org/riscv/c/b9a931442451
  - [v11,08/14] riscv: Add xtheadvector instruction definitions
    https://git.kernel.org/riscv/c/01e3313e34d0
  - [v11,09/14] riscv: vector: Support xtheadvector save/restore
    https://git.kernel.org/riscv/c/d863910eabaf
  - [v11,10/14] riscv: hwprobe: Add thead vendor extension probing
    https://git.kernel.org/riscv/c/a5ea53da65c5
  - [v11,11/14] riscv: hwprobe: Document thead vendor extensions and xtheadvector extension
    https://git.kernel.org/riscv/c/7fa00fd6ff53
  - [v11,12/14] selftests: riscv: Fix vector tests
    https://git.kernel.org/riscv/c/57d7713af93e
  - [v11,13/14] selftests: riscv: Support xtheadvector in vector tests
    https://git.kernel.org/riscv/c/c384c5d4a2ae
  - [v11,14/14] riscv: Add ghostwrite vulnerability
    https://git.kernel.org/riscv/c/4bf97069239b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
