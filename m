Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44400C982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 18:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eLW3S162NvSInGKXQQCSOVIHLG4s/ZPyqhki+hAJE0=; b=p8jEihAdPfEfaq
	2Y5jTWOxvvI9QHiCbY1ss3tdpYXRGWadRD7Wx9lb+DdOk+yEgwsnfsPSzVScbSvckotulV2zbf3i0
	azkSeHwAS1bwoWwD6PROTZuUDlwmGB3Cq2HTvgj3nwRrqi2pP9UbZ+zTJLhZPhiUXS3QTR1g4vjkY
	NiiL4Q47cIorHkRrrFH7EJjrCOlafpbZ7MeLrxYScz24QjN/SXw0UW4T8rWlwwW1rO+vJG7fMbbD8
	RNqPev+a4f8JUk+rXkxe2YDh8z+KkV3zs7fl13h0ErscHeRqNAgbMDCnHXK8KbuYO1pCHQS1MvKPa
	55ojk0cQA3T7sMsA6hqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8idt-000000036Gd-4Bbb;
	Mon, 21 Sep 2026 18:21:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ids-000000036GV-3YBm
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 18:21:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B2D160142;
	Mon, 21 Sep 2026 18:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1251D1F000FF;
	Mon, 21 Sep 2026 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790014887;
	bh=PbwTZfAx3l/XvruYhKqHu9GpG2SrIjnLF1liXGZZY/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XQFJu4MOu03tBUbtwAkXf5AudkPj0Di0xkdBC+pdpRKIGAUaMAHYmLigFFkCyyZ0X
	 fzD69WbfKBHz+fwVBuzBdx2iQ/MajDSgbE9UdPQXqVF5mw8CmbHnGxsQZEpky7DG6Z
	 Dl+zZ++/XEGi3/JSEbDdAQ9GzoeQSx9eBowHuaVUAYCBN0NX7zXJ8xdDq+yTtZ2RsY
	 1IN2rbamhWnSUIzfp70KVyluYT9au4DS+B2zCK144rUx449cPyeq971b+WVekotNrP
	 +WesAGBwFUPOyo9wLr8DTdaME3WtCjUCrlnR/B4uWWwvSwvVENNihD44oobA6EoSCo
	 12s4PO9AGhvVg==
Date: Mon, 21 Sep 2026 13:21:25 -0500
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
Subject: Re: [PATCH 6/9] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Message-ID: <20260921182125.GA1219949-robh@kernel.org>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-6-3267f14ebce1@htecgroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-p8700-dts-v1-6-3267f14ebce1@htecgroup.com>
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

On Mon, Sep 14, 2026 at 03:55:54PM +0200, Aleksa Paunovic wrote:
> Document the MIPS P8700 ACLINT MTIMER.
> Extend support for both mtimecmp and mtime registers
> within the ACLINT MTIMER, identified via reg-names.
> 
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 43 ++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> index cf7c82e980f674afcf59fc726742dc4f49c1a820..35e02da675becb3c8bb187b8e1e623994d52df8c 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> @@ -17,18 +17,20 @@ properties:
>                - sophgo,sg2042-aclint-mtimer
>                - sophgo,sg2044-aclint-mtimer
>            - const: thead,c900-aclint-mtimer
> +      - items:
> +          - const: gf,mips-p8700-aclint-mtimer
>        - items:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
>  
>    reg:
> -    items:
> -      - description: MTIMECMP Registers
> +    minItems: 1
> +    maxItems: 2
>  
>    reg-names:
> -    items:
> -      - const: mtimecmp
> +    minItems: 1
> +    maxItems: 2
>  
>    interrupts-extended:
>      minItems: 1
> @@ -42,6 +44,28 @@ required:
>    - reg-names
>    - interrupts-extended
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: gf,mips-p8700-aclint-mtimer
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        reg-names:
> +          items:
> +            - const: mtime
> +            - const: mtimecmp

New entries go at the end. And then you can define 'mtime' at the top 
level with this just being 'minItems: 2'.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
