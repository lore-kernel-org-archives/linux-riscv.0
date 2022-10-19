Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491F1C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 13:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJTJB0F8G8nS2pSLeKjq0T/548cAGMnaxT+0VxX7XDo=; b=GqIIhZEGePotlx
	ZNhwqeceJn7MLbqXX9V1y2mUAX8QteVAZKU/nBVY9ClyU7EAUttUCoeSyUP95jSm6vefyC8dOQS5x
	PiM0S6rTvbhP5ZW1kD4ynBymejRx+LUd7Ilnx/BXaREvmb+wwHjs/wmd5d2QsI7WUa/bD0IBf7378
	o5WjHvMv9BhS1mi/KJ9aFp7VzwENxp1rr7i21QoKHQBj8+TEICuNl7j4Lh/r67NMIzY1HJDEf9wtZ
	POmR5A+suNCZcKQvoA13jyQWpMafy9u9AGCcB6fAuG/Wlk8vPdTpfUG9/bqI4E8St9+31fC5g8+nq
	29bkrTDd9xkLbez1P9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8qs-0023Xz-JF; Wed, 19 Oct 2022 13:11:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8qm-0023X0-Uo
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 13:11:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9DA99B82488;
	Wed, 19 Oct 2022 13:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E03C433D6;
	Wed, 19 Oct 2022 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666185070;
	bh=wY1M4RkPxwgRgjYuzUK2ZTBXoD9/bIiPor4ikkDS9K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cc2gVFT+bbsm/hjhbo63RI4Q97w5HISjEMDg1F1wGD0JqNeKSpajr0PR2+d6sqOlB
	 InKbG5krytIlt98zeDYQCEMrOx1MbEG1heA3WiaiTRdSnKpkU5f0nPIYNuDUZk5M+r
	 uGDekJCYfnGda1Z9yq+5qLOvGbVFec8Bn+6nXljE2gmpsT2spwJo3vgECfjRxkERFS
	 Um63BWHI3XZm+xp+0de5g2HgUYbFktmPFCcdWRlKpiwyIfTq0AztzyF+t7jDoeUIat
	 zvAP+6Jle1C1OHIg6GR+4NtI3l0IrMBzaIW5a33hFFCOkYhHpShcUA1LkZJ0LMNYXV
	 BTjVThuiLYziQ==
Date: Wed, 19 Oct 2022 21:01:32 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 4/4] riscv: entry: consolidate general regs saving
 into save_gp
Message-ID: <Y0/1LD7pqeKeCfeR@xhacker>
References: <20220928162007.3791-1-jszhang@kernel.org>
 <20220928162007.3791-5-jszhang@kernel.org>
 <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com>
 <YzXBZnGXQdEGR1LW@xhacker>
 <CAJF2gTTonVbTAJGw3qHdfK5vKkHRX64hJB757zsiNgWq4y0Xmw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTonVbTAJGw3qHdfK5vKkHRX64hJB757zsiNgWq4y0Xmw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_061113_159754_0C4EFD43 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, Oct 19, 2022 at 10:55:09AM +0800, Guo Ren wrote:
> On Fri, Sep 30, 2022 at 12:11 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > On Thu, Sep 29, 2022 at 11:59:00AM +0800, Guo Ren wrote:
> > > On Thu, Sep 29, 2022 at 12:29 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> > > >
> > > > Consolidate the saving/restoring GPs(except ra, sp and tp) into
> > > > save_gp/restore_gp macro.
> > > >
> > > > No functional change intended.
> > > >
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > ---
> > > >  arch/riscv/include/asm/asm.h   | 65 +++++++++++++++++++++++++
> > > >  arch/riscv/kernel/entry.S      | 87 ++--------------------------------
> > > >  arch/riscv/kernel/mcount-dyn.S | 58 +----------------------
> > > >  3 files changed, 70 insertions(+), 140 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> > > > index 1b471ff73178..2f3b49536e9d 100644
> > > > --- a/arch/riscv/include/asm/asm.h
> > > > +++ b/arch/riscv/include/asm/asm.h
> > > > @@ -68,6 +68,7 @@
> > > >  #endif
> > > >
> > > >  #ifdef __ASSEMBLY__
> > > > +#include <asm/asm-offsets.h>
> > > >
> > > >  /* Common assembly source macros */
> > > >
> > > > @@ -80,6 +81,70 @@
> > > >         .endr
> > > >  .endm
> > > >
> > > > +       /* save all GPs except ra, sp and tp */
> > > > +       .macro save_gp
> > > How about leave x3(gp) out of the macro, and define:
> > > .marco save_from_x5_to_x31
> > > .marco restore_from_x5_to_x31
> >
> > Good idea, will do in next version.
> 
> Where is the next version?
> 
> I want to involve the patch in my generic entry series, it would help
> in the coding convention of the entry code.

Hi,

Here is the v3:
https://lore.kernel.org/linux-riscv/20221003102921.3973-1-jszhang@kernel.org/T/#t

thanks very much

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
