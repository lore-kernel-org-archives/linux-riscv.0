Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E3AC74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnJtbeYjjdy/GnRDJbbSGmu/4McHHWFgiHnf43NgH5Q=; b=3oUt7FCpNussnZBYDNP/nKH5e4
	JWzBv5fAZqOUj/O1bV76orl0OU9WX8UTXwaMsKCxqHgAMc/FagLcK3VhdB69ZV5o0lQshZiRqnPkA
	8wHUWsn5g4ggd6F2T+zai/IeCNS+pOZQYNYD0pXXIFvGCmWcRPyrIDReZpTcx9a4lwnmadlQhT/hP
	rq4EXy/RuI18TVmMKQAf3wNWKPzP3W2WCHMd9AJXbgl6nOw9UxYN9Ys1v8ahfDU2Xhi5pO3de+pjU
	Vj9NpdPsgTtKvMMyMEXgRKMnXnCZ6gRSz9TyMVhD3jI/dLJ3RyWi9O9shW4ZZCo70nqW+ttzmYMnj
	ilMpcOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pedqu-00Cur3-0C;
	Tue, 21 Mar 2023 15:24:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pedqq-00Cupu-1y
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 15:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679412281; x=1710948281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aMLLh8V4kf7c9ciTlabKLcKZtNVTiRpS6IoNs5kWFIM=;
  b=oDEqg+JCzj+vJpxcXsuYhRD+KtrAQctV8W3i26HADRand6znN8z1uKxK
   3zlTZlVO9nTVQprAZYfvio0EonQ3/A7JPX+DmKuWjepPtT0CjVZDRkJJK
   U0wSecgkTCRcEL8BWF7X56sjNYXxuxomujtVdtxAkSUJtEX9FChMpvG3w
   WN9Krs9J9+jI6KNI2RbB5ZSvGjXI2Y21CI3h1AvK7LETAuhYMOgSb15+X
   b46BQwoNDN1t4lgXxwA+EepUfMhZHaZgtL0f+4U3j55e1u9vjCO3oTcAG
   h47DTGgHXq3Mf211nOMfrDCR2lSZcIQ0Cii6bfDGMV4EhiSj2VDsCl8ML
   w==;
X-IronPort-AV: E=Sophos;i="5.98,279,1673938800"; 
   d="asc'?scan'208";a="202710844"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Mar 2023 08:24:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 08:24:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 21 Mar 2023 08:24:27 -0700
Date: Tue, 21 Mar 2023 15:35:38 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Torsten Duwe <duwe@lst.de>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Li Zhengyu <lizhengyu3@huawei.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Li Huafei <lihuafei1@huawei.com>, Liao Chang <liaochang1@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<liubao918@huawei.com>
Subject: Re: [PATCH] riscv: relocate R_RISCV_CALL_PLT in kexec_file
Message-ID: <fc1a945d-368c-4385-b1cc-69978e0f4657@spud>
References: <20230310182726.GA25154@lst.de>
 <e02fdfce-4574-8e7e-ec96-8e8eaa4067bc@huawei.com>
 <20230321160349.3b3a46df@blackhole.lan>
MIME-Version: 1.0
In-Reply-To: <20230321160349.3b3a46df@blackhole.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_082440_733768_65F09B2E 
X-CRM114-Status: GOOD (  24.02  )
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
Content-Type: multipart/mixed; boundary="===============5429352267279763765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5429352267279763765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6Tf43noRFCb2ZP4i"
Content-Disposition: inline

--6Tf43noRFCb2ZP4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 04:03:49PM +0100, Torsten Duwe wrote:
> On Mon, 13 Mar 2023 11:13:17 +0800
> Li Zhengyu <lizhengyu3@huawei.com> wrote:
>=20
> > On Fri, 10 Mar 2023 19:27:03 +0100, Torsten Duwe <duwe@lst.de> wrote:
> > > Depending on the toolchain (here: gcc-12, binutils-2.40) the
> > > relocation entries for function calls are no longer R_RISCV_CALL, but
> > > R_RISCV_CALL_PLT. When trying kexec_load_file on such kernels, it will
> > > fail with
> > >
> > >   kexec_image: Unknown rela relocation: 19
> > >   kexec_image: Error loading purgatory ret=3D-8
> > >
> > > The binary code at the call site remains the same, so tell
> > > arch_kexec_apply_relocations_add() to handle _PLT alike.
> >=20
> > R_RISCV_CALL has already been deprecated, and replaced by R_RISCV_CALL_=
PLT.
> >=20
> > See Enum 18-19 in Table 3. Relocation types from=20
> > https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-=
elf.adoc=20
> > .
> >=20
> > It was deprecated in ("Deprecated R_RISCV_CALL, prefer=20
> > R_RISCV_CALL_PLT")=20
> > https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a0dced85018=
d7a0ec17023c9389cbd70b1dbc1b0
> >=20
> > >
> > > fixes: 838b3e28488f702 ("Load purgatory in kexec_file")
> > > Signed-off-by: Torsten Duwe <duwe@suse.de>
> > > Cc: stable@vger.kernel.org
> > >
> > > ---
> > > --- a/arch/riscv/kernel/elf_kexec.c
> > > +++ b/arch/riscv/kernel/elf_kexec.c
> > > @@ -425,6 +425,7 @@ int arch_kexec_apply_relocations_add(struct purga=
tory_info *pi,
> > >   		 * sym, instead of searching the whole relsec.
> > >   		 */
> > >   		case R_RISCV_PCREL_HI20:
> > > +		case R_RISCV_CALL_PLT:
> > >   		case R_RISCV_CALL:
> > >   			*(u64 *)loc =3D CLEAN_IMM(UITYPE, *(u64 *)loc) |
> > >   				 ENCODE_UJTYPE_IMM(val - addr);
> > >
> > > .
> >=20
> > Palmer, please apply these references to the commit message.
> >=20
> > Reviewed-by: Li Zhengyu <lizhengyu3@huawei.com>
> >=20
>=20
> Ping?

It's not been all that longer than a week & you're in patchwork so you
won't be forgotten, but I noticed a complaint when I went looking on
patchwork about your fixes tag:

Commit: f28b81e30b4b ("riscv: relocate R_RISCV_CALL_PLT in kexec_file")
	Fixes tag: fixes: 838b3e28488f702 ("Load purgatory in kexec_file")
	Has these problem(s):
		- Subject does not match target commit subject
		  Just use
			git log -1 --format=3D'Fixes: %h ("%s")'

The fixes tag should be:
Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")

Note the capital F & the missed RISC-V: prefix, checkpatch should have
complained about this.
Checkpatch also complains that your suse email in the Signoff doesn't
match the lst.de email that you used to send the patch (IOW you're
missing a From: header that send-email would add).

Could you fix those things up please & I suppose you can take the
opportunity to make the changes that Li Zhengyu suggested to the commit
message itself at the same time.

Thanks,
Conor.



--6Tf43noRFCb2ZP4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBnOxAAKCRB4tDGHoIJi
0hOtAQCLB6C9nIcVqUpFQ7xTtESnOBJTdvu8LY2vIaOeFiMjZwEAqc3Z6nZ80y9z
M7VMSeGNvfoOb5RYfH7UWCUXAJ7SiQQ=
=zuFb
-----END PGP SIGNATURE-----

--6Tf43noRFCb2ZP4i--


--===============5429352267279763765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5429352267279763765==--

