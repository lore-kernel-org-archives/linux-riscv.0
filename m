Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F349AC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 14:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2v/XqbaYCKCK0cXlhJXZsfedVafFxwRJojwCTsR6AXI=; b=qI6tfno0VYiBHhMPa3zyyRg0la
	CA+LhgcbxweXzLLMNdSYdGTvmt8OqS+LZ3lf1Uui1KCvcMgWTT4SVejxDAZmaaL2JaigrvD6yB0oY
	ujPo3WT1tRaAT8fMWYM2fjlVlQDJ+WRJViExI+El+ZJSZTZQgHJM3tRdAUngfbguQM4nKFDRR8SG8
	5bCuaDH42NeHwPDKRNFE1KEyaOfFbF57DiJ+tkLwbaAcGT0V/PNPsySHuv16tqalPfX1XIXjl2pg/
	kczwvaWAIV2SGhtpUktyBkR5mJgPU2yuQR6nRFOFBklB5oALPdYXTuphCKCBZpwqLHHeeulDkT7YP
	YAGk5G6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDSM-0000000EzDF-0EVb;
	Mon, 29 Jun 2026 14:59:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDSL-0000000EzCx-0Si4
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 14:59:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6337C6001D;
	Mon, 29 Jun 2026 14:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED811F000E9;
	Mon, 29 Jun 2026 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782745168;
	bh=lZnRTYts2J9Bba6ns0s3r9f2oW7X1LmUA+jtYt8C0+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hvT5xnUVC8bZLE3Zmz7pRO4kEbi3tLaejlgAEpQ2oXCdIYZwfbswbDBUyh+2/LdAX
	 HYmw/aipz5u8hiFF3A5dVvb1KSncFS2RReCzUE0SMHR9jtRNsVWu+jUCVg3kyqGO27
	 vG+SKTiPldpQEsfFupPbEPzErBsviWalzWLwANVeS2O1GTHiXK7oAHpYbohtwYnE+M
	 iPBjRTIqtPuesvupvse68sl4RndoZecY5g+suN6NsJbfFvzn/ayp/1EBeN9JNhUJPX
	 6jh32sXF89Ogms27RzfYvJK0dbEN9snh4zRKtCKMPCOPLG1ncwKkjbRx00/7828din
	 fV0slsVb5CpFA==
Date: Mon, 29 Jun 2026 15:59:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 1/3] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
Message-ID: <20260629-untaken-slather-b3b87558ba7c@spud>
References: <20260629063601.63917-1-hal.feng@starfivetech.com>
 <20260629063601.63917-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260629063601.63917-2-hal.feng@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============5783758584968379367=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5783758584968379367==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="spaqmsLa1o2j5Paq"
Content-Disposition: inline

--spaqmsLa1o2j5Paq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--spaqmsLa1o2j5Paq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKISwAKCRB4tDGHoIJi
0iH0AQCbq/Pc7UCPWAO7czELCLDiZrYU85kYekwP4Su2of8cAAD/Q7X3XSSS+8sz
DkfWwc16PsO+pU+HsQErDbABnR+lwAo=
=rCeT
-----END PGP SIGNATURE-----

--spaqmsLa1o2j5Paq--


--===============5783758584968379367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5783758584968379367==--

