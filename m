Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF627C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgDfrtSsPYuN3QMoL8KxY3KwvV/9d2EkLo6slFRvyXs=; b=NCkR+BEG9uNcXG
	kDtbPf+HDmNkhhkHtZhHUXSDf4NHNTckn2DWZA4Mn7mAeBKKgbov6KaGDGPRMvT89jgv76foG4qQS
	VqtYadnVcCKjuDJdwm6iuoPs0bVWr8CRWEf4UpYyXgyXRHlgn+6EutVbIbREh0NMEWAbxnkEhu4XG
	QEKT78qMDv6DSDEHb8mcoZM/zyeBtiM5DIEs1gLoHrORWqODsLk4o249uwpJGWk8s3FWVGL7+it6e
	BlXLnOl1SGb7MoUeQqYx9Mx4QtZTvZRWDqi7pB8Aut6iTwB7WXn19hdU0iot8A7sXUMAmb/K5cNc+
	yAy6GE8rztUEWyyOETSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAvIJ-002qjZ-TW; Mon, 11 Jul 2022 15:25:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAvI8-002qfg-PQ; Mon, 11 Jul 2022 15:25:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F3A91596;
	Mon, 11 Jul 2022 08:25:41 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56F7F3F70D;
	Mon, 11 Jul 2022 08:25:35 -0700 (PDT)
Date: Mon, 11 Jul 2022 16:24:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <mail@conchuod.ie>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>, Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: Re: [PATCH v3 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Message-ID: <20220711152423.djfqk6wbhmrshbkr@bogus>
References: <20220709152354.2856586-1-mail@conchuod.ie>
 <20220709152354.2856586-2-mail@conchuod.ie>
 <20220711143542.nlq6a5nuh4nouomo@bogus>
 <Ysw4voXuz+tcSKhf@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ysw4voXuz+tcSKhf@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_082544_941172_1DFEAC2E 
X-CRM114-Status: GOOD (  23.99  )
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

On Mon, Jul 11, 2022 at 04:50:38PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 11, 2022 at 03:35:42PM +0100, Sudeep Holla wrote:
> > On Sat, Jul 09, 2022 at 04:23:54PM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > arm64's method of defining a default cpu topology requires only minimal
> > > changes to apply to RISC-V also. The current arm64 implementation exits
> > > early in a uniprocessor configuration by reading MPIDR & claiming that
> > > uniprocessor can rely on the default values.
> > > 
> > > This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
> > > topology: Stop using MPIDR for topology information")', because the
> > > current code just assigns default values for multiprocessor systems.
> > > 
> > > With the MPIDR references removed, store_cpu_topolgy() can be moved to
> > > the common arch_topology code.
> > >
> > 
> > Looks good. FWIW,
> > 
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > 
> > > CC: stable@vger.kernel.org
> > 
> > However, while I understand the reason why this is needed in stable trees
> > for RISC-V, I am not sure if we want this for stable tree at-least on arm64.
> > I leave that part to Greg and Will.
> 
> Why would it be good for one arch but bad for another?

Not really bad as such. Just needs testing and must not change much ideally,
but it really depends on which stable trees we will target and what is the
original state there. As mentioned in the commit, this changed a bit around
v5.8/9 on arm64 and not sure what kernels RISC-V needs this. There could
be some surprises on some Andriod platforms but that is something we can
look at when if and when there are complaints.

I am in general not sure what is the -stable tree rules is such situation and
hence made the noise so that we are aware that we may need more work than just
backporting this patch. Also this is just my opinion. If we decide to backport
esp. to kernels older than the one containing 3102bc0e6ac7, then arm64 may need
more changes or probably we can pull that commit if that makes it easier. Based
on what is decided and what are the targeted -stable trees, we can dig deeper.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
