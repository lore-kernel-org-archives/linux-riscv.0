Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AD0C982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 22:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zry/ZoO3UH2FlJgEP6k5NGICzrXax7FGs5locyGkh4c=; b=vn2LUGqOe/6ITW
	sZtFTu5Ou2HlEXO0lmiljS1yJKEAaGeLRPlr3WkUtMX2mNgRQ15LZWq95O/sWR8Ks0mXXeO+BxVDO
	XFupPMBmsERkr+s1zFdVXiDICNg799zLgVmqILVtLdHdnVOY1zY0GWqbd8q+CI8UcanG0OuHvboB8
	nZx9pD8dY4krKA4l4xOYNjq8J4KGaxhAeWJ+mHQwQCTP30uIEdrUObfVY/jXOSfe52m6WdX2mivbd
	0xAjUuUkc7+/bXK0XnRKP5UTk2Xj2lcxlw81HHjPS8y6zCVQCKE+hlfCGBJlQiWODSP6P6JYzLuVB
	KlttBpbIqvd0K14EsWnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ggX-0000000Fbwr-11ga;
	Fri, 18 Sep 2026 22:03:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ggV-0000000Fbwk-33Ld
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 22:03:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 207CC43BCE;
	Fri, 18 Sep 2026 22:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DFD1F000FF;
	Fri, 18 Sep 2026 22:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789769035;
	bh=+AjKvC/qtXiZOeRMzHNlAY6klIi7dBjz9BNC4tf+Y94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BlyFgRTL5rlcxLWISARQLyIH+q/LaOJ0wamQtdobz3xwd24todGKWtQCGQUzQ3fU/
	 eKdzNlzbk/PsEToZjsSzk9dH3GHUg3CKiG8hXJ//0eIwJsKqqHSSRQ0s3pVhtTE9SO
	 2mvWAkTJm9N2L+aProXHc3jO/bStI9EQbvFGzE9F+tSnj8ClrDP2i/lCd3cmGyi+OP
	 mLar3u5p1sOcL6kMFBaAJnO4vVrVcKf0qkyqJAQ0auM+MlM9VZwic7N6oeP+w5cObV
	 fvyb4FqmkI4rqQSKty5d32xaVi7zmEr6DHacBHgf5Yg5t4nLKX8quQE9guLyMWjEFx
	 xA87sLUfd4MUA==
Date: Fri, 18 Sep 2026 17:03:53 -0500
From: Rob Herring <robh@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 7/9] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add MIPS P8700 gf compatible
Message-ID: <20260918220353.GA2420517-robh@kernel.org>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-7-3267f14ebce1@htecgroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-p8700-dts-v1-7-3267f14ebce1@htecgroup.com>
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

On Mon, Sep 14, 2026 at 03:55:55PM +0200, Aleksa Paunovic wrote:
> Add a new compatible for the MIPS P8700 ACLINT SSWI, with the "gf"
> vendor prefix. The original compatible is left as is.
> 
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
> index d02c6886283af790d75357f77a714558f68bb7d1..6c79d7b7058a64bb39141d565f0a6304365991f2 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
> @@ -30,6 +30,9 @@ properties:
>            - const: thead,c900-aclint-sswi
>        - items:
>            - const: mips,p8700-aclint-sswi
> +      - items:
> +          - const: gf,mips-p8700-aclint-sswi
> +          - const: mips,p8700-aclint-sswi

No, we don't do new compatibles just because the company governance 
changed. That would be an absolute mess. Once you have an identifier for 
specific h/w, it never changes.

Up to you if new compatibles that are part of p8700 use 'mips' for 
consistency or 'gf' to be current.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
