Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4CDC433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 18:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fiFu1u34v97OYMgZdEJdPmRW31kBxotdaUzIb9qp3w=; b=h0Cqx2XyinYAPx
	aeo6CJP2v2ZlBUopBCvS88cQLgbqwWutRQWC4NkvhU15SlMyBaVSusDmoNKiuhpHOJ7yqQ4fj0YnV
	/ZPNGodHlvNuYjwn7Ad+HEFhX4RO1pFdLdDlDu0paAHdqzhtWaA0oTYaFQLFZyDNZaloNUg2byyp8
	sHHwFwu0V95VytUCVMUVCdYzp11NHlejWTU5xxXTrvePlHnVR4oDpAobPulYTlkGQ2Y/JgPBgCqe1
	tYVc7ze/tEETR3Pkm4fWbHVEXTWVUEq4Sgb8iROjuDxesa6n2C2AJaV8hgUrDt4jACwFIqyOXOjOb
	RSERzLiPcac0et2GaAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohEFe-00Dwio-KM; Sat, 08 Oct 2022 18:08:42 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohEFa-00Dwhx-Er
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 18:08:40 +0000
X-QQ-mid: bizesmtp80t1665252455teb5lj67
Received: from [192.168.0.179] ( [113.85.219.225])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 09 Oct 2022 02:07:32 +0800 (CST)
X-QQ-SSF: 0100000000000070B000B00A0000000
X-QQ-FEAT: jbaoaN/hLKIC5Yj0V619849HMTLVRPFKWybSzNavB7OliimAOyl1ZwZtGg9e8
	qwWewiQWj4ugjzP4iZ12K1krk/nn6bbb+Ux+60fHDpHJM/NUhqM+kKexBclIBdU89f1f3OE
	73escGs/FVIiTvhkD34943Am9PYMQz3B6NZViXJ4ZhpmLBLK6tOUXEtKoTIHQnfE/cKuZZS
	r38BoyBxUZeLJ3PtCiJTg718u3cK0WWXtfO6zmuj/OCuzK8BaSuD3IFd4znibi33aAM7tzz
	uEb7iiBfn6JzoYVED9oKy4CqhzNzlsFDdF84vKrNmOlDX8CyCz70DLtbLIYfZ02W355lSGY
	v9s88bVWo1NYpOWs8N/yQAA+I+C6SXNGXBsIdx/
X-QQ-GoodBg: 0
Message-ID: <D431E7AF8892354C+5445265a-92e0-59eb-b0ab-98c053543015@linux.starfivetech.com>
Date: Sun, 9 Oct 2022 02:07:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 05/30] soc: sifive: l2 cache: Convert to platform
 driver
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Ben Dooks <ben.dooks@sifive.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org,
 Zong Li <zong.li@sifive.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929143225.17907-6-hal.feng@linux.starfivetech.com>
 <40d0abb6-88dc-d315-f768-27a623f60986@sifive.com>
 <CAJM55Z-PzvM_-_6jTWX+Jyy2FQ3TJdh4uYj0evpktnEENHL6WA@mail.gmail.com>
 <4d8a199b-f22a-a421-aae4-64e538cb97f4@codethink.co.uk>
 <CAJM55Z8QN1CeknrP9nyh9ei4EFQT_VKfTTi6uH5ssE3rqW5OdA@mail.gmail.com>
 <Yz2PDy9dkuwqyrR4@spud>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <Yz2PDy9dkuwqyrR4@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_110838_850856_D62B4150 
X-CRM114-Status: GOOD (  34.17  )
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

On Wed, 5 Oct 2022 15:05:03 +0100, Conor Dooley wrote:
> On Wed, Oct 05, 2022 at 03:55:17PM +0200, Emil Renner Berthing wrote:
> > On Wed, 5 Oct 2022 at 15:48, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> > >
> > > On 05/10/2022 14:44, Emil Renner Berthing wrote:
> > > > On Thu, 29 Sept 2022 at 19:59, Ben Dooks <ben.dooks@sifive.com> wrote:
> > > >>
> > > >> On 29/09/2022 15:32, Hal Feng wrote:
> > > >>> From: Emil Renner Berthing <kernel@esmil.dk>
> > > >>>
> > > >>> This converts the driver to use the builtin_platform_driver_probe macro
> > > >>> to initialize the driver. This macro ends up calling device_initcall as
> > > >>> was used previously, but also allocates a platform device which gives us
> > > >>> access to much nicer APIs such as platform_ioremap_resource,
> > > >>> platform_get_irq and dev_err_probe.
> > > >>
> > > >> This is useful, but also there are other changes currently being sorted
> > > >> out by Zong Li (cc'd into this message) which have already been reviewed
> > > >> and are hopefully queued for the next kernel release.
> > > >>
> > > >>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > >>> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > > >
> > > > I'm ok with something like this being merged, but please note that if
> > > > we ever want to support the JH7100 which uses registers in this
> > > > peripheral to flush the cache for its non-coherent DMAs then this
> > > > driver needs to be loaded before other peripherals or we will trigger
> > > > the 2nd warning in arch/riscv/mm/dma-noncoherent.c. I'm not sure we
> > > > can do that when it's a platform driver. See this patch for an
> > > > alternative to support the JH71x0s:
> > > > https://github.com/esmil/linux/commit/9c5b29da56ae29159c9572c5bb195fe3a1b535c5
> > > >
> > > > /Emil
> > >
> > > Are you replying to your own patch that does the conversion to
> > > platform driver and then saying that it could actually cause
> > > issues?
> > 
> > Yes, I can see it seems odd, but this patch lived for a while in the
> > kernel repo for the JH7100 until I rebased on 6.0-rc1 and realized the
> > above.
> > Hal Feng must have based his patches on a version of the code before
> > that when preparing this series.
> > 
> > > I'm all for dropping this for the moment and keeping the old
> > > early init for the ccache.
> > 
> > Cool.
> 
> FWIW, if converting to a platform driver will inhibit using the driver
> for doing non-coherent stuff I would like to NAK the patch :)
> 

Yeah, I agree, and this patch will be dropped on the next version.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
