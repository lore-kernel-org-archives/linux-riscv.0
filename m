Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0973AC07E8F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcG5goQxudCpFiZQTvkjWOd7LVnbEuPEwsDhB5/kGRs=; b=d8Ey+DoednSiETM4MzIZVB1P4x
	oV62Pg1lM20zlypCw2k6vR1BJBmxm38be2572N1UNpdOA00VR/gn1s0lJo5igAsa8Jm4Wfhn/YreV
	kX1ai1MPY5EGdbVc76qmdtU/x3sLXeFjFo3dIRlbrP+jpfARzfz1pwCpUc3ZQPOaqKFu4dgatYwgH
	bBSGZqTqpKtd9PC6muRRR6HskDVfk64QDNeaaSZgdxm5DL4o3559h49gfeaH6oL+aPR71XXd8Kx/v
	wSx0QrRhMpuvDenRHtt4tM7bFIabYIrCY65EKsOJHC3Fc902Jb049s6cLHuIS+tKp0kUAte9i9/HB
	UGc9OI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryowp-0000000CdC2-3bwz;
	Mon, 22 Apr 2024 08:22:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryown-0000000CdA9-06ID
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 08:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713774165; x=1745310165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hqzjZdrVT+2K2Gd5jHuwZTTR/Vs/MX4XtZ2J7V6NUU0=;
  b=DuWto87MJAwSP42T+qRqr6vljdsfw833VHf6U0vdPMCadVciYspWzfEO
   e6blsU2jzeR/uBJhkYFhPbmPruCFAg0brGxpqhn8iySV+m+rQDTMONxas
   HZCv91lieIDWkHzAkq8ThDfNTNjiHHmpQ+ZEv3QVy0yZHzZKv0knUDXLd
   V0gfUYOxZc+OdDVYkVuORsSS4Q9gJ/gYifzAEtRGXhLS9OtM1ZnC1mcq3
   3DxMkqRtwdjua3tx2b5kkTd5rt+23sjl+A7AKYuuTpoKOWu2FyL7aKTon
   CVlVB88Zdo6QxrErqIkxEXgOBAlRZbr1BmE7NWXSIqWnTN2t1/rCsrN2v
   A==;
X-CSE-ConnectionGUID: FFRa7jbjQ4CieqJWuyjLYg==
X-CSE-MsgGUID: +MO64W1yTt21mTVIuKugwQ==
X-IronPort-AV: E=Sophos;i="6.07,220,1708412400"; 
   d="asc'?scan'208";a="22079780"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Apr 2024 01:22:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 01:22:16 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 22 Apr 2024 01:22:14 -0700
Date: Mon, 22 Apr 2024 09:21:58 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Xu Lu <luxu.kernel@bytedance.com>
CC: Conor Dooley <conor@kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <andy.chiu@sifive.com>,
	<guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <lihangjing@bytedance.com>,
	<dengliang.1214@bytedance.com>, <xieyongji@bytedance.com>,
	<chaiwen.cc@bytedance.com>, Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [External] Re: [RFC 1/2] riscv: process: Introduce idle thread
 using Zawrs extension
Message-ID: <20240422-dropper-subplot-efaa833f3cf2@wendy>
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <20240418114942.52770-2-luxu.kernel@bytedance.com>
 <20240418-dove-deferral-2b01100e13ca@spud>
 <CAPYmKFsddST1n2ZU+5=c_yPqAKTjQ4X1mKVFMZbhfo8xiB+OTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPYmKFsddST1n2ZU+5=c_yPqAKTjQ4X1mKVFMZbhfo8xiB+OTA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_012245_272192_A64DB6D0 
X-CRM114-Status: GOOD (  26.35  )
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
Content-Type: multipart/mixed; boundary="===============6851587253011183959=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6851587253011183959==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="au03+AdWTr1KTcof"
Content-Disposition: inline

--au03+AdWTr1KTcof
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 12:14:47AM +0800, Xu Lu wrote:
> On Thu, Apr 18, 2024 at 11:06=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > On Thu, Apr 18, 2024 at 07:49:41PM +0800, Xu Lu wrote:

> > > +        The Zawrs extension defines a pair of instructions to be used
> > > +        in polling loops that allows a core to enter a low-power sta=
te
> > > +        and wait on a store to a memory location.
> > > +
> > > +        If you don't know what to do here, say Y.
> > > +
> > >  config TOOLCHAIN_HAS_V
> > >       bool
> > >       default y
> > > @@ -1075,6 +1090,15 @@ endmenu # "Power management options"
> > >
> > >  menu "CPU Power Management"
> > >
> > > +config RISCV_ZAWRS_IDLE
> > > +     bool "Idle thread using ZAWRS extensions"
> > > +     depends on RISCV_ISA_ZAWRS
> > > +     default y
> > > +     help
> > > +             Adds support to implement idle thread using ZAWRS exten=
sion.
> > > +
> > > +             If you don't know what to do here, say Y.
> >
> > I don't think this second option is needed, why would we not always want
> > to use the Zawrs version of this when it is available? Can we do it
> > unconditionally when RISCV_ISA_ZAWRS is set and the extension is
> > detected at runtime?
> >
> > Cheers,
> > Conor.
>=20
> Indeed, we can always choose WRS.NTO when entering idle.
>=20
> This config is introduced for the second commit in this patch series.
> In the second commit, we detect whether the target cpu is idle when
> sending IPI and write IPI info to the reserve set of idle cpu so as to
> avoid sending a physical IPI. Besides, the target idle cpu need not to
> go through traditional interrupt handling routine. However, if all
> cpus are busy and hardly enter idle, this commit may introduce
> performance overhead of extra instructions when sending IPI. Thus we
> introduce this config just in case.

Could you add the downsides into the help text of the config option so
that people can understand why to enable/disable the option?

Thanks,
Conor.

--au03+AdWTr1KTcof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiYeGAAKCRB4tDGHoIJi
0m0oAP9mbUm3LJcEUiHU1xnlWcY7C/VC+9g67Mo9ZUgSpFCQPAD/S4i9UUubWIEX
UgTIDTA4/zvViKNIYF6pSKiRQV8URQ4=
=Ocef
-----END PGP SIGNATURE-----

--au03+AdWTr1KTcof--


--===============6851587253011183959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6851587253011183959==--

