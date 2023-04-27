Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B908C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UO1CAjUrnmfXACTzP82TaeTQLzMdBfbcZUNLT2jkIs=; b=wqcvnwGzmpEEj/C4zH7v1k1VnL
	+UNJOovhtzWb3CzJMW+15aVeh1AntToCOKeeGqKPnNIlzsnmq/kg2zQ6OKvx3JNndIgW65O1crdD4
	QFG4QrAiQrDW5W6xT5Jsf5RtthMjTjJTG8YNueRQpAq7GQTtz0PtuFU0QYkfuzFseso9E58al0t06
	9tx6WxzLg58yv8mMXad9OVUZTwYGz04T+OUO4xE+5t8LFhOeT/HlJGuCEJvjMHQCb25EplZ1AmFTx
	8VBh83rGld2z/igCskL1Xwx+AR3OxaJo9uVv4wcT3ehQa84oKjWqjfksA69M7QS8tfZ/0yVFFhXMp
	0PtHczkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5Pk-0077F1-0v;
	Thu, 27 Apr 2023 17:28:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5Pg-0077EY-1T
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 17:28:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 084FC614C0;
	Thu, 27 Apr 2023 17:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643E7C433D2;
	Thu, 27 Apr 2023 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682616491;
	bh=fTIHyMELB7P4mMmUO7vjz/67287/XF7r/7KUpvHIaGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raRn+1kXDTM/GzlCJKA+5Te3YPVHdgoUeMtH/pxSm2YmAMNMNlSwpODOL46OGiLdc
	 vdLk8IiO24cJnOHdxQwQeHZbmoJHDSTMcfoc2jSFOD/lUI0HtOQMf6tj5TFDfJRddI
	 Jx1o81RQ4CeTKj7FCVOpLNChhVWB0Xg303ciZpt3oMbofaMZbv1AFgovB/fnzA4CzX
	 XJvtNSwNAxQny7MrssylghZSmifwucnOsPWfuEknqaTquot/qLNwRReWFOK39rJ8G9
	 28KvMNuih5oMwx4bzMsc4ex9SaZC348yndTciFdIDEs5wJ6xDXfBK/vPo5OHxwxUzq
	 ENv5cOEu9qVvA==
Date: Thu, 27 Apr 2023 18:28:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: ajones@ventanamicro.com, aou@eecs.berkeley.edu, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, soha@lohu.info,
	twd2.me@gmail.com
Subject: Re: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Message-ID: <20230427-duplicate-procedure-2eec53856977@spud>
References: <20230426-porthole-wronged-d5a6a3b89596@spud>
 <tencent_BC64BBD18CAF41904B9BD1510B1739062805@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_BC64BBD18CAF41904B9BD1510B1739062805@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_102812_572189_6120717E 
X-CRM114-Status: GOOD (  39.85  )
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
Content-Type: multipart/mixed; boundary="===============7334651649156480887=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7334651649156480887==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VTpKZ7gKyqWX7CfH"
Content-Disposition: inline


--VTpKZ7gKyqWX7CfH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 08:47:18PM +0800, Yangyu Chen wrote:
> Hi, Conor
>=20
> Thanks for your meaningful reviews. I agree with most of your advice but
> have a question about the code about checking the first 2 characters are
> "rv" in `arch/riscv/kernel/cpu.c`.
>=20
> On Wed, 26 Apr 2023 19:54:39 +0100, Conor Dooley wrote:
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
> I think this code could be a workaround for running rv32 S-Mode on rv64
> CPU without changing the DT, although the proper way should be to change
> this field in DT by bootloader or any other software.
>=20
> I have tested a simple rv64imac CPU core and left the `riscv,isa` string
> empty in the DT and removed the above 3 lines check from the kernel, and
> the kernel boots successfully, and using busybox as init is also ok.=20
> However, if this check exists, the kernel will panic at `setup_smp` due to
> `BUG_ON(!found_boot_cpu)` in `setup_smp`.

The initramfs I have fails to boot because it is build with FP support.
Out of curiosity, what shows up in /proc/cpuinfo in that case?

> I am wondering whether this should remove or add a more sufficient
> validation. Although this function will not be called in ACPI as I
> reviewed the recent ACPI patches[1], it will not be a problem if I submit
> this patch for better ACPI support. However, If I just simply remove it
> from my patch and submit patch v2 directly, the ISA string in ACPI mode
> with all uppercase letters will be OK. But in DT mode, the kernel behavior
> will accept the ISA string with all uppercase letters except the first two
> "rv". Do you think this behavior is different between DT and ACPI can be
> OK?

A difference would be fine, if it was that ACPI allowed caps and DT
didn't. But allowing caps everywhere other than the RV just seems a bit
silly to me, so I would rather allow the capitalisation of RV.

> After some investigation, I suggest removing this validation since the
> validation is useless for a proper DT and the recent ACPI patches[1] do
> not validate the ISA strings, so we will have the same behavior between
> DT and ACPI.

I dunno. I'd like to split that function in 2 actually, but I would
like the ACPI stuff to land before doing so. I think for now, what might
be best is checking that it has a sufficient strlen in a separate patch,
earlier in your series, and making the check case-insensitive as you have
done already here.

Cheers,
Conor.

--VTpKZ7gKyqWX7CfH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEqwpgAKCRB4tDGHoIJi
0kWfAP9e4VArAxe0AaDHBJoslthiQDLrOA4hOUoJTcqOEXJG/QD+KtBWf2LGLbZs
LZMF2RrjfiA1vdsCUAO1mBtQvGEE/w4=
=/PYG
-----END PGP SIGNATURE-----

--VTpKZ7gKyqWX7CfH--


--===============7334651649156480887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7334651649156480887==--

