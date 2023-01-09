Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C9DC5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 21:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RA/rmMBwCIEjz16ocqWe153mO/bt2fNemh0h7GksBvQ=; b=ewzIIu+qS9Roy1CEF5oMt3ryAi
	uCHUJAWBfN8APduFCkhbek/m7JrLI/gYCkpcqUjNx+bECaCgWjvCc/lhQqlNKAizY7+hulQQwtPE9
	Rg0AO8e0CzTH9dFh4EiEifIsS9T4QR7u8Wa+mE3gqa2jfm/6B0jGy3Q8U+WtICz5Yg0gO2Q0jO4/g
	qsZSpbaAtDptrxG4sGglHzL4Zz+/Tn3H4ZnNAyxFS1vGlgPr5bYwKLcn1zCCzY4hcVXOlfpjqM8lS
	//wPcPBVfe5zf/9DhvIzSD6ZKQ9qUQAdbOE9eoS6fHSvzu2I0L+wnv6zYS8geb/9lfvi0k+SyHRJt
	30NwLpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF04E-004MKW-0F; Mon, 09 Jan 2023 21:52:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEzyx-004KMI-85
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 21:47:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0BB2DB80DE9;
	Mon,  9 Jan 2023 21:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6C5C433EF;
	Mon,  9 Jan 2023 21:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673300815;
	bh=RB2pYujoEeM8ITyKqv1+mdeEBdTMo8SAHoKJZU0gc6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkPR8/FMDayhq87VlmDouJt0uPeYn67iJ1ufQXzow7a2T2Zda1EKmhFoThjhcwSZv
	 rikF2Gxw9gaD6w+FAB0TvCfpX0y0hYCfpxgWJy7lA/Zf+GIL0Umc51Q25FAtxeUTju
	 w9XmaeSfqU7hV6MkZRf6L4wt73BBit0rr5v3jMVMPCUN3QvzAceoESbhLrkdcLMITY
	 5tiMypUl7aTD5TAfQQS1Jdb2p2xzudV5Y53wrVFA89tWOaoeyTRF4KuwShYbGd+9g1
	 CSLxZC+ySB6RzEV0+P0YNI+SsztdiprpOwuRpo90FwtqGUcWmcwb8BtO06PwW+zXYD
	 JflKeZZi/FcOg==
Date: Mon, 9 Jan 2023 21:46:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: note that counter access is part
 of the uABI
Message-ID: <Y7yLS1ie8800TW6b@spud>
References: <mhng-72f383f6-a85f-4587-9fa6-f85fb9f27ec8@palmer-ri-x1c9a>
 <87359wpy9y.fsf@meer.lwn.net>
 <87y1rooje8.fsf@meer.lwn.net>
 <Y4srdBCmYJFx+ypW@spud>
 <CAOnJCU+DhxcPjgftMspWAzhsms_8sXnGS++vbp1iJDB0XcOxLQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCU+DhxcPjgftMspWAzhsms_8sXnGS++vbp1iJDB0XcOxLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_134703_635934_02943ECF 
X-CRM114-Status: GOOD (  39.02  )
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
Content-Type: multipart/mixed; boundary="===============5849470095225333586=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5849470095225333586==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Of8Ve/q5NMcybKBF"
Content-Disposition: inline


--Of8Ve/q5NMcybKBF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2023 at 01:36:19PM -0800, Atish Patra wrote:
> On Sat, Dec 3, 2022 at 2:57 AM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Sat, Dec 03, 2022 at 03:45:35AM -0700, Jonathan Corbet wrote:
> > > Jonathan Corbet <corbet@lwn.net> writes:
> > >
> > > > Palmer Dabbelt <palmer@dabbelt.com> writes:
> > > >> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > >>
> > > >> I think I merged the last one of these, but if the doc folks pick =
it up
> > > >> that's fine with me.  Otherwise I'll take it when it comes back ar=
ound,
> > > >> so folks have time to take a look.
> > > >
> > > > "Doc folks" applied it, thanks. :)
> > >
> > > Actually, I take that back.  I'd missed this part from the patch:
> > >
> > > > Based on an, as yet, unsent v2 of my other uABI changes. I don't ex=
pect
> > > > it to be applicable, just getting a patch into patchwork while I do=
n't
> > > > forget about this.
> > >
> > > ...but b4 happily picked up a couple of *other* patches from this thr=
ead
> > > and applied them instead; I've now undone that.  Sorry for the noise.
> >
> > Huh, I accidentally put an "in-reply-to" header on this patch. I have
> > been updating some of my submission helper scripts & I must have left
> > the field populated from sending another set by accident:
> > https://lore.kernel.org/linux-riscv/20221129144742.2935581-1-conor.dool=
ey@microchip.com/
> >
>=20
> I don't see the patch upstream. Is this patch merged already ?

No it's not. I was going to resend it actually, but I noticed the thread
yesterday or something. Not sure why you CC'ed half the world on it but
not linux-riscv? Or me if you didn't want me resending it!

> If not, please hold on merging this for now. We had some discussions
> around this in the perf community.
> Here is the thread
> https://lore.kernel.org/lkml/Y7gN32eHJNyWBvVD@FVFF77S0Q05N/T/
>=20
> TLDR; Even though x86 allows unrestricted access through rdpmc (not
> default), it still reads zero unless a privileged root user modifies
> the MSR interface exposed by the kernel.
>=20
> Quoting PeterZ
>=20
> "RDPMC is only useful if you read counters you own on yourself -- IOW
> selfmonitoring, using the interface outlined in uapi/linux/perf_events.h
> near struct perf_event_mmap_page.
>=20
> Any other usage -- you get to keep the pieces."
>=20
> "Anyway, given RISC-V being a very young platform, I would try really
> *really* *REALLY* hard to stomp on these applications and get them to
> change in order to reclaim the PMU usage."
>=20
> We need to decide what's the best approach for RISC-V. The current
> text in uABI will let users assume that
> cycle/instret can be read without any issues which is wrong.
>=20
> There are few options what we can do for RISC-V:
>=20
> 1. We can trap n emulate and report 0 always as suggested by Mark in
> that thread.
> 2. Continue to allow the user to read the counters directly but
> expects the garbage value depending on the other activities
> on the system. Hopefully, folks will fix their application by that time.
>=20
> Once we have the procfs interface, we enforce the behavior by breaking
> the application.
>=20
> In either case, the uABI needs to be updated accordingly.

I don't disagree with what I saw either PeterZ or Mark say. I'm happy
not to resend this, I've got no skin in the game other than not wanting
something like that "documented" only in the driver.

What do you intend doing to instigate the "stomping"?

Thanks,
Conor.


--Of8Ve/q5NMcybKBF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7yLSwAKCRB4tDGHoIJi
0nT8AQDrYwKB9zV6+effQvOKu8ROX2RJEKzzr3Hg1ViZ5VcMBAEAor9F8ZBaFQr7
MsupbPHpuGARjonG4i9z+Zu7pVHUcwI=
=GGhW
-----END PGP SIGNATURE-----

--Of8Ve/q5NMcybKBF--


--===============5849470095225333586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5849470095225333586==--

