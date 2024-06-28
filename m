Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76790C2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AHdJ9G+O04hBNz/PMtosH7gWLOTp2f7yePy/Pa+aiI=; b=Mu4g55DaKXt1VcieJVOJ6Pq6cJ
	Zop8UY5cSFQL16By9LfSXevuFTbhP7gCddhPR4zvOGgyHvnDiPRzGNI9IQZAgUNTFZvQ1yjZDn9KN
	aVDr7Lzz5oCQnJsvEIG2FZzanOnlC/+N7Vg5KzjiUpw7whdijCmb4Fk2Qj/oH3nlOx9rI0Ue03tUg
	PB51v+KKhZ4bwOX1AfoGC5WatJsmtV+RVzAC0jNCVFtzysHOwduEUledK+xuIKq8zzwZzr6XkhPWI
	5DP/C0OpMHTsyPPMOZlt9CCN0nUhs6PGLdPp7RC/VC4K5x8kraSMMkuZ6uFauHsLD5YBEQUgV2JyE
	iyeEwtOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNEKJ-0000000EKtv-3A6l;
	Fri, 28 Jun 2024 16:19:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNEKG-0000000EKtD-1Wov;
	Fri, 28 Jun 2024 16:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AF43621E7;
	Fri, 28 Jun 2024 16:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAF5C116B1;
	Fri, 28 Jun 2024 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719591590;
	bh=LTxkkD/nY6lAd8Hm4iCQkiN/eHwDOA5Fki8VgmfgnRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MX7Mj5hUhLiE91UIq2inljrT60PLH9e8l6QTgC6ZQNvAMBidqlAsUFcUWgh37xNtR
	 hYDylhmsqCO1JbsewHKDHXasQRX+xLjibcRc7V3aV9D/23ehealjzGCzLAVTdkVLs+
	 Qgmr2AIxylzGm8Vnz+W8zUvWobyOtbCGH3ImingcbS9miMBh7ILHe0QHegrE5SlZdD
	 K3KFM2wBj4ib6ehtDKUtfgNuCw2TQRbDywW1I+NIhYzzbYvRBf3Sy7sL8/WaYVsgAD
	 0V9b/A9JonF9gwm94KX6WWQwbU8dIQea/cXq/isAShfpX/FTIhMdkyb4uH/IWyJRZl
	 j1Piq1IPNhbwg==
Date: Fri, 28 Jun 2024 17:19:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	greentime.hu@sifive.com, vincent.chen@sifive.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240628-clamp-vineyard-c7cdd40a6d50@spud>
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
 <20240628093711.11716-3-yongxuan.wang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240628093711.11716-3-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_091952_558412_1DCA572E 
X-CRM114-Status: GOOD (  22.37  )
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
Content-Type: multipart/mixed; boundary="===============3288946943361762716=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3288946943361762716==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zVY6bc51HzyyBUYM"
Content-Disposition: inline


--zVY6bc51HzyyBUYM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 05:37:06PM +0800, Yong-Xuan Wang wrote:
> Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> property.
>=20
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..c3d053ce7783 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -153,6 +153,34 @@ properties:
>              ratified at commit 3f9ed34 ("Add ability to manually trigger
>              workflow. (#2)") of riscv-time-compare.
> =20
> +        - const: svade
> +          description: |
> +            The standard Svade supervisor-level extension for SW-managed=
 PTE A/D
> +            bit updates as ratified in the 20240213 version of the privi=
leged
> +            ISA specification.
> +
> +            Both Svade and Svadu extensions control the hardware behavio=
r when
> +            the PTE A/D bits need to be set. The default behavior for th=
e four
> +            possible combinations of these extensions in the device tree=
 are:
> +            1) Neither Svade nor Svadu present in DT =3D>

>                 It is technically
> +               unknown whether the platform uses Svade or Svadu. Supervi=
sor may
> +               assume Svade to be present and enabled or it can discover=
 based
> +               on mvendorid, marchid, and mimpid.

I would just write "for backwards compatibility, if neither Svade nor
Svadu appear in the devicetree the supervisor may assume Svade to be
present and enabled". If there are systems that this behaviour causes
problems for, we can deal with them iff they appear. I don't think
looking at m*id would be sufficient here anyway, since the firmware can
have an impact. I'd just drop that part entirely.

> +            2) Only Svade present in DT =3D> Supervisor must assume Svad=
e to be
> +               always enabled. (Obvious)

nit: I'd drop the "(Obvious)" comments from here.

Cheers,
Conor.

> +            3) Only Svadu present in DT =3D> Supervisor must assume Svad=
u to be
> +               always enabled. (Obvious)
> +            4) Both Svade and Svadu present in DT =3D> Supervisor must a=
ssume
> +               Svadu turned-off at boot time. To use Svadu, supervisor m=
ust
> +               explicitly enable it using the SBI FWFT extension.
> +
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware u=
pdating
> +            of PTE A/D bits as ratified at commit c1abccf ("Merge pull r=
equest
> +            #25 from ved-rivos/ratified") of riscv-svadu. Please refer t=
o Svade
> +            dt-binding description for more details.
> +
>          - const: svinval
>            description:
>              The standard Svinval supervisor-level extension for fine-gra=
ined
> --=20
> 2.17.1
>=20

--zVY6bc51HzyyBUYM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn7ioQAKCRB4tDGHoIJi
0mVMAQCK/SejlGwyghvHwynQhnjL6X2rPW6tv4CtsmOgM3pYaAD+L/W8OKitFsGd
/L1I8rbFj1EVzu2iWs17GMSaDJIGZgU=
=ykY3
-----END PGP SIGNATURE-----

--zVY6bc51HzyyBUYM--


--===============3288946943361762716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3288946943361762716==--

