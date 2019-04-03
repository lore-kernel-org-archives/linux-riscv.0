Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD89C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 09:28:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5B0206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 09:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ad18/gaI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5B0206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2hCJA4JWfjx381GqqgwG/mnJJeavku1uokUrxlwC60=; b=ad18/gaIB7/GuW
	BEAIh5jhxGPcg5MvmVLnJhNPhWtKssj0rQEacJGbRgWLsyEWOOdxO5ipubNplxtS/BoGvDyNTYjBY
	GMHwD/4YFRsOKqFlvhbH8JCWyeILGHAKfoTQ8SKEv8wAqwOTzNWpuj01CUTRNG+TkurYtW8QTf4NX
	OTf9Yk8x8rkQLGzwGTpN6DT2QRtm0pQaseeDP67YnnsIvPuYBu6BCTuIebd01Ki8sxXNIG/PraG8G
	5k8iArZ3/QQ/g26mRp5VnY8ljdyqXTFtF2o5pyzZh5CHhl3z3Pyb+1JaXC4JkcCyAfOLufvHWK/j5
	WT8rLDWhLSSkupdZyXYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBcBk-0002O5-P5; Wed, 03 Apr 2019 09:28:08 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBcBh-0002Nd-6O
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 09:28:07 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x339QnRj063412;
 Wed, 3 Apr 2019 17:26:49 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 3 Apr 2019
 17:27:57 +0800
Date: Wed, 3 Apr 2019 17:27:58 +0800
From: Alan Kao <alankao@andestech.com>
To: "Wladimir J. van der Laan" <laanwj@gmail.com>
Subject: Re: Perf counters on SiFive FU540-C000
Message-ID: <20190403092758.GA26612@andestech.com>
References: <20190331143732.7n4b5llrkxs5nbvm@aurora.visucore.com>
 <mhng-0cd5a4db-2499-4830-a4bf-656275714836@palmer-si-x1c4>
 <20190403010426.GA4033@andestech.com>
 <20190403084237.qygtfnefppdr3vtj@aurora.visucore.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190403084237.qygtfnefppdr3vtj@aurora.visucore.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x339QnRj063412
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_022805_493696_539FEE7D 
X-CRM114-Status: GOOD (  22.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 nickhu@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Wladimir,

On Wed, Apr 03, 2019 at 10:42:37AM +0200, Wladimir J. van der Laan wrote:
> Hello,
> 
> Thanks Alan and Palmer for the input!
> 
> On Wed, Apr 03, 2019 at 09:04:26AM +0800, Alan Kao wrote:
> 
> > > >These are very basic: CSRs mhpmevent3 and mhpmevent4 can be used to choose a category
> > > >(Instruction Commit Events, Microarchitectural Events, Memory System Events), then
> > > >from these categories a bitmask of events can be set that will increase the associated
> > > >counter when they happen. I don't understand the rationale for counting multiple
> > > >kinds of events in one register, so from what I understand, two counters can be
> > > >supported at once in the perf interface.
> > > 
> > > The idea here is to allow users to have different performance counter
> > > granularities.  For example, users might want to count all pipeline flushes
> > > (maybe their framework defines that as a possible counter type) or may want
> > > to specifically indicate which sort of pipeline flush should be counted.
> 
> I didn't realize some of them were conceptually hierarchical, seen in that light
> it makes a lot of sense and it's a good way of being able to count at various levels.
> 
> > > >I found some documentation about platform specfic counters in Documentation/riscv/pmu.txt,
> > > >hopefully this is enough to get me started.
> > > >(If someone started work on this, please let me know)
> > > 
> > > Someone from Andes had patches out to add support for their performance
> > > counters a while ago.  The issue there was that the performance counter
> > > implementation was chosen at compile time, but it should really be detected
> > > at run time via some platform-specific mechanism (ie, device tree).
> > 
> > PMU detection was one of the problems, and should have been solved in previous
> > patches.  For the rest of the problems, Documentation/riscv/pmu.txt should
> > serve as a good guide.
> 
> Looking at the device tree (for 'sifive,fu540g' compatibility?) seems, to me,
> to be the right answer here.

Ideally there should be a PMU node in the DTS.  I don't have the DTS for FU540
so you have to check if something alike exists.

> 
> It'd be possible to really-detect by configuring a specific event type then
> running that instruction and looking at the counters, but that seems
> unnecessary.
> 

Sure.  beleiving-reading-parsing the DTS you got is the norm.

> > > Aside from that I think the only issue was how to expose these to userspace
> > > in a sane fashion, which is something I thought would be quite tricky.  IIRC
> > > someone managed to convince me that there was a really simple scheme for
> > > doing this, but I don't remember what it was.
> > 
> > The corresponding userspace tool is in tools/perf.  Once one finishes the kernel
> > part, the work left for userspace perf will be the symbolization of PMU raw
> > events.  The preliminary patch supports common counters only, so I believe this
> > will be the first platform-specific PMU in RISC-V.
> 
> Right-the user-space interface would be 'perf', the idea would be to make that
> work for all the counters so that 'perf top' and profiling work for them.
> 

Oops ... current spec gives you no interrupt when a counter overflows, so
basically you cannot do the profiling by perf even if you finish the event
mapping.  The best you can get is "perf stat" to work.

> So it seems to me that on the kernel side, apart from the setup and allocation
> logic, that these platform-specific counters can be handled in the same way as
> `mcycle` and `minstret` are, they're also simple counters without overrun
> notification logic or other fancy features.
> 
> Also with the same limitation that they cannot be written to from the kernel
> in S-mode, so need to keep track of deltas.
> 
> Speaking of which, can the kernel write to the selectors? Oh crap I guess not.

Unfortunately you are right.  You have to manually hack some SBIs for writing
event masks.

> 
> Wladimir

Alan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
