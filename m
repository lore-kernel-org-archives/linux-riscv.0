Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF0DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 18:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaP4M7IPd3uVkQfdD903ydc2yZaionfcK00l7eCadEo=; b=Y9KHZ2OJdmwBUz
	K1FIAq6dbO1G3nLGkoQi+SafUyzQ+Ee1Lj7GTelNFq0/UTPd8YBGIBN+n6JLz5fsP2qcxgHnW2g4n
	ogXmdwQF7pUpql+RwuvAx9WPUSq42RBaYoPrVXDjFv+svA3Xj95i2twySvPnxY1sYFkFj5sGFHWg7
	m7urIOyCWyffcOedsvz7Bp/3BuiGsG6/vACQv0ewjtoSj2vNKP21dqmJdsfgBCkmfuNxdrrwbviiP
	j9AZ7V+ghO7ObiZ/sHQUtXQL+svqlCa4VLMATQ8Iy+h8wheqWTyBDcRpRiBvoHLRV71A+2z6muIdN
	wZLvzxPdP6c5+WwxOR9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxCEw-00FHWf-77; Tue, 14 Dec 2021 18:09:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxCEt-00FHW7-RV
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 18:09:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D0EA6167D;
 Tue, 14 Dec 2021 18:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2B5C34604;
 Tue, 14 Dec 2021 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639505362;
 bh=/xqmz9lrxbUEJFXEd4jkNP8kMOMxCqRlgDKcoEaYJRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VxMDAO85DxyMrysBXtPs7Kwg2fSgTWAGbGaytuHSJODT8PEUkCJxjE5gjLHbqe3s6
 FrDQbLDBChlHlolf8GbH2NZwVHXsD1z8GPjwGL+WN7uIDJ2op60vCXtIRREvf968Xw
 ggiLP1hUoMuDjL4c72wWQr7XcMQOPuYXYwF5G7YZsV+GFUxk7waUZJwCPLTRBcnoiF
 vucANR9tDIxfLqpoH+mOWw8m9Za2hUANY88LpMsng0H2zTwQeB7u8wDQC3+L4lmPAf
 u1+gmvIhTJxHNU7DSh8ftlSzvGRtEkkaCyqCi7kTola39ontbSHHOBiH2Scewm4YaE
 l2J4Gyzxg9F9w==
Date: Tue, 14 Dec 2021 18:09:15 +0000
From: Will Deacon <will@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atishp@rivosinc.com>, mark.rutland@arm.com,
 linux-kernel@vger.kernel.org, anup.patel@wdc.com,
 david.abdurachmanov@sifive.com, devicetree@vger.kernel.org,
 greentime.hu@sifive.com, guoren@linux.alibaba.com,
 xypron.glpk@gmx.de, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 mick@ics.forth.gr, Paul Walmsley <paul.walmsley@sifive.com>,
 robh+dt@kernel.org, vincent.chen@sifive.com
Subject: Re: [v4 00/11] Improve RISC-V Perf support using SBI PMU and
 sscofpmf extension
Message-ID: <20211214180915.GA15780@willie-the-truck>
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <mhng-b8ad045e-2022-4e7d-8e64-ab4cc09c15a7@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-b8ad045e-2022-4e7d-8e64-ab4cc09c15a7@palmer-ri-x1c9>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_100923_988887_01B2E565 
X-CRM114-Status: GOOD (  32.50  )
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

On Mon, Dec 13, 2021 at 05:51:28PM -0800, Palmer Dabbelt wrote:
> On Mon, 25 Oct 2021 12:53:39 PDT (-0700), Atish Patra wrote:
> > This series adds improved perf support for RISC-V based system using
> > SBI PMU extension[1] and Sscofpmf extension[2]. The SBI PMU extension allows
> > the kernel to program the counters for different events and start/stop counters
> > while the sscofpmf extension allows the counter overflow interrupt and privilege
> > mode filtering. An hardware platform can leverage SBI PMU extension without
> > the sscofpmf extension if it supports mcountinhibit and mcounteren. However,
> > the reverse is not true. With both of these extension enabled, a platform can
> > take advantage of all both event counting and sampling using perf tool.
> > 
> > This series introduces a platform perf driver instead of a existing arch
> > specific implementation. The new perf implementation has adopted a modular
> > approach where most of the generic event handling is done in the core library
> > while individual PMUs need to only implement necessary features specific to
> > the PMU. This is easily extensible and any future RISC-V PMU implementation
> > can leverage this. Currently, SBI PMU driver & legacy PMU driver are implemented
> > as a part of this series.
> > 
> > The legacy driver tries to reimplement the existing minimal perf under a new
> > config to maintain backward compatibility. This implementation only allows
> > monitoring of always running cycle/instruction counters. Moreover, they can
> > not be started or stopped. In general, this is very limited and not very useful.
> > That's why, I am not very keen to carry the support into the new driver.
> > However, I don't want to break perf for any existing hardware platforms.
> > If everybody agrees that we don't need legacy perf implementation for older
> > implementation, I will be happy to drop PATCH 4.
> 
> IMO we should keep it for a bit, so we have a transition period.  These
> extensions are pretty new so we won't be able to count on everyone having
> them yet, this way we'll avoid breaking users.
> 
> This generally looks good, but I don't see any Acks from the perf
> maintainers.  I'm happy to take this through the RISC-V tree, but I'd
> generally like to have at least an ack as perf isn't really my subsystem.
> MAINTAINERS seems to indicate that's Will and Mark, they're not To'd so
> maybe they just missed this?
> 
> I fixed a few trivial checkpatch warnings, updated Atish's email address,
> and put this on palmer/riscv-pmu.  Happy to hear any comments, if nobody
> says anything then I'll just put that on riscv/for-next whenever I get back
> to my own email.

Fine by me! Most (all?) of the other drivers under drivers/perf/ are for
arm64, so I'm more than happy for you to handle the riscv one yourself.
If I end up with something that touches all of the drivers then we can
use a shared branch or something.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
