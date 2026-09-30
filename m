Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F395CA5FAC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 11:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/0WYlGLrtKUF/zGnNE11YFXoitWQrYvOgQsCXSBCaE=; b=jUm8cr7yj6xUZq
	C9SIYoMAogctuJI2tf9LDG2y822Cl4RaW5F7E/KdU24dzp+/pZ6GXNYxoLdxxIezkG0B5SMU9fDYl
	uKZqEM95h7flEYCX/58jXAzvphvH4Cvezuq1xwRnHRA0aH+G2nvYWRvVvKnOB/djDs4fXi52yuf6v
	TTIgw3RI7wbkOLpNAeTkpSlVv1TnnHmVtcimYwAguQZ5ZlB3O6cpYmMpZu62YLbmWtHrqp/5ndDpb
	C3av1S2Om2bcctM1j8I67Xpi1KYC9YfFb9nek1D07n4S40yH5B/K0yce5A6FZIVPEFhQOfXMz/ZwD
	Kv3M1N6vK2caVxFvgglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsqc-00000005viN-0yMy;
	Wed, 30 Sep 2026 11:51:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsqb-00000005vhw-1Ie8
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 11:51:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45ECD4388F;
	Wed, 30 Sep 2026 11:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5531F0089A;
	Wed, 30 Sep 2026 11:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769100;
	bh=5FnIwsTd9J8v/KNbdey0dWm3okoZNmXW2AFmd2MzMj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bdbWBHOHxafx4KBMkmYVnIvHGlw7Q+9tfZgO8KhSNkwHLoor/uZ5INupb8qBSsTHU
	 cDn2gJLtic39vqH+1xwTnwm3kgY2vNVWQ7dEqtN4t7nw/24lJ+0jDrWlwLmnyIKvYS
	 JpYPe/oHpExEjRSErKx5JNTb4aXdpUjeBwqO85EIC6XKS5mginwc5c0kbLfh5cF2rO
	 pVFdzAo90hH+jIIpvKbxPJwszH24xBzdm69TqCqufzuMUXcIyEZ6fFJ4MeOZvoRh7M
	 d/4AGWIkw0Av3SHTt/EuHXkGVdE8OZ3EVhx9jbYF8zNhcK3U9EN8ZB1ubOgtgPzSbA
	 y0YGn+lRWmcgA==
Date: Wed, 30 Sep 2026 13:51:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
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

On Tue, Sep 29, 2026 at 06:22:45PM +0800, Han Gao wrote:
> Document the Milk-V Meles board compatible with the TH1520 fallback.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> index 301912dcd290e60f816d380152591106de9415b4..5361021b8dcc9897803a5915665c6bb83309fe53 100644
> --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> @@ -21,6 +21,10 @@ properties:
>          items:
>            - const: beagle,beaglev-ahead
>            - const: thead,th1520
> +      - description: Milk-V Meles single board computer
> +        items:
> +          - const: milkv,meles

Why isn't this enum with the previous entry?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
