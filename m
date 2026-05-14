Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0247CD4F3C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Nzbe5+2AOjUZIq2EmdTWPLcZJv4C9O5p47OQ2ahvyCg=; b=0pQWPBIY4g70pZFkJ9zFEep8Jb
	PIeDVDHCS6fLMNwyAQcbp4Uz8GE3Vy/R9qURvHZkG8FvfdqXp7ulxxU5otD1thBwf/lbgnXa1VWMJ
	FqqbccEyG2se2Y/u59S7GBeJTs8ZT+LSL2Kskv9MNIhHi1UytCsQ2c1JG0tVoPRui3pZG+A4DUnRT
	eVY7B5lyO4TEjfj38vh25sjLFS3oupNGSsxDJkxfIxMZNCaiG1hiIxvsuoG74j6bE7OMfJ/hdnOah
	L4r6yynZ63ot06767WL4RYf63Q11TpK4omSqcWdWTETv4jvY64pzTfpalVXVWd4Kv5/8m6VrPzx+d
	djO67OwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwX-00000005Zhz-0X8m;
	Thu, 14 May 2026 13:17:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVwT-00000005ZgK-3rwc
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E22B444E9;
	Thu, 14 May 2026 13:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC04C2BCB3;
	Thu, 14 May 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764653;
	bh=LXjR9KI/K4yRWbtOHy6vX/mBQ02JhQVFQtCevl9ZyN4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rZqgPjydVuobHeUYkV1cuOag+GmpEeNIEQR/HfW94JNIsgt/CABxNOsb6cPpkxgAW
	 GB7XsEUzIjp7c/qAFZKhatGp8u4BGIf8m3ifeuJH/vAsDkmfF1rIR/KRcAXxE84zmt
	 eYffQKHeaTxWIbYoWYUqQA9OJT60BRCjNG2bGZWM9Y2erzBnTTGOinHyKcGW8iSE2R
	 koDyK/MqmVGmmBX+v0+x8mVtzgSxXzgUgJxKxAgG/W6Y2rd7fW6eK1tM8C3TQr86ld
	 DPgzyCqlVD4MNGMLE2e8/uoFdW8tYOc7f7Zqd8zClC4mavyyR3jjAMP1uov1v5fA+O
	 vRjjs0NZ6llXg==
Date: Thu, 14 May 2026 08:17:31 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Paul Walmsley <pjw@kernel.org>, linux-gpio@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Linus Walleij <linusw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-15-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-15-changhuang.liang@starfivetech.com>
Message-Id: <177876464157.125909.5389364363930328136.robh@kernel.org>
Subject: Re: [PATCH v2 14/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_061733_984082_BB5942C6 
X-CRM114-Status: UNSURE (   8.90  )
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


On Thu, 14 May 2026 04:12:10 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 175 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
>  2 files changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml:135:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.example.dtb: pinctrl@11b42000 (starfive,jhb100-per1-pinctrl): gpio-ranges:2: [32, 4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-15-changhuang.liang@starfivetech.com

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
