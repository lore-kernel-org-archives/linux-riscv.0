Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4CCC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqwc/LvEsbveM6LFjm3QzRveSCcbWBXVzi/Gy5jyfes=; b=OUhRL3tERX6yGt
	9QO6htJhxshUPe1enWzIQ1foPu9hjn33gL4lBTPQpFv3HuNQehrSi2cyASwj6A6fYL646pJZwBgjy
	pz2/x3yvMuiDLDPsm4jbII/l02GxKKWdF/cP951rxOnw85qRA42IjaYgzfyoPhtuk15UB6hMJaWrx
	Rsbv6QY/64XqGokg7pzfw+1kOlIwl1uLVLOeYfHZusOO2g5/a+pZdcUyYe+wAN8jffXZilM91xxzG
	kcvhaovkse7ByCA6/09adVLJBzjnW/xE0u/EPq0r946PKjC/IRio3S4XQYidYwGzJkHZb44TSec67
	B6sipsDTmGRUcXdbEzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFFwM-00BJA3-1D;
	Mon, 18 Dec 2023 15:53:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFFwJ-00BJ8g-1J;
	Mon, 18 Dec 2023 15:53:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C60E92F4;
	Mon, 18 Dec 2023 07:54:37 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B004F3F5A1;
	Mon, 18 Dec 2023 07:53:50 -0800 (PST)
Date: Mon, 18 Dec 2023 15:53:45 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon
 <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/5] cpufreq: sun50i: Add D1 support
Message-ID: <20231218155345.476e71ea@donnerap.manchester.arm.com>
In-Reply-To: <20231218-blabber-slapstick-ab7ae45af019@spud>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
	<20231218110543.64044-4-fusibrandon13@gmail.com>
	<20231218-blabber-slapstick-ab7ae45af019@spud>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_075355_508907_95BB1341 
X-CRM114-Status: GOOD (  21.09  )
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

On Mon, 18 Dec 2023 14:55:30 +0000
Conor Dooley <conor@kernel.org> wrote:

Hi,

> On Mon, Dec 18, 2023 at 12:05:41PM +0100, Brandon Cheo Fusi wrote:
> > Add support for D1 based devices to the Allwinner H6 cpufreq
> > driver
> > 
> > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > ---
> >  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > index 32a9c88f8..ccf83780f 100644
> > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > @@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
> >  
> >  static const struct of_device_id sun50i_cpufreq_match_list[] = {
> >  	{ .compatible = "allwinner,sun50i-h6" },
> > +	{ .compatible = "allwinner,sun20i-d1" },  
> 
> I thought the feedback in v2 was to drop this change, since the
> devicetree has the sun50i-h6 as a fallback compatible?

Well, this is the *board* (fallback) compatible string, so we cannot assign
it as we like. The whole (existing) scheme is admittedly somewhat weird,
because we not only match on a particular device compatible
(like allwinner,sun20i-d1-operating-points), but also need to blocklist and
re-match some parts against the *board compatible*, owing to the
cpufreq-dt driver. The board name is basically used as a placeholder to
find out the SoC, because there is (or was?) no other good way - the
CPU DT nodes don't work for this. Back when this was introduced, this was
the "least worst" solution.

I don't remember all the details, and didn't find time yet to look into
this in more detail, but fixing this is non-trivial. If this isn't 6.8
material, I might have a look at this later this week/month.

Cheers,
Andre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
