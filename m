Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCFC10706E9
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0s3ri7xSNUSJ0oXQqgxSeEZSKXotE70JmjpbXMolsg=; b=kzS6twJxpEdiNh
	fbF1nlqU75aD74Segu7Uyggvsf0InYSvoPUtHhVleAA8SQJeIrGA3CiuEhLL6du/8axSNWPxBss7x
	Y/rdr5OirSenL8KbuQPpy06zuus3kYx8uDvtTU0aQ3TsjEQJQlhngvEua92LLodjtwgjyvcdQbN1f
	COHNzq+5Mlzm3cFMXAB8YmM5cvd8qtSVabM6/eB65VVCQdnH3wwY7M+WCaoVG/8vc4+9yVjQ/NxWn
	94jsaNbmSIxqR3kco0qUFWfuECBj5xT6Gul8KyPd1fEzNgNNk1Trp/Js2yAwV2E1q8lh2slIJO7JI
	eqjkv0mGKRf6KrUGB0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1SHw-000000020eO-3skE;
	Sat, 14 Mar 2026 16:56:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1SHu-000000020e2-33wu
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 16:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4832843582;
	Sat, 14 Mar 2026 16:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC902C116C6;
	Sat, 14 Mar 2026 16:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773507389;
	bh=K2/51MC7bI/87I8mto05HaeOL1q9UD0Pz5lwJ/71o/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsJ+5EBHkfaXYTFY7PI8OeYdt2u9isrCQDZ4tpK+CcWe3/Iqum+vK2TSUaJUtWi4I
	 KiDqjZXijttMtJsUrSPSAMIPwY6BPPyrDYeyPf8pzVAOnqnOL2lMzdS+HN9AphXA58
	 nkHrlvYUxMJ7nGDyb320oQamwGcjKwjypuNryunDbDwisHbMciB22vEKIySphyF3aI
	 pBtj5KfjH9r9DvDRUn5qF7BU9qhIUwd5wupk7aCk1ABHJPoEk6sEoLjbIqmcd2AfAo
	 3XT/f1G0ngCUCorEXlPj70ExYWaGAN3r4/imwUBcJB1qST7m0tClf1mXhq9FP6UeQI
	 z3oc99jzfi/aQ==
Date: Sat, 14 Mar 2026 09:56:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <abWTO7QBFIcjxKn6@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_095630_805218_6A0E4C27 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> respectively), however the binding currently only allows coefficients as
> precise as 100 milli-Celsius (1/10 degree Celsius).
> 
> Change the multipleOf value of these two coefficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> ---
> Changes in v3:
> - Added Drew's R-b.
> - Fixed some typos in the commit message and slightly reworded the
>   precision sentence.
> 
>  Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> index 56db2292f062d..7d57c2934a8a1 100644
> --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> @@ -105,7 +105,7 @@ properties:
>        G coefficient for temperature equation.
>        Default for series 5 = 60000
>        Default for series 6 = 57400
> -    multipleOf: 100
> +    multipleOf: 10
>      minimum: 1000
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
> @@ -131,7 +131,7 @@ properties:
>        J coefficient for temperature equation.
>        Default for series 5 = -100
>        Default for series 6 = 0
> -    multipleOf: 100
> +    multipleOf: 10
>      maximum: 0
>      $ref: /schemas/types.yaml#/definitions/int32
>  
> -- 
> 2.52.0
> 

I have applied this to thead-dt-for-next.

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=eb4fd43ff6793681f0a0a8e8ac861142caba2b19

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
