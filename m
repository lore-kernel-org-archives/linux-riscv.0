Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC73606A326
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 01:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B79bSPRd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=piyJX+OD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PyP6yuPMAiTcUWvj+EsvnWGyaHecFOvkqE5464z5iPk=; b=B79bSPRdfwoS0wTs8gQtFt8gc6
	oqR8gZA2INciLVA2gDniDckSBQ6ifj9xyNmCUn98mIfxgkD3BO1i1BM28LPgG9LNl6mjfkt4cmnx0
	UPZCmEInAwhCv6OWc9iXN5QJaU78yF+Jow4Q9yXJ3tMc+4+ZYQspM2qDGY1K6Te5BjznMte68t+IR
	rDvgh537Kr4rHytmIZguwEfKo9t09Kg3yXV9fAEk4yqs35AMLaZ/UUwOGrWXRDMATAtMWa0MZuQu8
	bNcQrwrQ/tV56NZrD9c8/VL9JFEaiOAibJRM3gRnGjDgcIKT57vaJVcTi8gsMB4xtB5M5RTRmQxr3
	AI3WjAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJtO-00000008RMV-1ftg;
	Thu, 12 Nov 2026 01:46:23 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJtJ-00000008RLJ-31be
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 01:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794447957;
	bh=o9qbUelCx5fzvjlP9T4Xcmeuzs4IG3zEIHU3OITHRHo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=piyJX+ODZSYYaVvjlTI2Eq9fElkjSsMxECUYYfK7ObaUBsg5PgSevcsupPAxywNUG
	 M1V8o33I51bLUw7HNWTBkWtgIrCpBX6XsgTznpCjUmm4GjvzDmmTNdnXfXcOulnxIU
	 W9hxC8AC0AIVB0KOWtwu9w9G0OOccXGgnGlv+qEE=
X-QQ-mid: esmtpsz17t1794447955t84c88b44
X-QQ-Originating-IP: nAMxank+hAidb3QvsKnH0QjBdmBkxc00yYWvW0b9tzA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Nov 2026 09:45:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6514529535114007816
EX-QQ-RecipientCnt: 20
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 12 Nov 2026 01:45:52 +0000
Message-Id: <DMSUPKS0VL8N.1RUUESQVU8FMF@linux.spacemit.com>
Cc: =?utf-8?q?Fr=C3=A9d=C3=A9ric_Mah=C3=A9?= <frederic.mahe@cirad.fr>,
 <marcel@holtmann.org>, <luiz.dentz@gmail.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <dlan@kernel.org>,
 <anarsoul@gmail.com>, <alistair@alistair23.me>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <troy.mitchell@linux.spacemit.com>, <linux-bluetooth@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Bluetooth for the RTL8852BS on BPI-F3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Luiz Augusto von Dentz" <luiz.von.dentz@intel.com>
