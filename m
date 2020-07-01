Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57564C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 02:46:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087F6206EB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 02:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yGQqSJ8i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 087F6206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=exM0QKwAmQtZm824drdEJJBg/e0wI1zxcF0ByMl2n/0=; b=yGQqSJ8iziJHAmPnoQHtxHK8Z
	GtiZUT4e4oad9CKvV9EssKlZHgMAMCdKQmOMIrYnQTAmob/xuXLcXRlpRuBWGwvhOxoZ/GinJuG1y
	aB3bRWowvG/7P0hP+uLHgDxnClB5md27vkUaMebd+v/IopBZdABcMas1i4S0HCxuL+zG33nRXUc/a
	Hj6ZPCy0POshk4qLSXJ1V0Ew72YzHzko5IPLEViQd5L7o4jZuHdg7jAGynGjgX1IEfHh7NL9fi59L
	pJsf3r/86EvGCtd1arMeaqmfnBvVsRobi+Zo4HRppZhmLHJtigW6rObhu42W0yuHSbLLsfgDzQTyu
	7uzDHLGHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqSlV-0004YP-F3; Wed, 01 Jul 2020 02:46:25 +0000
Received: from atcsqr.andestech.com ([60.248.187.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqSlS-0004Xx-Mo
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 02:46:24 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0612cYGv088370;
 Wed, 1 Jul 2020 10:38:34 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 1 Jul 2020
 10:45:56 +0800
Date: Wed, 1 Jul 2020 10:45:57 +0800
From: Alan Kao <alankao@andestech.com>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
Message-ID: <20200701024557.GB27962@andestech.com>
References: <cover.1593397455.git.zong.li@sifive.com>
 <20200701005129.GA27962@andestech.com>
 <CAOnJCU+5fLA5WZuiQ7NprdEDxnEus8RtyLZGD2ehraiHR-uf0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU+5fLA5WZuiQ7NprdEDxnEus8RtyLZGD2ehraiHR-uf0Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0612cYGv088370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_224623_125559_7F28C1F9 
X-CRM114-Status: GOOD (  35.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Tue, Jun 30, 2020 at 06:02:43PM -0700, Atish Patra wrote:
> On Tue, Jun 30, 2020 at 5:52 PM Alan Kao <alankao@andestech.com> wrote:
> >
> > On Mon, Jun 29, 2020 at 11:19:09AM +0800, Zong Li wrote:
> > > This patch set adds raw event support on RISC-V. In addition, we
> > > introduce the DT mechanism to make our perf more generic and common.
> > >
> > > Currently, we set the hardware events by writing the mhpmeventN CSRs, it
> > > would raise an illegal instruction exception and trap into m-mode to
> > > emulate event selector CSRs access. It doesn't make sense because we
> > > shouldn't write the m-mode CSRs in s-mode. Ideally, we should set event
> > > selector through standard SBI call or the shadow CSRs of s-mode. We have
> > > prepared a proposal of a new SBI extension, called "PMU SBI extension",
> > > but we also discussing the feasibility of accessing these PMU CSRs on
> > > s-mode at the same time, such as delegation mechanism, so I was
> > > wondering if we could use SBI calls first and make the PMU SBI extension
> > > as legacy when s-mode access mechanism is accepted by Foundation? or
> > > keep the current situation to see what would happen in the future.
> > >
> > > This patch set also introduces the DT mechanism, we don't want to add too
> > > much platform-dependency code in perf like other architectures, so we
> > > put the mapping of generic hardware events to DT, then we can easy to
> > > transfer generic hardware events to vendor's own hardware events without
> > > any platfrom-dependency stuff in our perf.
> > >
> > > Zong Li (6):
> > >   dt-bindings: riscv: Add YAML documentation for PMU
> > >   riscv: dts: sifive: Add DT support for PMU
> > >   riscv: add definition of hpmcounter CSRs
> > >   riscv: perf: Add raw event support
> > >   riscv: perf: introduce DT mechanism
> > >   riscv: remove PMU menu of Kconfig
> > >
> >
> > DT-based PMU registration looks good to me. Together with Anup's feedback,
> > we can anticipate that the following items will be:
> >
> > - rewrite RISC-V PMU to a platform driver
> > - propose SBI PMU extention
> > - fixes: RV32 counter access, namings, etc.
> >
> > Yes, all are good directions towards better counting (`perf stat`) function.
> > But as the original author of RISC-V perf port, please allow me to address
> > the fundamental problems of RISC-V perf, again [0][1][2][3], that the sampling
> > (`perf record`) function never earned enough respect.  Counting gives you a
> > shallow view regarding an application, while sampling demystifies one for you.
> >
> > The problems are three-fold
> > (1) Interrupt
> > Sampling in perf requires that a HPM raises an interrupt when it overflows.
> > Making RISC-V perf platform driver or not has nothing to do with this.  This
> > requires more discussions in TGs.
> > (2) S-mode access to PMU CSRs
> > This is also addressed in this patch set but to me, it is kind of like a
> > SBI-solves-them-all mindset to me.  Perf event is for performance monitoring
> > thus we should eliminate any possible overhead if we can.  Setting event masks
> > through SBI calls for counting maybe OK, but if we really take sampling and
> > interrupt handling into consideration, it is questionable if it is still a
> > viable way.
> > (3) Registers, registers, registers
> > There is just no enough CSR/function for perf sampling. The previous proposal
> > explains why [2].
> >
> > Perf sampling is off-topic but somehow related, so I bring it up here just
> > for your information.
> >
> > As this patch set goes v2, the PMU porting guide in [0] should be removed since
> > it contains no useful information anymore.
> >
> > [0] Documentation/riscv/pmu.rst
> > [1] https://www.youtube.com/watch?v=Onvlcl4e2IU
> > [2] https://github.com/riscv/riscv-isa-manual/issues/402
> >     This proposal has been posted in Privileged Spec Task Group, in
> > https://lists.riscv.org/g/tech-privileged-archive/message/488?p=,,,20,0,0,0::Created,,Proposal,20,2,40,32306071
> > but never receive any feedback.
> > [3] https://lists.riscv.org/g/tech-unixplatformspec/message/84
> >     I intended to discuss [2] in the Unixplatform Spec Task Group at the
> > online meeting, but obviously people were too busy knowing who the new
> > RISC-V CTO is and what he has done to even follow the agenda.
> >
> 
> Sorry. The last meeting's agenda was derailed for numerous reasons.
> Are you okay with discussing this during the next meeting ?
> I have not scheduled one yet but will probably schedule it on next
> Wednesday (8th July) if there is no objection.
> I can check with Anup if he can present the SBI PMU extension as well.

Thanks for the oppertunity. 
But I don't think that the time is enough for every important topic to be
covered.  What I provided in the previous citation [2] is a proposal,
which need expert to judge and critique after thorough reading.

The TG Chair should decide the priority of the items.  If there is any chance
for our proposal, I can give brief introductions.

> 
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 
> -- 
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
