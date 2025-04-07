Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABF5C369A2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4lRNT5SsdgRo1ZtNtxDNG5UtFlCkSySJ1yPEFqs0rk=; b=ecs2giiST06BmvJFrd+eVrWkTy
	A6EOOWOee7S/oyjo4mhErJU5BTJ+GVabeF0dYbKZMGuHtRNNzgmHFKLOhVnpBlvgi6yhAn3cpL2ym
	VB2SCj5lWYdOFk6THokDmWL/QqZ+kUAzX7yHNAFszjTL6TpRyrjVXecI7fnEOSF1jNrmXR4Up2Sn+
	VkUoqZF5hOUDOHGIPDcYbREyc+7o35X+j7R1bS8PHL9CgzV9597yzhG9pOHEceM39g5Bl8zHn/BWZ
	x9kjvzLfTvSVQVORVkbdKN7G+gXp/UAfMxgj3VL1sqveS2L5SD7/Zf4HDg0m8gI5IUZNa/27eEy6c
	0NV53NZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lqN-00000000Kjq-31Ad;
	Mon, 07 Apr 2025 12:44:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ldS-00000000FeA-1Ejk
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 12:31:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7AD4AA48965;
	Mon,  7 Apr 2025 12:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C4DC4CEDD;
	Mon,  7 Apr 2025 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744029088;
	bh=mWLxrmUWg2QbduQqGeynDbNIO+EvNnvSdkJRvmJ0LSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/PTyzE6r+rflOEinzc+cMW6/l5y6kQp7OPqVae68mCaiQ7GTyDb4zFGqxCCtqRZO
	 fw/C8hh2QgUFKSMOQ8ohXgqw80kg60aFnnFLFZE+m8+ky7HhqMeVKSRzRWWQCifsyU
	 Jxpc4nhL7K6QJmT3Lf5Hvcv3xbQREuJ9DtXwf0fLhUdPtuHqQaHZxbirTjHu0/yqht
	 P5UzN7Ow+wjCcHsVirpm0CpaLg49nUKa5S33ljVugn50Rpkc/HB9fru2GPZPDr1lwt
	 Lh/xjP0WKNTBqjf8TOIGCHz6ff+MztzPzfvrc0UR/DdLyfQuekYirLw0xobYwDtkAf
	 hGK2L5T4ojH1A==
Date: Mon, 7 Apr 2025 14:31:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, ghost <2990955050@qq.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
Message-ID: <jq55x7uhftvejninh56tzk32jtmmwa5wxzna5uxbkk5woi7zi5@6wrg2ctmyg7b>
References: <20250407072056.8629-1-looong.bin@gmail.com>
 <20250407072056.8629-2-looong.bin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250407072056.8629-2-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_053130_404707_09C64D80 
X-CRM114-Status: GOOD (  11.45  )
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
Content-Type: multipart/mixed; boundary="===============7122621043355093562=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7122621043355093562==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7u4pfjk7u4y7yhpc"
Content-Disposition: inline


--7u4pfjk7u4y7yhpc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
MIME-Version: 1.0

Hello,

On Mon, Apr 07, 2025 at 03:20:38PM +0800, Longbin Li wrote:
> diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml=
 b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> index bbb6326d47d7..e0e91aa237ec 100644
> --- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> @@ -17,7 +17,9 @@ allOf:
>=20
>  properties:
>    compatible:
> -    const: sophgo,sg2042-pwm
> +    enum:
> +      - sophgo,sg2042-pwm
> +      - sophgo,sg2044-pwm

Given that the sg2044 has more registers (to e.g. implement different
polarity), but the sg2042 registers are identical, I wonder if the 2044
device should use:

	compatible =3D "sophgo,sg2044-pwm", "sophgo,sg2042-pwm";

Note, I'm unsure here, only providing input to people who are more
knowledgeable in DT that I am.

Best regards
Uwe

--7u4pfjk7u4y7yhpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfzxZoACgkQj4D7WH0S
/k73JAf/YF3lOc8ZTYHAVl5pC0RWr/ZB8pp9gKCGzYHdGYbogEGAgSewARKopzQ+
ZEPmNeXoVEglTRPxfWXl0aDImSXG/NbOeA449I7kmpecXGHEX/iqwexGYR1kvNxh
Yg8jl+bl2dxh/m+jw/KoCi2rpyq9jverosDJ0r3y/aum7lqd6LB8IPx1zsxcaQN9
xXAuXOE4UnKaUSTZfRBqiwUvY0N62kg4/o/wFERPSdyKS3Tjfb7m8sTVy0rBoGEY
s8SvRNjcapE/sSWqPsREl2XdULCQHlJ6CCMXk10oMisXB65FouAzb80ghiZ8WU+6
0h9ascRYWtiItrTm/D854ODd/FgwmA==
=GmB3
-----END PGP SIGNATURE-----

--7u4pfjk7u4y7yhpc--


--===============7122621043355093562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7122621043355093562==--

