Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A673C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 13:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yE11tRBBWgvudBqHXZ1G+LxDG+9OGAHxrPiy4q8L1uk=; b=RaIkwnYcsaGb0nJlcuTK2OxYbi
	g+5zK5PvLU6dSiwYh3yqbdN+1o/xPng7vh3NsCs1Ci1ejptPmrQKg3ZLXkiNiGv7elgqaDipBZgQo
	dOlXYqNtNn+V1p8SjjBS3h4D3bltemgnHFOltOsfv8oFYE7xO6rTuwy3TllvQM/h6ZsrABfivGXDL
	uoileumr9D9PfkOIQEawDov5o7qM70i3Zb+2u67ZbvpjbGMTQXjvy6V9mMp77p6RJG+lUkRnivfHi
	FTuFHEPis4PYSs1c0wh2DLuM3/ApgGRSuucN5XJ3lQ8RrCVUC2f8RpY7nr21z/plRPeB9lv2YXbZZ
	yY2mv/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBh1-00000002Avo-3B5g;
	Tue, 09 Apr 2024 13:39:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBgl-00000002Aji-0HWd
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 13:39:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 41F00CE1F29;
	Tue,  9 Apr 2024 13:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58217C433C7;
	Tue,  9 Apr 2024 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712669940;
	bh=pTH7BO4el6rKEVr/dq4/+cLXqiAhvAeRhttJp5b1JT8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=TB+Dgk6JrdxIOGEplVMcgrE8KE1fFozP5xR2R8hEJNB4vM2/WlHsEfTrKLe6GLrp8
	 8aepaDluNmT61/iczRzmiP3V3QMA8FJcURyeoi7D/ICl5MYEQSiO/ARcSK/V8AYMh6
	 nSmb/zFdx4gq3dhYBdATdBxoORqjvEAHDMHnT4oqeNFeaj9nLP3G1JVG6BfD3wsVjr
	 Up2LEga5g4BXqMGMocwhRoY02oZuJRe9TQCtleZKFhKHazjSfr5qEe79h5fbtmdgcW
	 ry8SqSwsRCapheez3cZYm6tt1g1VBZKmYis9mWPSeHarqqzphZ9OYD2N79alM8izKl
	 UqtNK1mYqWG0g==
Date: Tue, 09 Apr 2024 08:38:59 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: michael.opdenacker@bootlin.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Chen Wang <unicorn_wang@outlook.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Inochi Amaoto <inochiama@outlook.com>
In-Reply-To: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
Message-Id: <171266958507.1032617.9460749136730849811.robh@kernel.org>
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board
 device tree
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_063903_489844_09E396E4 
X-CRM114-Status: GOOD (  13.04  )
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


On Tue, 09 Apr 2024 08:45:04 +0200, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This adds initial support for the Milk-V Duo S board
> (https://milkv.io/duo-s), enabling the serial port and
> read-only SD card support, allowing to boot Linux to the
> command line.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> ---
> 
> Tested with linux-next as of Apr 9, 2024,
> using the risc-v "defconfig" configuration.
> ---
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duos.dts     | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y sophgo/sg2000-milkv-duos.dtb' for 20240409064504.4010353-1-michael.opdenacker@bootlin.com:

arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dtb: /: failed to match any schema with compatible: ['milkv,duos', 'sophgo,sg2000']
arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dtb: /: failed to match any schema with compatible: ['milkv,duos', 'sophgo,sg2000']






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
