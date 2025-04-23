Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF338C369D3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MSh8aNb9HztBmJ1k/IummpWXB0etgYqo0iq+IGvpzU=; b=D5LdQFFdoGn07Wa7ZTKfcxuyku
	PwaZ3poXWZCn/uogtgtKZuClc4jy2V43kwow9k+FqKi665NvOsu5zN2vJfB+HFUzICxG+HO8sTDAa
	8X8AN/fWCtUSqfuDZjutPdu7plQ7MLjYSpbnzqK+iFFjJGNf2/ln43DVzfzla5ZoK6YQFDTqmSsQm
	vFG8v4qg5HP7//oN4c9a3bpr8N2J/FZJAmAT9s42fE6ReFV+lV4er7jWBZQiY4fSC+U4FzHJorRh+
	MgwaSVw/rU8yOtrAjudnhvqAN3Rj+T/cAltdFqmnBxSL8YALyxCZF+SF+Mnre0ZKxsWwoFQu+wa55
	/SSHZZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e85-0000000BMi0-2wbw;
	Wed, 23 Apr 2025 17:43:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7c11-0000000Ay4A-2EfL
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 15:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55DC7A4BB70;
	Wed, 23 Apr 2025 15:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEF1C4CEE3;
	Wed, 23 Apr 2025 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745422078;
	bh=KY+tkNDWDQZc8s3Rmj/OQu/O+PqFkhqgtS5wh4QnnsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3zXwlaUmJmzED06i0Arh6uR15KC4Rmlp9ZDHW51VPPjYu4t+4jwaqw65GFMq1BtN
	 BGh/lYNWxPIwVKZkIVdetzumhA4yLoRoZrLI313fhOBDW6m8Mu5E37EUaGO8DrtLby
	 Z5/mAiOQQgHeMv4lVH5dVD4oGs+oD9IOLalmou4l4DowFa7j9/n64SRzBInZdSHrKe
	 upNppygtWOMY0hDpi3jEqYbmPIokkY8EavdFSMz7N/PO9IhPO7c223pEesJUxEnqJ3
	 8mTBBAI66I/yIvFaNK39X5v2H+MpPolr1/9URVUI1SC/kceH8hCdJN9aW/X8OCeQrO
	 VYhORklofkxtg==
Date: Wed, 23 Apr 2025 16:27:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: mti,gcru
Message-ID: <20250423-blazer-obtain-ef4a0cd0a23d@spud>
References: <DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
 <DU0PR09MB619646561DF9B4F262F8B2B7F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DU0PR09MB619646561DF9B4F262F8B2B7F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_082759_697529_9C0FF93B 
X-CRM114-Status: GOOD (  18.64  )
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
Content-Type: multipart/mixed; boundary="===============2432070904614094792=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2432070904614094792==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iO+1mqSGaor1E+bf"
Content-Disposition: inline


--iO+1mqSGaor1E+bf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 12:14:26PM +0000, Aleksa Paunovic wrote:
> HTEC Public
>=20
> Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
> platforms. The GCR.U memory region contains shadow copies of the RISC-V
> mtime register and the hrtime Global Configuration Register.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  .../devicetree/bindings/timer/mti,gcru.yaml   | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/mti,gcru.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/timer/mti,gcru.yaml b/Docu=
mentation/devicetree/bindings/timer/mti,gcru.yaml
> new file mode 100644
> index 000000000000..6555dbab402e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/mti,gcru.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/mti,gcru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GCR.U timer device for RISC-V platforms
> +
> +maintainers:
> +  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> +
> +description:
> +  The GCR.U memory region contains memory mapped shadow copies of
> +  mtime and hrtime Global Configuration Registers,
> +  which software can choose to make accessible from user mode.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mti,gcru
> +
> +  required:
> +    - compatible

Why is this select required?
I don't see why it would be since there's not a fallback to a compatble
=66rom some toher binding.

> +
> +properties:
> +  compatible:
> +    const: mti,gcru
> +
> +  reg:
> +    items:
> +      - description: Read-only shadow copy of the RISC-V mtime register.
> +      - description: Read-only shadow copy of the high resolution timer =
register.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gcru: timer@1617F000 {

Drop the "gcru" label from here, there are no users.

> +        compatible =3D "mti,gcru";
> +        reg =3D <0x1617F050 0x8>,
> +              <0x1617F090 0x8>;
> +    };
> --
> 2.34.1

--iO+1mqSGaor1E+bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAkG+QAKCRB4tDGHoIJi
0m/WAQDYPIh35x33CEHzP0x5YIEB2rQl4h95pdgfeAO5nr4vpQEAlP+ccB+DDUpu
svNC2aK4eMOyUOMWxmIQQH4KYNchcwE=
=fPzU
-----END PGP SIGNATURE-----

--iO+1mqSGaor1E+bf--


--===============2432070904614094792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2432070904614094792==--

