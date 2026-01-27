Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09109D2FED7
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 18:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZydmqHXEY4IPkkzRulIDngUtfbkewIUkacM/nAeJMo4=; b=jqlKwp/MlZJ0mRiGHJIvtlEHH4
	sx6CHFa7tXEwRblfdoSSF1ANQKZ7WTrvXmr4p/9j6+fjVdyz99qe6PP/qaHFxGZHvHnDTtwgFwrFi
	uXA8gAExMf+bccQev010SHXD3NIhp4n9zL5yHsl7AIuFuUebkZ7i3/kvNiP052aB8lJrzblwm3bbz
	Rj6Y9PZBv4Y60ce2YXgvRLmVboolJd5kYp/r3gmnI3ig/zI5TWcdnL/mhUkVXo66Xb9bWL+SehnMK
	/pT3PdlRDZ6YL/kmEPGHVn8amKBhH/055ecQn5yYsl88yyrWe2HXLaafbNS0XMTioQ3jNPVQnjcGq
	15csbOLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko7x-0000000EqQN-0zKk;
	Tue, 27 Jan 2026 18:49:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko7u-0000000EqPi-0HEK
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 18:49:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30FCF601D9;
	Tue, 27 Jan 2026 18:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9F3C116C6;
	Tue, 27 Jan 2026 18:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769539760;
	bh=iT+yyXgQZ3x2/4R14CXtSWhq5XlSr9HST37oX+8s2WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4mTqxuigK0STYTNEcUwZ3eoJnKu2PylZkqigulHGoDlYwE+FurRxSvINwlG+VKfq
	 BGEbnBH+OoqnRycIR4vNO5cLSjI6W/bJFgnPj4zxGOqfMdAiyTsJZgKIsxv+uQw+bQ
	 bFGdPoa/9f9gsI8JGUzaerjyWe8UEbrcBpfaCkUmmqP/PDR70mRhO2qCajU8MpFM4/
	 jbJ4c0dMgRFU467QlE6ZvIPq8DknicMbbKYLKc2Qwtbfgj/DPWV+Q+8GecYvaaL4Tw
	 Hv9A5aTwIykpMA45/OO2ETyRUTBt/5frYU871RjtBcM/lu4ihy0cnE9o1jAvn09dk9
	 4PqLcEiRNQaZQ==
Date: Tue, 27 Jan 2026 18:49:14 +0000
From: Mark Brown <broonie@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-sound@vger.kernel.org,
	sophgo@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Message-ID: <6f1d8478-c2b6-4966-b339-47c4d55fe7c8@sirena.org.uk>
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
 <20260127-incremental-for-i2s-dvier-v1-1-431b809c632d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260127-incremental-for-i2s-dvier-v1-1-431b809c632d@gmail.com>
X-Cookie: I brake for chezlogs!
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
Content-Type: multipart/mixed; boundary="===============1118487540762939278=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1118487540762939278==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A2SbuAFzC6dVpo13"
Content-Disposition: inline


--A2SbuAFzC6dVpo13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 27, 2026 at 10:48:07PM +0400, Anton D. Stavinskii wrote:
> Add comments to cv1800b_dac_mute() and its caller to explain how the
> overwrite mechanism works and why we force it off before playback.
> ---
>  sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--A2SbuAFzC6dVpo13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml5CKoACgkQJNaLcl1U
h9Dexwf9F3/yOByeyoXaxyjBlHEC/mxOv+OZ2GLloz5ZE/XmNslI8Vr6cfyArC2n
CXy9zt5T5q9gqyWr0rPj75rhS0iRrxcI38bQA26JaJIP03Yx6Nxu0uRxL3psJexY
Cc3DYocMeU8i+u+5NcChQ07Hb3k/1n+IqwaMd9Dkm98EuXlgkfCDSLpllLiQUjFA
bnO9p8Zq6ohvKbfCgX/BfIdKgBSbiiXWFRsmkmSSKd61a7ZXhJrGxRZYOrexbEBs
9zqJHPgObJxVQcLsjouy2VS1t1tyyOrsjHbbd6T9qMG/OXiVPI2Ms4NW5zQNtZhr
rXxVFARpLhC0o5ZOVZAilBJdVTquRg==
=SBDX
-----END PGP SIGNATURE-----

--A2SbuAFzC6dVpo13--


--===============1118487540762939278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1118487540762939278==--

