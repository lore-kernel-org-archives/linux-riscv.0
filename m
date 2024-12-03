Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D84E64ABB
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yDQZlqJebhvQpJbE550892L2OKKc9s1DhgSzf1wWlhA=; b=mguFqUdMI5o+Q3IXdQ4q4YN/qW
	ZQHxni0PKrzSOsO0VAX3rB16XsvdOXsO+c36OGgthFb319ugUiakPUeC0yJTMbPs0Qp1M/7HkQQJI
	KBliIURVBqbwLR5wuIqlP0P8w+uC9fod/gklIrVlZJpEtlsOgJnxA+C9NWThtP3q2QRY5E9ztRu4K
	xdRJZB9xz6LHiBs6T/0ntKNcqJQ3R2MQEPeBSTR9jzPQPVH5LFQMW8ruz8QSWmb4l8QtbMWf4OfCH
	bQNkLGQsyjB99T3dznym2DEN817KuUAa67QdnmenNo28JBCyPsotWXTzFgtGOO0HIAUrbRDFcWrAK
	lqhAzwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUm9-00000009v1u-3b0Y;
	Tue, 03 Dec 2024 15:25:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUm7-00000009v13-0959
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 15:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16E54A416B5;
	Tue,  3 Dec 2024 15:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D98C4CECF;
	Tue,  3 Dec 2024 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733239518;
	bh=X/PwEvQP5tU0vB8EoXqX3xfn/sW++pmyf4vXD3OCWfI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BibNDSdIxD5dJNes1vJ7140QWABbcfK++KnAHPuRH34JJyltkmOovhdFy1ythpMcf
	 Jgt+X0vAfjdECQevLJNkTTtUM9aIJAefQRcN5aRk2mOXcIzItQZYV+TYYf9kHkbMsN
	 JB43bQz718szORF+xGZB1wrbaN6402z/7dJ/e1OMHJI4QMRkr2M/Wup8ldZAAW0bHL
	 arhJtg9HrfmdBNiCy15xVrQcxPODNLdMDZXsFOpjw4CqjZyn88aCXAoj1G/CVJOTCa
	 OLhJ7kNSWUAGXTiDqyC6R2x/C0ATmOvC9ytIP2sxvUPXMX5LD7v2D0pMT91r9TTHee
	 kco2TN/wiPeGg==
Date: Tue, 03 Dec 2024 09:25:16 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: m.szyprowski@samsung.com, frank.binns@imgtec.com, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 paul.walmsley@sifive.com, jszhang@kernel.org, 
 linux-riscv@lists.infradead.org, ulf.hansson@linaro.org, 
 mturquette@baylibre.com, wefu@redhat.com, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 airlied@gmail.com, aou@eecs.berkeley.edu, matt.coster@imgtec.com, 
 guoren@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 sboyd@kernel.org, simona@ffwll.ch, drew@pdp7.com, krzk+dt@kernel.org, 
 jassisinghbrar@gmail.com, mripard@kernel.org, palmer@dabbelt.com, 
 tzimmermann@suse.de
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20241203134137.2114847-9-m.wilczynski@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134159eucas1p1eafefef0dfe7f2b6343a639733012bcf@eucas1p1.samsung.com>
 <20241203134137.2114847-9-m.wilczynski@samsung.com>
Message-Id: <173323951617.1836905.12806289628083482638.robh@kernel.org>
Subject: Re: [RFC PATCH v1 08/14] dt-bindings: power: thead,th1520: Add
 support for power domains
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_072519_198734_517351FE 
X-CRM114-Status: GOOD (  10.99  )
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


On Tue, 03 Dec 2024 14:41:31 +0100, Michal Wilczynski wrote:
> Add power domain support to the Thead TH1520 clock controller bindings.
> This enables devices to specify their power domain dependencies,
> improving power management for components like the GPU.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/power/thead,th1520-power.yaml    | 52 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/thead,th1520-power.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/thead,th1520-power.example.dtb: vosys@ffef528000: compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/thead,th1520-power.example.dtb: vosys@ffef528000: reg: [[255, 4015161344], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241203134137.2114847-9-m.wilczynski@samsung.com

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
