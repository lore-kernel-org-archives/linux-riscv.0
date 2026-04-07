Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AFCFF5123
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 16:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIbbvAMvkcpd3jWVRnI8rDG2fDOL+3s9yhSUmz9XOYc=; b=2P/dP8OvgNxCc+nbSIrY5Z1VlN
	GIVc0bAq5ArD3pz1Mvtw9Jx6X378VU6TLTyHsPDVAhvCgptI1CVLe+pArGHQewGGhQ50PO8ZrFIGh
	TIFN3qiWpX0KWPClJLUTt2kMXvKkgGSn2/TZ/Y0J8w/jXFKqiUlG/obnnrYqXa0+aw07niFZ17ecW
	9W6C2rhEuVYg64+ziZhbZdQj/HAlawJLnl63yIv/Dr295ckOIKM1H6IM27MuhwVucytCEwOiplBfa
	5ww1cg3Qle/c5gS1aoDfM/WiYafFuKMS4engAwRh/ZlocAkNqwLHo+QuRbSfE8vSX8rFnHULkpJmd
	E6DZJSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Dh-00000006nFo-4B2H;
	Tue, 07 Apr 2026 16:24:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Dg-00000006nFM-1iWq
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 16:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D735F42A30;
	Tue,  7 Apr 2026 16:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48ECAC116C6;
	Tue,  7 Apr 2026 16:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775579043;
	bh=3FooutZHnN5nxUVqQr8hpPgl/W3i5T61GrZ8VKy5aQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZTI9GWldshgdI8QkQvKAxRlMjHNEPzrlwvkpnnvvACiO20Iz9jSLKY6tS+ajKWV8
	 KjqMjzJOtV7W1VEOqIYS7qpOmKQoZuctvxOnNixmg0PcCwcK0hDhCR7SQzMMn46g5l
	 mv7uZRCnADCP5icOnDxvJ4SxEPLCfASGWoSB/MgUfrffDSHAdp9MdIXYGCfdbtg1Q4
	 gR6Ag2dWOvyB7j64m1KzG5e3KmfStMN5s2/nORbSYnW8Tkkve7cM3Y2DasBsroYN/w
	 lSE0MECiYwv7YbW1l1dwvX29/3CYYgNGFObsQpuXNemJqTS0cdb95trWfYLafqzHH+
	 NnavoWBgBF3zg==
Date: Tue, 7 Apr 2026 17:23:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: spacemit: add
 deepcomputing,fml13v05
Message-ID: <20260407-quickness-ambition-a46682716b22@spud>
References: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
 <20260407055707.1202730-1-sandie.cao@deepcomputing.io>
MIME-Version: 1.0
In-Reply-To: <20260407055707.1202730-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_092404_464530_1E5C5CAA 
X-CRM114-Status: UNSURE (   5.88  )
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
Content-Type: multipart/mixed; boundary="===============1278803703930757082=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1278803703930757082==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TugsYhRd/uE/+Zd+"
Content-Disposition: inline


--TugsYhRd/uE/+Zd+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TugsYhRd/uE/+Zd+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUvngAKCRB4tDGHoIJi
0lj6AQDmNDP5TJttVM5GF6cCVSC0t6ifz0ZUtRfCmxJfyIrs4gD7BwQBkCshF4is
4kqBK1o6NWM6fTkIA5MQo6KETdJhBw0=
=pV5I
-----END PGP SIGNATURE-----

--TugsYhRd/uE/+Zd+--


--===============1278803703930757082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1278803703930757082==--

