Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EE4CDD540
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pxluMAsuGN2MLV2KI3ES5A2NMC5FjGq2A+H49RXETPI=; b=zmQG8oYYn1kNs8AXRjEpoCJdWY
	DGjwiep4wvMZ8mCreU9QDP3KUBk/9NySndsiO6roEO1IZ/UCV6iDVbhYzIqQcbdo2T0oNpy4Dcuyh
	AI/k/wO7qBeIChLdZk75TkyexmDAutrIkZax8F018uvW8fyfI6dbIe532RLh8/h1AKC8Q8tCbmGBp
	ym50C+XDMkGK/L+4mTNmV/nKQJcZ7JrRxAv2U97dJekt4wMoe0eDaVaE8VWC/Q9IaC7lFf3wgck45
	zAGIpCvPvp49ntFMLtddcKnwwObc3XU965DOCyZjIDv4uZil6Xv+hptqFMSjB0mQTL3S5BniRuAJU
	hFGiOHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqwUO-00000008W1W-0Yy1;
	Wed, 18 Sep 2024 15:21:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqwUK-00000008W15-3eDV
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 15:21:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F51EA425CD;
	Wed, 18 Sep 2024 15:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FE6C4CEC3;
	Wed, 18 Sep 2024 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726672862;
	bh=h74MYu0CMAjngiyISC1+qiBUaTaAmY+BF5I44TzOFQk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YWu/nLbZF3y4sdm/3OduIKLe/XT4R7y2ikUHgB9K/VBfEdIy4ceX09gq/1MTt3pSi
	 /4Re/5YjjHtrwq9+Nta1Tjw3ozq9fHWYv/OaKnVjdm4FMjxB8uLm+hBecPV4EDo/TL
	 0+GXxGvauyUN5CCvgBjq++XCk7V9Npwl4+hkLiZYlm6sdb/VJR4YsEopLu/NIksnq4
	 jwJyoV6pV0uH92gt507H9I1YmLL1Tt2yjOzMqTpfXzAnr0IxBsk0gbDDt5TFEm6AoQ
	 doALZonCIQ0vC6nZjdEFnc1qzuu9Lk7Yrzg/ezWY5Xdi2KN7VccEkvvuhMcEKVldj4
	 nHRu8GVXCnhSA==
Date: Wed, 18 Sep 2024 10:21:01 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, drew@pdp7.com, 
 krzk+dt@kernel.org, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
 m.szyprowski@samsung.com, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
 jassisinghbrar@gmail.com
In-Reply-To: <20240918134901.193033-3-m.wilczynski@samsung.com>
References: <20240918134901.193033-1-m.wilczynski@samsung.com>
 <CGME20240918134926eucas1p1df23a583b356505939d4c5501bd6c80f@eucas1p1.samsung.com>
 <20240918134901.193033-3-m.wilczynski@samsung.com>
Message-Id: <172667286158.1610121.8972324212190229160.robh@kernel.org>
Subject: Re: [PATCH RFC v1 2/3] dt-bindings: mailbox: Add
 thead,th1520-mailbox bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_082105_004722_8C80DE5E 
X-CRM114-Status: GOOD (  10.67  )
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


On Wed, 18 Sep 2024 15:49:00 +0200, Michal Wilczynski wrote:
> Add bindings for the mailbox controller. This work is based on the vendor
> kernel. [1]
> 
> Link: https://github.com/revyos/thead-kernel.git [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/mailbox/thead,th1520-mbox.yaml   | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.example.dts:31.28-29 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:442: Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1432: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240918134901.193033-3-m.wilczynski@samsung.com

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
