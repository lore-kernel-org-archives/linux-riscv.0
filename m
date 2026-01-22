Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BAAC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 08:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dv6kk9NuC7sgau5TK1+JzDeEToZEO8uFZZI9WcM0GUY=; b=VEj9AYpGZ+LOhD
	+RAeWRCqmMRg/CLUMf6iz1HXBoIlkb7C+Sj5TmQfsAtG0+fzFdQ1SnSeYHB3CQrFMMe54weF5Htj3
	n4pm4ovP1Um4CJWxN0UkzgiRHO/8SqM79ujthrsc6ZUTbMc6nzaOfCg6WIGPwoWv4jpF4HX7pp/DQ
	I1P74OtXLE9vhgI4u928qAVUlWAcCJicN5hfNRAme/9dLBcFJ0RtzxoLG/Melbl/kkfgXJSUZWCCQ
	0nBrVYx/Iqf6MEZNx++6EUM8C4xBfSkdurYugvJFSM/+sJpyNjASVHg7qdksOBmGrEQtXxV5nV8el
	diQv2ZHicvlDR0jHZ4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipkD-00000006cyA-0xt5;
	Thu, 22 Jan 2026 08:08:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipkC-00000006cxz-1Op3
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 08:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56360600C4;
	Thu, 22 Jan 2026 08:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE38C16AAE;
	Thu, 22 Jan 2026 08:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769069323;
	bh=QdnzH/k/Cpxt+cbGkFJe3060i3uFURJ3AiMAUgzjrW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bagLUWivqopIxhtDMa4hRZVJlzZb1kOZZsiVJnxhmZ7KLjsN6zgCRuoAMeWeiKT0i
	 o5XfefkojyxAH+mcKs5mdF+lMOnuo0UyRh2dY0QzIf1CjL3Q4CapMm7uRBbDVUI9EA
	 zXwzAvjbxhHSyFIE5UO8QV7c8bqDBXuM86amczFv7LQg/jcyNQu1XyIxE6PVHMGafq
	 GPhJ5VVM+EESTXOyPb5bECIGqYtWvl3640i5zTALnrwGhMuEky6JZy1M6m+h3E+D9I
	 72jCj78NUmFwr72E1RR5qO3AZFraIVU6S66ImRnev+NXK55Q7BFha/7EQqn2epNilq
	 Pg32b92y/9i1A==
Date: Thu, 22 Jan 2026 09:08:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: add support for AE350 I2C
 controller
Message-ID: <20260122-almond-pug-of-management-33d438@quoll>
References: <20260122-atciic100-v2-0-7559136d07cf@andestech.com>
 <20260122-atciic100-v2-1-7559136d07cf@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122-atciic100-v2-1-7559136d07cf@andestech.com>
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

On Thu, Jan 22, 2026 at 11:53:18AM +0800, Ben Zong-You Xie wrote:
> Document device tree bindings for the I2C controller on Andes AE350
> platform.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/i2c/andestech,ae350-i2c.yaml          | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/andestech,ae350-i2c.yaml b/Documentation/devicetree/bindings/i2c/andestech,ae350-i2c.yaml
> new file mode 100644
> index 000000000000..59a521fb249b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/andestech,ae350-i2c.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/andestech,ae350-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Andes I2C controller on AE350 platform
> +
> +maintainers:
> +  - Ben Zong-You Xie <ben717@andestech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - andestech,qilai-i2c
> +          - const: andestech,ae350-i2c
> +      - const: andestech,ae350-i2c

Same question as before. Nothing in commit msg explains me above and you
STILL DID NOT send your soc upstream which would help me to understand
the relation between SoCs.

Considering you did not even build check previous version, I do not give
you any benefits of the doubt that this is correct code.

Respond to previous review.

That is a NAK and I am dropping it from the patchwork.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
