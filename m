Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD9C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcVRbrPp5OfDFwe6HCRzni8oFClUW+s3IdfJ4u73PAQ=; b=bebYAHHb/4Uj5MKXUVrN6p3NwJ
	l27ivryJN1ZKqU970OtcxN8qDe5ntpn1U0GzJPo1F6twFvAGYeIBceagSgKJ47PYYlyvfyJ+bXsIr
	yhc1jLfzUetqfncALPNT1IYo635PvvRJGAT9Ukhno4cL3V7WeUhSm61muy9Ow5WDTW+EzhumkGreW
	fbJPALbD1XXomXKFiV+h0YoE80CjdBjYGu73OsUlwdJ413liRS9ZWVdTxf/H8Uhva4pcQ4wxGq/8M
	Yey3Dh6M8Rp0D0iyOAQA3uEIva0s4RHrX7knp3E/CzTKj2EBecDqeTtySSoDrI65R4siMIwSFD+DN
	7JWUfDTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWwz-0024ZQ-2A;
	Mon, 15 May 2023 12:05:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWwx-0024Yc-01;
	Mon, 15 May 2023 12:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684152311; x=1715688311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SE2yff8eHErH/4ND60UluHUrfSC0OZ2ezoD7zN3/nts=;
  b=Dmwm+sdjrgRltFqwWuV//seTV3WUozazEccgUMuPSMJ8xsVFMOQ5UiMk
   ZjdKZbdgA/D8qtXw3XoD5sy4I6NXCIUgnUgNOt/68t4oHCdbTxznj1eoB
   D3JTTOwN0eFp5CWZnZvaDdq+8uC2NUv21uBO+duDzQ7MDRJifEqQYery3
   aEzaBLKz2xnOTgFr2WVRok+KL8uzt/IQ+3jfjdA2+GUiyEF94D1oNwyRq
   nQhQhQ+KKsaTSl/Mul0R3bMzFcKRG5AcPdNFy+JMkglDUiYTq6DOKoTyr
   7H4yuwmGPCIu1gtKu/TD0F2v/UAPhJZKYxA/rZaKI5eoLBhdrMH8Mr82W
   w==;
X-IronPort-AV: E=Sophos;i="5.99,276,1677567600"; 
   d="asc'?scan'208";a="211287226"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2023 05:05:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 15 May 2023 05:05:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 15 May 2023 05:05:04 -0700
Date: Mon, 15 May 2023 13:04:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <andy.chiu@sifive.com>,
	<linux-riscv@lists.infradead.org>, <anup@brainfault.org>,
	<atishp@atishpatra.org>, <kvm-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>, Vineet Gupta <vineetg@rivosinc.com>,
	<greentime.hu@sifive.com>, <guoren@linux.alibaba.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
Message-ID: <20230515-applicant-bagel-57adf89c44f7@wendy>
References: <20230509-chitchat-elitism-bc4882a8ef8d@spud>
 <mhng-8554b236-c9d4-4590-8941-ed7ca5316d18@palmer-ri-x1c9a>
 <20230509-mayday-remold-a4421af1f9e1@spud>
MIME-Version: 1.0
In-Reply-To: <20230509-mayday-remold-a4421af1f9e1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_050511_116367_85775149 
X-CRM114-Status: GOOD (  40.07  )
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
Content-Type: multipart/mixed; boundary="===============8187722042222508991=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8187722042222508991==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B7pWDLT1ChCAE4rS"
Content-Disposition: inline

--B7pWDLT1ChCAE4rS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 10:06:14PM +0100, Conor Dooley wrote:
> On Tue, May 09, 2023 at 01:59:33PM -0700, Palmer Dabbelt wrote:
> > On Tue, 09 May 2023 09:53:17 PDT (-0700), Conor Dooley wrote:
> > > On Wed, May 10, 2023 at 12:04:12AM +0800, Andy Chiu wrote:
> > > > > > +config RISCV_V_DISABLE
> > > > > > +     bool "Disable userspace Vector by default"
> > > > > > +     depends on RISCV_ISA_V
> > > > > > +     default n
> > > > > > +     help
> > > > > > +       Say Y here if you want to disable default enablement st=
ate of Vector
> > > > > > +       in u-mode. This way userspace has to make explicit prct=
l() call to
> > > > > > +       enable Vector, or enable it via sysctl interface.
> > > > >
> > > > > If we are worried about breaking userspace, why is the default fo=
r this
> > > > > option not y? Or further,
> > > > >
> > > > > config RISCV_ISA_V_DEFAULT_ENABLE
> > > > >         bool "Enable userspace Vector by default"
> > > > >         depends on RISCV_ISA_V
> > > > >         help
> > > > >           Say Y here to allow use of Vector in userspace by defau=
lt.
> > > > >           Otherwise, userspace has to make an explicit prctl() ca=
ll to
> > > > >           enable Vector, or enable it via the sysctl interface.
> > > > >
> > > > >           If you don't know what to do here, say N.
> > > > >

There's been nothing here from the posting on the distro list. Whichever
way we go here, I would like the word "DEFAULT" added to the config
option to avoid confusion between it & RISC_ISA_V.

Thanks,
Conor.

> > > >=20
> > > > Yes, expressing the option, where Y means "on", is more direct. But=
 I
> > > > have a little concern if we make the default as "off". Yes, we crea=
te
> > > > this option in the worries of breaking userspace. But given that the
> > > > break case might be rare, is it worth making userspace Vector harder
> > > > to use by doing this? I assume in an ideal world that nothing would
> > > > break and programs could just use V without bothering with prctl(),=
 or
> > > > sysctl. But on the other hand, to make a program robust enough, we
> > > > must check the status with the prctl() anyway. So I have no answer
> > > > here.
> > >=20
> > > FWIW my logic was that those who know what they are doing can turn it=
 on
> > > & keep the pieces. I would expect distros and all that lark to be abl=
e to
> > > make an educated decision here. But those that do not know what they =
are
> > > doing should be given the "safe" option by default.
> > > CONFIG_RISCV_ISA_V is default y, so will be enabled for those upgradi=
ng
> > > their kernel. With your patch they would also get vector enabled by
> > > default. The chance of a breakage might be small, but it seems easy to
> > > avoid. I dunno...
> >=20
> > It's really more of a distro/user question than anything else, I'm not
> > really sure there's a right answer.  I'd lean towards turning V on by
> > default, though: the defconfigs are meant for kernel hackers, so defaul=
ting
> > to the option that's more likely to break something seems like the way =
to go
> > -- that way we see any possible breakages early and can go figure them =
out.
>=20
> To get my "ackchyually" out of the way, I meant the person doing `make
> olddefconfig` based on their distro's .config etc or using menuconfig
> rather than someone using the in-kernel defconfig.
> We can always set it to the potentially breaking mode explicitly in our
> defconfigs while leaving the defaults for the aforementioned situations
> as the "safe" option, no?
>=20
> > Depending on the risk tolerance of their users, distributions might wan=
t to
> > turn this off by default.  I posted on sw-dev, which is generally the b=
est
> > way to find the distro folks.



--B7pWDLT1ChCAE4rS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGIf2wAKCRB4tDGHoIJi
0oHWAP9KgZyTUf6ha5/KpevTnXE1TDs9Tk1YBq61LevlERonogEA72R6v5804ECn
DjDFtLZHJyG84A6vVb3YKu16DpWMCAA=
=QHY9
-----END PGP SIGNATURE-----

--B7pWDLT1ChCAE4rS--


--===============8187722042222508991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8187722042222508991==--

