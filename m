Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A18EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htp8skcH+1B95GQ5Qf22q8oa+1WmCEJXFDgTZUflzcI=; b=U8VUoboKR8E5GhBEHfUoNr8PuU
	GcIq8IU7MlZL/0oBf+BLN5KPQeF0ExDclKJ1xiYnRaJBcWPTibp6X0K3/7frIJb2SkjCNa6ji16td
	MfKue1oXs+LTwQDnqQ9FPdQ7nuqJfEC4/eXDGMbz6K8JixTfUP2ZRba+tQVCpW8CToxXBISiH4arV
	+nAeCcGaYSsH649f1jMXusbAkEOuKvTRmUsMqKz/C4djYqR8Do5e9MsZTVYB90PUdrPRkkHPwZC45
	v3cMIIShGTUo8Q7BC9Y5turmADiCG+yWOfzUExTh+YunEMvhqhZ7q6xIJSJqhsBpaP9+loS0/0OOP
	y71ZTJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEDjr-00Ds2M-0I;
	Tue, 27 Jun 2023 18:48:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEDjn-00Ds1W-1s
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 18:48:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF58D61187;
	Tue, 27 Jun 2023 18:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4723C433C8;
	Tue, 27 Jun 2023 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687891706;
	bh=NELyyK21vrNkHzi3CWwBf1sfbqmqAx0I5oq5ogKT3IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XK8/oJciIZwA8e5g4ZGR9bIapge3AfIKXaUlYaBF+FkQTJ03eBmsg8J3jlJ2Z3f9A
	 Bl3fRApHX98/Q0+srwfSjq260oCEf7sOsp1W35Ss25oE4z/q+g8Dh282y8B78BHece
	 93pqod1jDucAUft4kKEukVUVplZkLqGIuJT0vLdjmCdoaVvDnP4BqBDyDilOWczC5i
	 rQVAmnfoXOVKtJ41IYlIMHtMRdeSVXhUYsAeG/IMJlnL8Tm8sbPglm/VCiOEgwREz7
	 qlTaEh/G0KRAyFC7JWpSGMx4xKU3DcCq6kxa/cYlvtW5Z/mvRT1p0jjqnU95vJkAx2
	 U+tJvfkIofn5w==
Date: Tue, 27 Jun 2023 19:48:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jiatai He <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <20230627-debating-twelve-da2c1ed60948@spud>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-2-sameo@rivosinc.com>
 <CALs-HssMkVikspnEi-Ek2t=ABvFvgptAhsBjk1+aLuVjiP7P7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HssMkVikspnEi-Ek2t=ABvFvgptAhsBjk1+aLuVjiP7P7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_114827_704769_CC17194E 
X-CRM114-Status: GOOD (  31.31  )
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
Content-Type: multipart/mixed; boundary="===============6322920941400469643=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6322920941400469643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ntaoTpnMkWXgwwSA"
Content-Disposition: inline


--ntaoTpnMkWXgwwSA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 11:14:30AM -0700, Evan Green wrote:
> On Tue, Jun 27, 2023 at 7:38=E2=80=AFAM Samuel Ortiz <sameo@rivosinc.com>=
 wrote:
> >
> > From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
> >
> > This patch parses Zb/Zk related string from DT and

%s/This patch//

> > output them in cpuinfo
> >
> > One thing worth noting is that if DT provides zk,
> > all zbkb, zbkc, zbkx and zkn, zkr, zkt would be enabled.

Please explain why this is okay.

> > Note that zk is a valid extension name and the current
> > DT binding spec allows this.
> >
> > This patch also changes the logical id of
> > existing multi-letter extensions and adds a statement
> > that instead of logical id compatibility, the order
> > is needed.

Does it?

> > There currently lacks a mechanism to merge them when
> > producing cpuinfo. Namely if you provide a riscv,isa
> > "rv64imafdc_zk_zks", the cpuinfo output would be
> > "rv64imafdc_zbkb_zbkc_zbkx_zknd_zkne_zknh_zkr_zksed
> > _zksh_zkt"

I think this is fine.

Please re-wrap this all to 72 characters.

> >
> > Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>
> > Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>

This is missing your SoB Samuel.

