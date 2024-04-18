Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09770C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 14:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uViCt9F26ut9mQgzUNNJIj/ZW//lH/Xs1BuDcPgjPe0=; b=dK0FBp+5u58pcCH1sQUPGY75VQ
	tEMVTV5qiiF0QBMyQNjxOQ95WYkxqD8m3OhW7cRf4P7mknG2UaBm0b+iplMM7DnqZHDGyYRK9wMsM
	aIirr9HdpIiiTKEe12CvTPx7j5ZyJ8fxEetr7knXRk4u5dpND4SzjXIvLIS+sdX323qVmS1OmX6eD
	JXQb4AIdRnWsEoUuyjP0N8FZyuArbMJa1Wozmu+0KURa5zwUVxaVFf0Ihwo6ODRBIct3/C9olEPOl
	2GxIhpJiWZVsXqCh7+nuFMJAuiJ1ixAUBvgjqXTT/ra5H5UMX64DoxukIOHfQF1vmi/gOYMhGsBFg
	HgIf/qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSRN-00000002WqO-2MwS;
	Thu, 18 Apr 2024 14:08:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSRF-00000002Wmv-1xY8
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38DB0CE162B;
	Thu, 18 Apr 2024 14:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFBEC113CC;
	Thu, 18 Apr 2024 14:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713449309;
	bh=g/KqDqr1SceKtAwHTvVpWKhfc8Vr3dFUZKNkr7xMSAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHFF7J0sE5nDYCDNIjnpvnuG6mADEST9SsZFgbZc7P+ASD4sH1A5T9CNlbzIgct5m
	 T8qIc9P8CiPwh4z0q4IFJf/FwkuCuGKjg93dt/yta6kb7AGWugWuzqQHyyfGJaMRLN
	 Y5bCl+jeAPRfYuAQOg9lLBEMp+nGGklWk9rG3fasYRJRXBkFdx/vRuYU6/B2n9ne+e
	 ft0yHZmnXWMwhOvehAWfuA5Uvx9/sJ3VvLYxQUrhs7wwrWmeHnxFhTnzegYYOC0gVq
	 XE3aN4+uz4mkmgWPvdR530dZunEl3/7XDu6C18sDCRFfAlxgR/c05Dp5S/yhfWxWy7
	 pRQboWqPtTsDw==
Date: Thu, 18 Apr 2024 15:08:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
	guoren@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, lihangjing@bytedance.com,
	dengliang.1214@bytedance.com, xieyongji@bytedance.com,
	chaiwen.cc@bytedance.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [External] Re: [RFC 0/2] riscv: Idle thread using Zawrs extension
Message-ID: <20240418-variety-exhume-4fe364344086@spud>
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <CAEg0e7gDk6SFRh4oF0KsA7xZoMr7RuZXFWL8qD7rmM2cBDLwcg@mail.gmail.com>
 <CAPYmKFsQQPCd-34GArHfC-Sv8PCYHgmZxprK3WHKnJquQDoXiQ@mail.gmail.com>
 <CAEg0e7hpjAec=2k+PwJeb0WezmJCFdUD=HbCiGe7+RxKgPHgtg@mail.gmail.com>
 <CAPYmKFudqq6Yg=uaVjAubCMM5TBMj8dkC0mXz+6eq3vNizTt7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPYmKFudqq6Yg=uaVjAubCMM5TBMj8dkC0mXz+6eq3vNizTt7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_070834_142944_B799F126 
X-CRM114-Status: GOOD (  25.49  )
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
Content-Type: multipart/mixed; boundary="===============3664742484920695904=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3664742484920695904==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fk4xyD64bIbrps5W"
Content-Disposition: inline


--Fk4xyD64bIbrps5W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 09:09:06PM +0800, Xu Lu wrote:
> On Thu, Apr 18, 2024 at 8:56=E2=80=AFPM Christoph M=C3=BCllner
> <christoph.muellner@vrull.eu> wrote:
> >
> > On Thu, Apr 18, 2024 at 2:44=E2=80=AFPM Xu Lu <luxu.kernel@bytedance.co=
m> wrote:
> > >
> > > On Thu, Apr 18, 2024 at 8:26=E2=80=AFPM Christoph M=C3=BCllner
> > > <christoph.muellner@vrull.eu> wrote:
> > > >
> > > > On Thu, Apr 18, 2024 at 1:50=E2=80=AFPM Xu Lu <luxu.kernel@bytedanc=
e.com> wrote:
> > > > >
> > > > > This patch series introduces a new implementation of idle thread =
using
> > > > > Zawrs extension.
> > > >
> > > > This overlaps with the following series:
> > > >   https://lore.kernel.org/all/20240315134009.580167-7-ajones@ventan=
amicro.com/
> > >
> > > Hi Christoph.
> > > Thanks for your reply!
> > > Actually our patch series is different from this. The work from your
> > > link focuses on providing support for Zawrs and implementing spinlock
> > > using it, while our work focuses on implementing idle thread using
> > > Zawrs and accelerating IPI to idle cpu. Of course, the ISA ZAWRS
> > > config part can be merged. We will refine our code in the next version
> > > to reduce code conflicts.
> >
> > Yes, I've seen that this targets another optimization, but the basic
> > Zawrs support
> > would be identical to the other patchset (even if it is not).
> > I would propose that we work on a basic Zawrs support patchset that int=
roduces
> > the Kconfig, DTS and hwprobe parts (a subset of Andrew's patchset).
> > Once this is merged, all other optimizations can be built upon it
> > (spinlocks, idle thread, glibc CPU spinning).
> > If this proposal is fine for the maintainers/reviewers, then Andrew cou=
ld resend
> > these basic-support patches.
> >
> > BR
> > Christoph
>=20
> Roger that! This does make more sense. We will rebase our code on
> Andrew's basic support patches in the next version.

IIRC Drew's working on a new version of the linked series (we were
talking about it yesterday) so hold off for that before doing a rebase
and sending a new version I think.

Thanks,
Conor.

--Fk4xyD64bIbrps5W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiEpWAAKCRB4tDGHoIJi
0iP1AQDU2aET0LsGNcFkDzq2ZvrGNzqDCDtIdtlPBbmS/gTmsQEAxzRxLXs9jbYn
R3OVENIITqSyFtfdaNrNL/ezuQ87OgA=
=Qxuc
-----END PGP SIGNATURE-----

--Fk4xyD64bIbrps5W--


--===============3664742484920695904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3664742484920695904==--

