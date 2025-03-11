Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD69C2BA1B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcgdfl3x43+Iwy9N28PyoeHuJ5BoiAPIM02TJmL6fYs=; b=R+yT7qkh4QNrknDcisCmlv7ww1
	4AzLzDx4JFjbDR3OvBGcrffexky/6Y8INpgP6NMmR2/+FcupcKJdO9z9FOuOFwlZZ3E68YnRx+on+
	wbMQl20HHvsY6A6lSGu1Wz+otRjyU9a9L9McVH+ROOXkGukEso8V7qrSjrAJ5l/JSgdNXiP+khQYv
	HnOI55+n5an8QmGddzWszeVG87fhl6m4mQ1o5Nb9WFkivlvVxOhSq5YrtrmIiN4qQbnOaZJfrgQdX
	Vg1kJDEnQ6dhGXh3p+xzxlMU7nH0jTh+wtRWKSRBYq9apRHKAn7aE0jdX7jPoK4O4dyjbXSIaXGEQ
	R8FF4xIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4QF-00000006dZI-0O6v;
	Tue, 11 Mar 2025 18:33:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts45t-00000006aCA-3J32
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 18:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF9F6A4611F;
	Tue, 11 Mar 2025 18:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DE6C4CEE9;
	Tue, 11 Mar 2025 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716764;
	bh=wPq2NGfQNN84hMUqF0se/g6r/peCVY5UmFIk+kncgPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7zWJ2uejTexWUdWX9K8TlIX+/aRCbORV6/OlKII+cI5KcahRs17fY0VTzA7dGTUy
	 rHLmM/yMkRLNtJRH/MJiDCpd76w7Iivv3UO206j8DvgHRQ1xz+Wn6y4OEEvighIFCn
	 C/1zt0LYTuouMqwhVISC+UB7akU0UzjSx9NbzB1oILXD/dbEOyiqsa2HNQrna6I1tY
	 g9hil6+KL2MoAQrrwQiVizXwh2Wp4387MJgac9XozBkK/E7VT6uBsFB4fx6l9MQgGf
	 VWzJuPHW6jzsG9kj8cp/lskJLYbV9uZGTbp1swp5ceAmE7EG5520JUw5V3ELlx5Zbc
	 KD74n0F2J1n9A==
Date: Tue, 11 Mar 2025 18:12:38 +0000
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
Subject: Re: [PATCH 08/10] dt-bindings: timer: Add ESWIN EIC7700 CLINT
Message-ID: <20250311-clock-yearbook-d27a09466dfd@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-9-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20250311073432.4068512-9-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111245_890733_4802994D 
X-CRM114-Status: UNSURE (   7.68  )
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
Content-Type: multipart/mixed; boundary="===============2859734124181993106=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2859734124181993106==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yryHYQAuCVvglLLR"
Content-Disposition: inline


--yryHYQAuCVvglLLR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 01:04:30PM +0530, Pinkesh Vaghela wrote:
> From: Darshan Prajapati <darshan.prajapati@einfochips.com>
>=20
> Add compatible string for ESWIN EIC7700 CLINT.
>=20
> Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--yryHYQAuCVvglLLR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9B9FQAKCRB4tDGHoIJi
0i0mAP9FcNgiTxknoxVyenYfVlubklsRHYU0VEz0MaqFMjHLWQEAq0zSSzCax/al
dNyPFjnFMEb/jMbSfPJrc2hnYUM16gU=
=6RSo
-----END PGP SIGNATURE-----

--yryHYQAuCVvglLLR--


--===============2859734124181993106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2859734124181993106==--

