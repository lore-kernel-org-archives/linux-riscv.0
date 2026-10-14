Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEFBCC6B1D
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHoNnIQwB/3NfpzXNoBdh4qBQ6TROWeJlgvfR1MRFZ8=; b=DIE7fEwufr/OPF
	ietkHqX1cgiiD4qdbsNiP/8Zn9p4sfcTWnSLLwfhE9a7yVRmLFY8odoDrbBV5u2VbDpjlynDuXKd/
	OoS2wfG1gh6rr4ptyTAmh4fTU25ESRtMLeDuob/m1nFaqtaXkQvxQiHWCTLo9ip/7ZptzuF+RPLBk
	RW3Vz1Fl3BbkfXOQILdLHx+wKR8WCM5PSIPxYVGwwkOXXLFoErbQGbTZqFup9S8s1Xrz/F4T8gkUR
	JZ3Aftw7cyb07/V4sjVZrHkp/7Q3mm4b8BoTNz/MOiwL4pkPEcEY6vai//IQKzqnSplFf9IMMF3ko
	Wb991uBukyo0Vt5PGChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxOR-0000000FN3K-04Yd;
	Wed, 14 Oct 2026 11:43:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxOP-0000000FN2x-2Gz3
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 11:43:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 295634095B;
	Wed, 14 Oct 2026 11:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107FF1F000FF;
	Wed, 14 Oct 2026 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791978213;
	bh=7oE0XxvFFkBqtgQsaiPOqdldOyCWgA2hMmJ36+85B9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aiIDMyuu2uTFb+/QG9m1mRRuoZMFfp8wK/yD0aWrXZtz/m8gUdxid1LCT45bGtgcC
	 kcHil6ABQRer3XoYwDdDF587yQWKO8Xh6w7NKDHwGq5GCFrECU0rY26LMCbPrVnbmK
	 VGg+l47UfD0ugPbwF4is1B73xBK3P7cmfTG9GidqI9k3oM0MAXso2dONNHrZiRFch0
	 xUbHIGQH+7Y6fG5xsa40IYxMEPXCc0fmW85boXwYAvR19Py5WPNLb3Za42fAV/6uV1
	 oY/ysmAdu8vHUmn67M46Xh7MQAZsXo/TYozkssVQlyDZ+MbzC5HdM86WmzFUC2hqF3
	 mV4Z3U3Jd07Xw==
Date: Wed, 14 Oct 2026 13:43:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Message-ID: <20261014-humorous-cryptic-llama-cf6a6c@quoll>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014074516.240247-2-inochiama@gmail.com>
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

On Wed, Oct 14, 2026 at 03:45:13PM +0800, Inochi Amaoto wrote:
> Sophgo SG2044 uses eFuses used to store factory-programmed data
> such as ROM patch, public keys and other factory information.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/nvmem/sophgo,efuse.yaml          | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml

Filename should match compatible.

> 
> diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> new file mode 100644
> index 000000000000..d4bffe2724ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SoC eFuse-based NVMEM
> +
> +description:
> +  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
> +  public key and other factory information.
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,sg2044-efuse
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

Why is this flexible?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
