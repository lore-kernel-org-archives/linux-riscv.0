Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779DFE9A02C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Feb 2026 00:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBMED/nZ6lir81c3aZlu4zsABvEbgodv1lWwJgA6rCQ=; b=mXYVPbrOQ6wyuAeI1IvlkLiV2+
	SAuD4j1fDZT6UxOFolt0XtFsROgS+5ho2ixoB4NU7XJcVrYTzY4+EI0WpetSP2GMV4zaaa1QaJAMy
	Xhgx5A4vZilbzJeyxnn9uIdiYElC9OTmDq4YAsPddlEd+Q/CR3X9lis8cyp6VYblGHXryq40tYbAE
	Eu84f2t9FjBiC7qgrI1m4u86NCKMxvaDxm03mdEU82WtlJ7PKRfuhDjS5COsKnf8WDVj34l881g89
	6mVUjjexiR7fhte1TI9S8Xbi8IVt3g+9mk2vOKb0WQ/EbLhLf7lGhhCRpVh2BacPZvTsKRdhCW5zO
	KPEZVmAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsrTp-0000000AcA6-1GW6;
	Thu, 19 Feb 2026 00:01:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsrTn-0000000Ac9m-29Zo
	for linux-riscv@lists.infradead.org;
	Thu, 19 Feb 2026 00:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC88B400D5;
	Thu, 19 Feb 2026 00:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0E0C116D0;
	Thu, 19 Feb 2026 00:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771459274;
	bh=FDR47qQr0PHQH6jHFKRhjR6TYdyYxFnkGM82xuriaTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbbF5nw+w4yvNyUO/lHpab/un+ZWjLhJ4b7E87OEDq83brxvnW33xNXH2p+eNlZZn
	 O+Bbrp38VuKlKNLjoAcqX6DxNi4jK//Jkm3h5PdrSbWDFEqXinYFKAI1bnT2kz1Bmf
	 S32FYinUXN5UGXKqEFrgIeaGH00PiEBV49Yec3CcxbVYHvfPMT614ktZgkLgETb9AU
	 PkOo/cTXovaZb5jcrVLEHJiDmTTUdej1zn8OAbdeMSj53s6PHmiNygJVasMdQt7nxZ
	 vA7+trpucQcWwQkmNyxDxT9w01ZRQGEJyuzWXmW8zTsuHwNZ8nBMavFfn13K0dxWiW
	 22KWSquKQjcrg==
Date: Thu, 19 Feb 2026 00:01:10 +0000
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"zong.li@sifive.com" <zong.li@sifive.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
Message-ID: <7db68a59-3259-40df-ae9a-09ebccec16df@sirena.org.uk>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
 <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
 <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
 <aZYZsBlH_tVxnZIf@debug.ba.rivosinc.com>
 <196537b2933567d1781901f813a72ffffedd10fd.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <196537b2933567d1781901f813a72ffffedd10fd.camel@intel.com>
X-Cookie: Avoid contact with eyes.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_160115_600402_C7A5754D 
X-CRM114-Status: GOOD (  16.23  )
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
Content-Type: multipart/mixed; boundary="===============1141732916393562596=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1141732916393562596==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qSGwPeztPKFX1gqI"
Content-Disposition: inline


--qSGwPeztPKFX1gqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2026 at 09:58:41PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2026-02-18 at 11:57 -0800, Deepak Gupta wrote:

> > If we land arch-agnostic prctl for enabling branch tracking for userspace as
> > part of risc-v patches, I am hoping we can leverage that for x86 "branch
> > tracking enabling" as well. I don't know if "BTI" is enabled for userspace in
> > the arm64 world but if it isn't then it can use the same prctl. This creates
> > symmetry and convergence as well between major 3 arches for branch tracking
> > support.

BTI has been available to userspace for quite a while now.

> Arm already uses PROT_BTI to enable their landing pad like thing. It doesn't
> need a prctl AFAIU. Peterz had been suggesting we do a similar PROT for x86 user
> IBT. Although an additional prctl might still be required for x86. We'd have to
> actually start taking the patches upstream to see.

Yeah, for arm64 BTI the control is all per page rather than per thread
or process.  Unless I'm forgetting something there's just not a global
control for this in the hardware, it's all keyed off the page tables.

--qSGwPeztPKFX1gqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmWUsUACgkQJNaLcl1U
h9AvSQf/TKs8WfcrN/mrWxzHPs9rkZK9z15Eo84659u/Gqiq80dBtkX56ftgSJfN
csCc6A4AIuMcM3SWzmE/OJBG25elrAF7BAzl6a0mslEkHQFWcfiyg8G09w6LjcCz
tlp0K0Kt7Jt6NN/+8EX8zzYesuw6Wyq/NEZ4OPjcRaOpUXm2T25ivY7sLS0MjPjj
GaCRUIlGfu86kLJz+RlrP3fO82nefbsb19Bwuwp0KuJojaIihaHHGi/C2b/NMkt8
4yhyey45O87sKQq+akQtU9toGHeKy1FV6CsPkWHelTWch/nWedjz47fQ83heA/WI
bgkdT5/MYMpr9fEubJFWFA4PHSR5WA==
=t6PY
-----END PGP SIGNATURE-----

--qSGwPeztPKFX1gqI--


--===============1141732916393562596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1141732916393562596==--

