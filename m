Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B7AC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 11:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a30dWVInX61r458TMyP9GUfkHLns34+guTY1eqMN46w=; b=Fpt5UB1ma7EGcTbQbIWy/H+5uo
	O++BIRbH2r9rhC6VR+anX3tx5ylP7RxKQDyC55FaYI9mhtE2xTIymKOwb3Lz0a03bky/rKqpYawWM
	tk7f+65cbM2eRxNBZUJrSv0qY1biEh/3m/MZZc2mbn2rnazEAWCOmmcRYTJliCcjbwR3VGwH1rtH0
	K3OoQAnrUzYutOuCYW2bhmk9t5aqkQoZwjvCdkBNh9cXGSISTulHDt1w4TrY91h2KLDfQhb72N2VS
	K5Fq/wVY/WlNa1lNDDqSO8P7QW6j3FMbzPFZtaXRPyIzBYCZ3NZE/Agnc8ne1wDfTRfoLVdBH7kkm
	3yeUImMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7DAi-00000001QHr-05PO;
	Wed, 15 May 2024 11:51:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7DAf-00000001QHN-1YjX
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 11:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715773905; x=1747309905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GdvQ3kH47JlZhzV5G7bHu6bKjpEJvCPgt4JPEYVNd3A=;
  b=OhC2kyJLOPK9jYmMt+E6FnysE66Z/X/Q0p249aqYwfpWSa4LEA+yuNOT
   hi2O+LQWGG0129I7sQacbSZw5GsgVTpWC+SIEgjzEXtVwuVO/MlhXdI4X
   R6QBRRgVisYdhrcdySl2iBUsZOSviJ1IiM4pYG5oGl2QxNi7jQkob6ctU
   2ctCPmdOzc2RzvCKSXfAG7apEkK7T2GAgtnlEBNXnkG74kWkCABR0yfTI
   ECvsTV/pkvZ0Wvtl5vzdyevz6Xdomp6Q1tYsrEgwX/PSVQ/RMtuy91kPq
   z0QIyHtzr6ucqCt9fAxzh3RhW5C/PB2oYbLNcs8O6o9NSSsMNLpbxkE3a
   A==;
X-CSE-ConnectionGUID: ud8/5qnhRsubTfo6bloRBg==
X-CSE-MsgGUID: YPeKYJfeQtqP+N3X1UJ6iw==
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="asc'?scan'208";a="192175672"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2024 04:51:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 04:51:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 15 May 2024 04:51:19 -0700
Date: Wed, 15 May 2024 12:51:04 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
CC: Andrew Jones <ajones@ventanamicro.com>, "paul.walmsley@sifive.com"
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
Message-ID: <20240515-wobble-stack-5b9264c12f37@wendy>
References: <20240511023436.3282285-1-xiao.w.wang@intel.com>
 <20240513-5c6f04fb4a29963c63d09aa2@orel>
 <DM8PR11MB575179A3EB8D056B3EEECA74B8E32@DM8PR11MB5751.namprd11.prod.outlook.com>
 <20240514-944dec90b2c531d8b6c783f7@orel>
 <20240515-cone-getting-d17037b51e97@wendy>
 <20240515-jogger-pummel-19fe4e9e8314@wendy>
 <DM8PR11MB5751A2BB91C431DAE14F48C1B8EC2@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR11MB5751A2BB91C431DAE14F48C1B8EC2@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_045145_565215_57E49CB6 
X-CRM114-Status: GOOD (  27.00  )
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
Content-Type: multipart/mixed; boundary="===============0270989956478597155=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0270989956478597155==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="maladpWpE2+wJpPh"
Content-Disposition: inline

--maladpWpE2+wJpPh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 11:31:43AM +0000, Wang, Xiao W wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > > > My preferences is to remove as much of the TOOLCHAIN_HAS_ stuff as
> > > > possible. We should audit the extensions which have them to see if
> > > > they're really necessary.
> > >
> > > While I think it is reasonable to allow the "RISCV_ISA_ZBB" option to
> > > control whether or not bpf is allowed to use it for optimisations, on=
ly
> > > allowing bpf to do that if there's toolchain support feels odd to me..
> > > Maybe we need to sorta steal from Charlie's patchset and introduce
> > > some hidden options that have the toolchain dep that are used by the
> > > alternative macros etc?
> > >
> > > I'll have a poke at how bad that looks I think.
> >=20
> > I don't love this, in particular my option naming, but it would allow
> > the Zbb optimisations in the kernel to not depend on toolchain support
> > while not muddying the Kconfig waters for users:
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/=
?h=3Dri
> > scv-zbb_split
>=20
> In that patch, I think the bpt jit part should check IS_ENABLED(CONFIG_RI=
SCV_ISA_ZBB)
> rather than IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT).

D'oh, you're right. The bpf code being different was meant to be the whole
point of the change...

> > A similar model could be followed if there were to be some
> > optimisations for Zba in the future that do require toolchain support:
>=20
> Though this model introduces extra hidden Kconfig option, it does provide=
 finer=20
> config granularity. This should be a separate patch in the future, we can=
 discuss about
> the option naming there.

Yeah, not expecting you to do this as part of this patch.

Thanks,
Conor.


--maladpWpE2+wJpPh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkShnwAKCRB4tDGHoIJi
0sTgAPwICMKtZQim3Vt/IyQaj7mA09XXCNeqaMmOhqqrqRhmcAD+JuScaCRXPxMN
fi/Dv2IKekKAVwvT3aEZbt7ZJnLMjg4=
=znv+
-----END PGP SIGNATURE-----

--maladpWpE2+wJpPh--


--===============0270989956478597155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0270989956478597155==--

