Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1045C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 18:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzDGy5XqJygQibPbVcSdQQnNiiaBZIMckZHiXQOs2eQ=; b=UmR6dEQISGWmU2c5n5swOivpPz
	k0znvBpDNoJYl+Yt41I6nBbJNXMsVW7kFQGCp+jLa/TArOKMSsku4pydELToUGPBuyvhvdlIMBm5i
	A3RjQkMeZHTCGtUZFoHonsClVnPYlRgbx9xJgAYNdJ522OaM+8DEJNiOgWiCEMFN6vSHGy94XX/MU
	4EvNDzATod/uGvtrYtjwxKRWXQgNYBSLJysc2Dg8w8deV8iaYBWjrODJaV3Y/AlUj1COrKf7lhj49
	0iqRPDbVTCWcxOBVH9el4u8fcVB8PO9k3WLKn5wp0B4jky0CSc/O3bzSwPHqjKCFND5lwt0yS2WL4
	edLH7uTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg7Nf-00000002dl2-0M3V;
	Mon, 19 Aug 2024 18:45:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6Gm-00000002QSG-43sd
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 17:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03D64CE0ACE;
	Mon, 19 Aug 2024 17:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3864C32782;
	Mon, 19 Aug 2024 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724088853;
	bh=fMRu5tbYzfc0faI37PJ1BzlkxY9s1twpRQn9ugXZeE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iiFRhnuuuYkesZa1ht7tQ29Bc7LtvxDTvnWGuny5uaNwScEGRuvEvvlSVQOi8pcmy
	 P4W+HFKmmqzNfbGP1tbhUqJlZjkdjsB48V2U2ALGI0kXjIyal4dj/il97RXLPPEMrd
	 3Lg/eNelDtTzfyN5VwA7kNUpyocpxp9tg2A5viRwsEJ6k5/2emjjbNtquAAOrPsuXg
	 3Eetkd/X1Al3AoTTj6fH7gY8laE2LhWl/0q6XHbBDl0v5xEUZR1XbuWTS1RpXowlEb
	 BGgW99vEU1sOgIGuKdEq4+qOLxcNIkuRAQxrQgYKT9dJQVWvsGVyoZUCZVlZ7xOqdW
	 bYotRoZsVtUEA==
Date: Mon, 19 Aug 2024 18:34:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: Miquel =?iso-8859-1?Q?Sabat=E9_Sol=E0?= <mikisabate@gmail.com>,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: hwprobe: export Zicntr and Zihpm extensions
Message-ID: <20240819-unclamped-cheek-9b4851bed13f@spud>
References: <20240817075629.262318-1-mikisabate@gmail.com>
 <CALSpo=ZsZWNm_cXG_4GXyZ9invSS_eKH=9Q-mdoM2XV=HwzOXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALSpo=ZsZWNm_cXG_4GXyZ9invSS_eKH=9Q-mdoM2XV=HwzOXA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_103417_376750_B918A352 
X-CRM114-Status: GOOD (  21.11  )
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
Content-Type: multipart/mixed; boundary="===============3707999292786672809=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3707999292786672809==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wPCzj63yBK1PNHWF"
Content-Disposition: inline


--wPCzj63yBK1PNHWF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 01:29:16PM -0400, Jesse Taube wrote:
> On Sat, Aug 17, 2024 at 3:58=E2=80=AFAM Miquel Sabat=C3=A9 Sol=C3=A0 <mik=
isabate@gmail.com> wrote:
> >
> > Export Zicntr and Zihpm ISA extensions through the hwprobe syscall.
> >
> > Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
> > ---
> >  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
> >  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> >  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
> >  3 files changed, 10 insertions(+)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index 3db60a0911df..5bb69c985cce 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -188,10 +188,16 @@ The following keys are defined:
> >         manual starting from commit 95cf1f9 ("Add changes requested by =
Ved
> >         during signoff")
> >
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version =
2.0
> > +       is supported as defined in the RISC-V ISA manual.
> > +
> >    * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTPAUSE`: The Zihintpause extensio=
n is
> >         supported as defined in the RISC-V ISA manual starting from com=
mit
> >         d8ab5c78c207 ("Zihintpause is ratified").
> >
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2.0
> > +       is supported as defined in the RISC-V ISA manual.
> > +
> >    * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve3=
2x is
> >      supported, as defined by version 1.0 of the RISC-V Vector extensio=
n manual.
> >
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index b706c8e47b02..098a815b3fd4 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -72,6 +72,8 @@ struct riscv_hwprobe {
> >  #define                RISCV_HWPROBE_EXT_ZCF           (1ULL << 46)
> >  #define                RISCV_HWPROBE_EXT_ZCMOP         (1ULL << 47)
> >  #define                RISCV_HWPROBE_EXT_ZAWRS         (1ULL << 48)
> > +#define                RISCV_HWPROBE_EXT_ZICNTR        (1ULL << 49)
> > +#define                RISCV_HWPROBE_EXT_ZIHPM         (1ULL << 50)
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0    5
> >  #define                RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> >  #define                RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)

The sort here, by number, is fine.

> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index 8d1b5c35d2a7..30aede1c90ff 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -118,6 +118,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
> >                 EXT_KEY(ZKSH);
> >                 EXT_KEY(ZKT);
> >                 EXT_KEY(ZTSO);
> > +               EXT_KEY(ZICNTR);
> > +               EXT_KEY(ZIHPM);
>=20
> Conor, do we care about ordering?

I would rather that they were sorted alphabetically. Adding to the end
is nothing but a conflict generator and makes it harder to see what is
and what is not in the list. IIRC Palmer applied the patch I sent a few
weeks ago that sorted the entries in all of these EXT_KEY() lists.

--wPCzj63yBK1PNHWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsOCEQAKCRB4tDGHoIJi
0j20AP4mn1nrlXNLBYaUZvSWhqw15lLFxowAgFyao8lH1D/nIQEA6Lhe6OFrs9Sd
6BFmOhwTeZOG6+PhDiTu4GrRp1WGRQQ=
=/NqD
-----END PGP SIGNATURE-----

--wPCzj63yBK1PNHWF--


--===============3707999292786672809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3707999292786672809==--

