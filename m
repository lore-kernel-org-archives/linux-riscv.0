Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B17C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vRXPVbuOfO5XNUewivj/XnrKc+o1aEFkRjBp2ONB7cE=; b=2KS4knHTkPc0NmiH1jjD398PHk
	uuJEMVUXu33zn8koNnbnmc7Vm1HgRyBaQRYoPbQY6MPyebWp6EvMqaHS/1nCNAGMm6UUUEOI5tKwW
	iPXJNl7WOnfDq1WgRoiB/WLVuk5yPaFUK2xrrkWihgXsb0/NMVFIft6WRJhOWj8ZGRET8Fa1FDS/T
	WW3aNfJ2XZmd83xbFl/fw5EYXdcG2UXSpckZlvfkj5Ek5CDqm3VFPTFixBmcaIPQAhrfyP8seIxzz
	AcvmAjbVpXz8a0nRONscJYeTJnOv+npC/FVK7i3tfdHxPKRh9wuIuD1rmSEMeXcn6rCVDa7IPZkCt
	832eh2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTuy-00000002qve-1vWI;
	Thu, 18 Apr 2024 15:43:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTuv-00000002qv0-2Ok7
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 15:43:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A915CCE14E4;
	Thu, 18 Apr 2024 15:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720CFC113CC;
	Thu, 18 Apr 2024 15:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713454993;
	bh=NoN/F3sedrv19YhzjIJK0nyHZ+Qar5F5RygtFtMvJSE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=fQwLo2pjte4iLX8O73Q3NmDq2hks/xJBPNWyXBS7LqDoeDz03m4Kg5XVbOR5mLJu7
	 nVJXqFzu9q9E09THybeUCVgsLk3QxR9D5QUYKYSAMW3lVeK0fjfmBKuQIpTNCM682R
	 tm8qjLcUsvUrod0bXCakuHdF8wd0VTyk2VAUbNoq1xFKECknco3na/M12N1C2sDoWO
	 JBqhwhSmBTtEo7FRJkYfz0q2kPZFotLPFmqHN8zVf1HQOyIbUBWoxd4xanuWChk0Fq
	 3oziQ4/1wJdGDjQMPsnuaMbk8g3arvEnY7y5Fe/pmMVCHFFnWz+3yMNzjk/jA/qWUy
	 wIs7GJWI8LuLA==
Date: Thu, 18 Apr 2024 10:43:12 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: michael.opdenacker@bootlin.com
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
References: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
Message-Id: <171345477410.1962860.5172182463035592800.robh@kernel.org>
Subject: Re: [PATCH v5 0/2] add initial Milk-V Duo S board support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_084318_048880_3C858D21 
X-CRM114-Status: GOOD (  19.69  )
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


On Wed, 17 Apr 2024 08:53:09 +0200, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This adds an initial device tree for the Milk-V Duo S board.
> Last tested on linux-next on April 17, 2024.
> 
> - Changes in V5
>   - Fix the commit message describing the board DTS.
>     MMC is not supported yet.
> 
> - Changes in V4
>   - Remove mmc device (&sdhci0) as not working yet with linux-next
>   - Use "sophgo,cv1812h" compatible as on the Huashan Pi board.
>     Should I call the DTS cv1812h-milkv-duos.dts instead
>     of sg2000-milkv-duos.dts?
> 
> - Changes in V3
>   - Fix enum in devicetree/bindings/riscv/sophgo.yaml
> 
> - Changes in V2:
>   - Add a first patch to register the new compatible string
>     for this board.
>   - Use a correct SoC compatible string
>   - Add "disable-wp" (disable write protect) property
>     to enable write access to the external SD card.
> 
> Michael Opdenacker (2):
>   dt-bindings: riscv: add Milk-V Duo S board compatibles
>   riscv: dts: sophgo: add initial Milk-V Duo S board support
> 
>  .../devicetree/bindings/riscv/sophgo.yaml     |  1 +
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duos.dts     | 34 +++++++++++++++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
> 
> --
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
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


New warnings running 'make CHECK_DTBS=y sophgo/sg2000-milkv-duos.dtb' for 20240417065311.3881023-1-michael.opdenacker@bootlin.com:

arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	'milkv,duos' is not one of ['sophgo,huashan-pi']
	'milkv,duos' is not one of ['milkv,pioneer']
	'sophgo,cv1800b' was expected
	'sophgo,sg2042' was expected
	from schema $id: http://devicetree.org/schemas/riscv/sophgo.yaml#






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
