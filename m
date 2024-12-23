Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE88E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CvH5GUTo9q9HX3ko8QG1bltBHoWJYxcuxuBMOSH2/5E=; b=u9kdGKdsj5vpmt4qxMxWY6xjex
	jMonSAxTX/c7mDy7OW72hbzv9on2KwczRWqpcMhbVcNxSwfZu/0Z2dRk4wVeFQVDX+BmyoFvFc3cI
	6VKo6BjgiplCBselMlJaR5VMQqKygb3fB9aKbSCjWXt5mAZfvJGuoLkIpOQuKNGVS68mukXS6TBQi
	wt4Yh8cALAggE7Xx+AuFSz08sMSkAXDBFUDx27v4sCPSjCbueoaqC8677jUIIVENZnpgIAZWVH4yq
	JLOzkKIpXBcxH9rx5h+lDON/2pHjaAUamVm/pO36WbLcToM7zyIhcwovEoK2L1Niz5f1oENRuJAbv
	RC6WC9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkDk-0000000AHGN-15n6;
	Mon, 23 Dec 2024 15:19:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkAJ-0000000AGlG-1hHW
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 15:16:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B6DEA40F7B;
	Mon, 23 Dec 2024 15:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABA3C4CED3;
	Mon, 23 Dec 2024 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734966973;
	bh=BB3R4LhpT1qumoCcyu94hcb/+Z5AodbxcVxv7XXNnlo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J/8PDBNAjDsbMHT4ohKjjYowkPAH8mHtko322ltly9LGNpsGn2abCfbajgZjkxjiG
	 eWAEJNKTFt1BOllO+CrxjZg97NPoeWTng+3BPQyK5YsNDVjvJiiMlzVKXWMNk4XsRV
	 rH9ia4oQSTR/QZ2B9+ibwQlr+PSGYVsDLHgmpvaknHODudO+5TE+0FOAx+PNJy6lv1
	 oUwNgZeUtMCUtf+58quO0uw3w16aT9XTZllfis6IXgtwo1mkNCnVwOxwn2KyGB1wRO
	 x20tu6Q1LmafO/5i6X5pxUUdUL4CBzrBQckDb782bczHoXH+huTZB93wBNFpBL+C+X
	 1dg9lLVjt/+vw==
Date: Mon, 23 Dec 2024 09:16:12 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: guoren@kernel.org, linux-riscv@lists.infradead.org, conor+dt@kernel.org, 
 krzk+dt@kernel.org, sboyd@kernel.org, mripard@kernel.org, 
 jassisinghbrar@gmail.com, dri-devel@lists.freedesktop.org, 
 m.szyprowski@samsung.com, palmer@dabbelt.com, jszhang@kernel.org, 
 aou@eecs.berkeley.edu, airlied@gmail.com, ulf.hansson@linaro.org, 
 frank.binns@imgtec.com, linux-pm@vger.kernel.org, paul.walmsley@sifive.com, 
 devicetree@vger.kernel.org, p.zabel@pengutronix.de, 
 linux-clk@vger.kernel.org, matt.coster@imgtec.com, mturquette@baylibre.com, 
 linux-kernel@vger.kernel.org, drew@pdp7.com, tzimmermann@suse.de, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, wefu@redhat.com
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241223125553.3527812-4-m.wilczynski@samsung.com>
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13@eucas1p2.samsung.com>
 <20241223125553.3527812-4-m.wilczynski@samsung.com>
Message-Id: <173496697225.830201.2249501258776075204.robh@kernel.org>
Subject: Re: [RFC PATCH v2 03/19] dt-bindings: power: thead,th1520: Add
 support for power domains
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_071615_507277_9E3BF854 
X-CRM114-Status: GOOD (  12.10  )
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


On Mon, 23 Dec 2024 13:55:37 +0100, Michal Wilczynski wrote:
> Introduce a device tree binding for the T-HEAD TH1520 power domain
> controller. This allows devices to specify their power domain
> dependencies, thereby improving power management for subsystems such as
> the GPU. The new YAML schema describes the power domain node for the
> T-HEAD TH1520 SoC.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/power/thead,th1520-power.yaml    | 42 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/power/thead,th1520-power.h    | 18 ++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/thead,th1520-power.yaml
>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/power/thead,th1520-power.example.dtb: /example-0/firmware/aon: failed to match any schema with compatible: ['thead,th1520-aon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241223125553.3527812-4-m.wilczynski@samsung.com

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
