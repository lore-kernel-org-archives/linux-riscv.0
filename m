Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748C1C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 21:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCf8woS6jRpIZuPhqXYUgckTK9IWsanCivpQL5KwTKo=; b=H3dHB+vE6+h2JviPZtohgzP6Sw
	UTWukyEI1tAJw4bjpra6Uz0wnb1sKGn773XWvzJKbQ8vyoQlFuCeYjUoinbCrVdtGJJPKVPIu9gBC
	o4on4MJsCPMGl3Icyy5/vQ6GOe76L16BZ+jxYlP9xDME+5ybj7+lfEo5aTBGoL0Fhy/2OYU8OM0xc
	EevGkfgDzIpKE/6leyc1HiSqPrWb3xgANPj6xJRQPIUMw980IFvAgJ4Ir0wKsPyiV5AuHatxk7Prl
	JP6+RwWd8bmz9JqNPTFG34DO6/t0spUP3QYFTCKnwD9wRw+Ar8XDcrn2YuuHwbJk9DzdVJDwattEP
	Gp1FsfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7NkJ-003yUA-2Y; Mon, 19 Dec 2022 21:32:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7NkE-003ySF-IL; Mon, 19 Dec 2022 21:32:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1539A61152;
	Mon, 19 Dec 2022 21:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17666C433EF;
	Mon, 19 Dec 2022 21:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671485541;
	bh=oLY/hWa0BsSKVuey9p+rADWc2gkKEa942bf2hq1ehSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1567cbCr+8VKeF8rr15yhcd757qttbUoi9vPPSH3xwVULQyVsY3lCKOkzZA0X3ri
	 b7xUeWvzosshiz92VyUqtNF+T1kNXsmQ132Bh8oRVxf9QEIJVHNJVJfowP1p+Idrwj
	 suuPnHFhbfRktNEi5OqzI8P8J1Iy9BjWYEI1JV5EnRd+KwK9HCNHt9LC75yVsfA9st
	 xNgoFn1XokgNFeeeBFYDb9Vw00Dr3IWhvDUz6biFFkG8Fk5o44n4pWUBcpeMFi5NYA
	 OJX2Gp26kMahJY5wvbA4n5RomPQwzHe6da4HVfTYaHFaofUhfsgLQPoLHn5yXNLZNq
	 1QVcqmC8lzRdQ==
Date: Mon, 19 Dec 2022 21:32:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <Y6DYYL1CGuiKMsY2@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <10190559.nUPlyArG6x@diego>
 <Y45LRu0Gvrurm5Rh@spud>
 <12207576.O9o76ZdvQC@diego>
 <Y49Zi2CNv8pZSAe5@xhacker>
 <Y49p82Iac/+iYQ+1@spud>
MIME-Version: 1.0
In-Reply-To: <Y49p82Iac/+iYQ+1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_133222_691428_6E407805 
X-CRM114-Status: GOOD (  19.59  )
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
Content-Type: multipart/mixed; boundary="===============9072810831592013419=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9072810831592013419==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CH6M3iiZKM+1TO/I"
Content-Disposition: inline


--CH6M3iiZKM+1TO/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2022 at 04:12:35PM +0000, Conor Dooley wrote:
> On Tue, Dec 06, 2022 at 11:02:35PM +0800, Jisheng Zhang wrote:
>=20
> > > > Higher Powers here, but some sort of logical ordering would probabl=
y be
> > > > a good idea so as not to hold each other up?
> > > > The non-string bit of your series has been fairly well reviewed & w=
ould,
> > > > in theory, be mergeable once the tree re-opens? Timing aside, Jishe=
ng's
> > > > idea seems like a good one, no?
> >=20
> > IMHO, it will be better if Palmer can merge Heiko's alternative improve=
ments
> > into riscv-next once well reviewed and the window is reopen. Then Drew,
> > Prabhakar and I can rebase on that tree.
>=20
> Unless I missed something, we're saying the same thing in different ways
> :)

Hey Jisheng,
FYI I'm gonna mark this version of the patchset as "Changes Requested"
in patchwork. Palmer's said he'll apply Heiko's patchset that this
depends on once rc1 is out so I am expecting that you'll rebase on top
of that with the various comments fixed.
Thanks,
Conor.


--CH6M3iiZKM+1TO/I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6DYYAAKCRB4tDGHoIJi
0hGXAPoCfrNQ91+zdzsVkiszxD3RNg9lL443e0NP61dSS19AFQEA0/W07PpVDPhb
RC3f0K1Rn59gl+cuhonv9fuRRPtRhQc=
=R5/T
-----END PGP SIGNATURE-----

--CH6M3iiZKM+1TO/I--


--===============9072810831592013419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9072810831592013419==--

