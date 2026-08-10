Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB90C5AC82
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BkCeoqUzpRjstFUFg2UFmcvZS94ei185YYfhZv26KyA=; b=znHf+HGN9mjsMMvDK5Q4w7D8tb
	XXg6+l9MTpOF+ampGbViRgFes1HGhHzWQqhND0WR5fL5L2KqLdHfvQQUyzxyKiNtfkGFzIAsJEtrx
	8TPGck6WYBJZJ4Nt3GW4NCT7Bm3YptTn3AreLeTGMo5jQZUOyvmHI+dphauCECFaMXEMloBrry6dQ
	CC3TagMMJhDnijYaNEz6g1Tr7QtjLFT8ZVbW5wI4C8XxryvBtDmQnDSHbmQ1vbYoge6B+5ZUxnC2v
	TY9ylHkbvKRD+Y7aep914edwvo/5Xaf4fGKAz2S6h9vy04/WWUyEmzoge1R8IOQCPpEa/ul1XXm97
	GI3fbGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDl-0000000BGMv-1nWo;
	Mon, 10 Aug 2026 08:18:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLDj-0000000BGL0-0IDf
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:18:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D027343FB2;
	Mon, 10 Aug 2026 08:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ABE1F00A3A;
	Mon, 10 Aug 2026 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349934;
	bh=5IFZsDTW0Op/VJFdoNkzwSLLCb3qBarU/KVg6VCJXxI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=mW9FRI7MykVnKz7VAssJhrb1GhvgszMJ2ZZZ+tIwvBAPvKVXX0IzRyoppTOU3lvhu
	 Da0Ld63ClSfSx34wQs0I1R/x1v3VwoNWBUCKy0/aKiuSi0FtH69Omp5tKMcQuhYrt5
	 idbuVU7ZHMqdRLCM3XQyfCN/wDWpgvixZMsQOVSHul4+WUs2RaQJNonL9yfqoYXM5K
	 D9gfNJbvBLw9TjyrYCYpbX9zQKALhKvXxu6P+Sm2RHFmJayiH3YwbOQ5Uz7b6qfDPu
	 aQ6jnNhboO9WgKCd6ExGn+keNXN7B1U0b1QUEJtASQMJbTnJgjhkha4WLlOvSgJz+3
	 8atNSEfRC2eHg==
Date: Mon, 10 Aug 2026 03:18:53 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Linus Walleij <linusw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-14-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-14-changhuang.liang@starfivetech.com>
Message-Id: <178634992524.1015926.17874974537496810774.robh@kernel.org>
Subject: Re: [PATCH v5 13/21] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
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


On Sun, 09 Aug 2026 23:36:42 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 179 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
>  2 files changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.example.dtb: pinctrl@11b42000 (starfive,jhb100-per1-pinctrl): gpio-ranges:2: [32, 4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810063650.239303-14-changhuang.liang@starfivetech.com

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
