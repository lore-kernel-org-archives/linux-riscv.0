Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D2EC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITCXcZIymMaNMErq4xTLdmSexqkxngDsj21PYWMCuXc=; b=SX2v+dAeepn7ItrcEGBhte9WDP
	lnoBseZ3TceGoR+JVrjsVb8k6BfKrB+YslfbAKkOuS6mTD5jXri4YyfLrlSQsGNeREfm12LQnChvu
	ff+VDk8iu2V3pgZpebCuH0zPp9pC5TAakiE2bwKZ4R9nZ485WGMYuAdsB3UMNjFYzykUgIN5xuKqk
	SuPEjxWnL2fyIInp464GrIyvSXh/gUtGhVrkZMOigqCExdUqZj+OLG/lTBqe9180vCVJvOTeAiSPc
	WEx0fyl6eebGHidVnh63FNVowOvw2Rrg2zW2G1rMWAUzJp+Nw5WTa5EbCzeeQohFagygiTENicsPq
	x+P/pp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lrw-008gVe-1D;
	Wed, 29 Nov 2023 14:48:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lrt-008gUu-2A
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 14:48:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 42AA9B83EC3;
	Wed, 29 Nov 2023 14:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B196DC433C7;
	Wed, 29 Nov 2023 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701269327;
	bh=0+QaGA6PBlnGaUf5ZoWEYbce089KPfDbZK0tj/I7cFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kT2G2Hm8rBBK2fdq61Bkc6ea8uM+C0n3FaCDZbnKVd4J80BT27l4NEw1EfMJLPU7D
	 PD3im0d1vothsZI+2iCr5mMP2NMABsMnuQjqwlXdmQ0hndCVi+AkXn2H2aog3i5aNO
	 qYZYxYf2xEWwzIX6z2zkunD47iP4iWw9RGjQ7L7Bpf7YBz+ssH/SKVyAFc/3C6jrDK
	 Kz7/FtB2kiIAIbfLSKEGeB3pdk0Tm/QfrnoXPYz+kG++6nYvzncdiBxzpQ7n2BdYxd
	 fNVwPcssWP2wiIK1qdaa0cyMOGpik1Pvj5U/2yu+HqIbMBvAEMknd1N0eOMnEXcgqL
	 t/myAVP+nNXfQ==
Date: Wed, 29 Nov 2023 14:48:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: kernel@esmil.dk, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	daniel.lezcano@linaro.org, tglx@linutronix.de, anup@brainfault.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	michal.simek@amd.com, michael.zhu@starfivetech.com,
	drew@beagleboard.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com
Subject: Re: [PATCH v2 4/6] dt-bindings: interrupt-controller: Add StarFive
 JH8100 plic
Message-ID: <20231129-clatter-quarterly-4401934d2b50@spud>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-5-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231129060043.368874-5-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_064849_858273_8A214776 
X-CRM114-Status: UNSURE (   7.52  )
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
Content-Type: multipart/mixed; boundary="===============1123732184600608819=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1123732184600608819==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fypqDAEC7EAThQr9"
Content-Disposition: inline


--fypqDAEC7EAThQr9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 02:00:41PM +0800, Sia Jee Heng wrote:
> Add compatible string for StarFive JH8100 plic.
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--fypqDAEC7EAThQr9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWdPSQAKCRB4tDGHoIJi
0hQDAP961Iv1cU5dwPISI0S3yN45u/dL+hNqlw3EW/MWezvgXwEA6cTCBtuJGKCH
ePXq3ljQb5QkwFLuMvT6evagEHPv4wM=
=e5L3
-----END PGP SIGNATURE-----

--fypqDAEC7EAThQr9--


--===============1123732184600608819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1123732184600608819==--

