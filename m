Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71494C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcbQfvqff8YYOaayysNOI1JH345PSpmcVSKBePtYauM=; b=Wr+y3tRT2kFaUNokCK6Trr1+DW
	5PsMk6UzsJQ/an74NAyvpvIRb4XcrzYlYT3Y6lBlhfRLkZLENi9nxmqm84TNXbCAm3ox5OYc+dvPH
	Zak5whkXHBpXttZkSI6u7YkGyx5d889DP4WdXko42ScFFJOY5sOhGL7y6IaLwGSKDNAm0OZfXSbNR
	i14ywer9Om+GUCrcC3u9+1ma3NbbgMMj0JDcjashcCb5aDrBHwfN8jpotAMJRcmOIAB7tospKZOPT
	OJD4WyVMDoT12oZESKMo0VsZ9rytfw8LVvocrbH+Bi1Tcl+Cr/rPBnoxI1QZXYKy4X0n2vBgtsiJN
	El0h8+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s028T-00000009Pxb-1wuC;
	Thu, 25 Apr 2024 16:39:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s028Q-00000009Pwi-3pBh
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 16:39:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8D016CE1AB7;
	Thu, 25 Apr 2024 16:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A19C113CC;
	Thu, 25 Apr 2024 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714063182;
	bh=reXQCxjwgVF/vSZVFWzLCBgG6BHAY7X83818MVuU3B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGgY6OGwP8j5o0gXQ5YBFCAx0dtvyMnXPn6O/Ay4ELwGgXDtMS4+y9uaoGkixv6BV
	 /3tcMzjQxV4dczr26rO6F8V62Sx/JhLVrDflNufIsiflIRWEmAzdoREKtz8uT6tOJp
	 Y6E58kfQVvu8cQLTBRXFtznjdlup7xq6sh/FZFFkJJvbQQ5ZrD3uQEzzoJxElhm3zg
	 Kv4hMKbLr/90KpPDftAIZvMUI113nZEjbWj4Qt7Md+aVuqldoY3m4emQKskj6OEx4p
	 fxC7ZErw6M3JTA/bMBSHsYAiBtmMpvKZRK0aqwsGa/6AAaZNTXBjo75YLzI0vrWDnT
	 O2ep8AALwLF/A==
Date: Thu, 25 Apr 2024 17:39:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, jszhang@kernel.org,
	guoren@kernel.org, wefu@redhat.com, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH 2/4] riscv: boot: dts: thead: Fix node ordering in TH1520
 device tree
Message-ID: <20240425-mouse-unfair-1e0d9b19c713@spud>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <20240425082138.374445-3-thomas.bonnefille@bootlin.com>
 <bc69023d-5e70-4d5d-96d1-f298cec5b59d@kernel.org>
MIME-Version: 1.0
In-Reply-To: <bc69023d-5e70-4d5d-96d1-f298cec5b59d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_093947_149700_A81DB917 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Type: multipart/mixed; boundary="===============6888484514786263917=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6888484514786263917==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s+/8stqRgDeN0Bg6"
Content-Disposition: inline


--s+/8stqRgDeN0Bg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 11:49:10AM +0200, Krzysztof Kozlowski wrote:
> On 25/04/2024 10:21, Thomas Bonnefille wrote:
> > According to the device tree coding style, nodes shall be ordered by
> > unit address in ascending order.
> >=20
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>=20
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.

Ye, odd when the rest of the commits don't have it :)
I picked up this patch cos I'm prob gonna finalise what I'm sending
for 6.10 by the end of the week and saw no reason to not take the
cleanup.

--s+/8stqRgDeN0Bg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiqHSQAKCRB4tDGHoIJi
0vqrAQCSXRqNkEyrhHeiXz2NM/l7Al4/TFpt6Oz2uAWFe6CoJgD+PG9g8oooPxrF
aPl3LhX8ZNU0ceFECdkMYDfzEIhTWQ8=
=0yNn
-----END PGP SIGNATURE-----

--s+/8stqRgDeN0Bg6--


--===============6888484514786263917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6888484514786263917==--

