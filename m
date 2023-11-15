Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6220EC072A2
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kPPhk9XiLzSDAw7/1Zv4HdapTeJOJGRGtNaXnPSMXE=; b=tsAKcJk6lNz8A/
	2xAkNhMWpq3LGmiF7fEH03NNF857CAvpiRCtPqfKgA0RbnUbAVt84fIWBkYeQYe+lVcOKI0eU6DMM
	hudYklb+DvyqfHrBBYvFTk1jYfkqbQM4pk6ZXSiyIWJJhtjG6HcLb0Ezu7TkSXbuLmxVuRSTeJ6jO
	iykjEWYyxsJOpIb083UPrTwKAWvzitO649a1qInBn65VO/x4bqdf6I7rXlFPbXVCvwo1FuOFeGMsV
	abyTEMYx9AUbHf2hulDKF3nJtosrt9hUSWigZ/z2EtUARN183AXH9sBYhrg8eIzCvZFbV0oLuT+a2
	/l/gIQKBs8Jj0KwEpGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Hxb-001Cei-14;
	Wed, 15 Nov 2023 15:37:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HxX-001Cdt-31
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 15:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 81619B81A74;
	Wed, 15 Nov 2023 15:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E639AC433C7;
	Wed, 15 Nov 2023 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700062661;
	bh=AiZnGVVWhHwGhN3Vdq+4LuWAKRDxyRiM/b2iR4+LgQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2sgtua+jAxLQDlhigNd9qWhuSQcpDU43jP4CcDB1Xq71GjNQ391gHqlV7j3GScYt
	 dilsn+4LNuLQI9oRCQNTjdELOSVjJEvRuZJ28YjPiYD/4NHQu9W9JOkvGWuiwIrG+a
	 fARoieQBeBRx5/8jaxVNNPrrROlUd3ISEO4fF+zudf14d7n/EhajnTUDZyk+OfUGDH
	 dfAPo+XpSpI77TUtfZRL2KPFQ61w7rI2gBJH0rdGBKuV72qhXkEUDRRG3GlmulR3VV
	 lan9guIC+RXV8vacMWIbidYJUEtOMdiptsr2XYHdJWYvn66/5YG/9OvsdAw619Jwg6
	 9Mbw0XWrJwHcw==
Date: Wed, 15 Nov 2023 23:25:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Conor Dooley <conor@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 5/7] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
Message-ID: <ZVTi3lvSQEXeTbUN@xhacker>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
 <20231114-th1520-mmc-v6-5-3273c661a571@baylibre.com>
 <20231114-starring-swarm-0e1b641f888c@squawk>
 <ZVP1AoosripWj3gs@x1>
 <ZVTiFVHSsBxk3pLH@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZVTiFVHSsBxk3pLH@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_073744_120556_F8C25BBE 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, Nov 15, 2023 at 11:22:03PM +0800, Jisheng Zhang wrote:
> On Tue, Nov 14, 2023 at 05:30:26PM -0500, Drew Fustini wrote:
> > On Tue, Nov 14, 2023 at 09:27:44PM +0000, Conor Dooley wrote:
> > > On Tue, Nov 14, 2023 at 04:07:59PM -0500, Drew Fustini wrote:
> > > 
> > > > +	sdhci_clk: sdhci-clock {
> > > > +		compatible = "fixed-clock";
> > > > +		clock-frequency = <198000000>;
> > > > +		clock-output-names = "sdhci_clk";
> > > > +		#clock-cells = <0>;
> > > > +	};
> > > 
> > > If only you had a clock driver to provide these...
> > > 
> > > Is someone working on a resubmission of the clock driver?
> > 
> > Yangtao Li posted an initial revision back [1] in May but I don't think
> > there has been any follow up. It is for sure something we need to have
> > in mainline so I'll take a look at getting that effort going again.
> 
> Hi Drew,
> 
> Based on Yangtao's version, I cooked an updated version in last
> development window but still can't complete it and met some issues
> which need the clk/pll register document.
> IIRC, the document was released a few days ago before soc tree frozen.
> 
> It's nice if you can continue the effort! I'll read the sdhci driver
> soon.

PS: I can send my updated version to you for reference tomorrow.

> 
> Thanks
> > 
> > Drew
> > 
> > [1] https://lore.kernel.org/linux-riscv/20230515054402.27633-1-frank.li@vivo.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
