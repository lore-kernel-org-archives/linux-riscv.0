Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52FCE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:From:MIME-Version:Date:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RS5S+A605Jkn6NhKv4l6r4VH60rlZsdTTzpz5fAIaGI=; b=qzb0hAWpf2RMo7
	xsWs6/E0ly/SsG4EuFyRCnEv3pA79orbF+GJeI4kJVuUKAMWsLLojrOGi6MqHJxnjMStrIpEubSHZ
	+6RXGZksUllwkvQOKeyWbGI4qvidapqmYcwyrr8T8fHMXWT0qYxIYJ+Mm8qaNEN74Gei3+qIXXO3a
	HHhoR1QE6BbeQfEm79Z7SnkLKZZS7M8CFMPHkRVKyPUhEzEYheFjfRC1IuQyl1zWm+mbGijQkrM0z
	Wiaulh2JZDYd/SWJ0hEfYHbiLXpXS6BSUbidxIqxSta8zdAoT+C3FKHRYwX+R6F6xjDHuqykmqRdr
	8Q/p1YheCHfaGxm1Y8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8Xo-00000009ifa-2k02;
	Mon, 16 Dec 2024 10:41:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8Xl-00000009ieX-1p7g
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 10:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FB7F5C5FE0;
	Mon, 16 Dec 2024 10:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E198BC4CED0;
	Mon, 16 Dec 2024 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734345699;
	bh=MIPDG5npvjgPw5aSOixMDI/+/nDxKCP/5TlsORkHAgg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hF8Va7/ygXZ1JIiTm/K1veoHrxpUTxozypjdhoXuP+pwIGqPABP7jTiexBrUpI8AI
	 j6N7ocpCYDxuhj+nyC07iJy74/rW5K/cvmXoukJdZv6vduDaKEL/TdUnvlMM8eh4JA
	 jxXiUcOm3C0rb/nhLfayykitTPERt+QB6CZ7+u9qvB3+UxW+hN0On0EJEKdKWUHyy+
	 a7rAzKIt7NSFc4Kl+pwDemshgIUtVV7/tcOCSrqw3ZqBumVASLMcEg3tyuFlHcBHxP
	 iFvs3fZtry/pQjPK8ZGtO9n5Qspg40bUngF7j0ECGGGgoZ9KOuZoDhPzq/8kmQIGfc
	 QEMHKEBf7AglQ==
Date: Mon, 16 Dec 2024 04:41:37 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
In-Reply-To: <20241216084817.373131-3-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-3-apatel@ventanamicro.com>
Message-Id: <173434569485.3760664.8535166298614044761.robh@kernel.org>
Subject: Re: [RFC PATCH 2/8] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_024141_557726_8F337AC8 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Michael Turquette <mturquette@baylibre.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Rahul Pathak <rpathak@ventanamicro.com>, linux-clk@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Mon, 16 Dec 2024 14:18:11 +0530, Anup Patel wrote:
> Add device tree bindings for the common RISC-V Platform Management
> Interface (RPMI) shared memory transport as a mailbox controller.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml:33:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml:39:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml:46:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml:52:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml: properties:interrupts: 'anyOf' conditional failed, one must be fixed:
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/interrupts.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.example.dtb: mailbox@10080000: reg: 'oneOf' conditional failed, one must be fixed:
	[[0, 268959744], [0, 65536], [0, 269025280], [0, 65536], [0, 269090816], [0, 4]] is too long
	from schema $id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.example.dtb: mailbox@10001000: reg: 'oneOf' conditional failed, one must be fixed:
	[[0, 268439552], [0, 2048], [0, 268441600], [0, 2048], [0, 268443648], [0, 2048], [0, 268445696], [0, 2048], [0, 268447744], [0, 4]] is too long
	from schema $id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241216084817.373131-3-apatel@ventanamicro.com

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
