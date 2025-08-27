Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1608FCA0FF6
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 19:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bfi5Fie3SukZBTMphPy8sgrOLMyFtk0ZUHP7OORnZU=; b=KP2jUUrp1BJBLUJL+55Vq+IW2W
	0M65aOCY1g4AvU4dh8szLYJIiGj/pd1S1r+M9UrrgxitJjYbGGEY0wT4ba/YL2Jpu2rZ+6B9y2q6/
	DV0wiK8TfigkbDzZNIIHMdQ8U0BOoFMsL9pbUs1OjnwB5V3xBFOfKi+W156i5kfdziZU2krL5pl9l
	4lXSoZdE4+FG4Fr8oOdLCacYKI/UZ8oGjK0qxUBmUMjj+kx/hd1suAbWOfhyxMPHjtleL/13SaDRk
	XjGqfGZsKB4rAvlAVyX6avmUnyUEUbAlCFvM7vPXbO/3XGaRr9IkTA/pLItNtT5MP0DNbqEvhKmTx
	xcjHATdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLxk-0000000GdCC-26QM;
	Wed, 27 Aug 2025 19:37:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJwX-0000000GJVL-0iZB
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 17:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6EDE44BB7;
	Wed, 27 Aug 2025 17:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4104C4CEF0;
	Wed, 27 Aug 2025 17:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756315696;
	bh=J2iW4fcquoMXCFvrwNgVUWmetrANS/ZUtfkvs7vrbUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a83xwGxlmmFgKbpXsiSmmPwVl48weCDVspZ0TGs/TfZ7amQqZKAQIUXlr2ls5/7RV
	 ES/aC3DOfpBAIuOy7lhwp0at6S1I7BRy/gV1WaX0PgupjR4DgdRacO2y6s27OHweXV
	 iqXXrvV5EEcNZtEY9548ph9X5pyM6QfZLU1lLbiZeNdIuciZVj1TFPOZ83OSUWbHmp
	 W4D2PTsd/47Q2NdXl+J0chm/MSYSDh7VgpdTDSXY0ZE6vDoDA29aEljZcBTwx3lR2w
	 O/RJWDlkB9MBrmZ23DhkkZNRmBcF+LrhauKt77mYId7FuYF9GBVMPnChHysjjh7X6P
	 wS5+1qz+WQg+Q==
Date: Wed, 27 Aug 2025 18:28:12 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: Re: [PATCH v3 RESEND 0/3] riscv: dts: starfive: jh7110: More U-Boot
 downstream changes for JH7110
Message-ID: <20250827-aloha-datebook-6133960546ff@spud>
References: <20250823100159.203925-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250823100159.203925-1-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_102817_235001_ECA60E18 
X-CRM114-Status: GOOD (  10.09  )
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
Content-Type: multipart/mixed; boundary="===============1195742452529552530=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1195742452529552530==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DBSyI2GI+xVp3lzx"
Content-Disposition: inline


--DBSyI2GI+xVp3lzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 23, 2025 at 03:01:40AM -0700, E Shattow wrote:
> Bring in additional downstream U-Boot boot loader changes for StarFive
> VisionFive2 board target (and related JH7110 common boards). Create a
> basic dt-binding (and not any Linux driver) in support of the
> memory-controller dts node used in mainline U-Boot. Also add
> bootph-pre-ram hinting to jh7110.dtsi needed at SPL boot phase.

Emil, could you take a look at this please?


--DBSyI2GI+xVp3lzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaK9ALAAKCRB4tDGHoIJi
0h47AQC8FbMusMnLVxo/83unGL4xyLbvXY89HBtv7cWlwJZMIwEAgL1E3yrJIeXC
LtVzvGmO2ZTGxJTfVWJVmWMOuLQsLgg=
=7Ecq
-----END PGP SIGNATURE-----

--DBSyI2GI+xVp3lzx--


--===============1195742452529552530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1195742452529552530==--

