Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1067C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 20:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuQFGYnu2PGaf5yRigPlaQ9GijSq7/I/ao5i5VO7xOw=; b=ZE37JKt27rwaSRMYqSap82cbqx
	XWf2zJRS/4p5N4b20lKBdBQRc7NFEAlRixe8OYdiSKKeEAGD/ddbO7P4PCKXHcKn+KlhbvAZF1xNM
	KF+kUmuKP7egVQAyjzkUnCH0OUcjB856teK+4G5ZlskT8OnEi6AzUscmXf2xRla5lVFcpWz3D5fA5
	gSfLX6Nup1S/izxfFmvLNcy9D5NrG19EPGy6ETPqMsIb2jzs7B6R0Sh9TMs0tlbhxF0XzS6c48+/5
	/jTE2RTAN/7CThnuaO/oYmQIu23l1SELwr/xWsnTbFdI/BKL+bVG0VJX3Ar7YV1NCu7b+FtvAlP45
	u0kQYurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5XCX-00000006QVn-46SN;
	Fri, 10 May 2024 20:50:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5XCU-00000006QTw-0Np5;
	Fri, 10 May 2024 20:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E8B1ECE1ECE;
	Fri, 10 May 2024 20:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF4BC32781;
	Fri, 10 May 2024 20:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715374239;
	bh=+9uY+3QS/KU4LqGvBa9PuWhKX14BfkblrVKzdImHbHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2Rz0POxy4nvsZ9o7IKxVQPe6AU1Y5raSL2PH5Oq3Rmz9k8KRtPC1aeUKTzmOEOmB
	 n71lEqdV6eRXzZanUG2D7rEuULiSpRFrDJ9IO9Vz10Bl16Bfwfq85+pXyM6rMFmlI4
	 +Lhh0FZaryAI5Zv7h6a3CUH7A/zjs8HOEOz89ULFAlJpiSafjizZPyECELU1b07WSD
	 vywqr+1jWnM0GTV1UaDeTW3gA1enGAqHExtiEYv222nusjRmFleW9jG7We53M7KEdE
	 jPbZtVtERRLHwRgUbNclnBiRcRtw07M2GPeESJZlrhzrvk3zn1KHFhgmw34EUO6mby
	 R7ylxUW7WiWbQ==
Date: Fri, 10 May 2024 21:50:32 +0100
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
Message-ID: <20240510-childcare-outlook-d18e3cc5ccb3@spud>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
 <20240507-divisive-swoop-c2737a2d9a9f@spud>
MIME-Version: 1.0
In-Reply-To: <20240507-divisive-swoop-c2737a2d9a9f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_135042_506714_92EED9B8 
X-CRM114-Status: GOOD (  14.07  )
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
Content-Type: multipart/mixed; boundary="===============8728392941061447518=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8728392941061447518==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BHMvR13gFgTG0XBs"
Content-Disposition: inline


--BHMvR13gFgTG0XBs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 06:03:19PM +0100, Conor Dooley wrote:
> On Fri, May 03, 2024 at 11:18:21AM -0700, Charlie Jenkins wrote:
> > All of the supported vendor extensions that have been listed in
> > riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.
> >=20
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>=20
> This seems fine, thanks for updating this interface :)
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Hmm, actually the automation on patchwork is complaining a bunch about
the series, but I think that's mostly false positives except for this
patch. The nommu defconfigs are prob the easiest way to reproduce this:
  /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:41:55: error:=
 'struct riscv_isa_vendor_ext_data_list' has no member named 'vendor_bitmap'
  /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:42:60: error:=
 'struct riscv_isa_vendor_ext_data_list' has no member named 'per_hart_vend=
or_bitmap'; did you mean 'per_hart_isa_bitmap'?
  /build/tmp.QPMRM3oUNu/arch/riscv/kernel/vendor_extensions.c:43:60: error:=
 'struct riscv_isa_vendor_ext_data_list' has no member named 'bitmap_size'

Cheers,
Conor.

--BHMvR13gFgTG0XBs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj6ImAAKCRB4tDGHoIJi
0v5GAQDz/COSUgwYOrRhiE95HyXWBcrE7N78mp8pUkk9m/hrFgEAxmMo1xhXO2iP
tU7a1ZH2VRD826Ot6whFO6eC88ci1wU=
=8S+4
-----END PGP SIGNATURE-----

--BHMvR13gFgTG0XBs--


--===============8728392941061447518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8728392941061447518==--

