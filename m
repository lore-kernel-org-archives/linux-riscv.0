Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EACCD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3tK8itSHdY0SDuSxiGVP0eOeAwmwsXZGJ0dF7lV4wM=; b=KJp3rwGUpp0ljfWKwueZDLpk9U
	3Z6u9x1GhMY4o+MqykANn+K9Jj32hsRXHa4UQ+Q/EqHSCS5m8SjAK/D0CyIAeVYG/G0DyXukELKLr
	X3l8Qlf7CgbloTou+/9KSfPKMXQ1XmMOPCEm/TPzrISxMIF1jfgaOfEG8HVXSvtDPO7NbfhE6DQxP
	VN6p/C7RDHg9cn1UrSYm10+JuMsUjXLDCo1E5+J+JzsYgSoig8WyBPPF36HUByTiWOrdwRa8NxQdz
	1CnkkjU6H9dbGEhUfblyx2XF8SAqsvQcSCYV6iRdV+Q254iUczFkmXpDV35Y/Lm6EgG1hgSTuRC/1
	DUhBPcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoIZ-0000000FVRy-1b93;
	Wed, 03 Jun 2026 16:18:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoIY-0000000FVRs-0POE
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 16:18:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CA24601D8;
	Wed,  3 Jun 2026 16:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6AE1F00893;
	Wed,  3 Jun 2026 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503509;
	bh=0dkSNsGhATHahHOIk343lrdaR3d+vmGuRZtKmmqFoCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T3RU2WWBBp3wx7cySsyMEVkpuLZW1obU14Qhu+YzMQNM9x9IAJw4JXyzEq+SHDCij
	 amqm8vwggC2lPKJoqcFhKbWbpBaBS89u3GZxIzON14pQfK39YD8gQ9SIM7WEXJtYFX
	 rRW781Op3ArOR2TykVBdS0BP+ku6ohz6+cSFnwXjspKFGpn11lhIHwDsphzyicur6X
	 svO+3EH5STJnTE8aoI61IIOgPtA/34/fwoC5Yu92ycy6XICt4tibwO69YGtupRqYyk
	 qr3DYudwGwsHQeo0e8Y36fEs7O5g+mg5sBFweJe/BmMZj72O/n25kvjeoCeQUPEDMY
	 z5vaKPVYZNqNQ==
Date: Wed, 3 Jun 2026 17:18:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Message-ID: <20260603-freeload-mammary-a9ffe25027a5@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-4-joel@jms.id.au>
MIME-Version: 1.0
In-Reply-To: <20260603074222.593243-4-joel@jms.id.au>
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
Content-Type: multipart/mixed; boundary="===============4684812199444397058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4684812199444397058==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IdNJvVaQ8NO6e5lM"
Content-Disposition: inline


--IdNJvVaQ8NO6e5lM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:12:15PM +0930, Joel Stanley wrote:
> Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
> core.
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Same here.
pw-bot: changes-requested

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 5feeb2203050..2a57bd14569e 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -75,6 +75,11 @@ properties:
>                - sifive,x280
>            - const: sifive,rocket0
>            - const: riscv
> +      - items:
> +          - enum:
> +              - tenstorrent,ascalon-xg
> +          - const: tenstorrent,ascalon
> +          - const: riscv
>        - const: riscv    # Simulator only
>      description:
>        Identifies that the hart uses the RISC-V instruction set
> --=20
> 2.47.3
>=20

--IdNJvVaQ8NO6e5lM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBT0AAKCRB4tDGHoIJi
0t2fAP0SOH4/qoVR+yCPstssQkqd3ER8ROudAzs7kQg849IOyQD9Ft3kytAqIQto
X9BuoS8YKaqsNEy6B9lDTjX3yAXq/go=
=GqXK
-----END PGP SIGNATURE-----

--IdNJvVaQ8NO6e5lM--


--===============4684812199444397058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4684812199444397058==--

