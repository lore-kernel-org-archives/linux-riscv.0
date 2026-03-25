Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D98E109C040
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 18:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiUsm2Qn1Gemne5OIMCqW/jwfJs/1tjVmqaulYb0BbE=; b=Fy4bfHpqCtTrIVTCWdqIDALCEf
	FT4AiWg8mW5nFdsMCVYBus41Lg+zQYIj7N3vz9AWp2c0Z3ArG/yuMjPZbpDHsMKARlfVIj/oQr7ys
	RlQuNgJjVwJ3dakVUqartqtBJQCaMU+p0MEvHrir8l5hiuIKbQqjnstQFOgOndhXSe50aBgSoJo8k
	f74WMqWfSqvKKllbfbCMet/cuH3I/yO6UZgEnodrhuOBL0nf79PybEM0LGfRj8dZu1SWRVDCO8YDx
	VPcWjVOu+BmPiA+fQgt5b32Qd4z0gQrLpNpzEmsNGWKAQZ8KyqgWNE4SYQFfwD6lKT5uNthfLfafj
	1nZ+iZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Smx-000000043ud-2IOc;
	Wed, 25 Mar 2026 18:17:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Smv-000000043tq-15ME
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 18:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B986437C1;
	Wed, 25 Mar 2026 18:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B263FC19423;
	Wed, 25 Mar 2026 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462624;
	bh=dN1owC4wQeRllfjoQmd/3Y8PsVaW/qeYmie9bwIKyis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rNeKzCkzgWPO4uXanrCyZnmi0efPD0jFWWckAHuAqn3Oek4c0ntR5OimoBj293tJj
	 PqA2p7jbFFR2f9tUi8UmiG511QiGEzh03CsjpgR3pKf2cEb5N30DGvwocExgMqJFjG
	 6mcP2uBMsU5Ue/HN/mCpdJJU13D8aSl6NKt3EQfN6uALqP8QSBduTf7tVRdAilopow
	 vifvhVo9PjbA7W3aYMqeSIWmX9+x2DMwhwRSC5NwVVGB/IP3TPeUMwXonUXbV4ssZH
	 UXwslDJo/r690AUno7HxBSJuqnUzPkFn3j9KNCSE+QGeXqRX5se0ttrsfjsZpjh3Zz
	 yKxKvcOzFyHLQ==
Date: Wed, 25 Mar 2026 18:16:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
Message-ID: <20260325-entering-grandpa-7bf99307a74c@spud>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_111705_320687_A911A057 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4529599811257946487=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4529599811257946487==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FMGqwg53RZq43Ijf"
Content-Disposition: inline


--FMGqwg53RZq43Ijf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 09:49:24AM +0000, Yixun Lan wrote:
> Add a compatible string for the I2C controller found in SpacemiT K3 SoC
> which use same I2C IP as K1, so make it fallback to K1 compatible.
>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FMGqwg53RZq43Ijf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQmmwAKCRB4tDGHoIJi
0iyeAP4ryfPudFLay6Bnhb2ABJb+xaEVUmItrsc0JPNDccLSsQEAplVuih6J45RG
9z+9Upz415mnSSZhBSHkRcjbrT7oeQs=
=kZAL
-----END PGP SIGNATURE-----

--FMGqwg53RZq43Ijf--


--===============4529599811257946487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4529599811257946487==--

