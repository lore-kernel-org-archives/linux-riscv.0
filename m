Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120E2CAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 20:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKa0OmbidJmtHCWe/Y6gQ/Ohlb4H0JdPzJDTDlPoQV8=; b=N+u+JenOdZ/YgzAQ06YShYTfmB
	qiqAw74BvGQ+vVtuEoBGcf2dt6ZLWU0UWDPNXeGDLun27lhruXDLNFicCEc4Z9xIg1ryeoseUxOXt
	eCGUSesWxIe44yimb7RLXZyBT2lizvPyj/sLnzMm4G8CwSebd+14AM8WIX6lXsr57D/t8klDBNGEW
	W+SDCMLW9dT9Z3UVnE94qafQ/9MzP2nI2zYPtkTODf2k6KqMSAK84+ESVdVnQ76bA0bl0hKTf0hEG
	7cBGQdQl/9KepYofvbNlz2Ne7FBocumEBCtktTC3i3fD70WiypUjVIoBG4BPfZuusK6Wk0J/ayFB2
	YKwKv8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybqd-00000008uXl-29VG;
	Tue, 16 Sep 2025 20:00:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybqa-00000008uXM-3CVn
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 20:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73CC743E85;
	Tue, 16 Sep 2025 20:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E73C4CEEB;
	Tue, 16 Sep 2025 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758052816;
	bh=l5RcyRudbMnKY2qL2IjniShJoq21cxYpHC73/ta/rIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WiA3Ub8XYcwT1DFXZ/U0zg5fVLhMo7zwb3vorV4CSHFeQkUaVUq0q/CcVo5dbTCRk
	 aPvmEYLA9+g3C/ITecGWf6qg5a8JnZVAk3Qe5uBKQIvTfxwC/4lgnrY2pC6YWbDFK5
	 arFTIMQKar9g7mjl3iQlr2LF3mDLMra3Snc4fUmcG0LunKMwM5V2jviFidtfZpvqrQ
	 w7KXuW/8WmwN7zuWpmN8xPWfrGl0Y5R97VRre8Av68zN8Irn9vejQ51dZ1i1vWPA2T
	 9fqDiTXb0y1BhPfgTm1rp1aAgCixpG7jTm/0U3ApDjycvMMxdO5JvDRFch0alA+nwd
	 TuZEb8t8eLaEA==
Date: Tue, 16 Sep 2025 13:00:14 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Ssqosid extension
 description
Message-ID: <aMnBzqgoUrLMAtxw@x1>
References: <20250915-ssqosid-v6-17-rc5-v2-0-2d4b0254dfd6@kernel.org>
 <20250915-ssqosid-v6-17-rc5-v2-1-2d4b0254dfd6@kernel.org>
 <20250916-landfall-easeful-782b60eb7d69@spud>
 <aMm4n2PlI8JqmK2c@x1>
MIME-Version: 1.0
In-Reply-To: <aMm4n2PlI8JqmK2c@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_130016_849934_AD73D3D6 
X-CRM114-Status: GOOD (  23.63  )
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
Content-Type: multipart/mixed; boundary="===============0430474760625915964=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0430474760625915964==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="10bvof6Yj50fwpad"
Content-Disposition: inline


--10bvof6Yj50fwpad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 12:21:03PM -0700, Drew Fustini wrote:
> On Tue, Sep 16, 2025 at 07:36:01PM +0100, Conor Dooley wrote:
> > On Mon, Sep 15, 2025 at 10:13:41PM -0700, Drew Fustini wrote:
> > > Document the ratified Supervisor-mode Quality of Service ID (Ssqosid)
> > > extension v1.0.
> > >=20
> > > Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index ede6a58ccf5347d92785dc085a011052c1aade14..38e3d8d38cce55022ea70=
eb52423b1163e3cb097 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -165,6 +165,12 @@ properties:
> > >              ratified at commit d70011dde6c2 ("Update to ratified sta=
te")
> > >              of riscv-j-extension.
> > > =20
> > > +        - const: ssqosid
> > > +          description: |
> > > +            The ratified Supervisor-mode Quality of Service ID (Ssqo=
sid)
> > > +            extension v1.0 which adds the Supervisor Resource Manage=
ment
> > > +            Configuration (srmcfg) CSR.
> >=20
> > Please cite when it was added, as is done for other extensions.
>=20
> I had seen the pattern of commit X from Unpriv or Priv spec but I was
> having trouble adapting that for Ssqosid as it has its own v1.0 PDF.
>=20
> However, I now notice 'zacas' seems to have its own spec. Would this
> work for 'ssqosid'?
>=20
>         - const: ssqosid
>           description: |
>             The Ssqosid extension for Quality of Service ID is ratified
> 	      as v1.0 in commit 5059e0ca641c of riscv-ssqosid.

I'll change it to use the kernel style of commit reference:

        - const: ssqosid
          description: |
            The Ssqosid extension for Quality of Service ID is ratified
            as v1.0 in commit 5059e0ca641c  ("Merge pull request #7 from
	    ved-rivos/Ratified") of riscv-ssqosid.

-Drew

--10bvof6Yj50fwpad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaMnBvwAKCRDb7CzD2Six
DGI2AQDqcVG90uwlP30BH0fXNY11iff7sli6pD7f9SZz6jEMrAEA2BRJtcXM8MdC
qHtH4+VmDypq4EK6VlAvtKryUzkWigU=
=euQh
-----END PGP SIGNATURE-----

--10bvof6Yj50fwpad--


--===============0430474760625915964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0430474760625915964==--

