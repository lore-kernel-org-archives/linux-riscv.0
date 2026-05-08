Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18A3CD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8Q6nC5uFH3/izXsJOHk9CqNVy88Z+Ul8o/qzai0iqR4=; b=Jzs6+JqmEZxwsnetiQmyPs9Jjf
	YSJ/DWLRztMTfCR/Gi67fLSpaTfIZ+EuPMOZ4YMPlaXIoYem3qhuZ4htZVDXodZkKKIjCIzPSKgy/
	BYekShW+1WTee6hC98sLphG9XmWdpwigTA8G+UDq4A9H97Zg4RcrCJ+WWFXOExJvRaA1U15yH+lxm
	jNopOKD3JUONSpapgNEChNnaRwIQo3RBoc9EEngP27D3RM3aqRhRAqQZn6ThWnSG95XsvBtVKW6S0
	i/qx42I3DSkLG/V8uN9COQmCukXx18cDt08CGCSBdYOgpmVhBlM3U+8J0qgj2cXSHR1/s8GFt8WVB
	mTjEhiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEzH-00000005luT-03Od;
	Fri, 08 May 2026 06:47:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEzE-00000005ltm-0e3s
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 06:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69B9743C4F;
	Fri,  8 May 2026 06:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193EBC2BCB0;
	Fri,  8 May 2026 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778222819;
	bh=uKAOXdr7KoyoLXoWkvIiwhu5inN82Hrcf71gx2FwTL4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rBoM+uOJQYB0NFff7uB2cgpANz0ma7Q2Xa2GtuDlwToO8Z4hyJ3vsgSr7JHXCc+be
	 OLHKrccw0DSFGpeId3LHUKMk/Gwl4tqOqp/07IIW6u2cFxfyoOHuYWbFh23r7xTIOi
	 hL5WDRxzrIV6p6YckB/PmvwN7uPvaMY8cQ1rsoojo2qL3raam0Hmw0Tuc77TuWcpRj
	 ELQNf3ajnJ7t3nB+K+LQqKtJE3QjgxbH6e7bFggdFLT3FlZJUNU6lYITqPEd/6fQbx
	 uGYvmGl+oQd65vop7dQbVH+vVgJK7uUkiBh1CJlNu5DjaXsiG5N/gfY+Q0WIG2/kWu
	 FXza7gN5NuWLw==
Date: Fri, 08 May 2026 01:46:57 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-hardening@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Hal Feng <hal.feng@starfivetech.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
 netdev@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-clk@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Ley Foon Tan <leyfoon.tan@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260508053632.818548-18-changhuang.liang@starfivetech.com>
References: <20260508053632.818548-1-changhuang.liang@starfivetech.com>
 <20260508053632.818548-18-changhuang.liang@starfivetech.com>
Message-Id: <177822281712.4161155.7993611746550690786.robh@kernel.org>
Subject: Re: [PATCH v2 17/22] dt-bindings: clock: Add StarFive JHB100
 Peripheral-2 clock and reset generator
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_234700_235564_1E6409C6 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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


On Thu, 07 May 2026 22:36:27 -0700, Changhuang Liang wrote:
> Add bindings for the Peripheral-2 clock and reset generator (PER2CRG)
> on the JHB100 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../clock/starfive,jhb100-per2crg.yaml        | 76 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jhb100-crg.h   | 57 ++++++++++++++
>  .../dt-bindings/reset/starfive,jhb100-crg.h   | 17 +++++
>  3 files changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-per2crg.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260508053632.818548-18-changhuang.liang@starfivetech.com

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
