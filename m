Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7EFC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y79Y6Lm6hReCnCwQy6Jft+toX59vOwWEmvOF40AT6vQ=; b=01rwAgBh8iWUun5rQ56+g4kF/o
	QWmCKfkCFxWg2hJRRKa7WYQUUiVQxhAGyFF/MbDRzxuKf7wWP7VEC/dDU8HnxecTLn2ixEmg9OHc5
	0dZwen5tFlCix1PuG5IEN6X38QUJ4oRQr7nr5l5LAPhs8bGe5mUE4djhsPOtCmt7SlXwfz+6swUao
	lqN34LY3Vi2b3GmC6X0Igb21ohZahrthAVbcWf1A+4IJDU+f2HJdrskfrEODEUftR9ihygiODFyQ9
	cqomFEycveIFlAZy6Z+4FoMKjJjI00/nFfb/w4X4b7Fe82wPoY6CABtAzSvtHjPBMQCLkou9cwWHq
	SwrhlSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMToW-00000007Efa-1U4T;
	Wed, 26 Jun 2024 14:40:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMToT-00000007Edn-2EPE
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42F1B619B5;
	Wed, 26 Jun 2024 14:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22572C116B1;
	Wed, 26 Jun 2024 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719412796;
	bh=UwgeX3D1QGrQO5sAKbV1ypqL8APwiG1+96Pmy9n5yoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSTSbTwPaG4oTYr+cVBxJqKkOIcA7zIwhIdHHAgKx2zUCxr4PirdTGpRu+wGTRRm6
	 2oLAi2eBUmtcdbPWk+94orDN7peq2isepz1WrKpuTiQab1p0akDkAzG+wEOgaiP9Xy
	 0dDwb6FA3NECV2SGjK9qa67yoLF9WXab8h8rEUv/+qUrn7MHhq/wQAYGtWew/GAdX1
	 LUqLw6devPONfhH7OwDci+STr1azWFgnmqqd7v89BC366WLu+4FRPTO6xTQeqztQWb
	 s7i0bsrydakYQFtTyoP86oTA2/hN7JWmr9vNSPboYzVBFjz7guguK+s8YgfG7Ptt+S
	 aBKlRDoHwEdUQ==
Date: Wed, 26 Jun 2024 15:39:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/8] RISC-V: Replace RISCV_MISALIGNED with
 RISCV_SCALAR_MISALIGNED
Message-ID: <20240626-onscreen-shack-f248a88ee7e4@spud>
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-6-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240625005001.37901-6-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_073957_661241_AE0AAEE3 
X-CRM114-Status: UNSURE (   9.29  )
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
Content-Type: multipart/mixed; boundary="===============1285715257420107281=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1285715257420107281==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TztcxSdZZ9GztBGT"
Content-Disposition: inline


--TztcxSdZZ9GztBGT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 08:49:58PM -0400, Jesse Taube wrote:
> Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED to allow
> for the addition of RISCV_VECTOR_MISALIGNED in a later patch.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--TztcxSdZZ9GztBGT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnwoMwAKCRB4tDGHoIJi
0oa+AQDU+Kf1NECG/0+ci6wOtGzL0lKc1YAIVfGFV5YqJ8fP0gD+OeL/3OlDykVQ
84pJQzBnrYCyh/HpSycgHh5wIR2I0QY=
=eR+u
-----END PGP SIGNATURE-----

--TztcxSdZZ9GztBGT--


--===============1285715257420107281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1285715257420107281==--

