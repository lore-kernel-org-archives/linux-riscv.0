Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613F6EFCE33
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfzHDF7IF9qeDvJr5H+xgv/pR1tB17mkODuUI+n9Ffc=; b=eWexVup5Grlk4i
	e1IayqMz3G/dGQEAqt5WMZf3eC3zOlRfQoKyBXKqKQDHc0yUFfKWFsKJrip2VsxkcimrJUjyBnsG7
	V7yA5hfjaTMfPFblSZhbK5IMoXluxpXzTHtVc01EDw1ybkh7k0cHpzXP+7VnFjPYUboSnvHegBhay
	V8+gonYYECYCVSwlwQXvf46g6vt+GsMOD4FryhlyeXxY9rgk6ecLepiMvErzeV4ksCBvH69NLjVPb
	QzGfeAyCbBYdK3qniAVLKrZxmQP6e3AkFT3fXwSh0G13AxVje/OwgPbG0ixyhg2E8wSgysnXgduOf
	peQ9XdVFYdV+YeHuwT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqU3-00000000DN1-2gWU;
	Wed, 04 Mar 2026 17:58:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqU0-00000000DMg-3OQo
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 17:58:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-483abed83b6so60632225e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 09:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647082; x=1773251882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rq5hYgf0faXia9cxwlRkLJL71Mpw7xbT+1o0WoNrPw=;
        b=g2xdjsUXAtpKCik9ffsIB65KK0vrkjM+9zSwP3SEREryNOLLxu/GCSAU40bKHR4ek3
         Kcf5smnTDtBRQ9x17u1bf6nYgelsn03YpQuQeIZjwZyJYwoVdj+Ksa5ADwyQyOmo66vA
         nT/uQgtY9oD0QWxqPca/rnyZFvh5oCwgAIe8JWIkruCXIRS31M0gQKRSZQa6qrfEow6a
         xp9nPH/8h9r8IuOk1fv//olSt3POT9mNiUUaO80uq0TmKJmuMrYqpgMjNn10kwQtKWPZ
         N5HMauuUGYvssK/Io3YiwtsjF2MtJuqwa9DTam3kaf/qIjI7gGsCoNjgrWXWUYrSu33S
         jz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647082; x=1773251882;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rq5hYgf0faXia9cxwlRkLJL71Mpw7xbT+1o0WoNrPw=;
        b=nIQLQaa8R48L0TZA7sEtkmnV6bbJMQsGvHbaMl5TSQnPxIq2WoyFn1V/Xm6QfWekyT
         LJe8IJoWUoR9jC+nKVY3JwJTjpKCJDHb39/iC2FAjLFtMuMthbvwpHzH8wXd1w9NPWA3
         WsX1dzENMpvPFG+gzpVTgAKazBHdFZGhl2l0YwDMxxnsgOgLDmy+dnj9tNS2sPnTUha1
         1hfh68Glm059gLYjjDAbdzk4gFMZQR2LX2HCfwyJdrkGY7K9hO4zozJVzSc2xIGMXtzN
         lmlpcFAAAFxtTaQg5ixnQLHSOXNEslFp9LDU9ml9fiV8QVXuhGoYe9xVrB0uiFGAQaoE
         3DxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8I8Iykd/dfyOM20pjMVEQf49ilaqXLVtlc4PTh1tW4YmZjZcL6yQg2t3scnVefHXn6IwGKt8WKtDFrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSBhpjbHphfjC3yKozr4ULiC6Ub+gv4okKD4odOE5ouccTlbSk
	Lg8quGPReqsF1kh6n1e/PDXfAfzJy+6Ie2/VmxNcV/vyyrPDBw2FiY++
