Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F00DC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEA+3NxPMciXVKAeqqzZm8j0BdwG0rcaUfz4tFzTgIM=; b=qWm7xvQuycmhR0tvJq744QNgJw
	qp5FRTNBdxijbk24dGOfm1x408toI+xmBIBMTqOb9h0FCtVgO9+KYVCEqAab2sqRKo4UhPwy2J9Sx
	6MODTdETKlXjnL/2w6aeapfmnqE1g28qNDWUfQyaD76HE5q/otJeWRQYVLDAPjyZOIFLRvpA0rn9P
	qnysD+Hybp/9NWS1jc+mRM3gqUIUfEUS+5chLw5pZmldv+dmf2TpDlB1cTaeqZnmxraaevqfLcXCF
	e+L89uUIvOkFFi5P37xqcxzpEzBgk3Vjz0YathJBumtYEhiGflNFCfqQ5QjlVjPLtm0Ns6lGVU2bK
	DqXartvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79s1-00000000vAH-1OvF;
	Wed, 15 May 2024 08:20:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79ry-00000000v9m-2VQV
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 08:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715761215; x=1747297215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ISlf6Oang1bIb3NO5GiCyu6dI90A4hgSsCEF1qXyjhM=;
  b=OfBMxvXHUcXsBfSqYIT0rPwAPHx5IBwKUMX4O/NVoFrF3KTNnMB7/lQh
   R5jho9y61ZO5iVUmn6rGN23BOu8Uq1kcIKTSdgg2p9Qy84yaODbKztQPl
   AxbpdDNdJ5dpRrBGnVgl6W6Igv9Z7Lya9BM8eKe55VLNzzNCvJu5vCAc3
   2AYtT+5O2CGaorfB2HjeZHp101/RZTLvI34UVTwQOG0xu1exciOyQhzOt
   lkUfAO7V633VNb8Pu4XEz7wdQUGq2QKLVoOEPxCZywrs997JSYsztWq42
   t7JEPTOP22Kf0AcrbImNeOmJ7hPK96qMUlALLA+Og5EYqoAYV1a5zJolg
   g==;
X-CSE-ConnectionGUID: abhP6raiRY2CWqedFddvng==
X-CSE-MsgGUID: 4iB1jHs7SKKoyuFQP8+Gpg==
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="asc'?scan'208";a="255643733"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2024 01:20:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 01:20:04 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 15 May 2024 01:20:00 -0700
Date: Wed, 15 May 2024 09:19:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: "Wang, Xiao W" <xiao.w.wang@intel.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "luke.r.nels@gmail.com"
	<luke.r.nels@gmail.com>, "xi.wang@gmail.com" <xi.wang@gmail.com>,
	"bjorn@kernel.org" <bjorn@kernel.org>, "ast@kernel.org" <ast@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org"
	<andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>,
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org"
	<kpsingh@kernel.org>, "sdf@google.com" <sdf@google.com>, "haoluo@google.com"
	<haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "pulehui@huawei.com"
	<pulehui@huawei.com>, "Li, Haicheng" <haicheng.li@intel.com>,
	"conor@kernel.org" <conor@kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2] riscv, bpf: Optimize zextw insn with Zba extension
Message-ID: <20240515-cone-getting-d17037b51e97@wendy>
References: <20240511023436.3282285-1-xiao.w.wang@intel.com>
 <20240513-5c6f04fb4a29963c63d09aa2@orel>
 <DM8PR11MB575179A3EB8D056B3EEECA74B8E32@DM8PR11MB5751.namprd11.prod.outlook.com>
 <20240514-944dec90b2c531d8b6c783f7@orel>
MIME-Version: 1.0
In-Reply-To: <20240514-944dec90b2c531d8b6c783f7@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_012014_693910_396F747C 
X-CRM114-Status: GOOD (  22.15  )
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
Content-Type: multipart/mixed; boundary="===============2503319070863294278=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2503319070863294278==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PCtwkfT5UTiocbOE"
Content-Disposition: inline

--PCtwkfT5UTiocbOE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 03:37:02PM +0200, Andrew Jones wrote:
> On Tue, May 14, 2024 at 07:36:04AM GMT, Wang, Xiao W wrote:
> > > From: Andrew Jones <ajones@ventanamicro.com>
>> > > > +config RISCV_ISA_ZBA
> > > > +	bool "Zba extension support for bit manipulation instructions"
> > > > +	depends on TOOLCHAIN_HAS_ZBA
> > >=20
> > > We handcraft the instruction, so why do we need toolchain support?
> >=20
> > Good point, we don't need toolchain support for this bpf jit case.
> >=20
> > >=20
> > > > +	depends on RISCV_ALTERNATIVE
> > >=20
> > > Also, while riscv_has_extension_likely() will be accelerated with
> > > RISCV_ALTERNATIVE, it's not required.
> >=20
> > Agree, it's not required. For this bpf jit case, we should drop these t=
wo dependencies.
> >=20
> > BTW, Zbb is used in bpf jit, the usage there also doesn't depend on too=
lchain and
> > RISCV_ALTERNATIVE, but the Kconfig for RISCV_ISA_ZBB has forced the dep=
endencies
> > due to Zbb assembly programming elsewhere.
> > Maybe we could just dynamically check the existence of RISCV_ISA_ZB* be=
fore jit code
> > emission? or introduce new config options for bpf jit? I prefer the fir=
st method and
> > welcome any comments.
>=20
> My preferences is to remove as much of the TOOLCHAIN_HAS_ stuff as
> possible. We should audit the extensions which have them to see if
> they're really necessary.

While I think it is reasonable to allow the "RISCV_ISA_ZBB" option to
control whether or not bpf is allowed to use it for optimisations, only
allowing bpf to do that if there's toolchain support feels odd to me..
Maybe we need to sorta steal from Charlie's patchset and introduce
some hidden options that have the toolchain dep that are used by the
alternative macros etc?

I'll have a poke at how bad that looks I think.

> I don't mind depending on RISCV_ALTERNATIVE,
> since it's almost required for riscv at this point anyway.

As you say, using on riscv_has_extension_likely() doesn't mean you
depend on alternatives so effectively all this does is rule out use
with XIP, since alternatives are selected when !XIP. Does BPF even work
for XIP?

--PCtwkfT5UTiocbOE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkRwIgAKCRB4tDGHoIJi
0oNrAP9q45vV3szU20JF9S6wc6DveShfdByLH9gPMYtr7jfQJwEAgOlRs5bh/aUj
XQBTHLztm+XoKiwl2Q24JAHreZtb9Ac=
=/lH/
-----END PGP SIGNATURE-----

--PCtwkfT5UTiocbOE--


--===============2503319070863294278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2503319070863294278==--

