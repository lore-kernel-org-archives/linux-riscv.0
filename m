Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A3FC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 17:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewvNfVsoeB/hzgtK8tIyj9SP/6Y/+IrXDIisiirFm8k=; b=p4W8nSdbjeyuL73cZ9uKOFZN3N
	3Q9ciGaVXHdfGLdvAel9l7wcevQ5VPjUcdXW6u39LTo3USjuzLUlr3S3OAvFgOdLdmVekipAp2dQp
	LC1oxf0E6p6cBfm1ulKPRt4isW1ZxPTIUu6L3qTPeS6vl0+KEYrimeK/UXbrz/BvTyvCCOAVBaMPI
	0+L1HsfzEZGVvnHNHA3jKERHQWHu9T4OqvHQubYYYuFq1rBM/seNYKb3b+U+3k9p6tgDjntPGZrxq
	4lkyW5H5SR1awC4Xy1J6g1sMF+diWmlxVV+QBWGDM5HRG1cFCBGaRJSvALSWQTzMSKVB6ZW49Wb4C
	k1XsX0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prjFP-004ZCl-0j;
	Wed, 26 Apr 2023 17:48:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prjFM-004ZBd-2K
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 17:48:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7ED1A60C58;
	Wed, 26 Apr 2023 17:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF50C433EF;
	Wed, 26 Apr 2023 17:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682531282;
	bh=fk7z84ZDRTuxrtV5T6AKTWprEt9DRG4mR488JPr6Ydk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8AmMuAYDyATeiqXa2lVp6as8/aNi+HfVnfO1sVd3UF4wIKSU8vS6ahW+SzfOigm6
	 jfVpVyI2HKrQ4CMi4gnEahhEhZMV4+ZctNypnUPEVY9U2Qr1TRr5hgPUyR6mwvtoIw
	 k5Jf2uAddbyXaKIOYTGoa2zq+mnQjsrmYViD9Jggi38/VZGsdNx7LRJ2sxys+VIE9T
	 JDUP0dE7NlbVvcEKHy5YgozJj3krbGhJi0J07ASM+LLvoxy5iMS+dFNdw+TjWeWRVS
	 Qzf6XAFvsmopqUt7ZakYgz8FylKMG/LdOXlbzJXbsHfrOaPPAmKhDdOyl5fr8z4Xi/
	 Wzk2qWzbmDhVw==
Date: Wed, 26 Apr 2023 18:47:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: ajones@ventanamicro.com, conor.dooley@microchip.com,
	devicetree@vger.kernel.org, i@zenithal.me, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org, soha@lohu.info,
	twd2.me@gmail.com
Subject: Re: [PATCH v1 1/2] RISC-V: skip parsing multi-letter extensions
 starting with caps
Message-ID: <20230426-candy-deceiver-b3ff230bf7f6@spud>
References: <20230426-getting-tactile-e6cee2cdf870@spud>
 <tencent_0F23181FB02085B690E30BEE4BCC49087506@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_0F23181FB02085B690E30BEE4BCC49087506@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_104804_866389_FDEBBDF6 
X-CRM114-Status: GOOD (  27.71  )
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
Content-Type: multipart/mixed; boundary="===============1126048646879817164=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1126048646879817164==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m4pwzNwa0/gzzfck"
Content-Disposition: inline


--m4pwzNwa0/gzzfck
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 01:11:00AM +0800, Yangyu Chen wrote:
> Hi,
>=20
> On Wed, 26 Apr 2023 15:37:58 +0100, Conor Dooley wrote:
> > Perhaps the thing to do is to actually take Yangyu's first patch and my
> > second one, since the problem with backwards compatibility doesn't stop
> > the kernel from being more permissive?
>=20
> How about taking my first patch[1] since the ECR[2] mentioned that
> the format of the ISA string is defined in the RISC-V unprivileged
> specification?

That is what I suggested, no? Your 1/2 with a revised subject noting
that ACPI may need it, rather than talking about DT. See also my
comments to Drew about the "perils" of letting undefined spec versions
have control over your ABI.

> However, I think we still need to stop the parser if
> some characters that the parser is not able to handle as Andrew Jones
> mentioned in the previous mail[3]. In this case, we still need to add
> some code to stop parsing if any error happens.

Currently it skips extensions that are not valid, but keeps parsing.
Apart from the case where SZX are capital letters it "should" either
parse into something resembling correct or skip. If we start parsing
in a case-invariant manner, I don't see any immediately problem with
what we currently have.

I just don't really get what we need to "protect" the kernel from.
If someone controls the dtb, I think what they do to the isa string is
probably the least of our worries.

> In my humble opinion, backward compatibility can be solved by backports
> to LTS kernels.

The binding might lie in Linux, but that does not mean we can fix the
problem by backporting parser changes to stable. There are other users
and Linux kernels that would pre-date the change that we would be
inflicting this relaxation on for no benefit at all. U-Boot for example
does a case-sensitive comparison.

> I think the better option is to allow using uppercase
> letters in the device-tree document to make the parser coherent with
> RISC-V ISA specification but recommend using all lowercase letters for
> better backward compatibility.

Any addition of uppercase to that binding will get my NAK.
There is no realistic benefit to doing so, only potential for disruption.
DT generators should emit DT that complies with bindings =C2=AF\_(=E3=83=84=
)_/=C2=AF.

I'll go take a proper look at your 1/2 from the other day. I had a
comment about it that I didn't leave, but will do so now.

Thanks,
Conor.

--m4pwzNwa0/gzzfck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEljzQAKCRB4tDGHoIJi
0j/CAP4vB9GEt6wXZV3/y2wpDsh9PNz9EeiYIB6lwkaSkRslHQD/QQmAtpRfHYqm
sF6OK6sgzCdm//x1EQj6N52QcKJ67Qo=
=S3XN
-----END PGP SIGNATURE-----

--m4pwzNwa0/gzzfck--


--===============1126048646879817164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1126048646879817164==--

