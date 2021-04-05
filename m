Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48ADAC43461
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:40:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8AC7613A0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8AC7613A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pQWxjO+TsrAj8ZXLnNZWj6FY0plDIseRvPOdnDC6SGk=; b=qCkR43F9KC3jknkdStfsCggcg
	5kTwxHrEpomflZmbAv+bZsIMbI5jka9NDYNrCPRbtV2ORR6u34v9u3gu8trZM/1pXp8BOM4Yd3I9i
	obT/dMINvfEpQLpTiMxW4jMA2ogwa52NQ9dDaPwRcqBukZkfo9JfQcwirIQjO1AgcFlOcSX7mdPdC
	HEP4ifoGoFfEfQcns+UvRFh18aKv/+l64uDuxWBrYCCS3EPMR+A3wuVKfaWbcTm5oJ+AJ8PD5HCHE
	Qrk3EURBpC0A0xqwMRA8we9mk0jVeGlNsSLmlmsAr9yeQOuAzFVjcnsmI7y5HInQPbAQQZHt+GhoU
	et/qdKxLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTSHN-00084N-D2; Mon, 05 Apr 2021 16:40:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTSHJ-00083g-2f
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 16:40:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 372B6613AF
 for <linux-riscv@lists.infradead.org>; Mon,  5 Apr 2021 16:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617640839;
 bh=uwAcNXEy+ghDiCSwGPGlI0CYFJF4SwLzYINuCy4SDVg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GeIS+8lluCKRUl3YE+TiOVeb/hvdwna4O8MUQuwFiYmsAyLkj7J2FlGJspKA/mGST
 GuSRADV73FM+ifYvNNcTGyzBIYMlbART2af2ippo6HWHGWZkU7JeBpJyD8+uYvZ0hi
 5e0md006K4jRK67wgby+Tu9sLRcRY5iCZUPpBbslgjMH+l5MEbxk6iVgEZ1Old+Tbm
 LYki2E2+ILVESbdquz6fDxQrESGF50suQHkn0M/S7c4xJmIuAAAonvVvDniZHZRP7I
 yXLtTeS3Spt2En09KW4Zp3E+ANVjGQ39jQQr7tXfbzFfThekM/y+TUO4DzmV25mycD
 Yy9VP8DqW7VGQ==
Received: by mail-lj1-f169.google.com with SMTP id z8so13253568ljm.12
 for <linux-riscv@lists.infradead.org>; Mon, 05 Apr 2021 09:40:39 -0700 (PDT)
X-Gm-Message-State: AOAM531CRjknA8XUEunjBvO6tUcWKmvXDrGnwjtOryW1hdYyYvOk28qf
 R5/dEDwLNnemYatewonZDV52DcTdpVPzQMvM7ZE=
X-Google-Smtp-Source: ABdhPJzkUEfDB95CnL6786fUCeee9xm+HPQm1Xan7zZk5hheQjM99nBvdzRzMz0emsctQ9RjQnKaWKBuL1CIvXQjk0Y=
X-Received: by 2002:a2e:2a44:: with SMTP id q65mr17237317ljq.238.1617640837530; 
 Mon, 05 Apr 2021 09:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
 <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
In-Reply-To: <YGNNCEAMSWbBU+hd@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Apr 2021 00:40:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTitt=aD1eU_i_Nvf2vvYWcPeeyB97UyGwV-G4e+Lh7yw@mail.gmail.com>
Message-ID: <CAJF2gTTitt=aD1eU_i_Nvf2vvYWcPeeyB97UyGwV-G4e+Lh7yw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_174041_561631_E99C2BD8 
X-CRM114-Status: GOOD (  25.84  )
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

On Wed, Mar 31, 2021 at 12:08 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Mar 30, 2021 at 11:13:55AM +0800, Guo Ren wrote:
> > On Mon, Mar 29, 2021 at 8:50 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> > > > u32 a = 0x55aa66bb;
> > > > u16 *ptr = &a;
> > > >
> > > > CPU0                       CPU1
> > > > =========             =========
> > > > xchg16(ptr, new)     while(1)
> > > >                                     WRITE_ONCE(*(ptr + 1), x);
> > > >
> > > > When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.
> > >
> > > Then I think your LL/SC is broken.
> > >
> > > That also means you really don't want to build super complex locking
> > > primitives on top, because that live-lock will percolate through.
>
> > Do you mean the below implementation has live-lock risk?
> > +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> > +{
> > +       u32 old, new, val = atomic_read(&lock->val);
> > +
> > +       for (;;) {
> > +               new = (val & _Q_LOCKED_PENDING_MASK) | tail;
> > +               old = atomic_cmpxchg(&lock->val, val, new);
> > +               if (old == val)
> > +                       break;
> > +
> > +               val = old;
> > +       }
> > +       return old;
> > +}
>
> That entirely depends on the architecture (and cmpxchg() impementation).
>
> There are a number of cases:
>
>  * architecture has cmpxchg() instruction (x86, s390, sparc, etc.).
>
>   - architecture provides fwd progress (x86)
>   - architecture requires backoff for progress (sparc)
>
>  * architecture does not have cmpxchg, and implements it using LL/SC.
>
>   and here things get *really* interesting, because while an
>   architecture can have LL/SC fwd progress, that does not translate into
>   cmpxchg() also having the same guarantees and all bets are off.
Seems riscv spec didn't mandatory LR/SC fwd guarantee, ref:

In riscv-spec 8.3 Eventual Success of Store-Conditional Instructions

"As a consequence of the eventuality guarantee, if some harts in an
execution environment are executing constrained LR/SC loops, and no
other harts or devices in the execution environment execute an
unconditional store or AMO to that reservation set, then at least one
hart will eventually exit its constrained LR/SC loop. *** By contrast,
if other harts or devices continue to write to that reservation set,
it ***is not guaranteed*** that any hart will exit its LR/SC loop.***
"

>
> The real bummer is that C can do cmpxchg(), but there is no way it can
> do LL/SC. And even if we'd teach C how to do LL/SC, it couldn't be
> generic because architectures lacking it can't emulate it using
> cmpxchg() (there's a fun class of bugs there).
>
> So while the above code might be the best we can do in generic code,
> it's really up to the architecture to make it work.

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
