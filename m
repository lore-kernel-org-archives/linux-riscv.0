Return-Path: <SRS0=JY4f=UU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2732C43613
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 14:16:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888E920679
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 14:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pR6y1tJs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 888E920679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkyM8bguaOSvJH+Sl1uvuloAShzx8UkFKFAiyEUXOPQ=; b=pR6y1tJsN1ldkf
	NaHuIQuF48OhDzt7DzM1FXXbbzvAVACIncsEj5e4tviXGHeaZHZzLtcr28sDmsIY7Sf5lepzk2VkF
	OoQR9YDE6wFO5yjn1qNEoE36kd9THYpSdHeVcx36Z7E4xVW7gjNJW5+cO7oHwcTtKVeqedDKzD7am
	2rTpNup8JfTEkAh1h7IKfr4b1SgxpYCubsxChP8z94tZ5jU/LOK5mcRn1J02FyiY6zcnaUYvk1vEy
	+UnFFc8/pa5hL8889BztWSn0j84sGqwBYsXXTttOmHKqTuMKtjZpCZ1oitd9QOpQ3kL2pVgf+jR6z
	Zux3yhskKVNaaqCdJhqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heKLJ-0002Ns-Rq; Fri, 21 Jun 2019 14:16:42 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1heKKv-000263-8l; Fri, 21 Jun 2019 14:16:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55BFB28;
 Fri, 21 Jun 2019 07:16:12 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 D8FA43F575; Fri, 21 Jun 2019 07:16:09 -0700 (PDT)
Date: Fri, 21 Jun 2019 15:16:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
 separate file
Message-ID: <20190621141606.GF18954@arrakis.emea.arm.com>
References: <20190321163623.20219-1-julien.grall@arm.com>
 <20190321163623.20219-12-julien.grall@arm.com>
 <0dfe120b-066a-2ac8-13bc-3f5a29e2caa3@arm.com>
 <CAJF2gTTXHHgDboaexdHA284y6kNZVSjLis5-Q2rDnXCxr4RSmA@mail.gmail.com>
 <c871a5ae-914f-a8bb-9474-1dcfec5d45bf@arm.com>
 <CAJF2gTStSR7Jmu7=HaO5Wxz=Zn8A5-RD8ktori3oKEhM9vozAA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTStSR7Jmu7=HaO5Wxz=Zn8A5-RD8ktori3oKEhM9vozAA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_071617_404678_C81A2ED2 
X-CRM114-Status: GOOD (  17.86  )
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
Cc: julien.thierry@arm.com, aou@eecs.berkeley.edu, james.morse@arm.com,
 suzuki.poulose@arm.com, Marc Zyngier <marc.zyngier@arm.com>,
 Anup Patel <anup.Patel@wdc.com>, will.deacon@arm.com,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, hch@infradead.org,
 Atish.Patra@wdc.com, Julien Grall <julien.grall@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, gary@garyguo.net, paul.walmsley@sifive.com,
 christoffer.dall@arm.com, linux-riscv@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 19, 2019 at 07:51:03PM +0800, Guo Ren wrote:
> On Wed, Jun 19, 2019 at 4:54 PM Julien Grall <julien.grall@arm.com> wrote:
> > On 6/19/19 9:07 AM, Guo Ren wrote:
> > > Move arm asid allocator code in a generic one is a agood idea, I've
> > > made a patchset for C-SKY and test is on processing, See:
> > > https://lore.kernel.org/linux-csky/1560930553-26502-1-git-send-email-guoren@kernel.org/
> > >
> > > If you plan to seperate it into generic one, I could co-work with you.
> >
> > Was the ASID allocator work out of box on C-Sky?
> 
> Almost done, but one question:
> arm64 remove the code in switch_mm:
>   cpumask_clear_cpu(cpu, mm_cpumask(prev));
>   cpumask_set_cpu(cpu, mm_cpumask(next));
> 
> Why? Although arm64 cache operations could affect all harts with CTC
> method of interconnect, I think we should keep these code for
> primitive integrity in linux. Because cpu_bitmap is in mm_struct
> instead of mm->context.

We didn't have a use for this in the arm64 code, so no point in
maintaining the mm_cpumask. On some arm32 systems (ARMv6) with no
hardware broadcast of some TLB/cache operations, we use it to track
where the task has run to issue IPI for TLB invalidation or some
deferred I-cache invalidation.

(there was also a potential optimisation on arm64 to avoid broadcast
TLBI if the task only ran on a single CPU but Will found that was rarely
the case on an SMP system because of rebalancing happening during
execve(), ending up with two bits set in the mm_cpumask)

The way you use it on csky is different from how it is done on arm. It
seems to clear the mask for the scheduled out (prev) task but this
wouldn't work on arm(64) since the TLB still contains prev entries
tagged with the scheduled out ASID. Whether it matters, I guess it
depends on the specifics of your hardware.

While the algorithm may seem fairly generic, the semantics have a few
corner cases specific to each architecture. See [1] for a description of
the semantics we need on arm64 (CnP is a feature where the hardware
threads of the same core can share the TLB; the original algorithm
violated the requirements when this feature was enabled).

BTW, if you find the algorithm fairly straightforward ;), see this
bug-fix which took a formal model to identify: a8ffaaa060b8 ("arm64:
asid: Do not replace active_asids if already 0").

[1] https://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/kernel-tla.git/tree/asidalloc.tla#n79

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