In-Reply-To: <179442601916.1604530.1705197925952408060.git-patchwork-notify@kernel.org>
References: <20261111094557.443481-1-frederic.mahe@cirad.fr>
	<179442601916.1604530.1705197925952408060.git-patchwork-notify@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OD73vtqOAFgqQdl8kVxlaorlGh6ZaUM7MaaEhliCvStV/AKYXHEQMwXv
	mE8cjPXzZoSMzDP5rS79pEFkS9v0Cuth3c55LR7M61G2e8XnCAOlpEjrxoh8bqs8GEKMTfm
	GTyWl/QZL70ACCCVQ6uj8Tlyf3KkE2JcX10i0FHHOsrnfmi5q+Ehkn3K7RXY3bZvU2FID2H
	UvN7y9rKiw77FT7s6GhJ4fx1S1RlRbt7n6OsPhwPZHVivwHdgz9O3mYH3bj7sr9CPzEsPiZ
	anYDNKhJiC+hgVRO+VxFCm7clKBTCO1/dpbNR1ml5GvrpEDfhV/2pIFyykr+YGZpQHxfY3p
	TJc9QYLV1u0QXALxLj4Val5hsZE7/CthI+Qownvjkph5L1F+EXqwyrq4eoP0YcK/ilmDAho
	ZvCFlYhVaBcsc2VU89cwcIOEQgZEehRzQdL+SJw7373sgvVEJE1Y4vyw/ms45GOTC2Q21Id
	OMUuGZ3QjPuQHbb8B7XixuiYzs7iprF3xJjXo0jmeKrNhDIZGvuaDAh4bySOqW6kLnAbV56
	RA+Y600SEiXKQWXcLbRFeMx6ywBNGCxG5a+UJRDhGRum8DpjlhmVG+CuhQ2RMmjgc4wr2TD
	d9jJ3pfBFkZ94W/W+gOn3AIKoBSv2bAM+/8wb+QQJ5FJNFooxGq+YiWh3LAhoLGuVsbgV+D
	cGyRNvuebtQHbocavAoJSFzS4BmjFe3dwxdXk0kd1Zcow1gxUfTvCHCmx0tZuh3HzTl/1bD
	l1/6KffMQMTv7+AgDGYqGXZ/mf93hOH0+JeQSGtCJb9BHs+QrqmdnYhQb8uRxyx+kBYUNNl
	06viwZorpHpExLypIKCmxYCnoJKmZprZWkCQBHUR8BYD7VkRJkGTe7sPXHBZu8AsEKY/jew
	aZH2f1ovWzm8emaBcAGSmMYWkhghxdY3HkVZc6ExcZXgl8mK7/cUEWu2d5kcUwGmCbG4Qji
	rdB4VW/J2kmthTdNN2Yl5OqyEXyWpT820kPtJaT3gkQUxcw6IWwrGWQL2IF+aHUev6hHd1F
	5OEfl/viYZ1xVcnkitMrNIqckdq/L55vhD+jfzXnkrJegcbhzOxEi1uwRca08Usj47dp6VX
	f8qGllmeqmKimpUt5M9OSQQo1cVnn7Swg2kYjxjGMTh
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_174618_663892_A50B1419 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2486576312293909966=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2486576312293909966==
Content-Type: multipart/signed;
 boundary=d400da5dd7a138166c54bfc43864faed746c419ff16dffcffaf97ceb07d3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--d400da5dd7a138166c54bfc43864faed746c419ff16dffcffaf97ceb07d3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Luiz,

On Wed, 11 Nov 2026 19:40:19 +0000, patchwork-bot+bluetooth@kernel.org wrot=
e:
> This series was applied to bluetooth/bluetooth-next.git (master)
> by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

[...]
> Here is the summary with links:
>   - [v2,1/2] dt-bindings: net: bluetooth: realtek: Add RTL8852BS
>     https://git.kernel.org/bluetooth/bluetooth-next/c/c21f8cff7503
>   - [v2,2/2] riscv: dts: spacemit: enable Bluetooth on BPI-F3
>     https://git.kernel.org/bluetooth/bluetooth-next/c/df348a0d065c

SpacemiT DTS changes normally go through Yixun's tree to the SoC tree,
and Yixun hasn't acked this one yet. The binding patch is fine in
bluetooth-next.

Yixun, what do you think? Should Luiz drop the DTS patch and you pick it
up?

--=20
Troy Mitchell

--d400da5dd7a138166c54bfc43864faed746c419ff16dffcffaf97ceb07d3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavUaUCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9TDAD/fhHvVXqOkUxo
4u6rg6LrG/txpGkWipkP94X2k5PSn9EBAIezttdQYAric2H/Pw+q38b/NEdLHI/i
7Au69q7vwYkA
=ms2x
-----END PGP SIGNATURE-----

--d400da5dd7a138166c54bfc43864faed746c419ff16dffcffaf97ceb07d3--


--===============2486576312293909966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2486576312293909966==--

