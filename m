Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5311C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b5P1G7e8IqQG9tFbirLEdKehFWjbUPDae/+w1mHNps=; b=V81gWEo3X7YJY01mQWPfTLJJBq
	YD98blYGKI8QL3EO/Qf5LiIDYdGDXnfGLcISaxjKUWZL3hONf1IWZ7f5/NdMPiyxIy3AodmYpXINP
	kTlvm/vFK+1bDjioioSGPuTZAcsMKHev2T58kDv3uCG5f8q84bQejeqw7XldYkMS12wIXdOEbx9mo
	nW5jNuR1Hc/Mbw5K+nS3jyVf0OOLb3UcAtwq0REm6U21tuutXm7JF+7AJK98caW2kCaXCAZf6Fhsc
	Jj7Z6V2iEvZdBPcGZRCabxFulE/UXDIzdlBu9z/TaztvOkYwV7syz24fbafg145I5GhpzJZYF7f5v
	yNto49MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI20W-00000001ugl-12RF;
	Fri, 14 Jun 2024 08:10:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI20T-00000001ufJ-2dkV
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 08:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718352597; x=1749888597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tdyxMi9MCtjeyNj6V3YguqessosZYjypEXDKgngR3k4=;
  b=V0bFkPMEZI5B4nn3BFf3dYVZ71ulJDdbE/vYydNJwHgqVhyYrgS7dekV
   wfwgkFN7urth8VgOFtAcplhHthjV77HvBapXRqs52MjAGUCETMffrzAYT
   0LQeJF2sdkzqL75WCpK3LK/h2TTawgdzZUexdJwUPXZvouPxNW+ENkDze
   KTJ8j44/hG7Ut/+IkQh2fIhcWi88k+gxRCnuWyl2L3bdBUdIFQRKljROJ
   Rla1BcID6FyLPixQEP+dN7wZNNAFfIRmCA1voR0E3Pg2lvFZnA4KRKZ9p
   l5nLaTD549q54+OcZ202pKHSx2pW4JUR1AgC6FDsRZX+pDlss/Fc3Nm7N
   w==;
X-CSE-ConnectionGUID: MPaymeoARIu6VK5pumub+w==
X-CSE-MsgGUID: Uq74KbUuSymUnT1JBSATOA==
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="asc'?scan'208";a="29987298"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jun 2024 01:09:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Jun 2024 01:09:38 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 14 Jun 2024 01:09:33 -0700
Date: Fri, 14 Jun 2024 09:09:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jesse Taube <jesse@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, Evan Green
	<evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins
	<charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu
	<andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>, Greentime Hu
	<greentime.hu@sifive.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin
	<costa.shul@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Baoquan
 He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>, Zong Li
	<zong.li@sifive.com>, Sami Tolvanen <samitolvanen@google.com>, Ben Dooks
	<ben.dooks@codethink.co.uk>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Erick Archer
	<erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] RISC-V: Add Zicclsm to cpufeature and hwprobe
Message-ID: <20240614-oyster-ditch-80e8f00fd91b@wendy>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-2-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240613191616.2101821-2-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_010957_808592_404C3757 
X-CRM114-Status: GOOD (  15.32  )
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
Content-Type: multipart/mixed; boundary="===============6054920733224606691=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6054920733224606691==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OQKmvcs8HRT7+PY2"
Content-Disposition: inline

--OQKmvcs8HRT7+PY2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 03:16:10PM -0400, Jesse Taube wrote:
> > Zicclsm Misaligned loads and stores to main memory regions with both
> > the cacheability and coherence PMAs must be supported.
> > Note:
> > This introduces a new extension name for this feature.
> > This requires misaligned support for all regular load and store
> > instructions (including scalar and vector) but not AMOs or other
> > specialized forms of memory access. Even though mandated, misaligned
> > loads and stores might execute extremely slowly. Standard software
> > distributions should assume their existence only for correctness,
> > not for performance.
>=20
> Detecing zicclsm allows the kernel to report if the
> hardware supports misaligned accesses even if support wasn't probed.
>=20
> This is useful for usermode to know if vector misaligned accesses are
> supported.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--OQKmvcs8HRT7+PY2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmv6qwAKCRB4tDGHoIJi
0mzaAP9YBq9BuQ1DEPPsxpTTaIEq91WxQdesurCAlXQCERPNnQEA5hS94j7obJ9J
hv52wvk6In81vYzmCTh9UFDBJVVc9gw=
=TSBq
-----END PGP SIGNATURE-----

--OQKmvcs8HRT7+PY2--


--===============6054920733224606691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6054920733224606691==--

