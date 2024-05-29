Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E754C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHJt/ewYZg7Wz6geQDhHM5juJ14940alDaTcDhJlyeE=; b=2MW6xTlFXCb41DclsoPd4PJFj4
	Msm6zIOzJiyGv7WJk2mus1Pp9fYy3JPMBm0UrzgFGHT/umd1aGDPZ1k182BkGXFb6eJGoGXVZXrIU
	+cMxtNrjJyOsJS06zzbOI5bFy1iz8rVUXpwOMlSklEde1Shmhuwg6gxIRS2eZsHt/w7XjkpEh9/fT
	cR0Ff1DVhL530zNQDKXZiOwpuuC5rIHuPKiCJSAOLaodUIENZzVFvZVY6k+sExVJpz5J5u08WnpDs
	Zz0WqWIuudbJRB7BIE7Yr1nJv1dfy3BvgU6onrPhwXyFdGdORyMteMtq/UhDPyAy3JOMRLMvVErtJ
	R4c+pFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCF5Q-00000003XL4-0hwP;
	Wed, 29 May 2024 08:55:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCF5J-00000003XJn-3Txm
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 08:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1716972901; x=1748508901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=stmi+KjKYwhxeArkzsaF8RjOW0BjWcjWKiALUZ9OGuI=;
  b=zZ6PVrOSInKZCtocTHbi8RO5SYSJjmkEY5/FrTJXe2EM+O6QynO1NIot
   dLkAL1lWCTRLl7jlyWCxqSr5S3tZHaa71x/OIazWx4WZ998B7QJIIMzUE
   Oi4RsCPkQT9vovbDTNUkrPwCfzfgQEVoysDAIpDjY2uTm8CXaLYWCmQlC
   Dm9paDBBP1Vbr3xXzQgS/ksgM1Lp1bV9565iYzX0I9Lg17W28sw+VKd32
   jDs5bR53bQwiZqAbxhYyc9tlzzLsZ/i+Zexkh2vQ5Mt/a7x3WeoQTPRG6
   7ahIhWAMIl7aCz/gvkw7Q3Hsgd8NBp5qgNEqd5myIunQKx9832wsnwBXM
   Q==;
X-CSE-ConnectionGUID: 7aj2rH0ESMaOikeNKY2vOw==
X-CSE-MsgGUID: xF5tUv5VR9WfS0JhHj6+6g==
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="asc'?scan'208";a="194084660"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 May 2024 01:54:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 May 2024 01:54:48 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 29 May 2024 01:54:46 -0700
Date: Wed, 29 May 2024 09:54:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<xiao.w.wang@intel.com>, Andrew Jones <ajones@ventanamicro.com>,
	<pulehui@huawei.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-kernel@vger.kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@kernel.org>
Subject: Re: [PATCH v3 1/2] RISC-V: clarify what some RISCV_ISA* config
 options do
Message-ID: <20240529-riveter-spectacle-e5ab2f45065f@wendy>
References: <20240528-applaud-violin-facef8d9d846@spud>
 <20240528-varnish-status-9c22973093a0@spud>
 <f2a3bddd-0cc1-43ca-8421-1d67dd2800f8@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <f2a3bddd-0cc1-43ca-8421-1d67dd2800f8@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_015502_050993_4A83961E 
X-CRM114-Status: GOOD (  35.63  )
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
Content-Type: multipart/mixed; boundary="===============1465445030024124674=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1465445030024124674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ufpfARkzjihwFYJ8"
Content-Disposition: inline

--ufpfARkzjihwFYJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 10:47:40AM +0200, Alexandre Ghiti wrote:
> Hi Conor,
>=20
> On 28/05/2024 13:11, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > During some discussion on IRC yesterday and on Pu's bpf patch [1]
> > I noticed that these RISCV_ISA* Kconfig options are not really clear
> > about their implications. Many of these options have no impact on what
> > userspace is allowed to do, for example an application can use Zbb
> > regardless of whether or not the kernel does. Change the help text to
> > try and clarify whether or not an option affects just the kernel, or
> > also userspace. None of these options actually control whether or not an
> > extension is detected dynamically as that's done regardless of Kconfig
> > options, so drop any text that implies the option is required for
> > dynamic detection, rewording them as "do x when y is detected".
> >=20
> > Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554=
f75a676c@spud/ [1]
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   arch/riscv/Kconfig | 36 +++++++++++++++++++-----------------
> >   1 file changed, 19 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index b94176e25be1..3b702e6cc051 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -501,7 +501,8 @@ config RISCV_ISA_C
> >   	help
> >   	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
> >   	  when building Linux, which results in compressed instructions in t=
he
> > -	  Linux binary.
> > +	  Linux binary. This option produces a kernel that will not run on
> > +	  systems that do not support compressed instructions.
> >   	  If you don't know what to do here, say Y.
> > @@ -511,8 +512,8 @@ config RISCV_ISA_SVNAPOT
> >   	depends on RISCV_ALTERNATIVE
> >   	default y
> >   	help
> > -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> > -	  time and enable its usage.
> > +	  Add support for the Svnapot ISA-extension in the kernel when it
> > +	  is detected at boot.
>=20
>=20
> To me, the new version makes things even more confusing: svnapot mappings
> will indeed be handled by the kernel (since only the kernel sets up the p=
age
> tables) but it will only be used (for now) for HugeTLB mappings in
> userspace.

How would you suggest that I word it? "Enable the use of the Svnapot
ISA-extension when it is detected at boot"? The current text implies that
these options control detection of extensions (which they do not) and
that is what I am looking to remove as it has caused confusion.

--ufpfARkzjihwFYJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlbtRgAKCRB4tDGHoIJi
0qRDAQCWy/SRBWv+pbbkpLOchCFKbDcNZQYKkbilBF83QCBRgQEAsLJNQ3h2WnQO
MVK+RXQe2Hmh41W45EEunlXhnJeWqQI=
=3yN1
-----END PGP SIGNATURE-----

--ufpfARkzjihwFYJ8--


--===============1465445030024124674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1465445030024124674==--

