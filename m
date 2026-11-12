Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1339A606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IOIDqrwA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=hXQ7yT1D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nef4UwAu6U+hLKR4gGzyoz7D6e+PuNjRrhBg//RsNM8=; b=IOIDqrwA+6GpsJXNWXOwFZrTQK
	2bhnW5BSxZZe7Nck9p4XKhRmFaJCue2Y+fZRYPPAseOTqOGBCLW1S+ry3vTG5Hkc9uwE0BDTz1uD/
	aJyy9Xc61sp/SHqXlBWNM1zuoFXnVh+B2hcs1/EupL8ZSFmTIHnG36aPVsn2YaO4ngKEfvkoi1Xz0
	LU+7T74FD17jqrsG1bP5XsV49608NyHT1U3KWRbGF1FLGpE0Uq6/Xo84gBUjgjQeRV5e1t0lSO2c2
	RbDEb3k+DdGJgszlfclpZfZyMdQgxWFRHKk+JBWBHeQmQnDuUasz9vbNiS6D8/0ajm7rCPYRsAQSq
	wtKJ1J9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROOO-00000008plS-1Mff;
	Thu, 12 Nov 2026 06:34:40 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROOF-00000008pjG-3FdC
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 06:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794465258;
	bh=ASsIKBshGUMAc70HDX+oPAQojRVqL6qpA83ZTWLqdhs=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=hXQ7yT1DB6GM2/DYXK3u2AVIVRZTHvZCCqyCFIDpBa2EP3x8zgOgTLifx2ZgQ//2g
	 4AEg5ahn/FB+bGai4v1YI8W6tkh7328XV1ZaVktc+SezfluHeFLFgCPh/DlQ2henJf
	 aMy3JTqwZoi5EiAMr+jxZ2J2b7otXPe93yXZL/x8=
X-QQ-mid: zesmtpsz4t1794465257t9d1aebde
X-QQ-Originating-IP: U9DlmhTfsq4ycSNpcaKEk3c5qLBe/Y8xM6uLjl2ohkA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Nov 2026 14:34:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15307176739176379051
EX-QQ-RecipientCnt: 18
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 12 Nov 2026 06:34:13 +0000
Message-Id: <DMT0UCZC4KST.24J0VPBF3OJFJ@linux.spacemit.com>
To: "Vlad Banea" <montrealtango@gmail.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Encrow Thorne"
 <encrow.thorne@linux.spacemit.com>, <troy.mitchell@linux.spacemit.com>,
 <wangruikang@iscas.ac.cn>, <guodong.xu@oss.qualcomm.com>,
 <jyc0019@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] riscv: dts: spacemit: k1: give each PCIe port its
 own DMA window
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
In-Reply-To: <20261112015148.3911178-1-montrealtango@gmail.com>
References: <20261112015148.3911178-1-montrealtango@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NlWvLSkfVnGcgKQ5kWqmltmLOq3L1cXG7fQqADjRDUSZTV5Z1sCw6dTH
	QObIstPXtfYppZMNU5ZboCwuJOTwa9DDL63YQTkzK5eAI1qcRTdUaH9I4yJHZ8dUIRpO8wF
	KwxrXbuTC+dgICI/GQuBkH4UBHCvg6dx9+LTMXEA6/AV/GEkLkUM0X/Fv1Oe69gSzjg2tCf
	yszubkDmt0hmJI31iwk3srZEiXLvIGO1ZFg9AD/tmP3e4mlAt1qxI09/aMel77OPbDHS/f1
	q3p7hS43vWeBeowEUzsYnNpSsq8y2zfy3sDXb+aWgyHLEaHD7GYR+3YWgJyRVbSnFGemEXL
	rTJ1R+kNLZpNxYWPq//bZ68nrKItlMWyXbLSFVMrbGLkS9pRmujg7uO46aTByuvZz+FZoXz
	wgsaZ+Up5ci6S/hY8vYz3xtwnT/N0q5RQPnVgEVRjKJIK2YybsBQgQ+vo3yi+wfUK3RAe92
	s6xUeR2HydrTV5M05C6vDMx59imAXgIvABKTssgCOz+Ky4jfzesqotVraHl+gohq9bzXiMc
	Wurg9QBSjfsU2LtEXh8IeiNepQZ7Sfm7Spo53UX1mLolzFiQlDDblcQ+3gqqZMjZqb+bjU1
	J2x0mxHtzKv0VFJq4HBhxp4M/Iby1mdgJIIquJjgFBBCbXfvALK9Z0os1pnipCk3Xyo9PEt
	AaHA48K+8SQUxqtCTpLoFhHg9NhdT/p9iyybmCmVXVUpjIYZYu8+qjmO02WHn++JGfzqzhH
	LMe4F3ujrxp3sZI5YCJjxxPGWG8ZBD/3otOr3i6zqQpFHMJylfonPYeJBysjCWu3FKfYC4J
	JUejsTOPxd4GeU2i19MTP/WLMddiutcoJIJazVtD3JzD73qNiuDaq0202SRl9Q8bAEiiZ8u
	kQAW5B0ctfMOp1IIHim37A0nMDewA+SzShJTptAyMte7mvQJpBF2S4VnkCZ55to8IHC1y/y
	7N56G4wkOkHP5FL+avWthMFC39+a/sZLPBj7Lp19qZt5O3sCLMFhC1Lg8Hu3hK8BieuQMxm
	eZtSOKNVbIuBoJwUPE/GtRX3C0TwqMiwsp4GQ+mLq6gVHYvbDiq0IhC5dGGfgqydL/K1VWa
	zMbcuFuPllW
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_223432_703455_44E76ED8 
X-CRM114-Status: GOOD (  17.43  )
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
Content-Type: multipart/mixed; boundary="===============4798051708284907496=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4798051708284907496==
Content-Type: multipart/signed;
 boundary=b0091fec98f92d88b350d4afc7802ecf76e93337ea8fda20de5ee3b1224b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--b0091fec98f92d88b350d4afc7802ecf76e93337ea8fda20de5ee3b1224b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, 11 Nov 2026 20:51:47 -0500, Vlad Banea wrote:
