Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34373CF45D2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 21:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWq6tglI6BZzDpBXv+tLe1/M5JHYvZFCl5NnZPfxvF8=; b=wXRjTuwto63uy+QEvFWDn4NdFu
	PieDw2fNtZV1lvYwRvsUW/sO+Bl/zZFqPGe8hBnT6sFMyylNZEAXDvNarbX7AcDJgvM2ATFnYJPel
	tHQwUZNXbHOtdKbcJfYZEMAy1L7VJ1j6DMHgZUm+br377CPVxtOwaeVHLzWvd6RdqWk2THIh8WOAf
	iS4hkjavoHmq8YgsANr4bZRXUIXm0wbJvLU4CUISf/hUT7RxeTxEw9Oj/HIlshLArYMQoHQUpsLXI
	NrGvknhvvs0ZMLo0vb9QpxKjBQreBjqx82t0Pqgz4S+wYEI4qRixslz0T4tlbEWxsU7YVUNA4LokJ
	DeRgFtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPcd-00000006Dnh-0Bz4;
	Mon, 12 Jan 2026 21:38:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPcb-00000006DnW-175a
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 21:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF87060017;
	Mon, 12 Jan 2026 21:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF2BC116D0;
	Mon, 12 Jan 2026 21:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768253924;
	bh=vBi7wuAJuJ8NTq0C8JbqIvOjzKPuDK9DGpU4UZLWUko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jb+exARqsHhS4kIzEP0rwZ5c4MeHnfQLVvoLMBgjZGVvtO7t4CMlv9sQVi11bq+En
	 Faj2UIeASk2X0VoeXmAb0NO8c4vbavB5fWXyg2Zxdlz5+L9yPMLRboQltnGb+U/1bY
	 xX48rfyew/rZNKc0FHByCDWmprzGetlyCiFKDNTxtKPkKJOYM9CTzf7a3Z5DWotIms
	 JRtscJa1yJ6iQIk/oCxKxDBifCy/RhaRTGI4CFRALPvGw4mcXdXEu6S2IsmrsBVQT/
	 G3MeriXZWlRYqtgVkXVOHMYGKH16v89JjC0wu6UBp/3TTjOxFLsv5r4YwhB41EHYys
	 SBrEgHVRBRRuw==
Date: Mon, 12 Jan 2026 21:38:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 07/11] dt-bindings: riscv: Add descriptions for
 Za64rs, Ziccamoa, Ziccif, and Zicclsm
Message-ID: <20260112-unwrapped-affluent-5f68cc82c335@spud>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-7-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260110-k3-basic-dt-v4-7-d492f3a30ffa@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============5639013040651968779=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5639013040651968779==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y9kycwEVFeG6sD6q"
Content-Disposition: inline


--Y9kycwEVFeG6sD6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Y9kycwEVFeG6sD6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWVp3QAKCRB4tDGHoIJi
0qTuAP0S3FttlkbDDN/4Ybc7gLd9lNnSSoSGB6im59BdpbsO3QD+IKthJmyKuens
uiqJ/T4IbtuwWEyjJVvXvDNLqODQ9QU=
=u++5
-----END PGP SIGNATURE-----

--Y9kycwEVFeG6sD6q--


--===============5639013040651968779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5639013040651968779==--

