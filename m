Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB41C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Dec 2021 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLKsFXkF1gcXgZWBpbcgZ/ztcAuT83OAADu461vnXU4=; b=uyQPqenPwq9KqX
	7ttrzNxduARiOTF+bqILqcfqLhIKojkyyNrhuFACcuCOEhmlOvXLjbmRTgoP06LEpW1ujpTqhRnRs
	h583EJgQ4ITgV4jTKa4Kw8WiEZ7wr7hP7q5QWY2E9LCVO73S/u1nA05YzFYQOikWFFpOpDcVg0w9w
	pop5K59/rAkbS5fDt9jG6StBRy+T3Ozkmsrf/D7dUQh53Ilj4PxsAljgsYw3IRHIeNi7RBdnZEjVd
	WF8bb6aMa+7HhwuIhaUgVlexN7CiypUVncmP+tbcAhqmytPGF6ZEcFc3gyujdlPdBQQI07U8Aw72r
	XlY/kVxU0gDmTxj2McFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1ScL-00FYnj-9B; Sun, 26 Dec 2021 12:27:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1Sc9-00FYmI-Bt; Sun, 26 Dec 2021 12:27:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E53CE60DE1;
 Sun, 26 Dec 2021 12:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385AAC36AE9;
 Sun, 26 Dec 2021 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640521619;
 bh=Gt+sKS/vnEa5FGvBJkvK92fBrjRRtbp7Elv7vtB9T6Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O5ND8GZTzP37FqqW8YI2l78OPV1MEBsFN5w9qPpRnexGo+9xYaa1HFPkTv5Vsu5Gg
 ZPf9GHibAO3s/vFsmfwbLMgOVy4raObDtyaVspfPGUFDdzdBI8p1mCQpOg1EHdERyy
 Hj93UzgNK+XoMK1vH+ZdB63xCnx1w7FgAW/X2m8ta/2yDh6iE/q2igFWuioe2jKu2S
 ssSpUFwimZsymCnoWbPXh/BZIR5H8KjBH5KCmIZAmAEZ4QU+EWtYl1yLJQARHRQOoy
 cKltW5PrVUKXlhzuOwnQupQOwbbSnDJ5l5dOkmuXbai247xsv39sFiSx2v/Po9Ft3Z
 7MtB4KDlYriWA==
Received: by mail-ua1-f41.google.com with SMTP id az37so1633670uab.12;
 Sun, 26 Dec 2021 04:26:59 -0800 (PST)
X-Gm-Message-State: AOAM531IMja88efRxXSDc+jUGXJ//JISN7hRVKpXMsrMumkpv5FPO3MB
 efG2s6ySdcU1vCQTpIenT6Pf2dU20YDxOidRGuc=
X-Google-Smtp-Source: ABdhPJwhAjMl5vuVSY+e1MSrYZHNtN97FcWsuy4jm06VIDX71OU9nlYSpTUdTc6ASHpq06SMtAZBcytU0piDmRlLNi8=
X-Received: by 2002:a67:f2c6:: with SMTP id a6mr3560309vsn.59.1640521618234;
 Sun, 26 Dec 2021 04:26:58 -0800 (PST)
MIME-Version: 1.0
References: <20211225045430.2868608-1-guoren@kernel.org>
 <20211225045430.2868608-6-guoren@kernel.org>
 <YcdGC4ZNejSgZgRG@osiris>
In-Reply-To: <YcdGC4ZNejSgZgRG@osiris>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 26 Dec 2021 20:26:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSD-cUFzXLP4pdgkmZB=e54-uROvOFYUJDOP1ofX6_uzw@mail.gmail.com>
Message-ID: <CAJF2gTSD-cUFzXLP4pdgkmZB=e54-uROvOFYUJDOP1ofX6_uzw@mail.gmail.com>
Subject: Re: [PATCH V2 5/8] sched: s390: Remove unused TASK_SIZE_OF
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 sparclinux@vger.kernel.or, linuxppc-dev@lists.ozlabs.org, 
 inux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, x86@kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_042701_530662_D138768D 
X-CRM114-Status: GOOD (  17.17  )
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

On Sun, Dec 26, 2021 at 12:26 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Sat, Dec 25, 2021 at 12:54:27PM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This macro isn't used in Linux sched, now. Delete in
> > include/linux/sched.h and arch's include/asm.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/s390/include/asm/processor.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
>
> I could pick this up for s390, however sender (From: field) of this patch
> series does not match From: and Signed-off-by: fields above.
Thx.

>
> In general I don't pick up such patches, since this doesn't match the
> "Developer's Certificate of Origin" requirements.
> -> Documentation/process/submitting-patches.rst
I've updated .mailmap with:

Guo Ren <guoren@kernel.org> <guoren@linux.alibaba.com>
Guo Ren <guoren@kernel.org> <ren_guo@c-sky.com>

------

If you are still concerned, how about:

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux sched, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
