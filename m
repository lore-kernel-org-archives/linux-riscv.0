Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA6EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 22:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbyaH2n4Qmsnm/b+KIv8YZdQZW4FYoLIydxPy0hqjtI=; b=feK5IM6K8WQHk9
	Q8YIEkhVdh6lboWfPMPMtpaHPoFliNjaxWYbL3vVDQ5BDxZ0P6NUG730XJf2N2lynHfArl9WLVpPT
	x2Ptcu1pdgjawFXZHygq6AmdZXUF2Ke8daXZftJAYG3FL9fLVwLxi240MCygzoMZt9K/QH+ikJ+Qp
	NISieddj3M6+7ADHnxVG5Hsrrod+JUE05HuWi4L0DOvOxQdWO0J8IBjuMA1Ewy9UBFqlXMmqE3vZa
	1XKdotGwP+xOs83fsPCgwn3bg/epV/WpBmGSydqU4+H+isM6eA0dkchk2ULNxz59E7VT97ZJMt4Cl
	CEN4Qv7/2CsukSs/0ooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG7KK-005bt9-8L; Fri, 04 Feb 2022 22:45:12 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG7KH-005bsY-6Q
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 22:45:10 +0000
Received: by mail-oi1-f173.google.com with SMTP id q186so10198765oih.8
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 14:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WTbKoINrrZSrW+wbotNxY+1xcFSgxHlSIEBZgkY7L2c=;
 b=b7QG+oOns+bTLXGe3nrpbMu7m/E3FGlxQk2pSrEvgqjOYFmsyYR/WrhOSKmVeCl+rg
 0ejJOKdCIUY/3N/uOmcoyVIoCZ/5lFly3X9Q5ZoXJx2FVVhP2CDAzhgM5jIvsYbcX63L
 vHi8E0OMpHYmNq6aUWOFj4b7gJpaIpXfwWRHHWS+d6JqGogzfxJnmTIMvWaaHXz1C+UI
 nCYiqbhDTRCUKVkQNMGE/Bxvt9QwHjl3SCFc9kfW55TuFfRKeQsOb3XknRC1W7OO0+0y
 ELRuyUzkaSPpUF/Qa0V++FxvdLdeZgxWKmj24Cyv34p5WXCekdxs1OmYMInXw44Mq45J
 LV7Q==
X-Gm-Message-State: AOAM5301MP68hhHtD1qzNuyTe0PLKyXIuAyEo6nXloC9WnmcdGaopaYz
 zjdHwkJtlOOKB19qb1KV5A==
X-Google-Smtp-Source: ABdhPJw3TK/QO+UjLoDVWc5SsGv0teSPAjocM1bNUMCwJWW4qvEEP1P3eKqSQkQ8AK5Sbp2Baot7hw==
X-Received: by 2002:aca:dac2:: with SMTP id r185mr2389606oig.152.1644014708321; 
 Fri, 04 Feb 2022 14:45:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s64sm1248611oos.0.2022.02.04.14.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:45:07 -0800 (PST)
Received: (nullmailer pid 3322192 invoked by uid 1000);
 Fri, 04 Feb 2022 22:45:06 -0000
Date: Fri, 4 Feb 2022 16:45:06 -0600
From: Rob Herring <robh@kernel.org>
To: Conor.Dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
 bin.meng@windriver.com, heiko@sntech.de, Lewis.Hanly@microchip.com,
 Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com, atishp@rivosinc.com
Subject: Re: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Message-ID: <Yf2scqKFRFwWBIlC@robh.at.kernel.org>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-4-conor.dooley@microchip.com>
 <CAL_JsqJkFaGmpAi3eEUROWyOr_PQEZ209TneLhsOkpf3w8jQdw@mail.gmail.com>
 <84e1d43f-4d3d-1501-5bc1-c982272e1ce3@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84e1d43f-4d3d-1501-5bc1-c982272e1ce3@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_144509_265918_4E6C05AE 
X-CRM114-Status: GOOD (  18.92  )
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

On Mon, Jan 31, 2022 at 03:55:32PM +0000, Conor.Dooley@microchip.com wrote:
> On 31/01/2022 15:39, Rob Herring wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Mon, Jan 31, 2022 at 5:45 AM <conor.dooley@microchip.com> wrote:
> >>
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add device tree bindings for the i2c controller on
> >> the Microchip PolarFire SoC.
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >>
> > 
> > There should not be a blank line here.
> > 
> > Also, tags should be in chronological order typically. If Daire sent
> > this patch out with my tag, then the order is correct. If I gave it on
> > a version you sent, then it goes between Daire's and your S-o-b which
> > is the case here.
> Oh, thanks. Probably been messing this up right/left/centre.
> 
> On another note, I know I'm still missing a RB still on some of the 
> bindings, but what is the acceptance path for this series?
> Any left over bindings not taken by subsystems via yourself and the dts 
> changes via Palmer's tree?

They should go via subsystems. I can take if you want, but not with 
missing dependencies. I need my tree working.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
