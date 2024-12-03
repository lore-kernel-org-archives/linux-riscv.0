Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A09E64AB3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ytBQqS02Rt1o50zPRs0c1tTNM/CncjaMzVUlcguhcY0=; b=4SIv5cgXk5JZAtGiGoOkuUmkXX
	0Q3iox2a5dwcmKYFRIXqfk/HE0vO2Ayj2nCMyNuR2quQ8Xm/4awAA4FyJTbvEmYEaZCZCk1+USiWK
	LO5lNZAh1hDRA73eW4ZYRKbn18/Ufvok8XAOJm1JFAj8TjtfsRPiMgsODbhz/sGKAZfjQ6YEKQtqx
	wURzglr9Di61ecqnD60lQ/2m6HtRFTwr2W1yY6Kqsl9lcbHkaXKwVKDFwx50pnBRSsKjwOXeOCrvw
	14vQbunDjolWcRcVmZYU9kyS/KeeH+2138mb/LVBmYGB20WBjcShT7+0c/ofLxyhmLreltVlDcU6B
	rE5uecIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITpr-00000009la3-263w;
	Tue, 03 Dec 2024 14:25:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITpn-00000009lXM-1xwT
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 14:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA7735C61F0;
	Tue,  3 Dec 2024 14:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C3FC4CED8;
	Tue,  3 Dec 2024 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733235902;
	bh=3TKmXmpGABry9oSTFFXvSq6pX10XyahRQRIHFkooJ9U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ViPykzP+sBvHyHt7Xd0oRVDSF+xonpAPnOrijJ+0Pbp26DGv0Cdvrht8+TIpc2sWE
	 kJPD2rafQfO3kcF4UuE4GtuYKOBXphzyGjrTTwcTXAmzC3ez56j+n4MDHUjiRbWSTf
	 96usMdwPzLVCKTZq9txbogysHjFofNHPuVnJ2Sknt4qwn1kbHYr5WqRPrDI6Pdqqap
	 yRkFb5eMkdEvzsZMUdKUxD7ExbAkQ5KaFqhtfpAyH2PjJjxPeldOyIfhRbJEkI0ms0
	 b/FWkBWN6+yyPWtmW3TD2UAYGwaHNxr8r8j/dGsRMFF1dS/O3IbqfkMSn0Md3+C9WO
	 PHgCOkz0SFcsQ==
Date: Tue, 03 Dec 2024 08:25:00 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mripard@kernel.org, frank.binns@imgtec.com, aou@eecs.berkeley.edu, 
 jszhang@kernel.org, sboyd@kernel.org, guoren@kernel.org, 
 m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org, 
 maarten.lankhorst@linux.intel.com, wefu@redhat.com, 
 jassisinghbrar@gmail.com, simona@ffwll.ch, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, mturquette@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, krzk+dt@kernel.org, 
 ulf.hansson@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
 linux-riscv@lists.infradead.org, tzimmermann@suse.de, drew@pdp7.com, 
 airlied@gmail.com, matt.coster@imgtec.com, linux-pm@vger.kernel.org
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241203134137.2114847-7-m.wilczynski@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134156eucas1p2326d84fcef2ee0914586122520b18dcc@eucas1p2.samsung.com>
 <20241203134137.2114847-7-m.wilczynski@samsung.com>
Message-Id: <173323589751.1743555.13494050245769190862.robh@kernel.org>
Subject: Re: [RFC PATCH v1 06/14] dt-bindings: clock: thead,th1520: Rename
 YAML schema file
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_062503_554907_423A048A 
X-CRM114-Status: GOOD (  11.89  )
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


On Tue, 03 Dec 2024 14:41:29 +0100, Michal Wilczynski wrote:
> As support for clocks from new subsystems is being added to the T-Head
> TH1520 SoC, the Device Tree binding YAML schema file name should reflect
> this broader scope.  The existing schema file 'thead,th1520-clk-ap.yaml'
> includes the '-ap' suffix, indicating it's specific to the Application
> Processor (AP) subsystem.
> 
> Rename the YAML schema file to 'thead,th1520-clk.yaml' to generalize it
> for all subsystems. Update all references to this schema file
> accordingly.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../clock/{thead,th1520-clk-ap.yaml => thead,th1520-clk.yaml}   | 2 +-
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{thead,th1520-clk-ap.yaml => thead,th1520-clk.yaml} (96%)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241203134137.2114847-7-m.wilczynski@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
