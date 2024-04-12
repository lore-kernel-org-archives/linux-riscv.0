Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10692C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 23:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CnKAFZO1PnqVdsVvZRjXe1VkTFF36C1m7xpMIL8+3s=; b=X26SEm2xypH9jZ283g6AkzWgpl
	bOAXGlGTo9ghRNXt2WjciCm3kP27yLCn4M1cRfFd0YSBCrzasqDstbh4WWvXElJvP5dbiOfp3kBRa
	G5eAhjFWxLbx5toVt5Mi7zR7ZxDqyfelh8Zj739GCep9Qfk7euaUGYFtNJI1bCzcT8GQs9PgXYkfn
	P/86c4kaTlTRNIqB96tIOpQC1S2mE/UNu1IYY1Cspe+M0atfEKI1J57VRL83n3ZAcNq+QEpZs3E8j
	mq9b5T1HMamHA3p1mdLKTdoOBBpnx7Cfqlem1nOdc96qCiiHiah+TzqZEkJBSLPYGDYU5yjSKri4S
	CEw0hQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvQVZ-00000001hE5-27eF;
	Fri, 12 Apr 2024 23:40:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvQVV-00000001hCw-2QLE;
	Fri, 12 Apr 2024 23:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAC5A618DC;
	Fri, 12 Apr 2024 23:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDC9C113CC;
	Fri, 12 Apr 2024 23:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712965232;
	bh=9fTY4WZx/alT8Sa+UXHnrqhnRrKl/iF6TU4j2OrIj/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPXBUvTSeM9fF+xXpA07Gpnzgo9A4roMQAV8BMU8Tsh9iCbQaED1Slw64mRvBxR+l
	 xpT/q0xlzSKtEP7HbPN96NZ3fSnEHd6VmNwbNSSTBjT1QsvogDycYZNb5G8ytc9y3Z
	 l63WmrYLwUYiRLttqEDcTiRZKaQJS+5b8J59T+FLhWOZ5ajzoO7HjID3hecqtoSZ73
	 8rWb3Byn3SqU8X0Mg3+d4S7Ugxc4cnRJtRDPzTk2wUey0Iob5bmb0ek6FurxeJggvg
	 du6yiPVNMMZwsya5CHQHtdtjM8X0fY/3Hn+Hf1/ZB+wOxZpIaMyUvwXxHbQCo5vnML
	 NXNVXjT7x52IA==
Date: Sat, 13 Apr 2024 00:40:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240413-sharper-unlivable-5a65660b19e2@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <ZhlrdGXfSushUNTp@ghost>
 <20240412-eastcoast-disparity-9c9e7d178df5@spud>
 <ZhmeLoPS+tsfqv1T@ghost>
 <20240412-chemist-haunt-0a30a8f280ca@spud>
 <ZhmoPuoR00aS6qZp@ghost>
MIME-Version: 1.0
In-Reply-To: <ZhmoPuoR00aS6qZp@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_164033_876649_CDEC7E94 
X-CRM114-Status: GOOD (  29.27  )
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
Content-Type: multipart/mixed; boundary="===============5035367112121740818=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5035367112121740818==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fiOPUQP1XJPUpApw"
Content-Disposition: inline


--fiOPUQP1XJPUpApw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 02:31:42PM -0700, Charlie Jenkins wrote:
> On Fri, Apr 12, 2024 at 10:27:47PM +0100, Conor Dooley wrote:
> > On Fri, Apr 12, 2024 at 01:48:46PM -0700, Charlie Jenkins wrote:
> > > On Fri, Apr 12, 2024 at 07:47:48PM +0100, Conor Dooley wrote:
> > > > On Fri, Apr 12, 2024 at 10:12:20AM -0700, Charlie Jenkins wrote:

> > > > > This is already falling back on the boot CPU, but that is not a s=
olution
> > > > > that scales. Even though all systems currently have homogenous
> > > > > marchid/mvendorid I am hesitant to assert that all systems are
> > > > > homogenous without providing an option to override this.
> > > >=20
> > > > There are already is an option. Use the non-deprecated property in =
your
> > > > new system for describing what extesions you support. We don't need=
 to
> > > > add any more properties (for now at least).
> > >=20
> > > The issue is that it is not possible to know which vendor extensions =
are
> > > associated with a vendor. That requires a global namespace where each
> > > extension can be looked up in a table. I have opted to have a
> > > vendor-specific namespace so that vendors don't have to worry about
> > > stepping on other vendor's toes (or the other way around). In order to
> > > support that, the vendorid of the hart needs to be known prior.
> >=20
> > Nah, I think you're mixing up something like hwprobe and having
> > namespaces there with needing namespacing on the devicetree probing side
> > too. You don't need any vendor namespacing, it's perfectly fine (IMO)
> > for a vendor to implement someone else's extension and I think we should
> > allow probing any vendors extension on any CPU.
>=20
> I am not mixing it up. Sure a vendor can implement somebody else's
> extension, they just need to add it to their namespace too.

I didn't mean that you were mixing up how your implementation worked, my
point was that you're mixing up the hwprobe stuff which may need
namespacing for $a{b,p}i_reason and probing from DT which does not.
I don't think that the kernel should need to be changed at all if
someone shows up and implements another vendor's extension - we already
have far too many kernel changes required to display support for
extensions and I don't welcome potential for more.

Another thing I just thought of was systems where the SoC vendor
implements some extension that gets communicated in the ISA string but
is not the vendor in mvendorid in their various CPUs. I wouldn't want to
see several different entries in structs (or several different hwprobe
keys, but that's another story) for this situation because you're only
allowing probing what's in the struct matching the vendorid.

--fiOPUQP1XJPUpApw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhnGaQAKCRB4tDGHoIJi
0sbXAQDqwcw8csQEWGYwvW1DEpXXN05Grqo2xpuKvGADPYkWUgEAtM5EfnQLdtX7
xI9bLNJaIswXp9N/DvHPHd37C0Uo1wY=
=7ovm
-----END PGP SIGNATURE-----

--fiOPUQP1XJPUpApw--


--===============5035367112121740818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5035367112121740818==--

