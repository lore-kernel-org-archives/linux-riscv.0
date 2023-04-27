Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCC0C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 09:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWiCgx9Vd5Ra3IINwipeYfJxi+fCBgpjIfVI9OHKpnA=; b=V5lGmHVWC7wof5YbjxbO9KemAz
	7XIVzn914c5v3yn4sERNKmkO/wFcOUSKm6mrPTL2gW82820xVw7gA8OBskTI+GWAVW3hpHY1PXvxl
	FJI4K5OmMpi9Wq4P+OW1p0EYl6KsUnH6kUxA/cWw6h+ejE0GrPkf5kNuXdmsCEurxLA6e3IjVX2eX
	PX93ByrCWp+O9Is9RrltZ9ItAiXHuaXb0Z+/THmyzMK6uKCoOC3eSvh2n9BhFV+XOfNLrLpczUt/2
	eGSkgYRQ5MIHPRUhs5tdgP6wrw0oBKV6114uSe4xGg8VD6ngGy/wUcy7ZCG5Uwj+SLkr3KSU23nZH
	V7GdPs2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prxYp-005v4T-1T;
	Thu, 27 Apr 2023 09:05:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prxYk-005v2K-0l
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 09:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682586302; x=1714122302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H/3ifw4Me7ZLmwRnUHcz2Bf1iRNy/a2wlnlif9iRpDc=;
  b=uU2iJz4C257LB2F8TMdwc6SW6rVDSRkfVpDknSo7+hBH6uewsdl4iT5y
   wRS6LDhtFFLe80cmfH8D7LN+MGuWO/7KC0X7sl2510jj1xGbU+8sCaC6e
   7heOxSw3EpVQOjQ/USRA0yjn04LEYOKx/kR4FmrN/EL7+Yb1Ioud5YjPy
   IN3FO/m6xg9F8wdYcIHbp2Sfhi8lRIwzp7KE+3hd3jLeRkDK3wj5pXqIK
   ZwtMEMLBltHtfAMN5MnI3JNRU5+n0Ffs4Lgqb1od/xWlOdcbzFGTKFv0y
   6zN+kKu4Kxlbbqe1FJgx8QLiZ0uJagXsbKqmVYi1cktktpngLISaDtWxT
   w==;
X-IronPort-AV: E=Sophos;i="5.99,230,1677567600"; 
   d="asc'?scan'208";a="210933956"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Apr 2023 02:04:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 27 Apr 2023 02:04:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 27 Apr 2023 02:04:52 -0700
Date: Thu, 27 Apr 2023 10:04:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin
	<soha@lohu.info>, Hongren Zheng <i@zenithal.me>
Subject: Re: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Message-ID: <20230427-unveiling-kiwi-631e966f77cc@wendy>
References: <20230425120016.187010-1-cyy@cyyself.name>
 <tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com>
 <20230426-porthole-wronged-d5a6a3b89596@spud>
 <6kjgearxffbnnq4bsqs7e3jz6efz436m6gb3zjh7cfi357oxlv@krxto6orxwwn>
MIME-Version: 1.0
In-Reply-To: <6kjgearxffbnnq4bsqs7e3jz6efz436m6gb3zjh7cfi357oxlv@krxto6orxwwn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_020502_441634_2FB34E84 
X-CRM114-Status: GOOD (  36.85  )
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
Content-Type: multipart/mixed; boundary="===============6681833273263978187=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6681833273263978187==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g9EKRzq+LmoI7/Xs"
Content-Disposition: inline

--g9EKRzq+LmoI7/Xs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 09:53:19AM +0200, Andrew Jones wrote:
> On Wed, Apr 26, 2023 at 07:54:39PM +0100, Conor Dooley wrote:
> > (+CC Drew)
> >=20
> > Hey Yangyu,
> >=20
> > One meta-level comment - can you submit this patch + my dt-bindings
> > patch as a v2?
> > Some comments below.
> >=20
> > On Tue, Apr 25, 2023 at 08:00:15PM +0800, Yangyu Chen wrote:
> > > According to RISC-V ISA specification, the ISA naming strings are case
> > > insensitive. The kernel docs require the riscv,isa string must be all
> > > lowercase to simplify parsing currently. However, this limitation is =
not
> > > consistent with RISC-V ISA Spec.
> >=20
> > Please remove the above and cite ACPI's case-insensitivity as the
> > rationale for this change.
> >=20
> > > This patch modifies the ISA string parser in the kernel to support
> > > case-insensitive ISA string parsing. It replaces `strncmp` with
> > > `strncasecmp`, replaces `islower` with `isalpha`, and wraps the
> > > dereferenced char in the parser with `tolower`.
> > >=20
> > > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > > ---
> > >  arch/riscv/kernel/cpu.c        |  6 ++++--
> > >  arch/riscv/kernel/cpufeature.c | 20 ++++++++++----------
> > >  2 files changed, 14 insertions(+), 12 deletions(-)
> > >=20
> > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > index 8400f0cc9704..531c76079b73 100644
> > > --- a/arch/riscv/kernel/cpu.c
> > > +++ b/arch/riscv/kernel/cpu.c
> > > @@ -4,6 +4,7 @@
> > >   */
> > > =20
> > >  #include <linux/cpu.h>
> > > +#include <linux/ctype.h>
> > >  #include <linux/init.h>
> > >  #include <linux/seq_file.h>
> > >  #include <linux/of.h>
> > > @@ -41,7 +42,7 @@ int riscv_of_processor_hartid(struct device_node *n=
ode, unsigned long *hart)
> > >  		pr_warn("CPU with hartid=3D%lu has no \"riscv,isa\" property\n", *=
hart);
> > >  		return -ENODEV;
> > >  	}
> > > -	if (isa[0] !=3D 'r' || isa[1] !=3D 'v') {
> > > +	if (tolower(isa[0]) !=3D 'r' || tolower(isa[1]) !=3D 'v') {
> > >  		pr_warn("CPU with hartid=3D%lu has an invalid ISA of \"%s\"\n", *h=
art, isa);
> > >  		return -ENODEV;
> >=20
> > I don't understand why this is even here in the first place. I'd be
> > inclined to advocate for it's entire removal. Checking *only* that there
> > is an "rv" in that string seems pointless to me. If you're on a 64-bit
> > kernel and the node has riscv,isa =3D "rv32ima" it's gonna say it is ok=
ay?
> > Drew what do you think?
>=20
> It makes some sense to me as a garbage detector. It's unlikely the first
> two bytes will be "rv" if the string is random junk.

Preventing the input of absolute rubbish is dt-validate's job & if the dtb
itself has been corrupted somehow I suspect that we have bigger problems
than checking for "rv" will solve.

> also do a strlen(isa) >=3D 4 check first, though. of_property_read_string=
()
> will succeed even when the string is "".

I don't think that checking that there are at least 4 characters isn't
even sufficient. Either we should confirm that this is a valid riscv,isa
to run on (so rv##ima w/ ## matching the kernel) or not bother at all.

It's a different issue though, and I'd be inclined to revisit it in the
future when the ACPI stuff is in, along with perhaps the cleanup parts
of Heiko's series too.

--g9EKRzq+LmoI7/Xs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEo6ogAKCRB4tDGHoIJi
0tBzAP9Gjrxk70KxyJ3D82eZXdg5mq4oq9mwEu5UuYkAARPQawD/U/mk5q1Wts6h
7VXEioB99Mb4kdKQojdZuCuYnvN6lAU=
=IMRq
-----END PGP SIGNATURE-----

--g9EKRzq+LmoI7/Xs--


--===============6681833273263978187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6681833273263978187==--