> > ---
> >  arch/riscv/include/asm/hwcap.h | 11 +++++++++++
> >  arch/riscv/kernel/cpu.c        | 11 +++++++++++
> >  arch/riscv/kernel/cpufeature.c | 30 ++++++++++++++++++++++++++++++
> >  3 files changed, 52 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index f041bfa7f6a0..b80ca6e77088 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -53,6 +53,17 @@
> >  #define RISCV_ISA_EXT_ZICSR            40
> >  #define RISCV_ISA_EXT_ZIFENCEI         41
> >  #define RISCV_ISA_EXT_ZIHPM            42
> > +#define RISCV_ISA_EXT_ZBC              43
> > +#define RISCV_ISA_EXT_ZBKB             44
> > +#define RISCV_ISA_EXT_ZBKC             45
> > +#define RISCV_ISA_EXT_ZBKX             46
> > +#define RISCV_ISA_EXT_ZKND             47
> > +#define RISCV_ISA_EXT_ZKNE             48
> > +#define RISCV_ISA_EXT_ZKNH             49
> > +#define RISCV_ISA_EXT_ZKR              50
> > +#define RISCV_ISA_EXT_ZKSED            51
> > +#define RISCV_ISA_EXT_ZKSH             52
> > +#define RISCV_ISA_EXT_ZKT              53
> >
> >  #define RISCV_ISA_EXT_MAX              64
> >  #define RISCV_ISA_EXT_NAME_LEN_MAX     32
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index a2fc952318e9..10524322a4c0 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -215,7 +215,18 @@ static struct riscv_isa_ext_data isa_ext_arr[] =3D=
 {
> >         __RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> >         __RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> >         __RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > +       __RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> > +       __RISCV_ISA_EXT_DATA(zbkb, RISCV_ISA_EXT_ZBKB),
> > +       __RISCV_ISA_EXT_DATA(zbkc, RISCV_ISA_EXT_ZBKC),
> > +       __RISCV_ISA_EXT_DATA(zbkx, RISCV_ISA_EXT_ZBKX),
> >         __RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> > +       __RISCV_ISA_EXT_DATA(zknd, RISCV_ISA_EXT_ZKND),
> > +       __RISCV_ISA_EXT_DATA(zkne, RISCV_ISA_EXT_ZKNE),
> > +       __RISCV_ISA_EXT_DATA(zknh, RISCV_ISA_EXT_ZKNH),
> > +       __RISCV_ISA_EXT_DATA(zkr, RISCV_ISA_EXT_ZKR),
> > +       __RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
> > +       __RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
> > +       __RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
> >         __RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> >         __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> >         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index bdcf460ea53d..447f853a5a4c 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -309,10 +309,40 @@ void __init riscv_fill_hwcap(void)
> >                                 SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT=
_SVPBMT);
> >                                 SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZB=
A);
> >                                 SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZB=
B);
> > +                               SET_ISA_EXT_MAP("zbc", RISCV_ISA_EXT_ZB=
C);
> >                                 SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZB=
S);
> > +                               SET_ISA_EXT_MAP("zbkb", RISCV_ISA_EXT_Z=
BKB);

This order does not look correct, please add them in alphanumerical
order as the comment these SET_ISA_EXT_MAP()s requests. Ditto below.

> > +                               SET_ISA_EXT_MAP("zbkc", RISCV_ISA_EXT_Z=
BKC);
> > +                               SET_ISA_EXT_MAP("zbks", RISCV_ISA_EXT_Z=
BKX);
>=20
> Should "zbks" be "zbkx"?
>=20
> >                                 SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT=
_ZICBOM);
> >                                 SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT=
_ZICBOZ);
> >                                 SET_ISA_EXT_MAP("zihintpause", RISCV_IS=
A_EXT_ZIHINTPAUSE);
> > +                               SET_ISA_EXT_MAP("zksed", RISCV_ISA_EXT_=
ZKSED);
> > +                               SET_ISA_EXT_MAP("zksh", RISCV_ISA_EXT_Z=
KSH);
> > +                               SET_ISA_EXT_MAP("zkr", RISCV_ISA_EXT_ZK=
R);
> > +                               SET_ISA_EXT_MAP("zkt", RISCV_ISA_EXT_ZK=
T);
> > +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZB=
KB);
> > +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZB=
KC);
> > +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZB=
KX);
> > +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZK=
ND);
> > +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZK=
NE);
> > +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZK=
NH);
> > +                               SET_ISA_EXT_MAP("zknd", RISCV_ISA_EXT_Z=
KND);
> > +                               SET_ISA_EXT_MAP("zkne", RISCV_ISA_EXT_Z=
KNE);
> > +                               SET_ISA_EXT_MAP("zknh", RISCV_ISA_EXT_Z=
KNH);
> > +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZB=
KB);
> > +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZB=
KC);
> > +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZB=
KX);
> > +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZK=
SED);
> > +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZK=
SH);
> > +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBK=
B);
> > +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBK=
C);
> > +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBK=
X);
> > +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKN=
D);
> > +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKN=
E);
> > +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKN=
H);
> > +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKR=
);
> > +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKT=
);
>=20
> It would be nice to consolidate the ones together that search for a
> single string and set multiple bits, though I don't have any super
> elegant ideas for how off the top of my head.

I've got a refactor of this code in progress, dropping all of these
copy-paste in place of a loop. It certainly looks more elegant than
this, but it will fall over a bit for these "one string matches many
extensions" cases. See here:
https://patchwork.kernel.org/project/linux-riscv/patch/20230626-thieving-jo=
ckstrap-d35d20b535c5@wendy/
My immediate thought is to add another element to riscv_isa_ext_data,
that contains "parent" extensions to check for. Should be fairly doable,
I'll whip something up on top of that...

Cheers,
Conor.

--ntaoTpnMkWXgwwSA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJsu7wAKCRB4tDGHoIJi
0vn4AQC26oDY9hsosQnCmZScmeGEs62Nk31L0MR2pwcsoJ7hCQEAsn7zMvS8V7di
mZyViU5jVj3dhfmspRoeN1NyVql8/Ak=
=Tfgb
-----END PGP SIGNATURE-----

--ntaoTpnMkWXgwwSA--


--===============6322920941400469643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6322920941400469643==--

