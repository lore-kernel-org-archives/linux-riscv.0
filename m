Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D33DCD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 07:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcE2dmgkU2tOshSGP10oYdpABXaxonoQxh4tfh0eIzQ=; b=Y7m4tABLrw26gNIozPSql6ZsB/
	lMDzLD9tKZtYEpc8/2mPNTecqkFCD2BtUow8xWT+YinvEXEzlI29BliCwZYCVqDQ0EqgKqMuRTYRT
	cAp7mUekiqzQgLKWwahjHtioltXvRxf1NJOJh2+5WCpkAdeOq+Y+mojwFfKg4zX9kSQ6bGv7BPaQG
	2QhNixuyi8sH5kUr/YJWulgBR5BswEp8Y4UjmvQR9MA+IviLZDCYoQvCVV0gty15kGLCry4H4XLr3
	FQZbNe0u/JTqiVnUOsHy6HrhVRQGgI45sOSNBD7amUajmU9FVApmDPcWBr6icinjtHxmWgI9katsy
	dRQTAchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6gN-0000000HBI2-0BCn;
	Fri, 29 Mar 2024 07:29:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6fj-0000000HAzP-0upj
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711697347; x=1743233347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1cmDBy8dYrXEta4fjcrphoU72ogCv98mdd+8+tvN7TU=;
  b=vNQu1IJ22mG0F/36wqQJjlt6dsmta/T2tNQK6vUBdtpf+jH73jSIdk++
   U/QHbj6QGx1O3DH0hbn5Ty81cVN8OvRptulbbsSOwXqM7d8Jw9qa+6HET
   a3ji2g75qs/x7w/vgLrKzJ4IGGRF1UAmCJPb+glJycy1qMOmnJpnTaAuO
   OQMrJRPMAeUlhWh5miIjZ19jZYQRB+gr8buKZsWOskAM/NRPUBu56GTNC
   WN3e1KW9tXhhQrBcUMSWsfiEALSSYVyL6o5Js1vwpvcjtQglABUns/AkL
   DiaON3feJcYq5GJUjSOuXRU4OHmEzk4AFwaUVfwQu9WnhhLWRPP0o3jr0
   g==;
X-CSE-ConnectionGUID: dIC902tiRuyKClhJh9dfVQ==
X-CSE-MsgGUID: GdK04AE1QKylRlLI485iMw==
X-IronPort-AV: E=Sophos;i="6.07,164,1708412400"; 
   d="asc'?scan'208";a="185882733"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2024 00:29:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 00:28:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 00:28:45 -0700
Date: Fri, 29 Mar 2024 07:27:57 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing
	<kernel@esmil.dk>, Samuel Holland <samuel.holland@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, Andy Chiu <andy.chiu@sifive.com>, Jakub
 Kicinski <kuba@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>
Subject: Re: RISC-V for-next/fixes (cont'd from PW sync)
Message-ID: <20240329-fanning-woven-7dbb6cfdde9b@wendy>
References: <87ttkro3b5.fsf@all.your.base.are.belong.to.us>
 <20240327-irrigate-unread-d9de28174437@spud>
 <CAHVXubgMTe83sYaNO+SG=90=k5scaQrpApveTCO163MhUc1tdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubgMTe83sYaNO+SG=90=k5scaQrpApveTCO163MhUc1tdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_002907_345621_9405EF0A 
X-CRM114-Status: GOOD (  19.03  )
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
Content-Type: multipart/mixed; boundary="===============6529844623650820015=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6529844623650820015==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y/2CbQmcronQVXbs"
Content-Disposition: inline

--Y/2CbQmcronQVXbs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 07:46:38AM +0100, Alexandre Ghiti wrote:
> On Wed, Mar 27, 2024 at 9:32=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Mar 27, 2024 at 08:57:50PM +0100, Bj=C3=B6rn T=C3=B6pel wrote:
> > > Hi,
> > >
> > > I figured I'd put some words on the "how to update the RISC-V
> > > for-next/fixes branches [1]" that came up on the patchwork call today.
> > >
> > > In RISC-V land, the for-next branch is used for features, and typical=
ly
> > > sent as a couple of PRs to Linus when the merge window is open. The
> > > fixes branch is sent as PR(s) between the RCs of a release.
> > >
> > > Today, the baseline for for-next/fixes is the CURRENT_RELEASE-rc1, and
> > > features/fixes are based on that.
> > >
> > > This has IMO a couple of issues:
> > >
> > > 1. fixes is missing the non-RISC-V fixes from releases later than
> > >    -rc1, which makes it harder for contributors.
>=20
> The syzbot report [1] requires fixes in mm [2], if we don't update
> fixes on top of the latest -rcX, we'll keep hitting this bug, so
> rebasing -fixes on top of the latest -rcX is necessary to me.

No non-ff rebasing of branches unless its 101% required, please. This
seems like a justifiable reason to merge the rc it appears in into the
riscv branches though.

> [1] https://lore.kernel.org/linux-riscv/00000000000070a2660614b83885@goog=
le.com/T/#t
> [2] https://lore.kernel.org/all/20240326063036.6242-1-osalvador@suse.de/

--Y/2CbQmcronQVXbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgZtfQAKCRB4tDGHoIJi
0tiOAP4xrV2ls9KTOiepY1R3DQ4qiVounWXxYFc7g1IeQp60DQEA4pgF02ZVfCYK
LekKEkPD/qHka7u0tB7awW+UGsTp0gs=
=wq1B
-----END PGP SIGNATURE-----

--Y/2CbQmcronQVXbs--


--===============6529844623650820015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6529844623650820015==--

