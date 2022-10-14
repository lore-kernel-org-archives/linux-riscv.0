Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C593AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 18:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBGQdnFUojn176Gh5/81jFhAl80qKTxJjgwY1vBQPV8=; b=EO2hOx22zzHNKa
	ubU2Z5tdPmznLn3QRpv6vpX7YWl9NZLe1/+g16ArCaIOXaIYd2fJR1XLq3EQTDfZVQZVGCmmpht83
	XWkWCp8izHBDgRSOdVxq2ix7bO6TU2Hfvm5pEbG76+/1vGg7KBdl04dPNZ3UKC0hpRGaEHuY2N8jw
	wOCeEmgxJDwiUPjnr6D6HwSrfshvEtvS/nysL+tE3ARGlgRks9bXgUApT9VXUE8J/jmQv0iFP4HtH
	K6bKk9YcTgEtPQCjtg5Jo/soNYg1pdewx4Uum20IzomPQT1zGEbGTlQe3SYfNdB3rWsWwkA3nqWm7
	itCiFi6pxt2ZI7d87LLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojPGo-00FbqQ-ET; Fri, 14 Oct 2022 18:18:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojPGl-00Fbq3-DB
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 18:18:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE76F6135D;
	Fri, 14 Oct 2022 18:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6A3C433C1;
	Fri, 14 Oct 2022 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665771530;
	bh=xhDZYuIfFit/fN9G1ayXFPbjVvKWBMTddCQP4agZCgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUjdDo/FIO2c2TWy2gQGmHrFQmI9RUlLMdHcne8S4UiRRtmN04rjp0Zv0+f1ulme/
	 9sVov1o5n2EftCKQreF5JEjM4c5gj115uSb3JrTCcP6ltuaTA0hZYCnGRQelBlG+Mi
	 vsAsfpR679NNq5yR59kUifIPz26Z+5baVMiN2mhd+uh7fjKritIA77kQTjQmuhQQ8+
	 cup1aJEywU33DCEQialckHlt388GpFGT/OECEZF/xRSGRWl+lLnjYoPHE25sKqcFD8
	 LXu5TtrmMJE/ld0c+pl9ChN3mC14NxLedVhb67dhouLZc/xPzewBKAavvy1nzAmjXl
	 LPFajUsw7wHTw==
Date: Fri, 14 Oct 2022 19:18:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, konstantin@linuxfoundation.org
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: RISC-V Patchwork
Message-ID: <Y0moBigLHn5HulNi@spud>
References: <Y0ifX4gYDD0DIkYd@spud>
 <mhng-ec7cf859-caaa-4b72-8dd9-d88e81d6126a@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-ec7cf859-caaa-4b72-8dd9-d88e81d6126a@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_111851_564774_840207FD 
X-CRM114-Status: GOOD (  46.72  )
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

On Fri, Oct 14, 2022 at 09:15:04AM -0700, Palmer Dabbelt wrote:
> On Thu, 13 Oct 2022 16:29:35 PDT (-0700), Conor Dooley wrote:
> > On Thu, Oct 13, 2022 at 04:14:39PM -0700, Palmer Dabbelt wrote:
> > > On Tue, 11 Oct 2022 09:07:45 PDT (-0700), Conor Dooley wrote:
> > > > Hey,
> > > >
> > > > As one or two people have already noticed, we've resurrected the
> > > > patchwork for the RISC-V list @
> > > > https://patchwork.kernel.org/project/linux-riscv/list/
> > > >
> > > > The patchwork bot should let people know when their patches have been
> > > > applied. Hopefully it'll help people track what the status of their
> > > > patches are a little better and try to prevent stuff falling through
> > > > the cracks in Palmer's inbox.
> > > >
> > > > As an FYI, the statuses that are intended to be used are:
> > > > - New: No action has been taken yet
> > > > - Under Review: The maintainer is waiting for review comments from others
> > > > - Changes Requested: Either the maintainer or a reviewer requested
> > > >   changes in the patch. The patch author is expected to submit a new
> > > >   version
> > > > - Superseded: There's a new version of the patch available
> > > > - Not Applicable: The patch is not intended for the RISC-V tree
> > > > - Accepted: The patch has been applied
> > > > - Rejected: The patch has been rejected, with reasons stated in an
> > > >   email
> > > >
> > > > I reset patchwork and marked all patches as archived so we would have a
> > > > fresh start. If your patch has been archived & not applied by the end of
> > > > this merge window, feel free to resend it.
> > > >
> > > > Thanks,
> > > > Conor.
> > > >
> > > > @Palmer: hopefully I did the scissors thing correctly..
> > > 
> > > b4 doesn't like it, but my old scripts just picked up the whole thing as a
> > > patch.  I tossed the above bits, LMK if something went off the rails.
> > 
> > I just copied the suggested scissors format from the git-mailinfo man
> > page and pasted that. I didn't know this prior to 5 mins ago, but
> > `b4 mbox` splits it on the scissors line, into a patch and an email
> > inside the mbox - but for w/e reason, `git am` (or `b4 shazam`) then
> > seems to try and apply the email instead of the patch? Or else pasting
> > the patch into mutt was a terrible idea? Maybe it's worth mentioning to
> > Konstantin that things get messed up here, I'll do it tomorrow if I
> > remember.
> 
> If the man pages suggest doing this but the tools fail then it's worth
> fixing something, even if it's just the man page ;)

Konstantin, perhaps you can shed some light on what's happening here?
FWIW I see this on 0.10.0-dev-d8d41.

Thanks,
Conor.

> 
> > Unlikely I'll ever really send many more patches with this format so w/e
> > at the end of the day.
> > Thanks,
> > Conor.
> > 
> > > 
> > > >
> > > > -- >8 --
> > > > From f886e8a9def4bd3f2fa8a0a4d7e92c94fe72ea72 Mon Sep 17 00:00:00 2001
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > Date: Tue, 11 Oct 2022 16:49:53 +0100
> > > > Subject: [PATCH] MAINTAINERS: add RISC-V's patchwork
> > > >
> > > > The RISC-V patchwork instance on kernel.org has had some necromancy
> > > > performed on it & will be used going forward. The statuses that are
> > > > intended to be used are:
> > > > - New: No action has been taken yet
> > > > - Under Review: The maintainer is waiting for review comments from others
> > > > - Changes Requested: Either the maintainer or a reviewer requested
> > > >   changes in the patch. The patch author is expected to submit a new
> > > >   version
> > > > - Superseded: There's a new version of the patch available
> > > > - Not Applicable: The patch is not intended for the RISC-V tree
> > > > - Accepted: The patch has been applied
> > > > - Rejected: The patch has been rejected, with reasons stated in an
> > > >   email
> > > >
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  MAINTAINERS | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 8a5012ba6ff9..e2882dc703d8 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -17516,6 +17516,7 @@ M:	Palmer Dabbelt <palmer@dabbelt.com>
> > > >  M:	Albert Ou <aou@eecs.berkeley.edu>
> > > >  L:	linux-riscv@lists.infradead.org
> > > >  S:	Supported
> > > > +Q:	https://patchwork.kernel.org/project/linux-riscv/list/
> > > >  P:	Documentation/riscv/patch-acceptance.rst
> > > >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> > > >  F:	arch/riscv/
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
