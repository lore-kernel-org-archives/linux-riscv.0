Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1B5D29C46
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhZ4ukLwJN1p1hoj89DWwYLS5WDDhSXXaMlatHxgqvw=; b=fwA774OMJsQyPW7MZ+jshd/ihN
	ZpghbdA4KzpWT8TbLrLivfImEEWvn+8Nx4CCjwf06ySyIt86HFQYgm/L9M6Ou6g8Upg/r+flycJoB
	gEDZDaXAzA04VphC0ws1brr8mTqmnMO6W37aaCPnmeET0VnNoEEQB6+aL71LZQM0Cw2SPjXoJoPAk
	hUZQP+iT5Zw3mQkjtIAGGVjjBG0o1TCW9O4IdHGXW3Y32+FcCZX+XsyXc+CPw5FstC8+AvFrUK16S
	EEm+Hq10FHplBLaiCgkAMugiD47hn3p5HcYHn/WrQkCBzhGcXlwPcTMpn1CiMiYMRoCf/gtZEQkEx
	gd1AfPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsFJ-00000002WNV-3Anq;
	Mon, 19 Jan 2026 16:36:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsFG-00000002WMx-47WR
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 16:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C1CF443FC;
	Mon, 19 Jan 2026 16:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B22C116C6;
	Mon, 19 Jan 2026 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840610;
	bh=r5AEjxu0ffIco57i3KrTMg0Pm0HG6BQGf3lgxhMEqFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6ErR9heEjtTfI8bj+c+dyVTZdG0hyw7zI62IiINmsComZit6HlQyijcsFeykWvQ7
	 iQ1zBFL3pQoIG/kX7ftnx0iNvSwgKydlJuGaWFcp9deH7S5lUai//9KTFaYzJUbC7H
	 YvApF93/MH9kkxUBy+iqeNM3ghcPbafz9aV+K6ib1QAT17GiTI0YMXXYSE50q0IHyn
	 jwqUSfsxNSevgnBKxKfXeYmPravvY6IqsU2CZ7U8RwFOtQhrqa9Ym1a655yxpnI0+i
	 7v+3aCs4lwpL6kd5d6Vz9ORKb7eEIeq7T6rBD/6VY/mA0O3qXuHRoWpje80bdKF4kK
	 Jv2ZxIpUczUfw==
Date: Mon, 19 Jan 2026 16:36:43 +0000
From: Mark Brown <broonie@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <af0d60f7-9566-4aae-a349-c01fe0220663@sirena.org.uk>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
X-Cookie: Does not include installation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083651_058356_45E54CEF 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Type: multipart/mixed; boundary="===============0383693386426423216=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0383693386426423216==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4P9RQnxsZDW3YdgJ"
Content-Disposition: inline


--4P9RQnxsZDW3YdgJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> Document the internal ADC and DAC audio codecs integrated
> in the Sophgo CV1800B SoC.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--4P9RQnxsZDW3YdgJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluXZsACgkQJNaLcl1U
h9B3hwf9G1boRH8L5QCtx392+XGOiT4sOYgYXU0pmlteHX9unFMgDjR+FgH5TM2F
XLSCLPcmqhF49sa7nXmfhG68KwsL1b73U++hOxIIZNS/+q7LlB7n9nhsgmfQeANZ
7H4Y09vaMv7BuNbcyc5+klFCEsx1FeOfEsaVR5IJTqxve/Cu4LD4iOpbLcJ0WkaH
uW96QEQ+1b0OyjlkpmaykhS45RThDReaYjG5Mw9behxwvHz3BNIrfHBkmjp2miL3
Nm8J2bs04riq7EGAFzA88i2kymp0Q5jIxZnd+F6fdh4bPXG+8o1q8FC66acSnAT1
FXiKNOv+fds2KcshsMWSX9zl0KvRwQ==
=VPcX
-----END PGP SIGNATURE-----

--4P9RQnxsZDW3YdgJ--


--===============0383693386426423216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0383693386426423216==--

