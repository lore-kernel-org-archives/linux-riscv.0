Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D482C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 19:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPRtGtAq1zRVuFCVgtPQTmDK0rAwYYObHNIjIyz50tY=; b=c6lxWfqn1HdHFBIlmnxOrtec0I
	Zdk/LkZ3GAp3hYW2Kzc5sAhp0uXcJOHmNAkpYdEcR0QjbPnf1IioavvlWjvTZsWRw2ZWmJixMJiwR
	K9NR6RpvWcv1qVlBONeb/YbjYclRod/MjTFFH6mnYTd0Wp3GEnFYY8F56aIBg05DttIlEuJ2GHtQJ
	623H5QxtMG7Oqbvjo+TU3/tcBINIPRqvehOD8lQbBoj83WmWe78h2ITuFfYY2d2crhlCCFHrKBK6s
	v4hBCZ4E2uUGvWODJZaqsSKwLb+6ap+BUE69jLC9/QH4DP4My5Cw0fh87tkjM77vTjpG8ElKVKjhD
	ERvm1BTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HT8-009fpg-1B; Mon, 05 Dec 2022 19:49:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HT4-009fop-Fl; Mon, 05 Dec 2022 19:49:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D6FC6B811E3;
	Mon,  5 Dec 2022 19:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3429FC433D6;
	Mon,  5 Dec 2022 19:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670269771;
	bh=gpqDWSWbXSjKg40I3kv9dGH01C0Fe67Bhy3F34jRTBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4HnnmhP1SKtWfDiRy4ddvgwR2Fv32UwFEwm+R7CK+6FV5Y9LSMFvXXoy/Nj8NpuG
	 YhJL9kfEgliu6fQs/UkH1fcFE7TmBDHtjTifD37ok/u4P3aVJlaLVslXDMUI8B8hbM
	 +t/3sBllwFNE3yEkzZ3zRJY2/DeytO8EDf3Y3fvhp0PHuuciEpldmCnmuODU8BLQwz
	 p9Nzmk79TKOU0bFtADERPr0KYEeqY5LCBWENqG4N9WYNuNKGO5xZKn9f3VlMqX0YGb
	 xaxh9jrOJv6Sa+H2jmssKdOcGDLTRmR/PqTRiDv1SqXJIiXK58miEph0Jy2jZqbyv+
	 VGtyk1PfQJ4vw==
Date: Mon, 5 Dec 2022 19:49:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <Y45LRu0Gvrurm5Rh@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <Y44Q/B6THtP38eyL@xhacker>
 <Y446PdlUPGw5iB71@spud>
 <10190559.nUPlyArG6x@diego>
MIME-Version: 1.0
In-Reply-To: <10190559.nUPlyArG6x@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_114934_849215_7880E85C 
X-CRM114-Status: GOOD (  31.98  )
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
Content-Type: multipart/mixed; boundary="===============7965356288136368762=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7965356288136368762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0eq6YNiH5eo8OX+V"
Content-Disposition: inline


--0eq6YNiH5eo8OX+V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 07:49:01PM +0100, Heiko St=FCbner wrote:
> Am Montag, 5. Dezember 2022, 19:36:45 CET schrieb Conor Dooley:
> > Heiko, Jisheng,
> > On Mon, Dec 05, 2022 at 11:40:44PM +0800, Jisheng Zhang wrote:
> > > Yesterday, I also wanted to unify the two instruction fix into
> > > one. But that would need to roll back the
> > > riscv_alternative_fix_auipc_jalr() to your v1 version. And IMHO,
> > > it's better if you can split the Zbb string optimizations series
> > > into two: one for alternative improvements, another for Zbb. Then
> > > we may get the alternative improvements and this inst extension
> > > series merged in v6.2-rc1.
> >=20
> > Heiko, perhaps you can correct me here:
> >=20
> > Last Wednesday you & Palmer agreed that it was too late in the cycle to
> > apply any of the stuff touching alternatives?
> > If I do recall correctly, gives plenty of time to sort out any
> > interdependent changes here.
> >=20
> > Could easily be misremembering, wouldn't be the first time!
>=20
> You slightly misremembered, but are still correct with the above ;-) .
>=20
> I.e. what we talked about was stuff for fixes for 6.1-rc, were Palmers
> wisely wanted to limit additions to really easy fixes for the remaining
> last rc, to not upset any existing boards.

Ahh right. I was 50-50 on whether something like that was said so at
least I am not going crazy.

> But you are still correct that we also shouldn't target the 6.2 merge win=
dow
> anymore :-) .
>=20
> We're after -rc8 now (which is in itself uncommon) and in his -rc7
> announcement [0], Linus stated
>=20
> "[...] the usual rule is that things that I get sent for the
> merge window should have been all ready _before_ the merge window
> opened. But with the merge window happening largely during the holiday
> season, I'll just be enforcing that pretty strictly."

Yah, of all the windows to land patchsets that are being re-spun a few
days before it opens this probably isn't the best one to pick!

> That means new stuff should be reviewed and in linux-next _way before_ the
> merge window opens next weekend. Taking into account that people need
> to review stuff (and maybe the series needing another round), I really do=
n't
> see this happening this week and everything else will get us shouted at
> from atop a christmas tree ;-) .
>=20
> That's the reason most maintainer-trees stop accepting stuff after -rc7

Aye, in RISC-V land maybe we will get there one day :)

For the original question though, breaking them up into 3 or 4 smaller
bits that could get applied on their own is probably a good idea?

Between yourselves, Drew and Prabhakar there's a couple series touching
the same bits. Certainly don't want to seem like I am speaking for the
Higher Powers here, but some sort of logical ordering would probably be
a good idea so as not to hold each other up?
The non-string bit of your series has been fairly well reviewed & would,
in theory, be mergeable once the tree re-opens? Timing aside, Jisheng's
idea seems like a good one, no?


--0eq6YNiH5eo8OX+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY45LRgAKCRB4tDGHoIJi
0h/yAPoClGkccfHN0If2EOKH3NZmBJCUaoEgyf+E45t3FZ0FRgD+MTXdEYEJhPHI
1popxrLDGDwBWadBaE4lr/cv8t7ZVwE=
=JYwo
-----END PGP SIGNATURE-----

--0eq6YNiH5eo8OX+V--


--===============7965356288136368762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7965356288136368762==--

