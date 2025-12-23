Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF267E6F091
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1gcBRg922tL+vGEJRNslzbk74pBOxlxgjRRIEZf9uk=; b=qYIUFPCBotGN30
	YZ2h2qd1lvrAxmD5GS/XIpaN2QHBuhu7nalrgKPytYeOx4sEhPf57qhAKl3i3MDkZkln2jnCSX4kA
	K5R/2oCaXT1BaYRL816UD7qPlP01GrN2WGXXXLW1Je2dNbgzR4WSz/qFBalC8+ZRqwqSpt4voJO9c
	BSPe2PbVzWvHLXbYSybD2fDihmVjirALkbBaVub040j3PWkH1Wvde8RzRbsTqYMF+RndLjG2umTY6
	tTxFDHZzSB8A9NhjVsGXGvPIONDBMXTCHbALaM49hVeTglXyfrZb3AZVJDr9uxC5zxfD9ayng95dW
	4bEqy4LfIO5VM3lY230A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2kM-0000000FYHU-1Xmy;
	Tue, 23 Dec 2025 13:48:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2kJ-0000000FYGg-1gI8
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 13:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F92E433EB;
	Tue, 23 Dec 2025 13:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28794C113D0;
	Tue, 23 Dec 2025 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766497693;
	bh=bx657OI5tibWzD3FtMAugH/0bfKDFap5W4/OxxvT4To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Es1swHfSv6S6B2pHucKQZSoJ66PXsq6VNg9zC4wgOMhHg4ZrByc3vESkv7gopbzWI
	 D9464yDncxCMzlAVsmY6zWN0syhzVNp+5jrzbsJv60ORYXJ3BY0XfSiU5L8EDqYIIr
	 /VguxoOyUUlTkLnyzDX5qXCxvlkdvenU2Zn2MkHi/d29NWMOQJzcSz957qPCHLpYbE
	 iWQPXbtdFpHGfI6XVpYAcAQD3FJ1s+0Wr61gHyeDeJKLe3IoYe3L5l4LL3W+iaDaq2
	 w26G6AMjcUb6errmjMmyEEvGmIKGZFkHkyFuexrD8I3hXH/cLb3Ogk6eP0SeUaWLM1
	 azntYpSL9yRpw==
Date: Tue, 23 Dec 2025 14:48:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, linux-serial@vger.kernel.org, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: riscv: add SpacemiT X100 CPU
 compatible
Message-ID: <20251223-just-indigo-coua-14b16e@quoll>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-1-3af3f3cd0f8a@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251222-k3-basic-dt-v2-1-3af3f3cd0f8a@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_054815_522712_6BDC3223 
X-CRM114-Status: UNSURE (   8.73  )
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

On Mon, Dec 22, 2025 at 09:04:11PM +0800, Guodong Xu wrote:
> Add compatible string for the SpacemiT X100 core. [1]
> 
> The X100 is a 64-bit RVA23-compliant RISC-V core from SpacemiT. X100
> supports the RISC-V vector and hypervisor extensions and all mandatory
> extersions as required by the RVA23U64 and RVA23S64 profiles, per the
> definition in 'RVA23 Profile, Version 1.0'. [2]
> 
> >From a microarchieture viewpoint, the X100 features a 4-issue
> out-of-order pipeline.
> 
> X100 is used in SpacemiT K3 SoC.
> 
> Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
> Link: https://docs.riscv.org/reference/profiles/rva23/_attachments/rva23-profile.pdf [2]
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: Fixed alphanumeric sorting of compatible strings, put x100 before x60,
>      as per Krzysztof's feedback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