> The dma-ranges of the shared pcie-bus skip bus addresses
> 0x8000_0000-0xb7ff_ffff, the union of the three ports' outbound memory
> windows. CPU addresses 0x1_0000_0000-0x1_37ff_ffff are therefore
> unreachable from all three ports.
>
> SpacemiT's vendor device tree gives each port its own map that skips
> only that port's window (dram_range2/6/7). Do the same here. On boards
> with more than 4 GB of RAM, each port can then reach another 512-640 MB
> without SWIOTLB bouncing.
This already applies above 2 GB: RAM past the first 2 GB starts at
0x1_0000_0000, so 4 GB boards hit this hole too. Please say "more
than 2 GB", give the hardware reason below instead of pointing at
the vendor tree, and drop the RFC tag.

> Signed-off-by: Vlad Banea <montrealtango@gmail.com>
> ---
>
> Notes:
>     RFC: the per-port maps come from SpacemiT's Bianbu kernel (linux-6.6,
>     k1-bl-v2.2.y, arch/riscv/boot/dts/spacemit/k1-x.dtsi). They imply tha=
t a
>     port's inbound DMA to another port's outbound window reaches memory. =
I
>     have not verified that on hardware. Yixun, Encrow, can SpacemiT confi=
rm
>     that this is how the K1 routes inbound PCIe traffic?
Yes, it reaches memory. On K1 a PCIe master only sees DDR: bus 0-2G
is CPU 0-2G and bus 2G-16G is CPU 4G-18G. The 2G-4G I/O region with
the outbound windows is not reachable from PCIe.
Only the port's own window has to be skipped: it falls inside the
root port's memory window, so the root port does not forward it
upstream.

[...]
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 3fabfd34114b..949843bb7789 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -1152,13 +1152,14 @@ eth1: ethernet@cac81000 {
>  			};
>  		};
>
> -		pcie-bus {
> +		pcie0-bus {
>  			compatible =3D "simple-bus";
>  			ranges;
>  			#address-cells =3D <2>;
>  			#size-cells =3D <2>;
> +			/* skips pcie0's own window, bus 0x8000_0000-0x8fff_ffff */
>  			dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> -				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
> +				     <0x0 0x90000000 0x1 0x10000000 0x3 0x70000000>;
The maps for all three ports are correct: each one skips only its
own window and maps the other two windows to DDR, which matches the
address map above.

--=20
Troy Mitchell

--b0091fec98f92d88b350d4afc7802ecf76e93337ea8fda20de5ee3b1224b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavVd5SEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9/ywD/QhPXlczePcE7
6E0edZzTzsxIBwwvDfLS5FroM/8BVZwA/i4t63ynxaNGCEO+icG2zX0utPs6vnty
briOv3CJYJQD
=5IUN
-----END PGP SIGNATURE-----

--b0091fec98f92d88b350d4afc7802ecf76e93337ea8fda20de5ee3b1224b--


--===============4798051708284907496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4798051708284907496==--

