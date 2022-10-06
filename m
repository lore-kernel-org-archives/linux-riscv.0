Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EAFC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2cnsJSgTpehw4Ri4jILqKgs27GwXJpcAThPh8opLWc=; b=4rg5D/pQs13Kqh
	9JkNbohjEn7o2ypseb/tIlMSEjMxusC8F2GSkvAEs7wnOvGk5IGJjIbsZNQRFVO1AmZQ4nmEu6KEs
	nfbR7ZK/O9lrRXLyfJK4HJFYPZ9RQvOq2Lw/0vWaYQm7nI5tn1b1MFlNwIh56aJH6n1Bp/V9o3Hc9
	X58a4hJuwca36i2fMXvhLZTquSBrXhLT5WW/RVg5EbJ7q2c1nlP6J/N7utLPg0L2SacgHcMfwmLBn
	ow9ak9BgH+nzyeaxmZo9aY7Zr2CH7xYkLbwWBGovVV2EWYIAJgvGeUx8rdSywnT+qvlHmYRQysss/
	nOS4PFJkusSjcTf27/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMXU-000pCA-4G; Thu, 06 Oct 2022 08:47:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMXR-000p9Y-Ag
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 08:47:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B8AE0B81DED;
	Thu,  6 Oct 2022 08:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2567C433C1;
	Thu,  6 Oct 2022 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665046046;
	bh=+1B3cggy9P8mgv4GVCeTh/UO14b9H8rJnWBe3c/MK+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXmeRcBvhsAkRmynTMQ2wDQW8FeJdgSpCXIhXrz/is0R31JwVGqLL8gNpGtnjZ1z4
	 FBwUyFpfcbH9LANMi/Iq9iALXMZv3t26AFBOtSwjUNJ+Di0ihw4WA0l6+rIhB5ob/y
	 L7sxDn7RPvykGhXnjMjM3fpn+aP7DqEcspwWnvc7SgVDu3uqrbqpRlZnAy/WeowFrT
	 HnIwMeDJYgoM6ipZFK8BBOmSUapHnywkcntpDQg0VkY54YdtggK56GWMoCeTJ3roXc
	 OmhG4xvtGDFAZK/G83pzknp5UIYhF/sQI9jeqGKF3utNIZaswQdeU3byH+D2a5S6EA
	 F1R6sOgkFMbsA==
Date: Thu, 6 Oct 2022 16:37:52 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
	dvyukov@google.com, vincenzo.frascino@arm.com,
	alexandre.ghiti@canonical.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v6 RESEND 0/2] use static key to optimize
 pgtable_l4_enabled
Message-ID: <Yz6T4EYKKns7OIVE@xhacker>
References: <20220821140918.3613-1-jszhang@kernel.org>
 <mhng-30c89107-c103-4363-b4af-7778d9512622@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-30c89107-c103-4363-b4af-7778d9512622@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_014729_682396_FD5300B4 
X-CRM114-Status: GOOD (  29.01  )
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

On Wed, Oct 05, 2022 at 06:05:28PM -0700, Palmer Dabbelt wrote:
> On Sun, 21 Aug 2022 07:09:16 PDT (-0700), jszhang@kernel.org wrote:
> > The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> > is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> > boot, so static key can be used to solve the performance issue[1].
> > 
> > An unified way static key was introduced in [2], but it only targets
> > riscv isa extension. We dunno whether SV48 and SV57 will be considered
> > as isa extension, so the unified solution isn't used for
> > pgtable_l4[l5]_enabled now.
> > 
> > patch1 fixes a NULL pointer deference if static key is used a bit earlier.
> > patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.
> > 
> > [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
> > [2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t
> > 
> > Since v5:
> >  - Use DECLARE_STATIC_KEY_FALSE
> > 
> > Since v4:
> >  - rebased on v5.19-rcN
> >  - collect Reviewed-by tags
> >  - Fix kernel panic issue if SPARSEMEM is enabled by moving the
> >    riscv_finalise_pgtable_lx() after sparse_init()
> > 
> > Since v3:
> >  - fix W=1 call to undeclared function 'static_branch_likely' error
> > 
> > Since v2:
> >  - move the W=1 warning fix to a separate patch
> >  - move the unified way to use static key to a new patch series.
> > 
> > Since v1:
> >  - Add a W=1 warning fix
> >  - Fix W=1 error
> >  - Based on v5.18-rcN, since SV57 support is added, so convert
> >    pgtable_l5_enabled as well.
> > 
> > 
> > Jisheng Zhang (2):
> >   riscv: move sbi_init() earlier before jump_label_init()
> >   riscv: turn pgtable_l4|[l5]_enabled to static key for RV64
> > 
> >  arch/riscv/include/asm/pgalloc.h    | 16 ++++----
> >  arch/riscv/include/asm/pgtable-32.h |  3 ++
> >  arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
> >  arch/riscv/include/asm/pgtable.h    |  5 +--
> >  arch/riscv/kernel/cpu.c             |  4 +-
> >  arch/riscv/kernel/setup.c           |  2 +-
> >  arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
> >  arch/riscv/mm/kasan_init.c          | 16 ++++----
> >  8 files changed, 104 insertions(+), 66 deletions(-)
> 
> Sorry for being slow here, but it looks like this still causes some early
> boot hangs.  Specifically kasan+sparsemem is failing.  As you can probably
> see from the latency I'm still a bit buried right now so I'm not sure when
> I'll have a chance to take more of a look.

Hi Palmer,

Before V4, there is a bug which can cause kernel panic when SPARSEMEM
is enabled, V4 have fixed it by moving the riscv_finalise_pgtable_lx()
after sparse_init(). And I just tested the riscv-pgtable_static_key
branch in your tree, enabling KASAN and SPARSEMEM, system booted fine.
I'm not sure what happened. Could you please send me your kernel
config file? I want to fix any issue which can block this series being
merged in 6.1-rc1.

Thanks in advance

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
