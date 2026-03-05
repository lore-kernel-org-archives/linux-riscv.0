Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E2EFCE22
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 00:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WwS687bb+DNcTLLZutqqkIvlwKUbswH8TGjbN3xOxE=; b=QW+rlsAN0sfXtJ
	yvA3kxjzL9nrP87lE3KwrisKt4XVpBVl1PERPVMu8+dFU6Jq+w4CCKSj3klcdHlM5y9Hay8fbr8WX
	cNIMNX8/IC2EHexxfZjGYSKe3PB/bWeZd1jeEnw39mrarnJclyfCjRdIVNAaVfAmwiv4C66sS2z2I
	ULxmOmxHtfa79hwTuyumg1D51gPs+RRIq7vHA0pCcy7oI6wU3rsQ6YStKg8IlPOvUmTIRf9ru7UWH
	t0I0aEEP4P0yRDsz55L5juC2BzjLBnHU6EWdunsNIziv4wwD0jh5jPB9/3ZWaI5AUkBhgmzBm+IjT
	FVTgDMOXTxEhmIGEx7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxwAj-00000000gF4-38ls;
	Thu, 05 Mar 2026 00:02:33 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxwAg-00000000gES-1NpA
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 00:02:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c738d1fa6f1so99521a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 16:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772668949; x=1773273749; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fndfnkiJRWkhuW+xvek/3orGGPPXnFwo/ptLxjPpUVM=;
        b=Azgd+GeII1fUlQBQDs0Ex8ftSR05R5/0UvDl/f0jisL5arVV5uDHr0gpXK/gv7xLRx
         vxRkl4Y1wWwy+FKykqLawKSnXMBwu8e4QAAxlvnjHdITP4owpkE7A/aG9Y8306vK1hUu
         /6SA/Tc9lPzv9DXBNWHwDHBAiRPZzsbXnCz/7Ta3kh3OttHCbOTEx6kf1+aObBMkW6r7
         9rJYpyti+d2M+YuQoKjZSq/uQtnJvD1KAqD28Dx8NGHNoBxRmJgaGzV8XoR/TyEusZll
         OKFggYMP+XVbhonxCa7qdvETDwltf3yg6QBYTC02rm43B4bWITD3Yzr7atEciZtpaGA/
         JsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668949; x=1773273749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fndfnkiJRWkhuW+xvek/3orGGPPXnFwo/ptLxjPpUVM=;
        b=v/iR4feA1tk6xa0A1aoSp99PjAMOuOkocehjcQah0ivt9XEN+2tSx1kljCAgbISe+H
         8CoH+3GSHMAploU3hpxU57eggm8yJHBTOGGHWdziU2ZG7AwRkvB0/DeTbrEKAmht8B1C
         wsvHNUW9SFl8G8pY0sBcJ9Fq0PaLTTi++cqxVaD33t8t7OZywstZ3tlA+URUJMUbup7k
         u/MWMHlXf4Q0NrpYrNM5lH8a7cTZda4F3qgbLRmiUBNq9GJUs1Oi5maXv1uKAVaq/gxc
         UZgoDoA920pe23YwoyHOMLETL16nR1xC+lW4eC69JvjJj5AfGjCWeFJgYL3ZR1/gMzTl
         2OFg==
X-Forwarded-Encrypted: i=1; AJvYcCV/AgFcT9EIKI1+JGxNfSFxEDNSYPunfYNkKKG0hFZ5cUisvCNogosUKBys+TsWur0k8YmH9OJtAi0I2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdotK+8vBW01zNvFlgrjomubOP5rKWxoCeENzH7ptCmYdNlNwk
	w+UJUnLp5WKWZiKsQleyda1pPTL6R9eilzcVOGhgQwonLlwTDiICJ/E7
X-Gm-Gg: ATEYQzzfUaOU4ENCwF+vkQC+RAJozi4iVTrhbamEkkst9fPGUCVA//ZjI+IMmEu6wUl
	TrPz+mNGfI3GbomiKs+TI4fLJmfUlorgMOqe/Ccf83fk3Ll55yWiKU0sU9Dgk73dtA0tsZg46Tz
	vz7+i3cL+w4b7LUVSVdzcRh02uZqjoiqttJnaNDZ+YkrFjD5nD8gsSQsYVrACDXKrNFWg3uazZr
	Tl66AfzB82vaueGT/V6ExMakdL+xn89eJpeUIKsJFEs3Z9IZNX+Ro72sMjRMKv3Vr1NTYCpmkE3
	i7F0qu/8VvaysuPoSkFvC2lgUtixPVp9DPxbC8BgOW9sbiOd5a7iPYFybUp4ojhFw4LbahKQ3YP
	puVn7+7z5chvo9uD+dmm2sWm80EhyyrDHLmLpcLKA7/GiyX8RCJecQ2bECEel4GHjfQut0pC57W
	Fvyw3akXEKEgHvoeeNHlZGSYE=
