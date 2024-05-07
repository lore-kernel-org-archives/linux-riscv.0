Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFB8C25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPAAzSznsp3WZ2KWAAR2CcIDnIOwhtbtEYjrAwuTXBI=; b=WG4VKgWQfHsqDHmWNEYs6BRZHs
	1xjLDI554nExpWwUDin6MJLLs9/zGu9HcrtHVnDVYoWDscrPVLBs0Z9n1haCMTC8tfCtD46A7thDT
	9xpC89Qff0Q5+H+lb2j8sT87vvG6ZdgkrWnryrRobzBHvXtljM5YSpBbNHPmbNp7VYFEPhGvXc1u5
	TCfsA1LearGrcHGVgJ6v2X3ly2LLKxKQVHUGxDHqdxpyJkIXaPXFAnW3hzrPpUP1quEVMWhZPSJL7
	dDteBrwHzjDAWVqmyoS92mdYb1OR/RJmzSRFc29coqAiAcV/acZ6VslRMhKpYtsXHuHYiJhr6yP9o
	anqQ2A4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4OE0-0000000C8SO-3PNr;
	Tue, 07 May 2024 17:03:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ODx-0000000C8Q7-2Xu4;
	Tue, 07 May 2024 17:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63857CE13D9;
	Tue,  7 May 2024 17:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21011C4AF18;
	Tue,  7 May 2024 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715101405;
	bh=ArnZiiYUYEC1mlgNlltHqQrIthtsLHuxUJszJP2E6B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdK4PMDEapvW9NTJXzT+WrquyPt48Xws4KlkNo6FE7oktoOyUznLn8rIfaY6gM5Py
	 Ai35goUtcDFnF1eqKMnmFSxGY1D73HWtQGjNE8sykSzf0CZi28QTnln4GQgINr0NNn
	 MVVU89di3/rcQCu3cNK0iN0vLEvN54C17y6RYuIy06eftd4Pl771u4fatHSH/Scdcl
	 z+F3JNuaby4oqQCcoGC/zcW8bsYatn7vphQQFiGJC9GU7PJN9kjk/4mj1flIUqMZWn
	 5tX8+QDQSmk0TREMTmvmgCun34E0SCm65hXXDVQIn2W/KQeDcpJRUO4mlFGbAt8v63
	 FuDt59RvNRyOw==
Date: Tue, 7 May 2024 18:03:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
Message-ID: <20240507-divisive-swoop-c2737a2d9a9f@spud>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_100329_845647_3A035A16 
X-CRM114-Status: GOOD (  10.32  )
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
Content-Type: multipart/mixed; boundary="===============6697757198966687627=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6697757198966687627==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DjOV1yEKcl4Dfmqk"
Content-Disposition: inline


--DjOV1yEKcl4Dfmqk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2024 at 11:18:21AM -0700, Charlie Jenkins wrote:
> All of the supported vendor extensions that have been listed in
> riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

This seems fine, thanks for updating this interface :)

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--DjOV1yEKcl4Dfmqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjpe1gAKCRB4tDGHoIJi
0gm2AQCLHpjv3WhE7hyAxrtcfZiN9zHtIaysFDZBciMppAkHSwD/YTCG+52INlpy
VoV7MjpQnmLGSVLjs8FDGFXVJUEjfQI=
=g03H
-----END PGP SIGNATURE-----

--DjOV1yEKcl4Dfmqk--


--===============6697757198966687627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6697757198966687627==--

