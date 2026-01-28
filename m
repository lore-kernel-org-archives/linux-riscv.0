Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D73ED46BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 17:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVKMBEKSylUhtpe+JYU+EUHSN9d9h73xJuoOvUsm38k=; b=z4RbpDVRT8km9IC9m9yVdtsmz9
	duN7I4sI58y3EUx8L3B5mEH5SjtUTPRf0c2qOny7quSMtT7MRDFQG092sN/svpGu6SzkKiLyMzZ6U
	XWwg8bg5BQ0+97NAPvTJN9GocgstDu1fcaeAhrQWOhQ6CPsn5iFpPZb5s8TOoqwlX4HmrGW8pYZAy
	ez4uemPkF00qo8upUe8IdOVps2L4E7E5/O+NlECBK+MOPfjoz0ktROzFGevRIDDMPD7z0RSSCtm0V
	Qr+JqlCf5OfkLJRI2J1dLISgar3WGUwrcv+gO27qQp8VbEC8JeLW78cTqjn3KBF6ohqZ4XzRYPmV8
	t+WCLNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Yj-0000000GVvF-2I8S;
	Wed, 28 Jan 2026 17:42:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Yi-0000000GVun-0qfe
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 17:42:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 467216001A;
	Wed, 28 Jan 2026 17:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D698C4CEF1;
	Wed, 28 Jan 2026 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769622147;
	bh=3AAO19nNVqLcAGRkxvozsuhUW0i3Z+IQDaRF+aPh0L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kl+fSdPsUFL1MDJ7fF6AsuWf/6pM+UtxxA5AvFPPCf0pnQCnA5BwiF5LATymFfDbp
	 io9U8tZMC/oJ+Pr63Mo/MPR1fpJZ8lyyeKiAPzfDlgsQr8fNuK8YAphdC4xLmpRT6E
	 bBoCL20sLdWWfC7hfo/w42YgBQeuIYbojIlANMT9tiIDrLhD4jnCJoRZok9yDRZ4pT
	 6kdhxWnO139zoB4gIJmfd5xWHjRPMUJjyqRLntSNJSKhTYo3baWcaWg99gh8zwilQu
	 uXDkuehJObU+a39S/gc+qQvPhEtkVJViBvX21NRqpUYe/LoOfetxJUyk+6GUG3CMjL
	 xd3p1aOc+nV7g==
Date: Wed, 28 Jan 2026 17:42:22 +0000
From: Conor Dooley <conor@kernel.org>
To: ben717@andestech.com
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: i2c: add support for AE350 I2C
 controller
Message-ID: <20260128-moonstone-grope-5df7a55b5da1@spud>
References: <20260128-atciic100-v3-0-8c002fcc2bb4@andestech.com>
 <20260128-atciic100-v3-1-8c002fcc2bb4@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20260128-atciic100-v3-1-8c002fcc2bb4@andestech.com>
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
Content-Type: multipart/mixed; boundary="===============0027392305343864459=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0027392305343864459==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="foFtRSyLMH1HfjkT"
Content-Disposition: inline


--foFtRSyLMH1HfjkT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--foFtRSyLMH1HfjkT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXpKfgAKCRB4tDGHoIJi
0odYAQCXZQk1e9GHrNVVuWzxBQYPhfgr69mFZon7hexoNefbyQD/SnpkBWgLGvlE
vZ9+FsamjcmoLykBgiSU2lznlobpLwk=
=uHGy
-----END PGP SIGNATURE-----

--foFtRSyLMH1HfjkT--


--===============0027392305343864459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0027392305343864459==--

