Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A4CCA5FED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 07:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Rx2gpsm3Nf8E6X32tm1hqVMQteT/9BFMFxPaeV0Fb4=; b=eDCgdF/dWypf1J
	YnD4msr4wFEYIDdYe4Em18mZm3BEb2K+MSsbYWfU1zgwl1fIYw278gWPQXknF/ufCRvmetmfjdoZ8
	lTV/Mfznk4qZ3abDOR4djePpK0uh6HAqx1HCH9shzn7uJ+XnY3C3K/xI8nG3z5Y2WwngWKWDGcwuM
	wNpN6SnSbKLyP3UBo4BM6xs3h2dM56raFAWg2U2nBLDa4spt3tot1/lgiu7/p0/WZBhGI6BZG26p7
	86CezjYu4bhHyv8iawgMCNOlBgNtCmw6Vs1G89j+UlQSkWuxGLISbN0EcNtu1D5YT8yoJz9KjFwCg
	/WYfp/QdHlSxsh3BhlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4vt-00000005iSQ-3FUs;
	Fri, 09 Oct 2026 07:22:22 +0000
Received: from azure-sdnproxy.icoremail.net ([52.187.6.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4vq-00000005iQ3-2THc
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 07:22:20 +0000
Received: from luyulin$eswincomputing.com ( [10.12.96.77] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 9 Oct 2026 15:22:00 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.77]
Date: Fri, 9 Oct 2026 15:22:00 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Yulin Lu" <luyulin@eswincomputing.com>
To: "Samuel Holland" <samuel.holland@sifive.com>
Cc: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Darshan Prajapati" <darshan.prajapati@einfochips.com>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>,
	"Andi Shyti" <andi.shyti@kernel.org>,
	"Mika Westerberg" <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	"Min Lin" <linmin@eswincomputing.com>
Subject: Re: Re: [PATCH v4 3/7] riscv: dts: eswin: eic7700: add pinctrl
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <b7428a65-b303-4ed4-bdc0-caf5a89b4712@sifive.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-4-pinkesh.vaghela@einfochips.com>
 <b7428a65-b303-4ed4-bdc0-caf5a89b4712@sifive.com>
MIME-Version: 1.0
Message-ID: <2dd7292f.aba1.1a11f8a5115.Coremail.luyulin@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgAnPqEYlshqYu6FAA--.13830W
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/1tbiAgEPA2rHxigjHQAB
	sz
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_002218_961954_C5241613 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

Hi Samuel,

...
> 
> > +	default-pins-grp {
> 
> My assumption is that there would be one group per peripheral (e.g. SPI bus,
> eMMC, UART) that groups all of the pins used by that peripheral, with multiple
> "-pins" nodes in the case that subsets of those pins need different pinconf
> settings.
> 

I think users can define groups based on their usage requirements (a group can
contain definitions for gpio, uart, i2c, and other pins), and referencing a group
will apply the configuration for all the pins in it. Alternatively, users can
reference individual pins directly to configure just one item. Which design to
choose is determined by the user's actual use case, so I have listed out the
definitions for all the pins here.

...
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > index b3a230870315..b16e3e28632c 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -349,6 +349,11 @@ gpioD: gpio-port@3 {
> >  			};
> >  		};
> >  
> > +		pinctrl: pinctrl@51600080 {
> > +			compatible = "eswin,eic7700-pinctrl";
> > +			reg = <0x0 0x51600080 0x0 0x1fff80>;
> > +		};
> > +
> >  		clk: clock-controller@51828000 {
> >  			compatible = "eswin,eic7700-clock";
> >  			reg = <0x0 0x51828000 0x0 0x300>;

We will change the other comments in next version.

Regards,
Yulin Lu
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
