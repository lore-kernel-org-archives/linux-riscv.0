Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6191FCD5BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfGzBcteBLSkgFoZxKCWWEZtP72rbywdM2SeEWrmC90=; b=G+nVpqmo2c5jyC
	ho1h7t+f9fUd/lbyH550HItVvjHVD11tIJZwWdmV8cVsx0Fe13FueBZghm2xWeTJ/e2Xa+CRzWqrz
	t5mMOSs1zz4hRGcBFC8W+MHdlpmKK5k2vfc2O8Ks/c1h38wBcr9kS/fC2CIJuIriBUxDEfa3imbjc
	AdmUVP8I8JC2WeB4sc5Q8pXNQdUXedPOkXODP2rHmfbgrSXCNBWIrcPqUeQKLZY7Xlpzkqxu357vg
	LG8eWUzOYOsOGk1Md5IthE4rNiOCmO+bwx+2cB6gUXNCs7jKtOKsVEyWQkz/whrqbbYX5VnAEFONP
	taSQUPlM+euNhpj1tdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTfi-0000000ACE2-1FS3;
	Thu, 13 Nov 2025 09:31:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTfd-0000000ACDT-3t8d
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 09:31:16 +0000
Date: Thu, 13 Nov 2025 10:31:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763026270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=di0zlvtolFZ2ujSvVa+1BFR0CAlyEx4DiO0mYSWQDwc=;
	b=ygwUYp2FepRzD3HjKdKbHo13iKPe5fGwe/j9Ys6zZiMvxAWN1OBuAhyCiELOtD2RGYJltU
	8VX7MMGJ5DjE9n6DrWYVAuNwfdZvsbH1aHRwEYX3teYkFw5AJBO35bW4WpF5Tk5kFHUWrL
	gLNEY+Wc1BUOIms3gsYJ/wOrqfpecWcaeu7T+cTr/m0bQLMtttloE8h10mHvi2/tYzORRN
	G/jTKrO/gkksvgHb4CvJQr0H0W8vsKeIQ0e8rgMNvSrLaU6xLfa0eBk4Zd3xD9o+7GQDNd
	mfHowgXQeM41cjXmGj3ubXSd3BExQ+zjAH7KBXzuEcjBpvptyc3CwuDZVPJ21A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763026270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=di0zlvtolFZ2ujSvVa+1BFR0CAlyEx4DiO0mYSWQDwc=;
	b=+qRXOq4Jk2slHhdA1iSs+PP5mTSlOHMcDybHXlytmmFNwk4bSfci9b5O8vXXVZ+OjYzTkf
	EiwvRX9YrR/EFeCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Message-ID: <20251113102307-ca2180c8-4876-46ea-8678-aaedd9ba36f0@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <aRToC77bNUy2sKAK@derry.ads.avm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRToC77bNUy2sKAK@derry.ads.avm.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_013114_104769_0099E431 
X-CRM114-Status: GOOD (  27.31  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 12, 2025 at 09:03:23PM +0100, Nicolas Schier wrote:
> On Tue, Oct 14, 2025 at 03:05:15PM +0200, Thomas Wei=DFschuh wrote:
> > The current logic to inherit -m32/-m64 from the kernel build only works
> > for a few architectures. It does not handle byte order differences,
> > architectures using different compiler flags or different kinds of ABIs.
> > =

> > Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> > the flags used for userprogs.
> > =

> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> > Changes in v2:
> > - Rebase and drop already applied patch
> > - Disable CC_CAN_LINK if the test program generates warnings
> > - Move to architecture-specific logic
> > - Link to v1: https://lore.kernel.org/r/20250813-kbuild-userprogs-bits-=
v1-0-2d9f7f411083@linutronix.de
> > =

> > ---
> > Thomas Wei=DFschuh (10):
> >       kbuild: don't enable CC_CAN_LINK if the dummy program generates w=
arnings
> >       init: deduplicate cc-can-link.sh invocations
> >       kbuild: allow architectures to override CC_CAN_LINK
> >       riscv: Implement custom CC_CAN_LINK
> >       s390: Implement custom CC_CAN_LINK
> >       powerpc: Implement custom CC_CAN_LINK
> >       MIPS: Implement custom CC_CAN_LINK
> >       x86/Kconfig: Implement custom CC_CAN_LINK
> >       sparc: Implement custom CC_CAN_LINK
> >       kbuild: simplify CC_CAN_LINK
> > =

> >  Makefile                |  8 ++++++--
> >  arch/mips/Kconfig       | 15 +++++++++++++++
> >  arch/powerpc/Kconfig    | 15 +++++++++++++++
> >  arch/riscv/Kconfig      | 11 +++++++++++
> >  arch/s390/Kconfig       | 11 +++++++++++
> >  arch/sparc/Kconfig      | 11 +++++++++++
> >  arch/x86/Kconfig        | 11 +++++++++++
> >  init/Kconfig            |  7 +++++--
> >  scripts/Kconfig.include |  3 +++
> >  scripts/cc-can-link.sh  |  2 +-
> >  10 files changed, 89 insertions(+), 5 deletions(-)
> > ---
> > base-commit: 10f8210c7a7098897fcee5ca70236167b39eb797
> > change-id: 20250813-kbuild-userprogs-bits-03c117da4d50
> > =

> > Best regards,
> > -- =

> > Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > =

> =

> Thanks for the patch set and all the work behind!  I found only one
> issue in patch 3, the rest looks good to me as they are.
> =

> I haven't reviewed the compiler flags for the archs, but from the formal
> point of view they look good to me, too.
> =

> How shall we proceed with here?  I think, easiest would be if we get
> appropriate acks from the architecture maintainers, so we could take
> this via kbuild.

That would surely be the best option. Unfortunately quite frequently it is =
hard
to get architecture maintainer's feedback on a cross-architecture series.

> Other opinions?

It would also work to only take the first three patches through the kbuild =
tree
and push the other ones through the architecture trees.

I don't really have a clear preference.


Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
