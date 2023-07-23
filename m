Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB3C001B0
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzHBo9sQrrCI0Hm0QPY9TUPtRvlEKudD/c5uXm8pqV8=; b=cubkeh/qJ3p8crAGZAe9Qb6Mv/
	BdKRXaD7TRUx29wP2hiaZhtaXh/J21Aj1w5TVBM2Cv40QJq6kPC1qTKXT9erBiNSQtQiqUR1ltNQ6
	OabclX1yuEijf0gKLXRE3eicIHiYm7lDUxOiZyrvLVr6NzXUCQW2vhqU2bQirjmh1O+EkcK/KLkag
	1a0ZTCdrm+Jw5QTE1R7WHHXutscogJZx02t8hpYNLIAxqLkhFJn/foYFGp3QKixdnImdnCOXISmpE
	3BYCt4KLoo/gSGh+qmjSPsrZ1wi6+QF8ZdNk5ReBv71zE7D6NGGUykJcBAlZDFJsljoECXssngolQ
	5OhJkUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNWO5-000lWz-0f;
	Sun, 23 Jul 2023 10:32:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNWO2-000lW7-0Z
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 10:32:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C6B860C4D;
	Sun, 23 Jul 2023 10:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BEBC433C7;
	Sun, 23 Jul 2023 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690108342;
	bh=ARam13QTWA3O3nkOowtbpN3JJUB9tpWKoRXDn3NbSyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAHkxQK1dv4LyfRDLNHTgSvV+D0up3guCN+24ju5BK37E89QyqpoclXadVYWg5yz/
	 8D/dmCq4yfdl8WUcSdbn/LCvHfp7+9b3vXhSnxB5eoJiD/2RiJi5Wf8gPwjALmV7sR
	 BCNlNFUehR5cJGZ0upY/7yIUDILUJEMRj2jpDPJee0HR+pdxKojZSRShk0C0n2vb6B
	 nKD9k6Pvtem9Nn897hVOSRVVUj/BCNfknkeSqwd+ogi4HX/vbdtgLe/C4H93V33Iy1
	 urgnMDth+1jb32Hr7Fx4p2G0uJ5EXTwHKCBRRqY/VRvWwuUzEGgHz8lGMvw9+YB2yn
	 8CUJtEUXdVV4Q==
Date: Sun, 23 Jul 2023 11:32:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH 1/3] riscv: dts: thead: add BeagleV Ahead board device
 tree
Message-ID: <20230723-savor-trolling-e35ed4a7a751@spud>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_033226_283974_F5300316 
X-CRM114-Status: GOOD (  11.13  )
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
Content-Type: multipart/mixed; boundary="===============2450035640592903258=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2450035640592903258==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hbyyzIRWlWHR+2MJ"
Content-Disposition: inline


--hbyyzIRWlWHR+2MJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 22, 2023 at 02:55:39PM -0700, Drew Fustini wrote:

> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0

Hmm, should this not be dual licensed?
I notice the other th1520 stuff isn't either..


> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0  0x00000000  0x1 0x00000000>;

There's some extra spaces in here for some reason.

--hbyyzIRWlWHR+2MJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL0BsQAKCRB4tDGHoIJi
0uLsAQCAtRC/rwHAZothQ3rTcnBrTdJmoEKJWLdHlvr2QtMyWwEAyrDpBULbR4aa
8Qzk3mMexAB5OcMcQabshMB2TxvIUAI=
=GPK4
-----END PGP SIGNATURE-----

--hbyyzIRWlWHR+2MJ--


--===============2450035640592903258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2450035640592903258==--

