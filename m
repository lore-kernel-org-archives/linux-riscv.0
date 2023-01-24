Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49454C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sJVbC4g6sbuwT4f3VWmQ1cKo02yA4SH2SxmdxTg6aI=; b=AMK5LimmHipxNv
	CDhGXdp+lYu4gu5teNhGJHRw8zlrrKiGS7Wo02RPi3KB/XdMn8NuWe5oE9B5kMCtIWKq+R+9yhcK8
	6w2jjhyUrHBoSzP/8w7GVo928oXB9DopakOjHpYeFHCj7zYrP4nIAU2ZsWextA9ekt5NDCGAh/Llv
	SZBVqYKlFTLBGaAweJuP2uIWJkpmWA3pN0jqPctOJ1AyuqjdBCsTHyY3kUNbr/ephFA7K9ZiibJSu
	DeB6PpN8GbGGajbjkVHBXd9xNnvEs7X/bdyN7Zts8MzXwrfBqMFHoHI3u7pO4zEVvNdoW7CF/F09R
	gTGoF9yfyWG5+k0oFDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKVs-004NoQ-9B; Tue, 24 Jan 2023 14:43:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKVg-004NkA-M7; Tue, 24 Jan 2023 14:42:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 703194B3;
	Tue, 24 Jan 2023 06:43:30 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92E083F71E;
	Tue, 24 Jan 2023 06:42:47 -0800 (PST)
Date: Tue, 24 Jan 2023 14:42:45 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	linux-riscv@lists.infradead.org,
	Pierre Gondois <pierre.gondois@arm.com>
Subject: Re: [GIT PULL] cacheinfo/arch_topology: Updates for v6.3
Message-ID: <20230124144245.ddphvqbcxpzrlgek@bogus>
References: <20230120121856.1407369-1-sudeep.holla@arm.com>
 <CAMuHMdUZzLkWvhQ=YeH2KfQ_FRidemfOvbbHf_b1AHROK9HFNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZzLkWvhQ=YeH2KfQ_FRidemfOvbbHf_b1AHROK9HFNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_064252_835453_C4E3B771 
X-CRM114-Status: GOOD (  29.70  )
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

On Tue, Jan 24, 2023 at 02:44:10PM +0100, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Fri, Jan 20, 2023 at 1:22 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > It has been tested on RISC-V which is the main users outside of arm64.
> 
> Has it?
>

Hmm, I might have mixed up things then. I was on a vacation for quite some
time and might have assumed Conor response on the thread with testing.
Extremely sorry for that. However it was in -next for few days before
Greg applied to his tree.

> > The ACPI the RISC-V parts are acked-by the respective maintainers. All
> > the changes are in the -next for sometime and no issues reported at this
> > time.
> >
> > Regards,
> > Sudeep
> >
> > -->8
> >
> > The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> >
> >   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/archtopo-cacheinfo-updates-6.3
> >
> > for you to fetch changes up to 198102c9103fc78d8478495971947af77edb05c1:
> >
> >   cacheinfo: Fix shared_cpu_map to handle shared caches at different levels (2023-01-18 09:58:40 +0000)
> >
> > ----------------------------------------------------------------
> > cacheinfo and arch_topology updates for v6.3
> >
> > The main change is to build the cache topology information for all
> > the CPUs from the primary CPU. Currently the cacheinfo for secondary CPUs
> > is created during the early boot on the respective CPU itself. Preemption
> > and interrupts are disabled at this stage. On PREEMPT_RT kernels, allocating
> > memory and even parsing the PPTT table for ACPI based systems triggers a:
> >   'BUG: sleeping function called from invalid context'
> >
> > To prevent this bug, the cacheinfo is now allocated from the primary CPU
> > when preemption and interrupts are enabled and before booting secondary
> > CPUs. The cache levels/leaves are computed from DT/ACPI PPTT information
> > only, without relying on any architecture specific mechanism if done so
> > early.
> >
> > The other minor change included here is to handle shared caches at
> > different levels when not all the CPUs on the system have the same
> > cache hierarchy.
> 
> While this gets rid of the "cacheinfo: Unable to detect cache hierarchy
> for CPU N" warnings printed during boot, it resurrects the printing of
> 
>     Early cacheinfo failed, ret = -12
> 
> during early boot on all my RV64 platforms
> 
> See also https://lore.kernel.org/all/CAMuHMdUBZ791fxCPkKQ6HCwLE4GJB2S35QC=SQ+X8w5Q4C_70g@mail.gmail.com/
> for a similar earlier version triggering the same issue.
> 
> > ----------------------------------------------------------------
> > Pierre Gondois (6):
> >       arch_topology: Build cacheinfo from primary CPU
> 
> Reverting commit 5944ce092b97caed ("arch_topology: Build cacheinfo
> from primary CPU") fixes the issue.
>

OK, thanks for narrowing it to one patch. We will look at it. But does
it work fine even with this errors ? We had seen such a behaviour in the
past. It fails to initialise too early but works at later initcall level
which I am not sure if we investigated why.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
