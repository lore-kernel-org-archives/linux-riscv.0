Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28871CD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUgMDhdcU0B9u10jCaAO/0g/5+7yaCiYLjoODOeXxXo=; b=mcFg6TPjKIqsjAdrW6IE7knYAy
	TCPnwKTb9ZmOqpVosIfdl8eoyFum16zNUbwebXi+6C8mo2xKn+StkvSCdb94jBO5JeTYyPCSPxxyk
	2YVHrswZx3xjyFB/qc8LBcmrXK2viYwi7kHjiBn2enz13R9TZUeGnhcKAjTcODDQHAd3FfY5JA5jg
	lOTZarPDi+dsJMDnIMd37zdJViGdGWUadSLVBQhAQKDea0GJtdrl9mcFhXT7MbVQf0t3YFPiXydCB
	/zFUV80ST4HAMYtfWcVOSOvr/9TBp22a2h5aBgx2mkV9J00PZ1lcPhg0c1ez8rF4gqFMbmWqdCxgw
	g7ev8QsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wac6O-00000002mBE-3Q6k;
	Fri, 19 Jun 2026 16:29:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wac6N-00000002mB8-2z9x
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 16:29:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE2A6601E1;
	Fri, 19 Jun 2026 16:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2460E1F000E9;
	Fri, 19 Jun 2026 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781886594;
	bh=+XEYgedP2+rsgk2dCqKyYxBbZEMCdR5SozPym8Th4JA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fg4xmFxkBGkA/7uC2c1bGpPCjNQKO1OH/keV+aY+JAqs//287TxBFxr0cW/UN7l4C
	 wm+dWIgnBldjDgH1yywP8D8ZilYKwJK9L7gR+Q+JOBUCCskiO51kS+c58j8uWZll4k
	 adaqPgbcnkec4L0dGY0hCCn2TtwDN+8wZ1ozMdxJTS9PBt0NfAhCLW0p0pEjTiqzOg
	 b5mqJEmH85P1sAz5kD6o95rcd7SVW2f2VKbuozZcnBI9w1RO6STXCxxqpFlCPQ0j61
	 iSvw4QVY/r5tbxyDlmEHMlslUvJS8PjFfyksNiu3Gqsc+DgNI5XCipV6tXobPtDpl3
	 NimCT1AsgOa4A==
Date: Fri, 19 Jun 2026 17:29:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: microchip-corei2c: Use generic definitions
 for bus frequencies
Message-ID: <20260619-pension-deepen-7dd3c03fb422@spud>
References: <20260618141346.3241286-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20260618141346.3241286-1-andriy.shevchenko@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="===============6580810759705860504=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6580810759705860504==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yzhqw6Idhf/dthgS"
Content-Disposition: inline


--yzhqw6Idhf/dthgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--yzhqw6Idhf/dthgS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajVufwAKCRB4tDGHoIJi
0mBjAP0XB09qOMrHaGvhmNiY0lYsURtCL8D99P2FpHacQ3VDjAEAtMGT1Q1KgOD7
/60ZWDAO1fJxwJ+BMNkanABQS+qR4gU=
=g0FO
-----END PGP SIGNATURE-----

--yzhqw6Idhf/dthgS--


--===============6580810759705860504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6580810759705860504==--

