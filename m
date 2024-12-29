Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E4BE7718F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l6wDtOA1o2ZVU5DTzjS5Fs14w72Crl4/vF4jXz16GFo=; b=Er4MS9sfI8LtpjPTTRJpDr4slV
	bl0D0vdODRTyYowmKCQhx6g3L7PpRJ8tCWHMv/yMjFoZnGcs7qh60c7Mcm8A8xilYDLi4Wc4uc8Up
	I2ZXVNER7/SnkAOmLCzcmJV9hrBzdIl7roIXnfDUSGlzS0A2VLzFUu9Azo5sHzRSEtfdih5gq4Gop
	Xs1CR8o83YlcutJRzQc6n2KDJZfq1KkKv+KJXVQya0EhVR/EKobk271XGJ3bKRBJD5Id7xXYNDtKZ
	ULAP7HVPLQl5DiiZz4WQZxtSrYew0+GIPg71u1xqc4I8ncfWyQDkSOoMTdv9OeBdTuahnXWP4aqlH
	VOnQqD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuJV-00000003Uhf-1GiQ;
	Sun, 29 Dec 2024 14:30:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuJS-00000003Uh9-3clY
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 14:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B25BAA40B47;
	Sun, 29 Dec 2024 14:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E9AC4CED1;
	Sun, 29 Dec 2024 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735482636;
	bh=lFIVaV71tsM7UxfJbfpVommJU7JD4UzmobP32UMnsZU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oUHJ9E1ljBqkdDUI0KZvJrzRVz30XDvTlNQOiXt4xBxyPoHI8L+Ud3ZO05V094zjY
	 NpgcQFezAHhFNUP19fZ1NfhcmPbQ47ZpDgMm0X6TpSxL2fLIJAQ5r8ZFZIABHKl8GE
	 N7DEMR0BGD7MYZmIE+BpNsmth9tmvPwn27nSdtwvHdPr+2wp3hgQJM+OTV2nwdcI4k
	 iNYaJ/B8CMINcitW5afhpvGi3UZCJ/U/5tXEcLiXsMgc9e/j+v+EY/apd94PY8rQ/O
	 AR17HaiSyHitgEh1HMQctV/7CI2x5W0afe/4Zt8H2qDNclwlgLExbkDkEyjoLerlFc
	 4Anz/z+YGiwzw==
Date: Sun, 29 Dec 2024 08:30:34 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <TroyMitchell988@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>
To: Xukai Wang <kingxukai@zohomail.com>
In-Reply-To: <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
Message-Id: <173548263487.3742243.93806553348966195.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_063038_998330_5087D5E1 
X-CRM114-Status: GOOD (  10.91  )
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


On Sun, 29 Dec 2024 21:21:08 +0800, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the new clocks available and
> the required properties to configure them correctly.
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 41 ++++++++++++++++++
>  include/dt-bindings/clock/k230-clk.h               | 49 ++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/canaan,k230-clk.example.dtb: clock-controller@91102000: clocks: 1 was expected
	from schema $id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com

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
