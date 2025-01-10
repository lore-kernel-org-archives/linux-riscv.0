Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4921E7719D
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 17:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1OK1wU3yu8Mfpqa4ubdMXVS75ftF4S+m+aRNCjLZE4=; b=UCHgK2+QKfG/y+
	tuIf+TSdzwKvgmb+SOcHzKOwxXMt6Q3Kd0haxztgONmfce3/pz18my83rN4V0qzgvA6P+s+bz+w7x
	AH/FbzrRfPe17myWPQ8R4V14YIagFhiIhDLvOZ53MOKJ/AzrLJzGlgC0cxEQWIqxJT3NYiBWO3FHC
	o0W0qJs+73NFjsk+58lpt/bDDxKUKhnnLo6cM5ZwIqqiOCov8eeZV8vCnBmpUEa1XNracyvsY81yz
	o/x6qYzYONonVVvTFHaMGhF06Zc/vRmC8jJLZUz8eKZUNQOblBz1AIOJ7eqdgluRqoriUu4qNmHk6
	YZKRlpBfDaDmfvXY7/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIwy-0000000GSa5-06JH;
	Fri, 10 Jan 2025 17:37:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHmP-0000000GDZE-1gE8
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 16:22:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E509A426A6;
	Fri, 10 Jan 2025 16:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEE6C4CED6;
	Fri, 10 Jan 2025 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736526156;
	bh=B86HqiQXd7XamUOxa4NUPwgIW5QO9pZXuFkjKng8NEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pi5mNHVcrvS4+GtdQL0KBVXG/ypLuIjgxqZ7m3pui9XLZgorf0Lgy7AH2d5F+IubO
	 sQhjVHGtSOXKiRQNcfZShUCEjcfKEq2Gud4Ebt+ITnL7KMvoO6aH+eCB72xJFYLGgN
	 Nyq1u0SHrf6cQRul4TanE054AH1DpQNdVOf9IaM/WyhKQrVxgRsZdow9Iocanq3AZE
	 nJwK4qKsmFrs0rRhKn9RWzJflPWkYLng0jFoO6m1MJvjmMFyA3NBf7NeXjU5bgYmwH
	 V2QBNm1imwS95SPFLmFaqheSg05Hax3vHnzzwnjMv00zmkJ1L3nv/TMvZFRXVmRTbx
	 yQA89GDYJ/paA==
Date: Fri, 10 Jan 2025 10:22:35 -0600
From: Rob Herring <robh@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: add
 risc-v,aplic hart indexes
Message-ID: <20250110162235.GB2975507-robh@kernel.org>
References: <20250109113814.3254448-1-vladimir.kondratiev@mobileye.com>
 <20250109113814.3254448-2-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250109113814.3254448-2-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_082237_509534_C4CC447E 
X-CRM114-Status: GOOD (  15.74  )
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

On Thu, Jan 09, 2025 at 01:38:13PM +0200, Vladimir Kondratiev wrote:
> Document optional property "riscv,hart-indexes"

That is obvious reading the diff. Why do you need this?

Also, what happens when this property is not present?

> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  .../bindings/interrupt-controller/riscv,aplic.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> index 190a6499c932..bef00521d5da 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> @@ -91,6 +91,14 @@ properties:
>        Firmware must configure interrupt delegation registers based on
>        interrupt delegation list.
>  
> +  riscv,hart-indexes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 16384
> +    description:
> +      A list of hart indexes that APLIC should use to address each hart
> +      that is mentioned in the "interrupts-extended"
> +
>  dependencies:
>    riscv,delegation: [ "riscv,children" ]
>  
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
