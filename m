Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66D9E77180
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:From:MIME-Version:Date:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvF9sMNrfTdaQxr4Oxqy+Z/q+F1zOnMYIwrNdVO45Ac=; b=HErJTvCS3sch39
	4V/oGStQvm4UfynoBoPbtEsqm1GCVXQvvgrTuc3158mi2/Yx/n9UYMjy90bNLz7iFGj7finaFs3xx
	OiwPCDJ/J6YLjhKoo3/IDkUA9DzF6OS9QBqF0yzAfQKarWXP75CtRPBJ4iSA1/OOdVa+kTVVWhhPf
	Ad/PAALLHNXiHB405lxGdP8IQpjlKQqylLDmornOyiAxF6wVOspf+HuOSRIPgfJL9uINIx6MLlZh5
	oOsocqcJ/1b6N9d0R/opFiMsBMY0MjkivCNadPLOlqyZtzSaRdN7z/nnxWjMO6hpMrUAtOOI0KRVy
	SQx8OIBkgki0FBpf8Zrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8Xp-00000009iff-0pI8;
	Mon, 16 Dec 2024 10:41:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8Xl-00000009iea-3IbD
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 10:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1BEE1A40EBF;
	Mon, 16 Dec 2024 10:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954EBC4CED0;
	Mon, 16 Dec 2024 10:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734345700;
	bh=+Gt7sln311MYYO7UyQ53nZUhFgOQuw/rcPUpZqaXzDo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=S6yJclheYtv1mrwMkQ6DazZgNxA/kcRY27xDiCz5vrdl+3QLj4Yls4G8CwpKj7wG5
	 yTlhCgAXwiD2ZdRG+fB07++l8ztGhOwONeWKRRGdes2UiJfuRw0anR93FG1O19vEtF
	 +FfGSUTulmf18Duxf5jCB1AFP14NYzOZl8Z+EcnqnOgtqt/s0HtvF12ptjjZRjbvlK
	 LrOmxSNL97cpBtwCb2VjjAjJ1SFoJaRLj8/6y/iMyiw39+o/QmsEW0offSyULE6/rC
	 32N4FInv2CxChtec22ICcd6qihMYfbKY0USFC2tVFJmgC1R5IGuZyl2IQWbLHrazXS
	 n7kxRe0UfAhvA==
Date: Mon, 16 Dec 2024 04:41:39 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
In-Reply-To: <20241216084817.373131-4-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-4-apatel@ventanamicro.com>
Message-Id: <173434569620.3760706.9963658064899025443.robh@kernel.org>
Subject: Re: [RFC PATCH 3/8] dt-bindings: mailbox: Add bindings for RISC-V
 SBI MPXY extension
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_024141_885684_70A22DCA 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Atish Patra <atishp@atishpatra.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Michael Turquette <mturquette@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Mon, 16 Dec 2024 14:18:12 +0530, Anup Patel wrote:
> Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
> extension as a mailbox controller.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#'
Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.example.dtb: /example-0/mailbox@10080000: failed to match any schema with compatible: ['riscv,rpmi-shmem-mbox']
Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.example.dtb: /example-1/mailbox@10001000: failed to match any schema with compatible: ['riscv,rpmi-shmem-mbox']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241216084817.373131-4-apatel@ventanamicro.com

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
