Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3629C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 17:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mUGCvFZNfVn2+Xv+ZVNgETl8rI/uWZ1qHSRdouI/p0=; b=Szdpf59c2PIAgy7eDqg/F9MKJw
	K5GzTnPW0LydZslMPAAe/9/GWz95J6FUPoCm3rRa55uOlSruNYsKTpH87lijkYby/VyMF9pFoTKk9
	7QEq8T8oGvbU8Cz7rKH8Mm5yhHTca16XdkhXanSkmnbYIZB1++gy78zXju3v+6pkMPCmYbwxJOlMp
	8NrfcDWORvphmdKfBRaK3lIAtd5VC72cGUvXs6RPye2dcuiD+Wm9Xim9kcBUajPMWOhhVG/ntMZgF
	pRk6oibA9hCkrMzVRTlrxH8vCMqV58mOP6dO0Ph+JMyaH7cfjKU993uTui06PcYVF2O08sS7iv5nO
	LtSp/QAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43RP-00EnKk-1s;
	Tue, 30 May 2023 17:47:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43RL-00EnJx-2s
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 17:47:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 63C9462EAD;
	Tue, 30 May 2023 17:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF09C433D2;
	Tue, 30 May 2023 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685468842;
	bh=ZbKD8T6XaIwB4p2rBGYXibCFVbjC5VHZ8efSGsRpmf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5RyBCiNjWNomJEEMvP38q3EOc/bloifBXLw76Zo2gV7mUs8f4F1/RFXyZ8vlvMyh
	 PRGJ+HkY49bqp4CW8Bn3jc2Ip1ya2vOhm4lT4pZYsBBni+Lu4PmvN/hYEY5jhgZNVJ
	 SOWuvGQ5mVXBHmwiue8FlqTbYsdgFjZMLf/EE8uVdipOjvBzwtJ6fgyfZ4R/r72TTa
	 0v2taCtgBw7q7ZEMwXGqV7r4Sh6e0McsVf1WAOEQqQh56sdby20Fq9bo62fpZQRTMh
	 TyFIZ/5mzaWaTjb9EhH4z8MMziZGz8zYgcjbE5bC5IMCXuB8tWOHMSgGcd8/n64GyZ
	 qzRhpd4A8miuQ==
Date: Tue, 30 May 2023 18:47:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Message-ID: <20230530-hatchery-unifier-64d7a2ffe0d0@spud>
References: <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
 <CAHVXubgx3uBEjMLHXTxr0192ZHbSb=qK4NggZyWQTDfgrJt2-g@mail.gmail.com>
 <20230528-darkness-grandly-6cb9e014391d@spud>
 <cf0d2d2a-c407-7b3d-a5ab-ea5c19e7b890@ghiti.fr>
 <20230528-uneatable-earpiece-3f8673548863@spud>
 <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
 <20230529-skillet-quarters-3fbc3b6edb3a@spud>
 <41e57bb9-ce0c-7772-abeb-5c01d5ec19bb@ghiti.fr>
 <20230530-polka-trifle-7ccd7a093099@wendy>
 <92d4aaa8-a1ed-74e1-3a22-df9be1ca1e4a@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <92d4aaa8-a1ed-74e1-3a22-df9be1ca1e4a@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_104724_022320_09638F3A 
X-CRM114-Status: GOOD (  44.01  )
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
Content-Type: multipart/mixed; boundary="===============7492899839219891278=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7492899839219891278==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yFAqj5gbekTcSN8V"
Content-Disposition: inline


