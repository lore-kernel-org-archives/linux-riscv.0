Return-Path: <SRS0=oZIk=GI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B359FC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 21:25:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38CD92076D
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 21:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38CD92076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KqX+OlMAy3UmWYX/ZKjZ+41jafrEMLsgb5g9DkqzaPM=; b=CEzwzPFiD/OuCSQEJofnAzY9f
	HGHu3MjIpGv2UQbtps8sVaxClcXMzt1OLsolFK9Xrqk/tWKqhYU0sIusw4sgvJPbXl3gIAvWZgXG5
	MSOcANYlJ0SbCfWcW4qr6PbvSRUTXPWZsXWWyIG7MNGs5htwSKvqJWpS9VTpUL6dAnK4E/HFjzpf6
	6aMeINaQd6pnqsyV9B0mKQQZJR+h230pha4PezCStEdmyFl0ioFBKoqbQpHfzyG8O5DejVL5c1iJh
	8DlMqVCEtwRj3+/Q9s0BTDz5qCPJTndtt9E+15kasi7C+QM60se1STBhiQDDPmZoLZd03847N9dpb
	k36i/hHww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwtpp-000229-Cb; Tue, 05 Jan 2021 21:25:45 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwtpm-00021d-6n
 for linux-riscv@lists.infradead.org; Tue, 05 Jan 2021 21:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1609881929;
 bh=G0OVLdbaJsgO8HPhgo/xuHH4VcarVg+GV7RnGJ7YXdM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Bk4UHtUkaNQN8pmEkgqMXvvlLezQM4/a9/y6BmHYL8NQuM8ESeAjvijTwRtNjw7DE
 lcyul/e3QnYqj+wcfGGH3GWJj0HGo/a1WIh/CI/1+M+yYecYLpC1GsWKx2ybTCdyu7
 9UUMpdHbA1zLZGuTW0jPllLuVHOdv5p12ne0rb7Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbRm-1klMik3YaM-00H7Wo; Tue, 05
 Jan 2021 22:25:28 +0100
Date: Tue, 5 Jan 2021 22:25:25 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: conor.dooley@microchip.com
Subject: Re: [PATCH v3 4/5] dt-bindings: add bindings for polarfire soc
 system controller
Message-ID: <X/TZRXPQv0wXvT+0@latitude>
References: <20201223163247.28923-1-conor.dooley@microchip.com>
 <20201223163316.29186-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20201223163316.29186-1-conor.dooley@microchip.com>
X-Provags-ID: V03:K1:Gf17oAsiy5iz7mpMhRYz4egNe5BoH7WNT/wUW88YtCqDXne5g+C
 e2uaohiym9EwmEtwsMV2r2FkbRo8kvy+9YvPbO74LgZoX6VlHOczciuwcqPr5bJqZGEpKgQ
 lXbNdzOCwN+tT3UVQm5dOIsVD8oLKPGxVJRKtBbw5qXhqDXYAlnPafZUgiRxQW3NUjRv1pK
 9iS9vTqNZ/h9MTKIsLCKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k1IA2ttbA+I=:Nzv6Ro/7yo7NnjwXZwfMM/
 CctYuJ+TcwhItd0GMsOBXv7X6SPHbY+raN4/J83K2RV8uFUyr+LMkfrpJxUstl61JDnXOq+P4
 oa0mRTQt5T5nUqhmIPsAAfvmUCDknPWxMxageQ6bkxeQPpbW1LS9GC++tTRR/YRoOnDdmvvxP
 M/XPnwo/HSCAz6eN57aGLgcpgjAkm+r/UHsy4A6BfHIjDbE/A9cSJZgIJvkBYGSwCA9b3Sba7
 uYVgYU1SYH7y5FX8Z4/zI2hPt0xmKHgpvyqwBqAc2Qm/4n0TN8IW/QhnH5oKUSKahOWcOgb8Y
 wV6eEnHaXbAU5f93jdvaVWXqzFsPj6s3Cub8jdtPGFLfrMpX7hYYFrcaOfcthLtxik18tQL2u
 ISY3GN7Grnv4VF0x3Ul98kL1abnod2X5fq9a/XHG941k1b7D8X88x9CH74qy4n4rqsS7B+FGS
 4PsMU7ZAR0eUTA6IRpD8HdraEbBQfio9eT/Jw64DuRpM2v9F5Zk8RRXX6vQFvF0ZRv3vb+QfH
 RarMais8KR6GgSXq7qxJM5zGv0QMz6GbA9RXG1V2IRxAkdhSSY2dTazLttQpZdWRZhwRkjm00
 Pb57d+hK3Udq2wKxgkuQKdtn4fm0m+uxObHM2+uHxN219Xl5YhiHxINZWn5TPgo+qyQ7ZZhPU
 TYnNnMO+MvezBP0HHyTILOei+E0Nq4gJqORbENQ2ssNvrUPeFZ5mFYWlUMTvohmj9a/gRmaJw
 26DJNb/rKncJL0q44zfLdSC6KIBES5huHTMn4w7816LWZS9f8WeUAn+h3THVDc+jzhQsbpt0l
 tB3ZUGER19700IONLAuQ+QP1XbcrrdRJ1UTsgmaaMEz9sOk0PsWfi+knyvJdDZLlxUMyfALmw
 txbgTSeI9dWou15a5b+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_162542_486910_6BF717D9 
