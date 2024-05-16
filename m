Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01637C25B77
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 16:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EigYoLaujgvufq1rkv1z2ERQruinEEXWun3PUgk6L0o=; b=ohWVxcI75yx83vL9vpslhwrQvD
	+ZB76KDtjpsbHNDYC+LpkvzsRNztAO9/IcTivHqlafHrF2YUG29ZNFm9LrzV6xY+PTx+8sYiFkugj
	xf7e+cPMowq6sf6+JWWFZ3HfvaYkxRscvk/sd3RQHswbMFI1EHCUBNFKieUnbwJwekGcvYw8KzxrU
	vpfJjorvnIiK8jotGgxrNLGtr8vQ1R+LKeLCK+IaZFGF1UD6f0oHqYdC7kUqtBNzk0Ntsb8qSRfZt
	+rLYpsMNXqu6uJjhzCGwbXLeAIE/kPDrb6e6XmMgb3Ffq4+Km54Td+N2oOVoHM5F/0pZQ/+4d2cEd
	mpGGwfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7duI-00000005Vej-0yks;
	Thu, 16 May 2024 16:24:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7duD-00000005VbS-1URi;
	Thu, 16 May 2024 16:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EEA161789;
	Thu, 16 May 2024 16:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F557C113CC;
	Thu, 16 May 2024 16:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715876672;
	bh=YPQd9Pwq5Y5I0Bij2ansbmtYi61hje5cM4D0fSaH4v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckTBUbeU+U4d8pK30I5KoZpbLoTF1F3+e6xfJWjXJ4EJQyFcHH8LKaim31594OV8N
	 mLeuX/YVDzdBjW8zJiShYpRnbVPc9rQznt1jj3VJ7+lyGmQU9EzEUWQp4cCxD2urfV
	 vMlxsjpdY4l9sInSsA0QnW2dCTO258v55LpfqzLuFxP4QXecHPkpPW0MG3lFZ6xH4m
	 UAtqVq37k3D3kP9GRlXGON/IS+3TCIn9S7HqoBAPo44+HK9rT90qyAo6ZIykI2epHX
	 j6l3mUoL4XBcQpMJOXoE9B88N7CTanz7fRCGviNd7CG7INHguA1X2uMTnfFsvvzL24
	 dCPsaC40p8iQg==
Date: Thu, 16 May 2024 17:24:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v6 03/17] riscv: vector: Use vlenb from DT
Message-ID: <20240516-grandkid-monday-86c698ca4aed@spud>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
 <CABgGipXg68VEGt=oZZSENmbqs4-g3PB=CBobNwgqQjLHfxo+VQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipXg68VEGt=oZZSENmbqs4-g3PB=CBobNwgqQjLHfxo+VQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_092433_511406_EA53DAE6 
X-CRM114-Status: GOOD (  19.80  )
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
Content-Type: multipart/mixed; boundary="===============7468170846244040890=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7468170846244040890==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="54mb6NLQMPiDuRTG"
Content-Disposition: inline


--54mb6NLQMPiDuRTG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 10:00:12PM +0800, Andy Chiu wrote:
> On Sat, May 4, 2024 at 2:21=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.=
com> wrote:

> > +               if (elf_hwcap & COMPAT_HWCAP_ISA_V && has_riscv_homogen=
eous_vlenb() < 0) {
> > +                       pr_warn("Unsupported heterogeneous vlen detecte=
d, vector extension disabled.\
> > +                       elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> > +               }
>=20
> We only touch COMPAT_HWCAP_ISA_V and the failed case only turns off the
> rectified V. So here we have nothing to do with the Xtheadvector.

There's nothing t-head related in the tree at this point, so doing
anything with it would cause build issues.

> However, I am still confused because I think Xtheadvector would also
> need to call into this check, so as to setup vlenb.


> Apart from that, it seems like some vendor stating Xtheadvector is
> actually vector-0.7.

The T-Head implementation is 0.7.x, but I am not really sure what you
mean by this comment.

> Please correct me if I speak anything wrong. One
> thing I noticed is that Xtheadvector wouldn't trap on reading
> th.vlenb but vector-0.7 would. If that is the case, should we require
> Xtheadvector to specify `riscv,vlenb` on the device tree?

In the world of Linux, "vector-0.7" isn't a thing. There's only 1.0, and
after this patchset, "xtheadvector". My understanding, from discussion
on earlier versions of this series the trap is actually accessing
th.vlenb register, despite the documentation stating that it is
unprivileged:
https://github.com/T-head-Semi/thead-extension-spec/blob/master/xtheadvecto=
r.adoc
I assume Charlie tried it but was trapping, as v1 had a comment:
+		 * Although xtheadvector states that th.vlenb exists and
+		 * overlaps with the vector 1.0 extension overlaps, an illegal
+		 * instruction is raised if read. These systems all currently
+		 * have a fixed vector length of 128, so hardcode that value.

Cheers,
Conor.

--54mb6NLQMPiDuRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkYzOQAKCRB4tDGHoIJi
0rSDAQDYSejV6VHTrL2jnxNTvkydaJkpuoNoUR0KH7Woyb0A7wEAoRBty/hTiap0
kvVFRs7XwEEn0QBitKVO7a6zx8YNQA4=
=DNuY
-----END PGP SIGNATURE-----

--54mb6NLQMPiDuRTG--


--===============7468170846244040890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7468170846244040890==--

