Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13030C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iM9HB7Bq61+nxK6DetR2+EsW898k08qr/B/8MTNONlA=; b=5A4HSyKxylLT5R
	bZcKvGjHYf+hEulDGJ91QxhN878z1TUVHy+YRSY74nnKhQzLBI+xbUUz+z29ucuKehQXKCsx6eJVg
	RwrywtbT/wON8GVFN3fxng5Dp/279NZiunmk8tvbGxsrf99LJsaTl0tZoQfB3M8GdFo9iGF7ZspYy
	OFqsn/ZfZgUAGnWbA2I6Ik0VXs+zMCN2Gii8dVYoPV/zM16H2V+1Zzhx7dkOWSew4ezBTsGgeb1Sh
	J/trT08J94iGqNx8YqYzTau8CoEeRYfxDFwzyFuiPnFHSa98YG5Cg3fDLS7ZsrY2hKc89RtatBxGq
	5/gXbKDQJcVSygLiQv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNJ8-0000000DQdH-10tl;
	Thu, 04 Jul 2024 14:19:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNIs-0000000DQSn-3xau
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 14:19:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 35031CE3797;
	Thu,  4 Jul 2024 14:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AE1C32781;
	Thu,  4 Jul 2024 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720102756;
	bh=OwRVZY+f9veGOGoR06mRiZvZ/R/K4T/tjGiz7dFM/24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbTclH35SnvUdR4hFK5/Ro8n9I3duUwlcnH+GdPeTzb6igHteP2I2pKjkRze1turk
	 dQgOopkNNnnIGMgS3bkVFBXdupG7Lt21Eh8jIucIXUjt5Xi5TVXVQy8ZMQrfGkAgIr
	 Iu2ZM0oykY8fYBRFmNKfEgQFI1u/0Lb5CZBzhiguuVnQ0fnJcrbK4YJc/cc44ScpPR
	 ezveUi+K4inDtXVuCIGCYRSv/0pNKLidOJDqUnzXEQN3TsiQbfk+Mgo3Ly9W1j8POU
	 bDSQwhGeSEDYbD7TG/LzdnCCoWqdxUbk8eYdeW4debYK3+tXXXRireCuOUHSu0Z2/E
	 /tCSYACMDGPhQ==
Date: Thu, 4 Jul 2024 22:05:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Meng Zhang <zhangmeng.kevin@spacemit.com>
Subject: Re: [PATCH v3 11/11] riscv: dts: spacemit: add uart1 node for K1 SoC
Message-ID: <ZoasDzbOfQjxk9QZ@xhacker>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-11-12f73b47461e@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703-k1-01-basic-dt-v3-11-12f73b47461e@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_071919_183282_A9A2B9D1 
X-CRM114-Status: GOOD (  19.09  )
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

On Wed, Jul 03, 2024 at 02:55:14PM +0000, Yixun Lan wrote:
> Devices in 0xf000,0000 - 0xf080,0000 are reserved for TEE purpose,
> so add uart1 here but mark its status as reserved.

This patch doesn't deserve a seperate patch, it's better to fold it
into the dtsi one.

> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> ---
> This patch can be folded into "riscv: dts: add initial SpacemiT K1 SoC device tree",
> if maintainer finds it's too trivial to have an independent patch..
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index a076e35855a2e..fee8921513c1f 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -372,5 +372,15 @@ clint: timer@e4000000 {
>  					      <&cpu6_intc 3>, <&cpu6_intc 7>,
>  					      <&cpu7_intc 3>, <&cpu7_intc 7>;
>  		};
> +
> +		sec_uart1: serial@f0612000 {
> +			compatible = "spacemit,k1-uart", "intel,xscale-uart";
> +			reg = <0x0 0xf0612000 0x0 0x100>;
> +			interrupts = <43>;
> +			clock-frequency = <14857000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "reserved"; /* for TEE usage */
> +		};
>  	};
>  };
> 
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
