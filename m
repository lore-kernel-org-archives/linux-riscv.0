Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ADCC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivMB7xvqdZfaqjXmNmUZ4x8WhTFHsAr4UufdSM+0IjY=; b=IIy9lNwwP4Lx9s
	sRTateFX7zdWKzLWK/NfoQM2+YduMQ6EMOBWOgAeM5TitWikECDDpN0d16ZE8uz195f6bqtI+meow
	JiJoxJ9Q1eahVP8QEBzsB2OgTnRi8cJKhOkd1/s9fKGHBx9c2uZVuJj65SNlgyjE0YGYdAj+qlhAN
	oDL9fH4hUzAi7ZHrIyN1ZzBbn9xkcBUiG6Vz3MBvbRWnAUy+uByuEg9p2tLhrs+C9NeKy6ClTR4Om
	yW0xyUCc69XV+o9kcsJ4UTIg+EEfUKheyVVqLfN9Nj0Qc9W0IMYISWb/Mmn3ocpRG/jBKg23da4NA
	X7vZKMNf4RmoJ9cel3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCAV-0000000G3FA-1VZC;
	Fri, 12 Apr 2024 08:21:55 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCAR-0000000G3D2-0r20
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:21:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 398302000A;
	Fri, 12 Apr 2024 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712910107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nG1yXB1XEUMftHkpIGuydKh68O6oshqMzKBjchWUWDI=;
	b=HBJnRm4KJwgoJG/yw+/A62Pxo7TJ9fF307KWhyPxNW6XlyblM1LsFtqnIJVxKMW9pgFeKd
	Kyct1zJOUrAeuPp9jEG2vftsgxAfHY4hLp8fdpw0kGJrgK/AZjR0AJu6WsDT4bUlBIyNm8
	r4DB4j3ZWZ7q3V8wGji13KKrBdSQVS3IDqOnwbFG9I3mX02TVhSKRA0N7rIFdfuKilXL2r
	5whRGiSrTfRMO0zz4dgp+hITgM0yslOxNcdupC3yHfFSKcAD7WxXpEZwiO7idRhNg8h05e
	o7IsN5zlJQzuTBuBvp57Nr8M8b7z4IJx5fQfzGWhzmlkxxOaf5jr6kU41Ev7og==
Date: Fri, 12 Apr 2024 10:21:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wefu@redhat.com
Cc: jszhang@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, guoren@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 5/5] riscv: dts: thead: Add XuanTie TH1520 RTC device node
Message-ID: <20240412082144c4a3d9b2@mail.local>
References: <20240412080238.134191-1-wefu@redhat.com>
 <20240412080238.134191-6-wefu@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412080238.134191-6-wefu@redhat.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_012151_410135_A9E0B8FE 
X-CRM114-Status: GOOD (  13.25  )
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

On 12/04/2024 16:01:47+0800, wefu@redhat.com wrote:
> From: Wei Fu <wefu@redhat.com>
> 
> Add nodes for the XuanTie TH1520 RTC device node on the XuanTie TH1520 Soc.
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index cd6bc89a240c..62e588dbc942 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -463,6 +463,17 @@ timer7: timer@ffffc3303c {
>  			status = "disabled";
>  		};
>  
> +		rtc: rtc@fffff40000 {
> +			compatible = "snps,dw-apb-rtc";
> +			reg = <0xff 0xfff40000 0x0 0x1000>;
> +			interrupts = <74 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc_32k>;
> +			clock-names = "osc_32k";
> +			wakeup-source;

The wakeup-source and interrupts properties are mutually exclusive.

> +			prescaler = <0x8000>;
> +			status = "okay";
> +		};
> +
>  		gpio@fffff41000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xfff41000 0x0 0x1000>;
> -- 
> 2.44.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
