Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB1FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t86j4TnSwQeHOiyYxaNi1Ye2x/jz5V9HVIvgHF5Uwek=; b=rKv54jGxjoCcvn
	Yld3cFbEKmI/HBrDGe3hMCGH8yNQyypjdxq9CITsgijnrIVe+mPrgAdPtGnnD5o0MoorUAHSI1eha
	BJqvRo0rQGyv6ZVXakszWcjqt1s2uJfNuuHo4sRSQ/NCPBi9hR+T+ueSTBozezTQ8aqLW/pymVLP8
	m0hgeDYNSHBGoJWfJ8EGlRCpnkNonOjnukKp6IZy+SrcvtlCJiIEZsg5YiwrCnnyIkV1UKUPhbPmI
	I1Zo02OkUDi6FKm3XmUxumIFyjquYc834CZQ+obpvopONNhICZ0OfrveffFw+ESa0GcrChFeBMykZ
	FEu2wh6QpLeP9itaRUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw8F-0043kJ-Ti; Thu, 29 Sep 2022 16:11:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw8B-0043iC-VS
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 16:11:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 404BA61A3F;
	Thu, 29 Sep 2022 16:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6583C433D6;
	Thu, 29 Sep 2022 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664467882;
	bh=YQ2VBsdrbmdPy2lXy7ot5iuJYzQlEhfs7SsBIKRXys0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIiXGJaWxiVEK7X2NAyW+d/K6UeALMRP5UlZu5D/jYoqbAmGXNDzv/Y20YziT2HIH
	 VueM46Fqx1jwmmpB0RtTnFQXf54vSZf4HvO8hSpXJKylMbkhya2nJd3ceYoEwHrZ+b
	 HRZcZlwA6YvAr8MTVFHSDZX25Q0JHnBXN8qGKSXnsIJp70DrelwBnXwyhPesBQ47gm
	 YH7R5AFs5g8+tMucOIcfZ3NrS8Adnt1Kl6HMmkvlF0vM9daU5BzAT7jge2N8jcfL+Q
	 Bx4xR5htE9VIukaJeLeN8dRKyCt0N7YSTrqHusSOYOutV3dB1idDjYbC6Ec1wfsamg
	 UfTL446k0S+nw==
Date: Fri, 30 Sep 2022 00:01:42 +0800
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
Message-ID: <YzXBZnGXQdEGR1LW@xhacker>
References: <20220928162007.3791-1-jszhang@kernel.org>
 <20220928162007.3791-5-jszhang@kernel.org>
 <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_091124_066671_308D45F6 
X-CRM114-Status: GOOD (  14.70  )
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

On Thu, Sep 29, 2022 at 11:59:00AM +0800, Guo Ren wrote:
> On Thu, Sep 29, 2022 at 12:29 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Consolidate the saving/restoring GPs(except ra, sp and tp) into
> > save_gp/restore_gp macro.
> >
> > No functional change intended.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/include/asm/asm.h   | 65 +++++++++++++++++++++++++
> >  arch/riscv/kernel/entry.S      | 87 ++--------------------------------
> >  arch/riscv/kernel/mcount-dyn.S | 58 +----------------------
> >  3 files changed, 70 insertions(+), 140 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> > index 1b471ff73178..2f3b49536e9d 100644
> > --- a/arch/riscv/include/asm/asm.h
> > +++ b/arch/riscv/include/asm/asm.h
> > @@ -68,6 +68,7 @@
> >  #endif
> >
> >  #ifdef __ASSEMBLY__
> > +#include <asm/asm-offsets.h>
> >
> >  /* Common assembly source macros */
> >
> > @@ -80,6 +81,70 @@
> >         .endr
> >  .endm
> >
> > +       /* save all GPs except ra, sp and tp */
> > +       .macro save_gp
> How about leave x3(gp) out of the macro, and define:
> .marco save_from_x5_to_x31
> .marco restore_from_x5_to_x31

Good idea, will do in next version.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