--yFAqj5gbekTcSN8V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 04:33:45PM +0200, Alexandre Ghiti wrote:
>=20
> On 30/05/2023 13:27, Conor Dooley wrote:
> > On Mon, May 29, 2023 at 09:37:28PM +0200, Alexandre Ghiti wrote:
> > > On 29/05/2023 21:06, Conor Dooley wrote:
> > > > On Mon, May 29, 2023 at 08:51:57PM +0200, Alexandre Ghiti wrote:
> > > > > On 28/05/2023 15:56, Conor Dooley wrote:
> > > > > > On Sun, May 28, 2023 at 03:42:59PM +0200, Alexandre Ghiti wrote:
> > > > > > > Hmmm, it still works for me with both clang and gcc-9.
> > > > > > gcc-9 is a bit of a relic, do you have more recent compilers ly=
ing
> > > > > > around? If not, I can try some older compilers at some point.
> > > > > >=20
> > > > > > > You don't have to do that now but is there a way I could get =
your compiled
> > > > > > > image? With the sha1 used to build it? Sorry, I don't see wha=
t happens, I
> > > > > > > need to get my hands dirty in some debug!
> > > > > > What do you mean by "sha1"? It falls with v6.4-rc1 which is a s=
table
> > > > > > hash, if that's what you're looking for.
> > > > > >=20
> > > > > > Otherwise,
> > > > > > https://github.com/ConchuOD/riscv-env/releases/download/v2022.0=
3/vmlinux.bin
> > > > > > (ignore the release crap haha, too lazy to find a proper hosting
> > > > > > mechanism)
> > > > > Ok, I don't get much info without the symbols, can you also provi=
de the
> > > > > vmlinux please? But at least your image does not boot, not during=
 the early
> > > > > boot though because the mmu is enabled.
> > > > Do you see anything print when you try it? Cos I do not. Iff I have=
 time
> > > > tomorrow, I'll go poking with gdb. I'm sorry I have not really done=
 any
> > > > investigating, I have been really busy this last week or so with
> > > > dt-binding stuff but I should be freer again from tomorrow.
> > > >=20
> > > > https://github.com/ConchuOD/riscv-env/releases/download/v2022.03/vm=
linux
> > >=20
> > > Better, the trap happens in kasan_early_init() when it tries to acces=
s a
> > > global symbol using the GOT but ends up with a NULL pointer, which is=
 weird.
> > > So to me, this is not related to kasan, it happens that kasan_early_i=
nit()
> > > is the first function called after enabling the mmu, I think you may =
have an
> > > issue with the filling of the relocations.
> > Yeah, it reproduces without KASAN.
> >=20
> > > Sorry to bother you again, but if
> > > at some point you can recompile with DEBUG_INFO enabled, that would be
> > > perfect! And also provide the vmlinux.relocs file. Sorry for all that=
, too
> > > bad I can't reproduce it.
> > New vmlinux & vmlinux.relocs here:
> > https://microchiptechnology-my.sharepoint.com/:u:/g/personal/conor_dool=
ey_microchip_com/EZpFNxYYrnNAh5Z3c-rf0pUBBpdPGTLafqdtfcXRUUBkXw?e=3D7KKMHX
> > They're pretty massive unfortunately & hopefully that is not some
> > garbage internal-only link.
> > .config is a wee bit different, cos different build machine, but the
> > problem still manifests on a icicle. I've added it to the tarball just
> > in case.
>=20
>=20
> Ok so I had to recreate the Image from the files you gave me and it boots
> fine using qemu: is that expected? Because you only mention the icicle
> above.

Unfortunately you sent this one right as I left work..
I ssh'ed in though and ran the vmlinux.bin & had the same issues.
Silly question perhaps - is it just not possible to boot something that
has been hit with `objcopy -O binary vmlinux vmlinux.bin` with
CONFIG_RELOCATABLE? At this point that's the main thing that sticks out
to me as being different. You couldn't boot the vmlinux.bin that I sent
you either.

Cheers,
Conor.

--yFAqj5gbekTcSN8V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHY2pgAKCRB4tDGHoIJi
0hAqAP9YasgLw/aZyFNtndJoOr+ciIy8BdmXFiR3djiyi79E1wEAqr4fh/FlvjgV
896quzlFUVMJxGPMq51gcAZSP9yvdAI=
=a/8W
-----END PGP SIGNATURE-----

--yFAqj5gbekTcSN8V--


--===============7492899839219891278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7492899839219891278==--

