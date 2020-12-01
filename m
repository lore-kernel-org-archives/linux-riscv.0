Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC83C64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 05:34:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC7752085B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 05:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hcwgqthj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC7752085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mpi/PCpdinj5Va8ptpQ08fGfc1zg6uk6/CMQiRtxWR8=; b=hcwgqthj4sMtaBqSjk67prqJS
	rRvMihZMU5Qr3bx/rd1GbpILSvAVADt+KZyZCtkS6ARedNB2/jkCVyb23pyxu/bD3Hssme+TLGTIv
	Yj1lrcaWwo6mhfsrKOmPLLtIyaJrDfLsL9HoLUwlferwyM8t1SacUOiv+/nxD+Gij+wonklqUEBUg
	/io+uRa/BePIKhN7LPwdaUJw9SUKwgl50GEMN8VTi0D4kJGL45MkEyr7MuTZ2dG0x0kEgEI0aEfAG
	sSPY63l7jAU4anPwzKAXRXXD6QVwwFE11GybsY6gvl6srLZUiceLsVcIDy9ytRP0qO9tlQyTr/S3o
	qMjuVzjwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjyIi-0005Qm-JE; Tue, 01 Dec 2020 05:34:08 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjyIe-0005Oc-W6
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 05:34:06 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0B15XHn0081932;
 Tue, 1 Dec 2020 13:33:17 +0800 (GMT-8)
 (envelope-from tesheng@andestech.com)
Received: from atcfdc88 (10.0.15.120) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Dec 2020 13:32:56 +0800
Date: Tue, 1 Dec 2020 13:32:57 +0800
From: Eric Lin <tesheng@andestech.com>
To: Pekka Enberg <penberg@gmail.com>
Subject: Re: [PATCH] riscv/mm: Prevent kernel module access user-space memory
 without uaccess routines
Message-ID: <20201201053257.GB7647@atcfdc88>
References: <20201130053037.27006-1-tesheng@andestech.com>
 <CAOJsxLH-tCyvydX_+djXNMpOAxW2Zr7rAZizLUwQVNyU8YreBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOJsxLH-tCyvydX_+djXNMpOAxW2Zr7rAZizLUwQVNyU8YreBg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0B15XHn0081932
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_003405_459574_F42D47A0 
X-CRM114-Status: GOOD (  20.96  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 "dslin1010@gmail.com" <dslin1010@gmail.com>,
 "Alan Quey-Liang Kao\(?????????\)" <alankao@andestech.com>,
 LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 30, 2020 at 04:07:03PM +0800, Pekka Enberg wrote:

Hi Pekka,
> On Mon, Nov 30, 2020 at 7:33 AM Eric Lin <tesheng@andestech.com> wrote:
> >
> > In the page fault handler, an access to user-space memory
> > without get/put_user() or copy_from/to_user() routines is
> > not resolved properly. Like arm and other architectures,
> > we need to let it die earlier in page fault handler.
> 
> Fix looks good to me. Can you elaborate on how you found the issue and
> how the bug manifests itself?

OK, I'll elaborate more on the commit message.

> 
> >
> > Signed-off-by: Eric Lin <tesheng@andestech.com>
> > Cc: Alan Kao <alankao@andestech.com>
> > ---
> >  arch/riscv/mm/fault.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> > index 3c8b9e433c67..a452cfa266a2 100644
> > --- a/arch/riscv/mm/fault.c
> > +++ b/arch/riscv/mm/fault.c
> > @@ -232,6 +232,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
> >         if (user_mode(regs))
> >                 flags |= FAULT_FLAG_USER;
> >
> > +       if (!user_mode(regs) && addr < TASK_SIZE && unlikely(!(regs->status & SR_SUM)))
> > +               die(regs, "Accessing user space memory without uaccess routines\n");
> 
> Let's introduce a die_kernel_fault() helper (similar to arm64, for
> example) to ensure same semantics for the different kernel faults. You
> can extract the helper from no_context().

OK, I'll add a die_kernel_fault() helper function in v2.

Thanks for your review.

> 
> > +
> >         perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
> >
> >         if (cause == EXC_STORE_PAGE_FAULT)
> > --
> > 2.17.0
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
