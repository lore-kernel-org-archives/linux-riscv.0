Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D54DEA8536
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyncM2CHeX2BjegFzK4xLvs/AZ76yjeOcN28S+dAJT8=; b=0a2XQn3qbtmPF5
	m8HaBRIb94POKMSGL6si1bXr1arNQReAG73u31rHQ9a3na/FDhuNCF+1xzalpSLgJYT3v6G9XrcRX
	gNV+IUNAooacxYFKubVo3aLifF12No886T3YNZs/KX/Ed3vyEQ7Id/H2x4JkVJ6PStvnhh2Lqtver
	NrJgbiP/9FCPGofFnTSVOmYpSsMMUNJIuYEaGu8YVpA7lViaWtq6F2b1ktF6QE2lvGuDvQmYfU+AP
	6dW8Fh/R9mq5R2+4ElE6tX15+7+oyGZ5Q87gS0HPTIloJZT6wbrz1EjFozMYKVy6B9I/Dxs2Bh69K
	EG8HNldKmx22KXFM0qhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHUU-00000006CVp-33tQ;
	Sun, 08 Mar 2026 17:00:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHUS-00000006CVD-0loo
	for linux-riscv@lists.infradead.org;
	Sun, 08 Mar 2026 17:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA87341B2F;
	Sun,  8 Mar 2026 17:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6617AC116C6;
	Sun,  8 Mar 2026 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772989225;
	bh=IWoJ+2WT1ISgb/UKfnuzPpHQqGWj/SikHRdtgBbkoJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jhj7Sg1KPb8kVRk8MjelzUm5XoMgGaFXkhNjMkQ0KaYcylHDOGfPiCFrufCTPgdK/
	 hFJd6tw6RctBxgm4AUG4JZj2cXZr9m9tFvG6O5btH/Myi9kqJ/GjphHxmexmz/FWRf
	 +YNfbnfPCO27+oM4J+ftQB5BJx14JrXo+cFaPrzI5fjE1nU3kmIvAhm3Flpu4Slj3I
	 h2a8RNEcyw7gcjKCe2ATiqugs0nJelsEzFrvU7K2MLSYOUwVN0nt0f5LOlFy+MJV5H
	 +7k412XTH90UIQmAZvlqf5K+gjGXtyaPL+rKdtdFMyv1HPm2keZaoYKrVB2EBW9+cK
	 xDLkYVi1T6//g==
Date: Sun, 8 Mar 2026 10:00:24 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <aa2rKMGPnCc8lGow@x1>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
 <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_100028_245509_60E8CFD9 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 05, 2026 at 10:40:43PM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> has the 1/100 degree Celsius bit (the values are 42.74 and -0.16
> correspondingly), however the binding currently only allows cofficients
> as precise as 100 milli-Celsius (1/10 degree Celsius).
> 
> Change the multipleOf value of these two cofficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> New patch in v2.
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

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
