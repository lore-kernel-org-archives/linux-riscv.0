Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBBAC433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 00:52:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36CA62073E
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 00:52:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mToFNSwJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36CA62073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bPzsBhj6T3ZexNGlg5B0kSIZJdSz4flWS7A0jJ9Au00=; b=mToFNSwJT1aOEAz1Eqen4UdOI
	Ooa2mMG/u+sium5rotX92KEZuxUDbjbo/zitc3gHMd7/C8EcUtTQOtEJdXKAJvJ83wdc0PILHR68t
	gEL9zoIR2+l72vdpJdkr8hxiGz4YVCJxr7kQd5myocM5CKjbhfGLha0gEHIme7nBkPQJvJsxwG1ig
	LDbpq1NXPyJ3AmQDDGe6P2pRJzuaKfsaVpOm9Z8bOZiExF9ziKSn3clVFzjtE4Mfvt4nFzehgHoHM
	V9l9q4BTVHrPAG+KoBeA6UwspRfdsI9bBZgeqmiVe5ia7CZH6IGjzI96BJQ6J8L29qDE3SYrzFPq9
	wYpT6JcmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqQyt-0000B9-T0; Wed, 01 Jul 2020 00:52:07 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqQyr-0000AI-5J
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 00:52:06 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0610i76Y066903;
 Wed, 1 Jul 2020 08:44:07 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 1 Jul 2020
 08:51:29 +0800
Date: Wed, 1 Jul 2020 08:51:29 +0800
From: Alan Kao <alankao@andestech.com>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
Message-ID: <20200701005129.GA27962@andestech.com>
References: <cover.1593397455.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1593397455.git.zong.li@sifive.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0610i76Y066903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_205205_608641_92EC509D 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2020 at 11:19:09AM +0800, Zong Li wrote:
> This patch set adds raw event support on RISC-V. In addition, we
> introduce the DT mechanism to make our perf more generic and common.
> 
> Currently, we set the hardware events by writing the mhpmeventN CSRs, it
> would raise an illegal instruction exception and trap into m-mode to
> emulate event selector CSRs access. It doesn't make sense because we
> shouldn't write the m-mode CSRs in s-mode. Ideally, we should set event
> selector through standard SBI call or the shadow CSRs of s-mode. We have
> prepared a proposal of a new SBI extension, called "PMU SBI extension",
> but we also discussing the feasibility of accessing these PMU CSRs on
> s-mode at the same time, such as delegation mechanism, so I was
> wondering if we could use SBI calls first and make the PMU SBI extension
> as legacy when s-mode access mechanism is accepted by Foundation? or
> keep the current situation to see what would happen in the future.
> 
> This patch set also introduces the DT mechanism, we don't want to add too
> much platform-dependency code in perf like other architectures, so we
> put the mapping of generic hardware events to DT, then we can easy to
> transfer generic hardware events to vendor's own hardware events without
> any platfrom-dependency stuff in our perf.
> 
> Zong Li (6):
>   dt-bindings: riscv: Add YAML documentation for PMU
>   riscv: dts: sifive: Add DT support for PMU
>   riscv: add definition of hpmcounter CSRs
>   riscv: perf: Add raw event support
>   riscv: perf: introduce DT mechanism
>   riscv: remove PMU menu of Kconfig
> 

DT-based PMU registration looks good to me. Together with Anup's feedback,
we can anticipate that the following items will be:

- rewrite RISC-V PMU to a platform driver
- propose SBI PMU extention
- fixes: RV32 counter access, namings, etc.

Yes, all are good directions towards better counting (`perf stat`) function.
But as the original author of RISC-V perf port, please allow me to address
the fundamental problems of RISC-V perf, again [0][1][2][3], that the sampling
(`perf record`) function never earned enough respect.  Counting gives you a
shallow view regarding an application, while sampling demystifies one for you.

The problems are three-fold
(1) Interrupt
Sampling in perf requires that a HPM raises an interrupt when it overflows.
Making RISC-V perf platform driver or not has nothing to do with this.  This
requires more discussions in TGs.
(2) S-mode access to PMU CSRs
This is also addressed in this patch set but to me, it is kind of like a
SBI-solves-them-all mindset to me.  Perf event is for performance monitoring
thus we should eliminate any possible overhead if we can.  Setting event masks
through SBI calls for counting maybe OK, but if we really take sampling and
interrupt handling into consideration, it is questionable if it is still a
viable way.
(3) Registers, registers, registers
There is just no enough CSR/function for perf sampling. The previous proposal
explains why [2].

Perf sampling is off-topic but somehow related, so I bring it up here just
for your information.

As this patch set goes v2, the PMU porting guide in [0] should be removed since
it contains no useful information anymore.

[0] Documentation/riscv/pmu.rst
[1] https://www.youtube.com/watch?v=Onvlcl4e2IU
[2] https://github.com/riscv/riscv-isa-manual/issues/402
    This proposal has been posted in Privileged Spec Task Group, in
https://lists.riscv.org/g/tech-privileged-archive/message/488?p=,,,20,0,0,0::Created,,Proposal,20,2,40,32306071
but never receive any feedback.
[3] https://lists.riscv.org/g/tech-unixplatformspec/message/84
    I intended to discuss [2] in the Unixplatform Spec Task Group at the
online meeting, but obviously people were too busy knowing who the new
RISC-V CTO is and what he has done to even follow the agenda.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