X-Gm-Gg: ATEYQzyCfqIVoc4xKyYc0voDYE+R9auu/Y3nN2hLHEgy770G0q1ChUcBUXv51PD53AB
	BhNBidRObrzbjBlCr30Y3Cka3tx1GuFTWWwYNxSSj7BR4MljMrj1hsaLhcnEzq0QXHK0765XfaV
	+rKmtgnc2s+L7fOOY2IlrJwFgumDrGv3ur5oW5AKsPt7BDYqHgASHGfqMudbjk4HLfyf+RBNbD8
	vMszU6q2bcJHGWtuAbBrNAZpFCXe9HpZ2ryMHJK3TwoYXM8FctYKPsTPYhnoaABOMdzXmxYzwG4
	sNYVzj7TyH66YsUOROVktNA/qI546QigmIO9TzU2axWXA4wrzVvidgEuar4O0EPQDXXmfGN0/VE
	h0hwqDx6C5sHWPIa+uNu5VqL0l3U+d63Gh71lx6/VZiNTvWSOvEg5NqSHLHdG5G8ylZqJ5+2W5R
	HxFIHE1aQFJGvCXUswUweYJOeP10PGBvRSpj2GmWqV2iXTDwwBjzEM4pTXxpd1bXAjQ+bX5g==
X-Received: by 2002:a05:600c:c163:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-485198749b6mr51102325e9.21.1772647082156;
        Wed, 04 Mar 2026 09:58:02 -0800 (PST)
Received: from anton.local (bba-217-164-166-37.alshamil.net.ae. [217.164.166.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851acf9c31sm13254295e9.12.2026.03.04.09.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:58:01 -0800 (PST)
Date: Wed, 4 Mar 2026 21:57:56 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
Message-ID: <aahuz5KJLL_rAZTH@anton.local>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
 <aZ939evsOs6nCd5I@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ939evsOs6nCd5I@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_095804_868377_62A30D11 
X-CRM114-Status: GOOD (  21.61  )
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

On Thu, Feb 26, 2026 at 06:32:27AM +0400, Inochi Amaoto wrote:

> > +#define DMA_CPU_A53		0
> > +#define DMA_CPU_C906_0	1
> > +#define DMA_CPU_C906_1	2
> > +
> > +#endif // _SOPHGO_CV18XX_DMAMUX
> > diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > index 06b0ce5a2db7..ebe5e8113939 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> > @@ -8,6 +8,7 @@
> >  #include <dt-bindings/gpio/gpio.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include "cv18xx-reset.h"
> > +#include "cv180x-dmamux.h"
> >  
> >  / {
> >  	#address-cells = <1>;
> > @@ -448,6 +449,60 @@ usb: usb@4340000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		i2s0: i2s@4100000 {
> > +			compatible = "sophgo,cv1800b-i2s";
> > +			reg = <0x04100000 0x1000>;
> > +			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
> > +			clock-names = "i2s", "mclk";
> > +			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
> > +			dma-names = "rx", "tx";
> > +			status = "disabled";
> > +		};
> 
> This magic number 1 is bind to the RISC-V cores, I think we should add a
> macro DMA_CPU_ID into CPU file to route the CPU id to real cores.
> Or, just let the borad dts configure which dma is enabled.

Hi, Inochi. Sorry for delay, I've missed the messages somehow. 
I'm not sure what is the best option TBH. 
If the problem is with the magic number, there are constants for this in your
file:
#define DMA_CPU_A53        0
#define DMA_CPU_C906_0     1
#define DMA_CPU_C906_1     2

So I could use them. 

If the problem with hardcoding the CPU - it is little bit more tricky. 
Ths commit is in the riscv branch so we could not use ID 0 at all.
Unless you want it to be more generic.
From my understanding we could not boot from CPUID 2. (may be i'm wrong
here) If it is correct, it means the whole setup will only work on CPU
1. 

In any case I will follow your suggestion. I agree, leaving this with 
the magic number is not good. 


Second question: 
Do you want me to resubmit this change as A separate patch as the rest
of this patch was applied? 


> 
> Regards,
> Inochi
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