X-CRM114-Status: GOOD (  15.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 lewis.hanly@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, jassisinghbrar@gmail.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, anup.patel@wdc.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, cyril.jean@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3977222611519892631=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3977222611519892631==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FMJAI3Xpdhqt2MKs"
Content-Disposition: inline


--FMJAI3Xpdhqt2MKs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 23, 2020 at 04:33:16PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Add device tree bindings for the MSS system controller on
> the Microchip PolarFire SoC.

"MSS" doesn't appear below, so perhaps an expansion in parentheses would
be nice, e.g.: "MSS (microprocessor subsystem)"

>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs_sys_controller.yaml        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/micro=
chip,mpfs_sys_controller.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mp=
fs_sys_controller.yaml b/Documentation/devicetree/bindings/soc/microchip/mi=
crochip,mpfs_sys_controller.yaml
> new file mode 100644
> index 000000000000..60fde1925910
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_=
controller.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs_sys_con=
troller.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip PolarFire SoC (MPFS) system controller
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,polarfire-soc-sys-controller

The file name and compatible string are inconsistent in phrasing
(mpfs- vs. polarfire-soc-). If possible, please align them.

> +
> +  mboxes:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    description: |
> +      phandle and index of the mailbox controller device node.
> +      See: ../mailbox/mailbox.txt for more information.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - "mboxes"

Quotation marks are unnecessary here, because there are no special
characters in "mboxes".

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscontroller: syscontroller {
> +      compatible =3D "microchip,polarfire-soc-sys-controller";
> +      mboxes =3D <&mbox 0>;
> +    };
> --=20


Best regards,
Jonathan Neusch=C3=A4fer

--FMJAI3Xpdhqt2MKs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/02T0ACgkQCDBEmo7z
X9sWYQ/7Bwcca3EgLofiNd2r0011OLx1t8Jw8k38CkgtkY4Gu/0aAWbNK1ZiGncW
Uf2sqJw9jU/pqHMhPBbq3WhBMxIZ8mJRLNxaDkcywMCjLlaV3UsSh4J7iU70Odo3
JgLdybDMOdVZRX8e/k0LjZ6evJSGkgwKQuRqgqWc6N30zRBeINo2DTzYYgLY9j9d
QZY/679R0Olf2V4LgHkYRsvElxYOgj0HIqFtVB0yADv0MdxGpdIJzpjDCwfL6POy
356gORm8um+fywEBCZ1h3TKD6adfulFMdTVAAsky+Py1px8eFyPvbD5ln1a5+q1U
kyQgvJ5ZQqZ2y13+3emdUZJslZSSxaqfKvqzESorrii1cfvMLmoArtBf4hJ+OHNb
QVUT+9Y9IEEEEDVa3asjppkB64RxENNBVvjQfjAuN9gHE6ZMElAFrhNG/mWZiwI5
hLpRN8iy80bOKT1RrreMSdoIT2spFQNY2HZGXAJtJNAEyIcjl3W7ZASJuRyr1Xxo
95EF4WV8MQzNUNoz3aoyAa3oMcpe44xY3T9ac6gVeD3iYL3KoA49lC2f0EWpp2gt
SkSrKRmXqjBNx2cvgsMEFuWUuAPw/VeR7lpBeiRN5KM6DOzn0hMxYBIy0gK8e5dq
BMlWjrdiPcDhcvucwnf1CyLfwjoihMimxblN0bLqSkbR80O/+nY=
=vass
-----END PGP SIGNATURE-----

--FMJAI3Xpdhqt2MKs--


--===============3977222611519892631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3977222611519892631==--

