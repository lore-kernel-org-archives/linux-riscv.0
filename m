Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A16C77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 17:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fR/vdQBsQNZr7cXt7bz8B88e1qIx8i/YU8FLXGEufvE=; b=r+C3BA0ozuo0K/ei4gxHW25AIu
	m/H6WjDFQJld5hb2ednYX8BMyAvU1IQ1GbJkCOSkj1vLzkXVu3KC6dbmNeGxbZs7uEnHmEHaGzKhc
	oWXQK60pzhZgjoWPzuoHJGFk1jTPaJB5UKGqvtGJIhlspqa82mzP27+Unrs4gWQNG+qfBg5qK1MFT
	+Jrw2UzsrRvPXavy/ShJ+0cglPL5NTxafgx7bopMeNaJ81gM7yZidUx5KN8RR9eeqxzbATYBL7HBI
	83bP8PaUf91wL1O8xn+5CA0qgSYPrwJwlR1Jsxj63jDUxmlBaLzgFTsaCsowHOSxtstfpv6lezvvy
	c5DpItGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psoJQ-00CwBY-0Q;
	Sat, 29 Apr 2023 17:24:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psoJN-00CwAs-2Z
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 17:24:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2AC1060915;
	Sat, 29 Apr 2023 17:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD71C433D2;
	Sat, 29 Apr 2023 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682789080;
	bh=sq6usrIlQ/28LQDt+r0twkGl5RyrXFGOWOiorZPC7k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqLQ+5ECtDNIbOffcTdLxO2hn87/xtKq7hEpcucl2BmkeWJIrde0onY3If9Vb4Lsv
	 eEJaEr5jXHxr4sw1e3V3HI5PhSqxf8ODwQSADc8eeILAeLxD4tluZwAUAY4SpfYGBx
	 xaU5JgW9xVHgGnZvHmDHV4mDSCTZat8ba/bo0ParGMu1fvvsug9vZVmuVshME1IDBv
	 hE1smY0M/85a3miNYbXMzhoVCI7MQ+FbpGTM+U7kgx8N7YOdaLUsTsEaerg93jzxa3
	 RGUOFnzqYcL+rhmCVK4CjFhcr7t97m55uWjB5AIWpSwACxvTezRWzOyoRNQJ0gcGQk
	 Wkwu4ow7NZOwA==
Date: Sat, 29 Apr 2023 18:24:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: fix sifive and thead section mismatches in
 errata
Message-ID: <20230429-outboard-hypocrite-983e977103d2@spud>
References: <20230429155247.12131-1-rdunlap@infradead.org>
 <CALs-HsuG3EFBs60sgiMcPHoE1dF7mhi3GKt=AWvRPaUHAfA88Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HsuG3EFBs60sgiMcPHoE1dF7mhi3GKt=AWvRPaUHAfA88Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_102441_873220_54537C68 
X-CRM114-Status: GOOD (  16.39  )
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
Content-Type: multipart/mixed; boundary="===============0743425352266142584=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0743425352266142584==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y0dbtxqGgkaAbUFx"
Content-Disposition: inline


--y0dbtxqGgkaAbUFx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 29, 2023 at 10:21:39AM -0700, Evan Green wrote:
> On Sat, Apr 29, 2023 at 8:52=E2=80=AFAM Randy Dunlap <rdunlap@infradead.o=
rg> wrote:
> >
> > When CONFIG_MODULES is set, __init_or_module becomes <empty>, but when
> > CONFIG_MODULES is not set, __init_or_module becomes __init.
> > In the latter case, it causes section mismatch warnings:
> >
> > WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_=
cpu_mfr_info (section: .text) -> sifive_errata_patch_func (section: .init.t=
ext)
> > WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_fill_=
cpu_mfr_info (section: .text) -> thead_errata_patch_func (section: .init.te=
xt)
> >
> > Fixes: bb3f89487fd9 ("RISC-V: hwprobe: Remove __init on probe_vendor_fe=
atures()")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > Cc: linux-riscv@lists.infradead.org
> > Cc: Conor Dooley <conor@kernel.org>
> > Cc: Evan Green <evan@rivosinc.com>
> > ---
>=20
> Thanks, Randy. I'm confused at how I didn't see that when I made the
> original fix. I feel like repro of these section mismatch errors
> depend on some other factor I'm not understanding. In any case:

Perhaps you had a cut-down config that did not enable either of the
relevant ARCH_ options to get those errata compiled?

Thanks for changing the fixes tag Randy,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--y0dbtxqGgkaAbUFx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZE1S1AAKCRB4tDGHoIJi
0gygAP49xJB5js4hmJBkRf6uchyUWmMJgValg/hKIRsFfeVQLgD/b15lZi/lR3Od
Bau17tKRXdMw89zA5WCPAgb83tghyQY=
=6g9o
-----END PGP SIGNATURE-----

--y0dbtxqGgkaAbUFx--


--===============0743425352266142584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0743425352266142584==--

