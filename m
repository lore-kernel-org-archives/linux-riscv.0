Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC3C7114C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGVVmc5MKOHjtcX+tj3kpQiF/l3+7lbDnGQXSx3p0pM=; b=C5cRehPf1cXf+e7RI/qdvLCN61
	hzl4lm7h6w1ReUiUwT/6xVqA3CA9k74CXLEmSPFQ8C/9RVLKljnPBAmSVZ6QaeunFUPMtdzHLGxRR
	EGNL5e01L3EfLZoMVsMr/anWXt3y/u3VwlaMEf0CoT//+1ZHU1vcUAtbMeJejLnHirdPWUFG6apzW
	WbVhb2TxxiAJW8/xt5ailaVat9K7b4Eo/1bA8b/pnl1cR6xz9TPPraD9/r3pXpsht0luBmxHE2Oah
	aKX2aimKkA7LGp4cLi0JQSSB5TfYgtTqsPS2v95WjvjV1ji+RK+OacXpm9LbfIDwPgdPIxK88MrCt
	6e1UbPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7A-0000000EjTl-3ShP;
	Thu, 12 Jun 2025 22:09:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjy0-0000000Do96-0T95
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 15:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEBA74A16D;
	Thu, 12 Jun 2025 15:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2588EC4CEEA;
	Thu, 12 Jun 2025 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742547;
	bh=Ss4ahYRx/y3pjwhd7QqlDK8uOFCu1jOBr4RPH/Ks9bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auLrsJ/6G8/Nk8NFr4MskwcvM4uw4NObh3me2bKXsGlCE/GgINLIKEF00tdXKPUVB
	 pRQiVQFnzPl1vUEnTcGP2+vnUDPGIs8+YdOduzrw6hjkiy+R9/p5Ne8jDIXxbggupA
	 a7Rh6ZfP9wsYptqrYGlAzeYshwm4qkEM+NgAbI+Hybe6HrG/jmYqQalFfJaTI6urnZ
	 jqkff3rGnxDBUmgcYqvl7JyPZscCfAIPrQZ9B71mwDY7S0/bdNdSn94FmRkXrivB4e
	 S5F4eDy2/qSR/o0GPYpkq7JU4c0MwhUTVhiPh8Db9fb310HtxM24ewwB7CQCCISp+A
	 V2uBjTwq0HlKg==
Date: Thu, 12 Jun 2025 16:35:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: interrupt-controller: add MIPS P8700
 aclint-sswi
Message-ID: <20250612-wildfire-ambiance-b4acbe3fff31@spud>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-4-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
In-Reply-To: <20250612143911.3224046-4-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_083548_166258_5A8DC8B9 
X-CRM114-Status: UNSURE (   9.17  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Anup Patel <anup@brainfault.org>, Chen Wang <unicorn_wang@outlook.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Ryo Takakura <takakura@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Content-Type: multipart/mixed; boundary="===============2757690437327703729=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2757690437327703729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="68if0ZfXqCRI0GCb"
Content-Disposition: inline


--68if0ZfXqCRI0GCb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 05:39:07PM +0300, Vladimir Kondratiev wrote:
> Add ACLINT-SSWI variant for the MIPS P8700. This CPU has
> SSWI device compliant with the RISC-V draft spec (see [1])
> CPU indexes on this platform are not contiguous, instead
> it uses bit-fields to encode hart,core,cluster numbers, thus
> property "riscv,hart-indexes" is mandatory
>=20
> Link: https://github.com/riscvarchive/riscv-aclint [1]
>=20
^ this blank line shouldn't be here fwiw.

> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--68if0ZfXqCRI0GCb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaErzzgAKCRB4tDGHoIJi
0qQtAP96mQXSweUBXZh9o3rMkqZLrg/kAmO+xkB2lY/aAdpU9QD9E5LQRDJdi1Jq
Grs4zFK0xB6PMdtGGbxpWhfpr/KbfA4=
=We6+
-----END PGP SIGNATURE-----

--68if0ZfXqCRI0GCb--


--===============2757690437327703729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2757690437327703729==--

