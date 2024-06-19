Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBD2C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeU/h7U097L6CBkywayeS1GxNpJ641ir4Nq/P64RezU=; b=YiDeua3KwOyWWr95pWkC0/U1sz
	8+cAdZwXiR1PZDqfzN3Uy9HNTw7WG9RwWKsTb7/WGvFc2Pvhw0M5R2jw6Q7xs24NorZMLajb8Wiug
	Kxk936VIOCUEtgVKlE8dU9on7EZKsPZ61DeKcd4NezXBYtyha/PYgzCigNiP6+ccnxkDJ8T+y1qSG
	PWg8+E9F1C4EY/XxexkI47ZJ3Ri+TwMOQwp4S2gkS/Ku2OCU1YIqkXOeXLc/C+/fhBEZzb1B0XRPJ
	i1e6ip5YFPQm7WcTPSYPgV3RIp6Q2E61fO9x7Itwum4lj6/7jNPUuvxRaCtC9iFcnVVivIEp8VWRJ
	GZZL5MZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzAD-00000002EGh-2lKZ;
	Wed, 19 Jun 2024 17:32:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzA9-00000002EFi-3Jhx;
	Wed, 19 Jun 2024 17:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A67361F0C;
	Wed, 19 Jun 2024 17:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C857C32786;
	Wed, 19 Jun 2024 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818320;
	bh=Mw7LIUiugtdZZuHFybQbmbix1eukq5dcFpQhjX9nH/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQM5QXItO5CQmXw6l/M0J8VfPMifngGLU6Fibd7nXVnfDg7dHOK8GjJKktiT2i0mF
	 MNr1+IlItwJJEE6T1SQjTXZEemi048HB/w4osBkDQzU344pOkgttSJeB6uU95qYXxD
	 XGEgNMauemZ6e2UWJkKLRRbV6bRTJWecKsErpQMuSxc+asRAIGVzAVrW8IEOyLQBjC
	 GT+qfR1QPB+BC7cnR0A2ruyJcjcb8klh4v4RDUK9MN7W3GRsYG9M+E5zDJc3FLY9yl
	 tSknn25Bca/Lxf+tI+UEIXICOjg9UdZznuRFPhIWOQv9Ycx4kyWtZavgSHCgoqTDR2
	 ESHshqPBbqdKg==
Date: Wed, 19 Jun 2024 18:31:55 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: riscv: add Zaamo and Zalrsc ISA
 extension description
Message-ID: <20240619-unknowing-matrimony-84e1e16efeef@spud>
References: <20240619153913.867263-1-cleger@rivosinc.com>
 <20240619153913.867263-2-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240619153913.867263-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_103202_174945_F9E133CD 
X-CRM114-Status: UNSURE (   9.01  )
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
Content-Type: multipart/mixed; boundary="===============0260824118778868413=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0260824118778868413==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WElrE+kfa4QQLVIV"
Content-Disposition: inline


--WElrE+kfa4QQLVIV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 05:39:08PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for the Zaamo and Zalrsc ISA extension[1].
>=20
> Link: https://github.com/riscv/riscv-zaamo-zalrsc [1]
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--WElrE+kfa4QQLVIV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMWCwAKCRB4tDGHoIJi
0o10AQD+YJeDB9kDq+cmYMtglAAQi08gU/ZdO6csF0EgoJE9RgEA3vqPEx9kf8/3
FHxUErBZs27ZSQXpY2OxrNHoYQsUrwc=
=d4WG
-----END PGP SIGNATURE-----

--WElrE+kfa4QQLVIV--


--===============0260824118778868413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0260824118778868413==--

