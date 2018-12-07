Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F40C64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 15:05:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 979B9208E7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 15:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="faBWVbPu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 979B9208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3GP86IC2QcAbUANKNsQet0i7VzVjpPmHL4ld7eB5LA=; b=faBWVbPuFbiswr
	s3QHt5Dw6ukCbO7nvGioSRCcWoOfviXoV9WHiURt2wboj5ojSMPmq0fCAC2+5NkV4pSfM0e5XaTui
	PgXn3sguzTlETDUT6QOZuKK9AFcS3FVR9ilg2xbMl4QY8i4Bl+acwpIL1TQCxM8kAvG8OwWwL1fXq
	H2ZupovBxvE50uTon9aGG6tnENh8c1l0VZfjtPTQsyCcQrxEY5cslk3L9bTCGdsSf3+OMrdGVv/X+
	9XbvBga4d4dVFy0xfB7ybeK7HI3bLL0nD/R2+SOXipKnYnISVrRWcWomoDgUGGr6Rb0N7z7360fKY
	WFooEaEbuhnMJiwV6dJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVHgr-0003sI-4J; Fri, 07 Dec 2018 15:05:17 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVHgR-0002cF-3b; Fri, 07 Dec 2018 15:04:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6F7B15AB;
 Fri,  7 Dec 2018 07:04:38 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4143C3F575;
 Fri,  7 Dec 2018 07:04:35 -0800 (PST)
Date: Fri, 7 Dec 2018 15:04:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Morten Rasmussen <morten.rasmussen@arm.com>
Subject: Re: [RFT PATCH v1 0/4] Unify CPU topology across ARM64 & RISC-V
Message-ID: <20181207150432.GB4100@e107155-lin>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <20181207134509.GA5913@e105550-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181207134509.GA5913@e105550-lin.cambridge.arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_070451_455169_E8672C0F 
X-CRM114-Status: GOOD (  23.45  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Juri Lelli <juri.lelli@arm.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jeremy Linton <jeremy.linton@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 07, 2018 at 01:45:21PM +0000, Morten Rasmussen wrote:
> Hi,
>
> On Thu, Nov 29, 2018 at 03:28:16PM -0800, Atish Patra wrote:
> > The cpu-map DT entry in ARM64 can describe the CPU topology in
> > much better way compared to other existing approaches. RISC-V can
> > easily adopt this binding to represent it's own CPU topology.
> > Thus, both cpu-map DT binding and topology parsing code can be
> > moved to a common location so that RISC-V or any other
> > architecture can leverage that.
> >
> > The relevant discussion regarding unifying cpu topology can be
> > found in [1].
> >
> > arch_topology seems to be a perfect place to move the common
> > code. I have not introduced any functional changes in the moved
> > code. The only downside in this approach is that the capacity
> > code will be executed for RISC-V as well. But, it will exit
> > immediately after not able to find the appropriate DT node. If
> > the overhead is considered too much, we can always compile out
> > capacity related functions under a different config for the
> > architectures that do not support them.
> >
> > The patches have been tested for RISC-V and compile tested for
> > ARM64 & x86.
>
> The cpu-map bindings are used for arch/arm too, and so is
> arch_topology.c. In fact, it was introduced to allow code-sharing
> between arm and arm64. Applying patch three breaks arm.
>

Ah right. Though I remember the whole point of moving these to arch_topology
was to share between ARM and ARM64, I completely forgot to check the
impact of this for ARM platforms.

> Moving the DT parsing to arch_topology.c we have to unify all three
> architectures. Be aware that arm and arm64 have some differences in how
> they detect cpu capacities. I think we might have to look at the split
> of code between arch/* and arch_topology.c again :-/
>

Thanks for pointing this out. I completely agree and apologies for
forgetting about arm32.

Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
