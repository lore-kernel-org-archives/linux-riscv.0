Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430EE60850BE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R4+7yOSW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hth+rPdM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TMinNDL1UyNEo63bO0Bkf1LA48yZzavU/gLM1wwyJ64=; b=R4+7yOSW/liEr1LtMGrdx/N+ZV
	5wTDglkmtN4XuwqfTtUh+IZa6WodcOoV1PG2ijBfZCW+lounQ9GdMupK9sD2MIuYzzOXocFJNQGi5
	7VSIIwOLljcuVB5GBzpRbzRycjq4vJVqVskWyzH9cH7FxWanTLCUkeglXwZXIcd3BXbeSpJAIJ31r
	mQy09xLdigs3eFSiNDVWQKbtpr/K3ZfoEaUV2eCikWUSBXOfwmEqOflpopZ3ZXHsgqiY432vzJZ/n
	XaeWqdEDbetz6N7Yd/QiKzJrm/4WDg5lNSr1+N4QxEFm/L6WMHR3faH9dd/TOIOoEZtD4Ia86XMpx
	BWFLfoCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxUr-000000004f3-1f3P;
	Mon, 02 Nov 2026 19:15:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxUp-000000004eq-2gkp
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:15:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A6F060136;
	Mon,  2 Nov 2026 19:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132871F00A16;
	Mon,  2 Nov 2026 19:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646906;
	bh=Ub7b5kzLvl9OAeW8ozCd6H/592RWGbAqWfLNRh//2/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hth+rPdMehrl9EA1niQuNJaYSiG8QK4UJG4rx8w5Ztdq3W+R1L/UaI6/zUUkZCN7K
	 xDyiXsp4wlh0FJCJDcFHwZcofoZr4pjikuBS2SlOck6aQiKqdbcDOc9EbVT/oeE8G0
	 9SJlMrKd3rpvhnrldz1cIOWF6WmQ9z9mKwbt7Ge9PitOwZLM44JstbN2OfxP03NCyJ
	 HA8EV2ZhDX+d7Sp2/aIYeLSy1ZDmsglmKsl6wJtM839v9kvTMwIesqkqeWDNnOD50Z
	 clF9ZfT7ekH6mdC2DlAz099ceeGe12OL0RSdfav0IQJ+Sk5NRtGVo5NJDqW6i6Kvzl
	 qrK7BS0wJSM3g==
Date: Mon, 2 Nov 2026 19:15:02 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: timer: sifive,clint: add OpenHW Group
 CVA6 APU
Message-ID: <20261102-coagulant-unplanned-f98c31a5a309@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-4-marouene.boubakri@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102141727.640769-4-marouene.boubakri@oss.nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7755451236465407019=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7755451236465407019==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ck1ZkQepgggIYSGA"
Content-Disposition: inline

--ck1ZkQepgggIYSGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ck1ZkQepgggIYSGA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujhNgAKCRB4tDGHoIJi
0vnqAP49VXjGm7Y82Jh8vMDSzllX63VvhJSZatC/j3MzWdJm0gEA40JIqOL0/nky
JeL86xTzQidzloCS9D260V0s7U2YHgg=
=Ze0C
-----END PGP SIGNATURE-----

--ck1ZkQepgggIYSGA--


--===============7755451236465407019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7755451236465407019==--

