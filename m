Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F333CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 12:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSVZKUOClkZlWBhJLjwiW1yRe44gA/BfuZ+yvNNQ1co=; b=kfo3kEQJaczzARGhSx0TdJOuli
	vIkqe4uHK8Ai7hqfTF+qjGREZWkffYr0TGivR+5XMtkowDL8Hb9DwjNo0a+9DjqPYDg+mnqYMFNal
	+LvEtg4o2clrhx5ajAkQ8HQE3yxBH7O03lVV7dp7lK/Jc3o2DrFn4sOrd64JpHjaIW7V3uudoHz3Z
	ldrc92jNHWSMUDdxCP7JmDrNE0/TifUzCWaqcXXXgyHnNNV4jhqNP5piEt3fIK5iReN2qWpcrh4rJ
	QHoR8ktdJm+RlvjcUho4gImXWUzFWMTm3fkU0xQK2Tx/HwQMBV4QuSABcj/pR9Dn83Df2EX5IdgVd
	zMVp20mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCdLw-0000000BHb5-4Blh;
	Sat, 25 Oct 2025 12:26:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCdLv-0000000BHax-33uF
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 12:26:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A882160254;
	Sat, 25 Oct 2025 12:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9938C4CEF5;
	Sat, 25 Oct 2025 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761395194;
	bh=XA0LBs60d1Gvp183PYeVpoLINndtx657oSRL5oD+WDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q83Pe8v00HZSQX7uT5MUCkv+RSQ0sCD2ZvTt+39uUCtCxY2Q5M3ONxRjtbJ+nLhcw
	 H96l3nQpb3HCrmkwHvUCLROfeQsp9O24gFbw5x2/Sqgy+aN9JdIURBTdBThyEua9L2
	 3vFneTX6dits3KSah7JKehEWXFu4woLfrdttgWSzCDpRT48ZfrJAQTHooLhQ5Dp40q
	 y/TxnimxmWT5jSZBP6YvYF7ADSr9NkX2B7K2vZ/36MJuSe9vbi+T73j4ocC9sak8Ff
	 HX88tCY3ZiQhVI1V6SUV92Vl+Qp8yYsb8rliJELdHADX/FWHUnXl4tvaQeF1DUhBgs
	 Z1Xjj2MNgNZMQ==
Date: Sat, 25 Oct 2025 14:26:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benno Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Drew Fustini <fustini@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v16 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <47ut33rck4xoh3d7d6t3d7twqag3u7eusbruc2i2veqf2umpga@ipamilvshysw>
References: <CGME20251016133814eucas1p199cb62658c016e84e34d525e7c87f16e@eucas1p1.samsung.com>
 <20251016-rust-next-pwm-working-fan-for-sending-v16-0-a5df2405d2bd@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20251016-rust-next-pwm-working-fan-for-sending-v16-0-a5df2405d2bd@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============0969733651752491275=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0969733651752491275==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ue2aydelqwngvqlb"
Content-Disposition: inline


--ue2aydelqwngvqlb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v16 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
MIME-Version: 1.0

Hello,

On Thu, Oct 16, 2025 at 03:38:00PM +0200, Michal Wilczynski wrote:
> Michal Wilczynski (7):
>       pwm: Export `pwmchip_release` for external use
>       rust: pwm: Add Kconfig and basic data structures
>       rust: pwm: Add complete abstraction layer
>       pwm: Add Rust driver for T-HEAD TH1520 SoC
>       dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM controller
>       riscv: dts: thead: Add PWM controller node
>       riscv: dts: thead: Add PWM fan and thermal control

I applied patches #1-#5 to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-next

. If I should take the riscv dts changes, too, please tell me.

Best regards
Uwe

--ue2aydelqwngvqlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj8wfQACgkQj4D7WH0S
/k7+mQgArnA+n9XWQ7YH1TKmkOxj0p/41RfGGWkpSKUxrKtQrhlFAky5iBDQddtZ
L5w7qHIIRJQLc8P1MuUe1zyfX4iodXGazEiFpz7I0wAS3xft3Aa4rqB0qFRFIxGv
bgM2exfnJvjiM21WwGXTniDq/GsDHCYqeazwECCb5+/4amap245Rw1ZWtTDZGIm1
YX7SsPJrZ3X+L38nZN0n/SeVNH3VU5b1e6yXyaQKf7lGOLFutchQqYdLE6Vno+5k
Ul7eJiVK+Zlrl5LKNHdvjMCvi71GBoNbqZZj1xvSLRINwq1lZQgJg6yVI5w9sr/m
F44ES2C4FsgmuPqY74u/UnfUJw8yVw==
=WOZX
-----END PGP SIGNATURE-----

--ue2aydelqwngvqlb--


--===============0969733651752491275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0969733651752491275==--