X-Received: by 2002:a17:90b:1a91:b0:359:7c55:c160 with SMTP id 98e67ed59e1d1-359a69da7d6mr3299580a91.13.1772668949367;
        Wed, 04 Mar 2026 16:02:29 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359aa1ff041sm1177382a91.3.2026.03.04.16.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:02:28 -0800 (PST)
Date: Thu, 5 Mar 2026 08:01:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aajGmn3KsZGsZlhz@inochi.infowork>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
 <aZ939evsOs6nCd5I@inochi.infowork>
 <aahuz5KJLL_rAZTH@anton.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aahuz5KJLL_rAZTH@anton.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_160230_628935_B5205096 
X-CRM114-Status: GOOD (  31.89  )
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

On Wed, Mar 04, 2026 at 09:57:56PM +0400, Anton D. Stavinskii wrote:
> On Thu, Feb 26, 2026 at 06:32:27AM +0400, Inochi Amaoto wrote:
> 
> > > +#define DMA_CPU_A53		0
> > > +#define DMA_CPU_C906_0	1
> > > +#define DMA_CPU_C906_1	2
> > > +
> > > +#endif // _SOPHGO_CV18XX_DMAMUX
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > > index 06b0ce5a2db7..ebe5e8113939 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > > @@ -8,6 +8,7 @@
> > >  #include <dt-bindings/gpio/gpio.h>
> > >  #include <dt-bindings/interrupt-controller/irq.h>
> > >  #include "cv18xx-reset.h"
> > > +#include "cv180x-dmamux.h"
> > >  
> > >  / {
> > >  	#address-cells = <1>;
> > > @@ -448,6 +449,60 @@ usb: usb@4340000 {
> > >  			status = "disabled";
> > >  		};
> > >  
> > > +		i2s0: i2s@4100000 {
> > > +			compatible = "sophgo,cv1800b-i2s";
> > > +			reg = <0x04100000 0x1000>;
> > > +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> > > +			clock-names = "i2s", "mclk";
> > > +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> > > +			dma-names = "rx", "tx";
> > > +			status = "disabled";
> > > +		};
> > 
> > This magic number 1 is bind to the RISC-V cores, I think we should add a
> > macro DMA_CPU_ID into CPU file to route the CPU id to real cores.
> > Or, just let the borad dts configure which dma is enabled.
> 
> Hi, Inochi. Sorry for delay, I've missed the messages somehow. 
> I'm not sure what is the best option TBH. 
> If the problem is with the magic number, there are constants for this in your
> file:
> #define DMA_CPU_A53        0
> #define DMA_CPU_C906_0     1
> #define DMA_CPU_C906_1     2
> 
> So I could use them. 
> 
> If the problem with hardcoding the CPU - it is little bit more tricky. 
> Ths commit is in the riscv branch so we could not use ID 0 at all.
> Unless you want it to be more generic.
> From my understanding we could not boot from CPUID 2. (may be i'm wrong
> here) If it is correct, it means the whole setup will only work on CPU
> 1. 
> 

Yes, that's true, the only boot cores are 0 (A53) or 1 (C906_0).
And You only need to take care of these two cores. And the ARM
DTS you can just find it in the arch/arm64/boot/dts/sophgo.

Or, just let the board determine the DMA required, as the DMA
channel is shared across many devices. So it may be better to
not allocate them without enabling the device.

> In any case I will follow your suggestion. I agree, leaving this with 
> the magic number is not good. 
> 
> 
> Second question: 
> Do you want me to resubmit this change as A separate patch as the rest
> of this patch was applied? 
> 
> 

A separate patch or a new version with this single patch are both
fine to me. But you are always required to add the changelog and
link to the old versions. Otherwise, others are lost the information
about this.

Regards,
INochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
