Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825DEC28B2F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvPv/lY1BH4OODM1uTR6TEqpJUmc+BZZsEo8Hz76lT4=; b=iEIPN9w+WpOWE2oGYUST+nEMrI
	pcVYiD9f9NFZv93vTPz0y9KJFH2Fe5aVzFZwf0TS37+2xHW5HSIz22Q2T0QFhcX632rq0JhK50L0/
	1qqySYutt7g69TgC6RiscakXIpteI0uae/ZZB7oMkXomWDYSJocFNe0kbmooqhU76AA6lFtKll/FH
	z+CwnJLNLIH4MS0FKsJlDQu1MpFlSumRDXwLyh3rvK55/MZxq6kaGv2vtDXjZ4NDLV34datX4DYzo
	LISYR4WjlfNdcgu94dMt/UepalvwRvcgXDiXDYOkE8oDs9OHymx8eAYJhFi9JNMYwemvWxzZZBf7y
	SeI2HH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4QE-00000006dYf-1yMU;
	Tue, 11 Mar 2025 18:33:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts45X-00000006a5j-2jR1
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 18:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E7305C4D92;
	Tue, 11 Mar 2025 18:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A918C4CEE9;
	Tue, 11 Mar 2025 18:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716742;
	bh=3H5O6bWO/yhhqtga12cTBlakPqsT0CqcPydgL8g9Xeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8gOrxnvhqd7g5q2G+7udUnkNP0oImP6iG9oOu18TP8KImBZJdYGGeBqtmyA94Pok
	 bdYtg4YhaB1dVfdGzpCs2FFVOPt4t6lG8ycFg4b6Q/wEA1PQeh7I0uj4ZfvrvtYbDK
	 LhuZYHMcJwVz5wPNkw/ImDq+1pqKFEnuaDud+Oxp6lIuaPhthxvdcUxWMvmWYiEZou
	 zMqT/8YOo0l2bqYYttA4hGhcPki4Gwn4uvItSVu2NrnMKO+nPmKPJg/gaw147eTTW/
	 +ihLgsw3X2OLZ2Aq84/Qyp0gsqwoBApxwNWCO1geeSkQQgUIatLWmvKelcW4UXQzOX
	 q//kQsiKQnnFw==
Date: Tue, 11 Mar 2025 18:12:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] dt-bindings: interrupt-controller: Add ESWIN
 EIC7700 PLIC
Message-ID: <20250311-stitch-revisit-9f24ef006dca@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-8-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20250311073432.4068512-8-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111223_812035_0561610E 
X-CRM114-Status: GOOD (  11.96  )
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
Content-Type: multipart/mixed; boundary="===============6885599018314322818=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6885599018314322818==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YTSoY6KxqwAVELjH"
Content-Disposition: inline


--YTSoY6KxqwAVELjH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 01:04:29PM +0530, Pinkesh Vaghela wrote:
> From: Darshan Prajapati <darshan.prajapati@einfochips.com>
>=20
> Add compatible string for ESWIN EIC7700 PLIC.
>=20
> Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index 3dfe425909d1..ea7093fde060 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -58,6 +58,7 @@ properties:
>        - items:
>            - enum:
>                - canaan,k210-plic
> +              - eswin,eic7700-plic
>                - sifive,fu540-c000-plic
>                - spacemit,k1-plic
>                - starfive,jh7100-plic
> --=20
> 2.25.1
>=20

--YTSoY6KxqwAVELjH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9B8/wAKCRB4tDGHoIJi
0p6EAQDifbJmeyNsMj+bYCpjnv1K/o1pQIdyzSatN7nK3XfckQEAqy0UUe1dgpw9
HgV3/eXX2X+SVhYeCCMy5KEoMW8lWQg=
=dAbH
-----END PGP SIGNATURE-----

--YTSoY6KxqwAVELjH--


--===============6885599018314322818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6885599018314322818==--

