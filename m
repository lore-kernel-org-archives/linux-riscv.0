Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023F1C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 16:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGPmP8A08G8L6B/3vtrusFZQ8POofpfYN6CKB9b4qcY=; b=veDnyuijQu7VJ61C9ma0w3aDIU
	8aVp5ikhF5aSTWpWjM/GYiFhpIUkpFHn8qdxvQwF7RisLjLch+Ua/gwbM9BHKuQTl+rk+H307n3kE
	VRPaQyTUAfQD9r+G4cQnKqWlHnRZsdDf1iufmkWUwXf3OULiSxRKyi+GOcf7gquuBnqH0o8vFDsV4
	i94HhK7Ou/VvTXpUtBoR0h3oU99U6H7gkEr/HX2JsP9nYigdtwxMjsgpCpGXcOw9YCnsEfjr5vcLX
	/ZBgfKTkUXP8nOHYQzqDojJjCpYQpw2AHRiSigtBkNucdk7GzB/L0VtXXx3w2WcT7qLX+g0+Dgjj/
	i0cJsMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s80hZ-00000008Qy7-1L8J;
	Fri, 17 May 2024 16:45:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s80hU-00000008Qv6-49uP;
	Fri, 17 May 2024 16:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9DCBFCE1B50;
	Fri, 17 May 2024 16:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4330C2BD10;
	Fri, 17 May 2024 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715964290;
	bh=QgpU1zoyPrzUzveFTEOAv83qjETN+zMW2porc0qvn8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxOWVUlkeOGUO6nin1HrAxJzDDBkF12l8UCJ/u77wE4lVOQt7hHeEPBvaabU0v/hI
	 Ipa841XmuJndKRJ1cFI2nWuMtLTyl8vxLr4sxizfyRljHV5KT3y1V/JN4GhIJbB2RZ
	 fEkLYIWpf1cvtxUd33HRN+SbD5rPvbn4PpPfHF0x3ZRTSJP6xndv69bXeE4uXG0vJM
	 IOgEICJuvVWtWVm5nLKGzTeZFfTes3KrS7T4rkP9sM/RUDApKMUPM/tpHtyrkCKEy0
	 QbZH7pR8SqHRupdnelhpROsCEWejLnI0PuWt89grFM5rT5fQ0p/SNqme1R32pM3y93
	 zGJFdKHc6uaeQ==
Date: Fri, 17 May 2024 17:44:44 +0100
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
Subject: Re: [PATCH v5 07/16] riscv: add ISA extensions validation callback
Message-ID: <20240517-scrunch-palace-2f83aa8cc3ce@spud>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-8-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240517145302.971019-8-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_094457_432641_AA3380D7 
X-CRM114-Status: GOOD (  15.15  )
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
Content-Type: multipart/mixed; boundary="===============4261414045056047416=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4261414045056047416==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W/IHxON2BVIcsXV6"
Content-Disposition: inline


--W/IHxON2BVIcsXV6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 04:52:47PM +0200, Cl=E9ment L=E9ger wrote:
> Since a few extensions (Zicbom/Zicboz) already needs validation and
> future ones will need it as well (Zc*) add a validate() callback to
> struct riscv_isa_ext_data. This require to rework the way extensions are
> parsed and split it in two phases. First phase is isa string or isa
> extension list parsing and consists in enabling all the extensions in a
> temporary bitmask (source isa) without any validation. The second step
> "resolves" the final isa bitmap, handling potential missing dependencies.
> The mechanism is quite simple and simply validate each extension
> described in the source bitmap before enabling it in the resolved isa
> bitmap. validate() callbacks can return either 0 for success,
> -EPROBEDEFER if extension needs to be validated again at next loop. A
> previous ISA bitmap is kept to avoid looping multiple times if an
> extension dependencies are never satisfied until we reach a stable
> state. In order to avoid any potential infinite looping, allow looping
> a maximum of the number of extension we handle. Zicboz and Zicbom
> extensions are modified to use this validation mechanism.

I wish we weren't doin' it at all, but since we have to, I think what
you've got here is good.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Do you want me to send some patches for the F/V stuff we discussed
previously?

Cheers,
Conor.

--W/IHxON2BVIcsXV6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkeJfAAKCRB4tDGHoIJi
0kl2APwOQPrdeOk2UeAnU791s9RSGh57l/KFZUV8B/odusv3NQD/Umivns2bYz6q
g4XXrW4VGMdCkveeyrvnkMklbwDTswA=
=bE5t
-----END PGP SIGNATURE-----

--W/IHxON2BVIcsXV6--


--===============4261414045056047416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4261414045056047416==--

