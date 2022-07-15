Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECBCC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhSUmZq47+OKhS2XS2iKdwWji/YK5MUvfRjmWTbrEOg=; b=WyPUiyUg6rakzW
	LOIKABBQtqcIqhb4v5KNTCSAsDrjDJey91EdG6T+m5AIoNZKZpIlNYOi0Z5qkBbng+VRdPh8oPnHa
	+j1O7hm4CGI6FvJRrdqH+TIYyg//tRslHpWrnfRKOvmdk2KybM4fApWoEJ585qPejL31fU3up4EgG
	bRwKIzuqUWpfwec6/xyS9Qpdvzr/FLHTNXQSzzYd0FmgS+8w5ZdMC+6Pp9ul0u2228JS5sLZzsSh4
	jJuieLNm6KchkaScR3uClXV7iWGdY2ddbdUiki35Qd2InT7V+IpRv08Si85D5Bk9Oog3t03VCdtlq
	YcwslfmneF/gepSViAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLce-007Kxt-H0; Fri, 15 Jul 2022 13:44:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLcc-007KvB-8M
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 13:44:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31FC7623E4;
	Fri, 15 Jul 2022 13:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA350C34115;
	Fri, 15 Jul 2022 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657892682;
	bh=8BPiocY7scDyLEcAlQjPC++udc/2v52MfXgPwsWJmaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/7omktuc5K9bv7/vVtx7s2hZGuEbq0x4Dh4gwEpveYMluuJqTFobMI6tTQq11MLB
	 gIQ9PaLyEE9Muo+wlE9HzsHn1dKUYJC7GRQWYiJQ52ZMnxahn1VyzKEraFZtTIW/h6
	 1FuC6wRdT1JG5zL75xUh52YjQ27H+tseApcbggAtffCJre2UsHzQJVRw7N3Ivn0kqK
	 yBF60fvKOtN94xRY7MzDB95QGSINMLmbfbknA1Z4mEjxXOkqiWApUvyyyNd0/K06uX
	 6FgysEEhgFN/3+LHriZH+Kloq/Td8aj4sdmOX18TkCAxSkScaj6bIcdEuxzoQ6DJiw
	 U1ooy1Ii1DwUQ==
Date: Fri, 15 Jul 2022 21:35:43 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: anup@brainfault.org, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, ryabinin.a.a@gmail.com, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	alexandre.ghiti@canonical.com, Atish Patra <atishp@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v4 0/2] use static key to optimize pgtable_l4_enabled
Message-ID: <YtFtL3+/3FNkalZ5@xhacker>
References: <CAAhSdy0mkwacNMVa_jFZmZ+NRPBa1TpKUQGpzr6Z9_wfoq1R4g@mail.gmail.com>
 <mhng-17913c13-57bd-42f9-9136-b4eb9632253c@palmer-mbp2014>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-17913c13-57bd-42f9-9136-b4eb9632253c@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_064446_394487_03332957 
X-CRM114-Status: GOOD (  33.35  )
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

On Fri, Jul 01, 2022 at 08:48:25PM -0700, Palmer Dabbelt wrote:
> On Sat, 25 Jun 2022 21:33:07 PDT (-0700), anup@brainfault.org wrote:
> > On Sat, May 21, 2022 at 8:13 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > > 
> > > The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> > > is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> > > boot, so static key can be used to solve the performance issue[1].
> > > 
> > > An unified way static key was introduced in [2], but it only targets
> > > riscv isa extension. We dunno whether SV48 and SV57 will be considered
> > > as isa extension, so the unified solution isn't used for
> > > pgtable_l4[l5]_enabled now.
> > > 
> > > patch1 fixes a NULL pointer deference if static key is used a bit earlier.
> > > patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.
> > > 
> > > [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
> > > [2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t
> > > 
> > > Since v3:
> > >  - fix W=1 call to undeclared function 'static_branch_likely' error
> > > 
> > > Since v2:
> > >  - move the W=1 warning fix to a separate patch
> > >  - move the unified way to use static key to a new patch series.
> > > 
> > > Since v1:
> > >  - Add a W=1 warning fix
> > >  - Fix W=1 error
> > >  - Based on v5.18-rcN, since SV57 support is added, so convert
> > >    pgtable_l5_enabled as well.
> > > 
> > > 
> > > 
> > > Jisheng Zhang (2):
> > >   riscv: move sbi_init() earlier before jump_label_init()
> > >   riscv: turn pgtable_l4|[l5]_enabled to static key for RV64
> > 
> > I have tested both these patches on QEMU RV64 and RV32.
> > 
> > Tested-by: Anup Patel <anup@brainfault.org>
> > 
> > Thanks,
> > Anup
> 
> Thanks for testing these.  Unfortunatly they're failing for me under my
> kasan+sparsemem-vmemmap config, which looks like a defconfig with
> 
>    CONFIG_KASAN=y
>    # CONFIG_FLATMEM_MANUAL is not set
>    CONFIG_SPARSEMEM_MANUAL=y
>    CONFIG_SPARSEMEM=y
>    # CONFIG_SPARSEMEM_VMEMMAP is not set

Hi Palmer,

Thank you for the hint, I find the reason: SPARSEMEM is the key, KASAN
doesn't matter. To fix this issue, we need to move
riscv_finalise_pgtable_lx() after sparse_init(). I will send out a
newer version soon.

> 
> Nothing's really jumping out and I'm not sure that's a super compelling
> configuration, but IIRC it's found a handful of issues before so I'm not
> sure it's sane to just toss it.
> 
> I've put this all on the riscv-pgtable_static_key branch of
> kernel.org/palmer/linux .  If nobody has the time to look then I'll try and
> give it another shot, but I'm pretty buried right now so happy to have the
> help.

Let me know if you want a seperate patch against
riscv-pgtable_static_key branch.

Thanks

> 
> > 
> > > 
> > >  arch/riscv/include/asm/pgalloc.h    | 16 ++++----
> > >  arch/riscv/include/asm/pgtable-32.h |  3 ++
> > >  arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
> > >  arch/riscv/include/asm/pgtable.h    |  5 +--
> > >  arch/riscv/kernel/cpu.c             |  4 +-
> > >  arch/riscv/kernel/setup.c           |  2 +-
> > >  arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
> > >  arch/riscv/mm/kasan_init.c          | 16 ++++----
> > >  8 files changed, 104 insertions(+), 66 deletions(-)
> > > 
> > > --
> > > 2.34.1
> > > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
