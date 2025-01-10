Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1A7E7719C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lV/ZGSghc/JlcdYXS2vz81Isy1M0lvdLP5XqwAKDs8U=; b=uHL2XeVuTqhZ52
	OJNTarANF3WXOBjyFSk+VQcX/xojBEivQd4ZVsq3N4EPqTAFx5Bqa/nerbNHt39jd/6aTrCHLqc2F
	8mBJLDtDhIMWPny6WvxECnvx9y8x6CxwjemAx4FQs3bHhDZMOAw9m3lSBQnmU3m+RaKqpmVeBcZij
	ITTv1octhZV88a+KulJq+ndQ3Hp7xMXbJT4tad8QsAG+TlFLLnAAPat1NdJRGS0HF/YoYZcToEFUb
	CxlICDB/KEL3t9buqcgomas3hdpouabKooJozGXOOGnWbBicpPbsC1ybptaWiUJIUZuZQQ2IMgUEv
	vmZLwjR/VbNjrXMfJYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIwv-0000000GSYo-3ATi;
	Fri, 10 Jan 2025 17:37:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHkb-0000000GDA7-1OxC
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 16:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12757A42680;
	Fri, 10 Jan 2025 16:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DF0C4CEE0;
	Fri, 10 Jan 2025 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736526044;
	bh=LKUhCQ7uyIY0f8gN/kHHYG4fgpltHjGFFaHE0gi9P0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Amj4PXR+Oo8fuqto2o2c80PYRQvozGzpuAFQotAwA1QrCb/e+A+N6Euac5bxNS5zg
	 q4WWu1SXOKkoPoKcjsYSzpKvx8s7R1atU7K7OEY9K9vwntUGC/ZMJfln51z/h2Sxs1
	 n/OYyiFVu10izUUAvk2qa53ar8IXS3xKeInsoh6m8djEgvk3lNo6VuSfbkKSZOOYd6
	 4iZojg8XZV5VlD845iGwtW25hJZp4ekZu2AqMVHaJK0Et4qq0NbCCjPwjjRG/ehZSf
	 pLaYdNE4d/6VitCNYD1pDXHJbgj+cuRHrOHSZZndnx1TU1YymwFaGBppdulqMv5uZa
	 DShP9YlYILJRg==
Date: Fri, 10 Jan 2025 10:20:43 -0600
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
Message-ID: <20250110162043.GA2975507-robh@kernel.org>
References: <20250109113814.3254448-1-vladimir.kondratiev@mobileye.com>
 <20250109113814.3254448-2-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250109113814.3254448-2-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_082045_433949_6DCC45F7 
X-CRM114-Status: GOOD (  13.99  )
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

Wouldn't using the 'cpus' property linking to each cpu/hart node work?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
