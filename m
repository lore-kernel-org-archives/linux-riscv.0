Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5F0CA5FE2
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 05:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80v92fhK74LjxBRUIphuRbCQStl1m/ZxgdHhqC29eWs=; b=DLsTtWIyjP9Eo4dE3EKj5iqW72
	L5ewGuJ4sJXRG4HWV/hKNR/927960aDfwngarEzZvE0/EfCPLT7BrHPjYw4dvHhf90Tg8dIBR1zxx
	wTSg31lLORSVFSyebyF+ZUYJKxElFefAkUlN4PN+HsanY8HISEZDIpuGnNNcJa9VAPspSgwGbyyfU
	gnUhXHuy832TxBEFiMUzcSsGgLyk3tR6odPHO4er5aVVW/QGdgL8S98OEeyjKqPvtlKK+JOsVJRjZ
	oM3jmjMGdTs9LgWVM1A39u/5ZLHZut1pOLFNa7zWDJpcr/6237788iaxpbWaikqFNzMS4X7yIIA+V
	v3sDMeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDbSC-0000000Fhbu-2ja2;
	Mon, 05 Oct 2026 05:41:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDbSB-0000000Fhbo-30wY
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 05:41:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 669096022A;
	Mon,  5 Oct 2026 05:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5637D1F000FF;
	Mon,  5 Oct 2026 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791178894;
	bh=kEvPPDlseXzo0VIEtns5Uo5OEVsIzZ5vK243j+h4K6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jXMeP0jWqoqNrZhtOmvSchDhn3bNHe6vW/ozxHYYcIL5McnHyeVgS7Q95L6P+lEKE
	 1fmOaHh2gm2yH923I7eiWIAjkC8eu05eLFkokl+MZUoigplShMS4YdChUwy9yN+Kgr
	 F4NB7Tdf09vOzpaZgSDgxhpH/34X7zuG6kw0ga2bbbwRs4HAIMrLR/wbTBIfTzjIAu
	 OZ75zMRYuKhWsSjx8fRzNlQyenMiYLe66ADtlq/F66hxqt3/pQXG55E8oIIrB8hErL
	 9l9SEuzyCsvRdzK4gt5qgTyIaoPPmJjbDFmh1Th/DdGGDSW/xWHDb3D485A3m3jdOI
	 q6g47SDuM3kkA==
Date: Sun, 4 Oct 2026 22:41:24 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 4/5] dt-bindings: riscv: Add binding for CBQRI
 controllers
Message-ID: <asM4hITT4dNVIndy@x1gen8.tail89d63.ts.net>
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-4-52fd8be98dcf@kernel.org>
 <20261004-fender-oink-1646de550f3b@spud>
MIME-Version: 1.0
In-Reply-To: <20261004-fender-oink-1646de550f3b@spud>
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
Content-Type: multipart/mixed; boundary="===============6535253108690323001=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6535253108690323001==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="maNOYJSQl7XIC3wz"
Content-Disposition: inline


--maNOYJSQl7XIC3wz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 04, 2026 at 12:05:31AM +0100, Conor Dooley wrote:
> On Sat, Oct 03, 2026 at 12:12:29AM -0700, Drew Fustini wrote:
> > Document the device tree binding for RISC-V CBQRI capacity and bandwidth
> > controllers. Each controller is named by a device-specific compatible
> > followed by the generic compatible. The binding also describes the
> > common riscv,cbqri-rcid and riscv,cbqri-mcid properties, and the
> > optional riscv,cbqri-cache phandle that links a capacity controller to
> > the cache whose capacity it allocates.
> >=20
> > Assisted-by: LLM
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > ---
> >  .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 97 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 98 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml b=
/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
> > new file mode 100644
> > index 000000000000..0924758ebdde
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/riscv/riscv,cbqri.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Capacity and Bandwidth QoS Register Interface (CBQRI) co=
ntroller
> > +
> > +description: |
> > +  The RISC-V CBQRI specification defines capacity-controller and
> > +  bandwidth-controller register blocks that allocate cache capacity an=
d memory
> > +  bandwidth to resource-control IDs (RCIDs) and monitor usage per
> > +  monitoring-counter ID (MCID):
> > +  https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.p=
df
> > +
> > +  Allocation and monitoring share one register block, and a controller=
 may
> > +  implement either or both. A driver discovers which at runtime from t=
he
> > +  capabilities register, so the compatible names only the controller t=
ype. It
> > +  does not distinguish allocation-only, monitoring-only or combined
> > +  controllers, and no property declares monitoring support.
> > +
> > +maintainers:
> > +  - Drew Fustini <fustini@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - tenstorrent,ascalon-shared-cache-controller
> > +          - const: riscv,cbqri-capacity-controller
> > +      - items:
> > +          - {}
> > +          - const: riscv,cbqri-bandwidth-controller
>=20
> I think I lead you up the garden path here actually, it needs to be
> "- not: {}", "- {}" permits anything.

Ah, good point. I will change it to "- not: {}" in the next rev.

Thanks,
Drew

--maNOYJSQl7XIC3wz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCasM4dwAKCRDb7CzD2Six
DHDzAPoDfbP02+kZlbXNjkO9p6YVGEPpNzVD/2lUwGTPtG8jrgEAmupMZOgQVR3D
O+0kZ5PUEUvEiYg7LLv7Xo/SkiA+fAo=
=sKfI
-----END PGP SIGNATURE-----

--maNOYJSQl7XIC3wz--


--===============6535253108690323001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6535253108690323001==--

