Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B04CF9C69
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 02:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JnWqVS8WCLHVntfLNJrGx6ifW/9cwP5We1UUXs8veYQ=; b=teuu0ZXQJOKf/x6tV5KgTykzNy
	44ci+/wfUrIus8MqWP8xaMwBmEfTJQ9BjXgGZMQhHBhy2MNJGf+5G9OQPhLorVUyEWpmniHRHbzy9
	FGnrhrbmw+PNQaSYroOcMUfW0ZobprkBmcgcwNnypheSfda9HB+xR82Iy+SwAgfgDyUYv7uawND8Z
	e5DnU+E5lofKIPUDGEYTYOymgIM6Qz3mmzyHAY0kJ//yjQ2xgZNlXrNtP8xF1E6tZQSvLmOJaba0p
	5dP3mAGksiWcWyOvu9FmGMUEDd0CeSxoT6AUsHif5AoeGMb5pzxukBbASGzQYKZtvyfr+nij5cxXT
	HPvroazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stHLR-00000003mjR-1Ppi;
	Wed, 25 Sep 2024 02:01:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stHH0-00000003mBf-2kS8
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 01:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E092EA43AE6;
	Wed, 25 Sep 2024 01:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C9FC4CEC7;
	Wed, 25 Sep 2024 01:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727229417;
	bh=4urW8mfpIiJf29yB4/ypALycXDHY7mku8Bvw/ccFrQY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=aSAkSrNDEckf4GU1UNDe3Q0fmFU6wx5f2MHy/iR2zgeGckgrKgQltpVG3QlF2j7/y
	 hLctymXQcR+cNMPZv2XpaAzuL6rHYH/rEYWW9ZSZUjr2OV1cTaIprS+Iw28J1qNQ9R
	 wN1FeurGkInxNjFx3bicAJnd2jf4c1ZR+WV37ZcASIuZVxwvt2kXkwsoCoWYYzuMxK
	 Fn3PIGc3dapxSjbQkD0z/o+pz8ivf4FO9/PN7oUKZ0LG6tg9OZrbvyCnLK/EdiJ130
	 VqhSy5UBJ14hvC3oe/1hpjEi85I+zyzuIgYIxXmu9RhXQBUlwM0kixRUDlQJInCadz
	 sGF15Ncq9HNrg==
Date: Tue, 24 Sep 2024 20:56:56 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, dhs@frame.work, 
 Michael Zhu <michael.zhu@starfivetech.com>, gregkh@linuxfoundation.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, rafal@milecki.pl, 
 devicetree@vger.kernel.org, Drew Fustini <drew@beagleboard.org>, 
 huiming.qiu@deepcomputing.io, linux-riscv@lists.infradead.org, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
 Emil Renner Berthing <kernel@esmil.dk>, ams@frame.work, 
 yuning.liang@deepcomputing.io, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20240924080650.1345485-4-sandie.cao@deepcomputing.io>
References: <20240924080650.1345485-4-sandie.cao@deepcomputing.io>
Message-Id: <172722910449.835930.11480258951992708289.robh@kernel.org>
Subject: Re: [patch v2 3/3] riscv: dts: starfive: add framework dts
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_185658_781262_F35151C5 
X-CRM114-Status: GOOD (  10.81  )
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


On Tue, 24 Sep 2024 16:06:50 +0800, Sandie Cao wrote:
> Add framework dts to support RISC-V Framework Laptop 13 Mainboard.
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../boot/dts/starfive/jh7110-framework.dts    | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-framework.dts
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


New warnings running 'make CHECK_DTBS=y starfive/jh7110-framework.dtb' for 20240924080650.1345485-4-sandie.cao@deepcomputing.io:

arch/riscv/boot/dts/starfive/jh7110-framework.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	'deepcomputing,fm7110' is not one of ['beagle,beaglev-starlight-jh7100-r0', 'starfive,visionfive-v1']
	'deepcomputing,fm7110' is not one of ['milkv,mars', 'pine64,star64', 'starfive,visionfive-2-v1.2a', 'starfive,visionfive-2-v1.3b']
	'starfive,jh7100' was expected
	from schema $id: http://devicetree.org/schemas/riscv/starfive.yaml#
arch/riscv/boot/dts/starfive/jh7110-framework.dtb: /: failed to match any schema with compatible: ['deepcomputing,fm7110', 'starfive,jh7110']






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
