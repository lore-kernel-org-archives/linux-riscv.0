Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3A6C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/2CDnXYgma8CMM0dJq5Mg+om4LNi2LWV0XQE5AXaN4=; b=yaDCUUxp1zDPxcrS68yduRjHWu
	K+9v+bJHNwtwygVUBC49hy4nG+wKmpAlxon/svpv3pd+7jHpsIiGG2eZk7c3GQCaz56N2eLV4doBW
	8JNGcrPGG3UjmqI2Dyv4q9FcXXE/RsjJz0MqnU+e58kUnpTPUbmPOFQLo6D2CIx8mfoE9ziZy9Lmb
	svR5ErrqQ2kizjR+ZRfTr6QT4TZW3F2P7inNzgKfDU0PATMzWx/O/0hBVR45Y07P3hbFN9bDAenXx
	HDWVzTuQUA3GzBQkvMQ36axogAQiCmPbWSmACgP24SL3R1j64hDM5Q6LsZxrVvt/yDp4NRgGgS5XB
	+o7Y6c0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSeR-00000008K8D-10Y6;
	Mon, 26 May 2025 07:53:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSdw-00000008K2V-1cj1
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 07:53:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7528B61126;
	Mon, 26 May 2025 07:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1D8C4CEE7;
	Mon, 26 May 2025 07:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748245987;
	bh=BbYGMsfcLHp+/GVsG438+tTvy3Zkb+vofZ3c+RLfKYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzTJvrdCv3nCLYhYIyEeMGq+fLpz1CGeMaWzTofOe+2rmzvRlodufbGuN+/2f/w4G
	 KBXhQ55ORwcVVU92jYoabGLkCqfcCbu/Gz64FYjnA3kC4n2lXAUvePfc2IaRHyla4G
	 Ns+hSFLf2rSCV8sINX63yJrk1TRm8jqBh5E0hcb4anV7JnDZgm9Gvrq+OYFzNQbVg6
	 pLWkpdIOjUZoamrP4CODlUBJHpD8owQmUlbsTAhXZX78ufwuuEYqQH8JvPFkC41PqF
	 yws+zgWoe3a3BUJlJI8MCWycG58EOYJDeLk1DiLLNyvalOc7drqO6BbjLwasHGacyy
	 4bq16Cx6N3Y1Q==
Date: Mon, 26 May 2025 09:53:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/6] rust: Add basic PWM abstractions
Message-ID: <enxctdseecqz765nmd24vziiaksmyhltqfwycdszmfq3s7orjm@lnpc7czuluis>
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211520eucas1p1378fbab27f4b1ae8808706c074fa217c@eucas1p1.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-1-bdd2d5094ff7@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20250524-rust-next-pwm-working-fan-for-sending-v1-1-bdd2d5094ff7@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============7954345013916979828=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7954345013916979828==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojsy757ta3qba3or"
Content-Disposition: inline


--ojsy757ta3qba3or
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 1/6] rust: Add basic PWM abstractions
MIME-Version: 1.0

Hello Michal,

On Sat, May 24, 2025 at 11:14:55PM +0200, Michal Wilczynski wrote:
> Introduce initial Rust abstractions for the Linux PWM subsystem. These
> abstractions provide safe wrappers around the core C data structures and
> functions, enabling the development of PWM chip drivers in Rust.

Oh wow, thanks for rustifying PWM. That might be my chance to actually
learn Rust.

I don't know when I will find the time to look into that in detail but
one thing I'd like to have for Rust support is that the drivers use the
new abstraction (i.e. .round_waveform_tohw() + .round_waveform_fromhw()
+ .read_waveform() + .write_waveform()) instead of the older .apply()
callback.

Best regards
Uwe

--ojsy757ta3qba3or
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg0Hd0ACgkQj4D7WH0S
/k59QQf/Zie657XEyEobiX+YRFby/LT3J0PihO7GXdaQaMVGvLXBOvDxjG8OeNu0
+ZLs+pGuXMJEBtLuBgN35D8f0MRvrzhYkHLoG4OEMCUXYl8F5PandUtiVaW9YRjQ
Qd5ty0G46BqM2IA20QvxKKkF3AVsirwbNjANp5TvaQTyesJcg/vh++5W0Lt0q7mb
YI8daLWPWRRYwCk8pHmPIMtsjHVTVG6MxvPH+Gg4u3Yd7d5NBb0CyHs4VMtITtFl
XNtNmS8hfXx3VYXyOo5UNFXezymWT31Uu+zPeNRRUIr2wmCiXajJu8m7SmFlk8B1
3LKMk6AoAK7O/+PlI1FfS3OTse1tsg==
=SkCA
-----END PGP SIGNATURE-----

--ojsy757ta3qba3or--


--===============7954345013916979828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7954345013916979828==--

