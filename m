Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77482C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 06:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCD7WSSOe/ELumWwzcT8DJAcJPsBK+72s2RpdgNqloY=; b=mFfauha+SeSsozwAhmcQBuGMJr
	64ZvpMtHV2Ub/JV0JzRlf1XWjaoAgG5BPAmxKWlR0K5TAkAuQAx/OKJf8HYXOzxeN108NM4LXaDDq
	Cj8CFqgsNyGuPen2wdwOw3Mq3USQhEGn10sB5OVT17r/CB1Q52C4vuVb2JnCsb8wiA4nTpoV/KF/U
	rw1nbGArTfELsuhLgWfu8b0VSzqS82PQFeBMg5pqGRl1dSIjjinKqsF2a7BVga8HW3BFa6q3s7qGR
	s/J5zoYrkMG3OufbcbSzvnWypfGbDY8sblaAeSUuAKpB6n9TMPRerlqRtzMMQPa55np9TpcV9IMnM
	PyBijGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCq2-0000000318x-2w2z;
	Wed, 29 May 2024 06:31:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCpy-0000000316o-3i1P
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 06:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1716964262; x=1748500262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zH5y51QIfyWMgU2MS015Gg0xtYou9QU6HF/0Q3WRPYw=;
  b=XNjscgV1Cbr8tAdFy4alZq5kZ1SX96VtG/XbG0J60OTqOI/D6E5jKCFG
   SbXKpqlKPGe+wpgxEliUwMM9GgBC7zQ+uFqC56UXhpPzTAMGpQIsEzOEa
   WMC5C1y5WOm9KHKhXL2XVBtiE1nARXirBfI3UZd2ymXJnxZjiNrIa8/GT
   xyRtNJAafzYbXivDcP0/vI56qPnRtPK3/gZRgsjx+mb3MC4TZ19qHWXMe
   XaCEnSHcFQMkql5DCBXoatRekFXkUBosyTLLvykxhbhsrpT1/D4ac/7lU
   iDeMyEWdrbSdzXHEuWlaV5+ZK4IUDjYn5NnnH8WonXuBlwqPMEd8yxgcI
   w==;
X-CSE-ConnectionGUID: e6tumgM0T7uwd7L4vEg+tw==
X-CSE-MsgGUID: A/hO/U7JRlOuR7VbCaFaIQ==
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="asc'?scan'208";a="27300257"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 May 2024 23:30:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 May 2024 23:30:36 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 28 May 2024 23:30:33 -0700
Date: Wed, 29 May 2024 07:30:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
CC: Conor Dooley <conor@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Andrew Jones <ajones@ventanamicro.com>,
	"pulehui@huawei.com" <pulehui@huawei.com>, Charlie Jenkins
	<charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@kernel.org>
Subject: Re: [PATCH v3 2/2] RISC-V: separate Zbb optimisations requiring and
 not requiring toolchain support
Message-ID: <20240529-hangup-recipient-246586c6f8a8@wendy>
References: <20240528-applaud-violin-facef8d9d846@spud>
 <20240528-opossum-flavorful-3411811b87e2@spud>
 <DM8PR11MB5751DBB6A068008269E7D399B8F22@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR11MB5751DBB6A068008269E7D399B8F22@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_233103_070432_3C233060 
X-CRM114-Status: GOOD (  10.52  )
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
Content-Type: multipart/mixed; boundary="===============4877079363950857129=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4877079363950857129==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rG0PxGrUtF8m4yb2"
Content-Disposition: inline

--rG0PxGrUtF8m4yb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 01:01:24AM +0000, Wang, Xiao W wrote:
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Tuesday, May 28, 2024 7:11 PM
> > -	ALTERNATIVE("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB,
> > CONFIG_RISCV_ISA_ZBB)
> > +	__ALTERNATIVE_CFG("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB,
> > +		IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT) &&
> > IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
>=20
> s/CONFIG_RISCV_ISA_ZBB_ALT/ CONFIG_RISCV_ISA_ZBB
> Same issue for below changes in strn*.S

I could have sworn I grepped for it and there was nothing, obviously
not... Thanks, I'll fix it up in a new version.

Thanks,
Conor

--rG0PxGrUtF8m4yb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlbLcwAKCRB4tDGHoIJi
0jc8AP90DEvrOSfWOH9WMnrelnVkjWKIwCS3PIn/6IwaBYSKzAEAiZGYQ825H6R3
OnZEKBXJJgLjKfpAYEb10FkwaeiI2AQ=
=AHbp
-----END PGP SIGNATURE-----

--rG0PxGrUtF8m4yb2--


--===============4877079363950857129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4877079363950857129==--

