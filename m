Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AFEC004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 22:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3DvBResXyLCKmSL2rfnXWHGJDA7jg208IQXfr2jc6Y=; b=Bialtn55HMJ8cH1+wT1hIy3sMV
	U9MXOxLFmi+F0gitn5QAsyiYgbTtxH6ZItw29zWuY6Wxc8x2z/iaQk/mRZplMiIoYuoNg1wykt5lN
	4/4jEwxzIty4fwCAwQ8msjHm3STQGYX9I6LThH8f8t5ekr/5raQC+S9hPO08c5DeGdaA/SAPvmun1
	tXHU+Oar72JKl0UoICZs7pyRSRhBa+2Tu6xd2xiPl16BJxoe3cXgxXODA/HhhWRG+HTdWLOIePpBo
	v9T3P1C6Rfz2hNlDudNTfElCS3kttiCvrl+9vtKpIDzIjkAG/aw9ej0k9TN6YJcTIxw67Tb0U39y5
	lydTL5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdBh-007Pzg-Vq; Thu, 19 Jan 2023 22:15:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdAL-007PQl-T6; Thu, 19 Jan 2023 22:13:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D354B61D95;
	Thu, 19 Jan 2023 22:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A94C433D2;
	Thu, 19 Jan 2023 22:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674166425;
	bh=0TfIfsT7UPQtXb3sT22jU7uGw99A7souxhvdf2e+V9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXJOQ07ln3xNI1VGM2Ekd+dqU7VasYlqn85+drkmHpU8ZmhSLftCzVTUNeMqDjOyu
	 dsh6nk7CJ4/CyDlbu+r5pov2snB5LFE3j9fETGo7u68xTcvbNFpRJz3JckN/MjJ3Hn
	 Ux/h6yeaTTRxic34et2/mHCxnKDYXBfeCKgdeJm+2ribsgpFeNq/zFNTilDFpPkybn
	 kfzNcDxR8G2apTwQk103syCxkrc72QR2KJyEP++x5QPxtpABIV2/EG+wwiz5WBkbZI
	 kk3XvZccPbyeAVdd6BnD3ScThEr8xdC9P5p67lZ55ngcDVceqFIG5HXWb3S4JB6MB5
	 3S5f4GHdgiakA==
Date: Thu, 19 Jan 2023 22:13:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>, kernel@esmil.dk,
	bjorn@kernel.org
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH v3 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
Message-ID: <Y8nAk8c/acWf6++5@spud>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-6-jszhang@kernel.org>
 <2398293.3Lj2Plt8kZ@diego>
 <20230112092136.f2g43hrhmrqouy4y@orel>
 <Y8F2YxMHUt+djhX4@wendy>
 <Y8MRZQENua+wi34T@spud>
 <Y8hqptFcUgjhns4F@spud>
 <20230119082903.yk3uslfrjtxzassi@orel>
MIME-Version: 1.0
In-Reply-To: <20230119082903.yk3uslfrjtxzassi@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_141351_304423_8170BE52 
X-CRM114-Status: GOOD (  36.03  )
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
Content-Type: multipart/mixed; boundary="===============2964189943797013513=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2964189943797013513==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t/O9pox46sePZAp3"
Content-Disposition: inline


--t/O9pox46sePZAp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Me again!

On Thu, Jan 19, 2023 at 09:29:03AM +0100, Andrew Jones wrote:
> On Wed, Jan 18, 2023 at 09:54:46PM +0000, Conor Dooley wrote:
> > Hey!
> >=20
> > I guess here is the right place to follow up on all of this stuff...
> >=20
> > On Sat, Jan 14, 2023 at 08:32:37PM +0000, Conor Dooley wrote:

> > Today at [1] we talked a bit about the various bits going on here.
> > I'll attempt to summarise what I remember, but I meant to do this
> > several hours ago and am likely to make a hames of it.
> >=20
> > For Zbb/unaligned stuff, the sentiment was along the lines of there
> > needing to be a performance benefit to justify the inclusion.
> > Some of us have HW that is (allegedly) capable of Zbb, and, if that's t=
he

I did some very very basic testing today. Ethernet is still a no-go on
my visionfive 2 board, but the sd card works at least, so I can run w/
Zbb code people want & we can see how it goes!

At the very least, it is capable of executing the instructions that were
used in Appendix A. I didn't try to do anything else, because I am lazy
and if there were some pre-existing test programs I didn't want to go
and write out a bunch of asm myself!

impid appears to be 0x4210427, if that means anything to anyone!

> > case, will give it a go.
> > I think it was similar for unaligned, since there is nothing yet that
> > supports this behaviour, we should wait until a benefit is demonstrable.
> >=20
> > On the subject of grouping extension/non-extension capabilities into a
> > single cpufeature, Palmer mentioned that GCC does something similar,
> > for the likes of the Ventana vendor extensions, that are unlikely to be
> > present in isolation.

Jess pointed out on IRC that GCC doesn't support XVentanaCondOps
so maybe there was a mixup there. I don't think that really matters
though, as the point stands regardless of whether it was in GCC or not.

> > Those are (or were?) probed as a group of extensions rather than
> > individually.
> > I think it was said it'd make sense for us to unify extensions that will
> > only ever appear together single psuedo cpufeature too.
> >=20
> > For the bitfield approach versus creating pseudo cpufeatures discussion
> > & how to deal with that in alternatives etc, I'm a bit less sure what t=
he
> > outcome was.
> > IIRC, nothing concrete was said about either approach, but maybe it was
> > implied that we should do as GCC does, only grouping things that won't
> > ever been seen apart.
> > Figuring that out seems to have been punted down the road, as the
> > inclusion of our only current example of this (Zbb + unaligned) is
> > dependant on hardware showing up that actually benefits from it.
> >=20
> > The plan then seemed to be press ahead with this series & test the
> > benefits of the Zbb str* functions in Zbb capable hardware before making
> > a decision there.
> >=20
> > Hopefully I wasn't too far off with that summary...
>=20
> This matches my recollection. Thanks for the summary, Conor.

Cool, thanks.

--t/O9pox46sePZAp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8nAkwAKCRB4tDGHoIJi
0jpZAP976+x+ZkRVzdavgP77bKd1eLS8QZmSr/7+1xVouP4CvgEAtgyo6s7+n/qA
oANTfCfXncWnh8YtZaGwZlbAOakaKgc=
=C0SZ
-----END PGP SIGNATURE-----

--t/O9pox46sePZAp3--


--===============2964189943797013513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2964189943797013513==--

