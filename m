Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B54C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 23:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiorK8etSGKQQYw+XDrHGvliaaDT9yHxiWZfSIAfe4U=; b=YyFn+Fq2wfouzJ
	1qjXMSUxi0EsZmoQGco9H7qzr2f5ifIErDHu009j20UR2pmDeDI8DQHvSstXF1BswcDt9w7aihGqp
	HOHkCGOGuvzRwevaW344udJ9iY7pQJNrwTgZZGHnIXthWvxFh1sjJwv4FsSCp9j2zK2dh76BBbUDh
	/0QFbkxhKjehljGEaue5miEhMCoWGMY8UaJk7aG28JKCMUi5pKR873eJmkqlzfzLIQENJx9ewdBWZ
	ZAHHWFBFtWssRAHX+ZQqIyPbGkrDyFHWnvQnvS0tNOCUUSGbT+2FxpFtvnv58Ump/lQraqcF3TO3V
	ynHnMF8KdGp+KmPk10oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj7e2-00DAI1-NO; Thu, 13 Oct 2022 23:29:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj7dz-00DAHd-Vo
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 23:29:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 544AC61988;
	Thu, 13 Oct 2022 23:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30A7C433C1;
	Thu, 13 Oct 2022 23:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665703778;
	bh=q8EPhK4EjdWm2TJUs9B6vNjUDa5Uao/4HBV3tRnWlOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVoXTMGaaFUues++pM7kNpbCtTTsQg4GjrvKA57MSgQkdRtKo8edNdPHr4I0TNWwa
	 jLmPcdNZASYA7BcUWBmnNFegObneiQBc2ggkmHtuabB8y/5+DaV01fUwivSD4W0Zuo
	 lQaQSylNl+Orb79Hv/8MDuaoto3AcckiMLp2HyiZfs6nA8SKpDOlNVg/S4TirhEEyY
	 0rU04iSVshdgIJKJCDOiRo4WwRvpqqeL630pcWg14gKQXcSpBiP9STlv8+EMu7yCVE
	 OV8U7UvuMOZAc0+JBD/kAzT1e5Nou1EOj9k3iOh2xuCG7eMwmHALL8jPujnjxZlGEh
	 yMfor0xSvxsxA==
Date: Fri, 14 Oct 2022 00:29:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: RISC-V Patchwork
Message-ID: <Y0ifX4gYDD0DIkYd@spud>
References: <20221011160744.2167025-1-conor@kernel.org>
 <mhng-8133a216-9206-49bc-bff5-0cbedfb2ce28@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-8133a216-9206-49bc-bff5-0cbedfb2ce28@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_162940_145254_65689FBF 
X-CRM114-Status: GOOD (  38.97  )
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

On Thu, Oct 13, 2022 at 04:14:39PM -0700, Palmer Dabbelt wrote:
> On Tue, 11 Oct 2022 09:07:45 PDT (-0700), Conor Dooley wrote:
> > Hey,
> > 
> > As one or two people have already noticed, we've resurrected the
> > patchwork for the RISC-V list @
> > https://patchwork.kernel.org/project/linux-riscv/list/
> > 
> > The patchwork bot should let people know when their patches have been
> > applied. Hopefully it'll help people track what the status of their
> > patches are a little better and try to prevent stuff falling through
> > the cracks in Palmer's inbox.
> > 
> > As an FYI, the statuses that are intended to be used are:
> > - New: No action has been taken yet
> > - Under Review: The maintainer is waiting for review comments from others
> > - Changes Requested: Either the maintainer or a reviewer requested
> >   changes in the patch. The patch author is expected to submit a new
> >   version
> > - Superseded: There's a new version of the patch available
> > - Not Applicable: The patch is not intended for the RISC-V tree
> > - Accepted: The patch has been applied
> > - Rejected: The patch has been rejected, with reasons stated in an
> >   email
> > 
> > I reset patchwork and marked all patches as archived so we would have a
> > fresh start. If your patch has been archived & not applied by the end of
> > this merge window, feel free to resend it.
> > 
> > Thanks,
> > Conor.
> > 
> > @Palmer: hopefully I did the scissors thing correctly..
> 
> b4 doesn't like it, but my old scripts just picked up the whole thing as a
> patch.  I tossed the above bits, LMK if something went off the rails.

I just copied the suggested scissors format from the git-mailinfo man
page and pasted that. I didn't know this prior to 5 mins ago, but
`b4 mbox` splits it on the scissors line, into a patch and an email
inside the mbox - but for w/e reason, `git am` (or `b4 shazam`) then
seems to try and apply the email instead of the patch? Or else pasting
the patch into mutt was a terrible idea? Maybe it's worth mentioning to
Konstantin that things get messed up here, I'll do it tomorrow if I
remember.

Unlikely I'll ever really send many more patches with this format so w/e
at the end of the day. 
Thanks,
Conor.

> 
> > 
> > -- >8 --
> > From f886e8a9def4bd3f2fa8a0a4d7e92c94fe72ea72 Mon Sep 17 00:00:00 2001
> > From: Conor Dooley <conor.dooley@microchip.com>
> > Date: Tue, 11 Oct 2022 16:49:53 +0100
> > Subject: [PATCH] MAINTAINERS: add RISC-V's patchwork
> > 
> > The RISC-V patchwork instance on kernel.org has had some necromancy
> > performed on it & will be used going forward. The statuses that are
> > intended to be used are:
> > - New: No action has been taken yet
> > - Under Review: The maintainer is waiting for review comments from others
> > - Changes Requested: Either the maintainer or a reviewer requested
> >   changes in the patch. The patch author is expected to submit a new
> >   version
> > - Superseded: There's a new version of the patch available
> > - Not Applicable: The patch is not intended for the RISC-V tree
> > - Accepted: The patch has been applied
> > - Rejected: The patch has been rejected, with reasons stated in an
> >   email
> > 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8a5012ba6ff9..e2882dc703d8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17516,6 +17516,7 @@ M:	Palmer Dabbelt <palmer@dabbelt.com>
> >  M:	Albert Ou <aou@eecs.berkeley.edu>
> >  L:	linux-riscv@lists.infradead.org
> >  S:	Supported
> > +Q:	https://patchwork.kernel.org/project/linux-riscv/list/
> >  P:	Documentation/riscv/patch-acceptance.rst
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> >  F:	arch/riscv/
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
