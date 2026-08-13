Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2A2C5CFCF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 17:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YfX55oCPoZeKxO6jSZU3VLTzQfFrJ6pWp8vgKOXCMU=; b=i4/SgHRkqSaLzVTHtvg0v7aCmz
	ef291+Kxew+F7ccwvt2MAm7U60YQ7TsLC3rQXOI78wW4g9zG8cl4I6u5DdJjaA2TpY1PoruS9SEGW
	/98cUr+VLTmQP/nBMD8+X9ANFbr7q5JYuHHjCmaPmUqpxM9+zrWi8FL5dzqVEmsAMqUcLNvm62DUt
	euoG4KIiTCOtvTarI65M4R9yUDuciK/DCxaEjbzS8+SnhCOz5n8ahRue9qIsHUFEMlpLff60tJPGK
	2ZRenI+/zL5xOK4aUTrbi5A2d6DWYgU3P31VvlzBALCltc320NubdRXVXcYMWeLby0Ts6XBGphCj2
	b0jzeoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYoJ-00000001DNJ-0vgz;
	Thu, 13 Aug 2026 17:01:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYoI-00000001DNC-0dtD
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 17:01:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7349560120;
	Thu, 13 Aug 2026 17:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4231F000E9;
	Thu, 13 Aug 2026 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786640501;
	bh=GePZ31TGPBJanc/JVQYvtBOijS6DiyBrW5H/YrR2scg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d/or0qZXa3USfe9zrvVJrjFEARdxr0gpZ71KO8sVwrEtOsu3pq81xbLKSWI+xOKts
	 GhhrWmYnocJkMYD+7Vg/chD7/b7z+Ztehs/lQ/+qWS6EtwfCw+Xw/fX24c5hVCpi23
	 ngFbzWGMBIXBrFPa7g1GyOPJuVr6+tvWbja23c1ag5kHewrDXjBwFg/HC0IdHBXn+X
	 m+kZWaH80PaUhfW8a51IItCI0AnzVBsqYyl78VsaQOXl9ZNBi+II9tSSp6oOpoejjv
	 6QkimSGedGJKJtn3mkISPnsLErmjj5BCHiTAGFeygEOUpIRjToi/d18ayyBTYlopBE
	 8SQ+zNWOiuZ8Q==
Date: Thu, 13 Aug 2026 18:01:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Message-ID: <20260813-volley-panning-c0589cd0ba22@spud>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
 <20260812-rva23u64-hwprobe-v2-v6-3-c985af3256b8@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-3-c985af3256b8@oss.qualcomm.com>
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
Content-Type: multipart/mixed; boundary="===============6093624588445657146=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6093624588445657146==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rXSRKR8H98tOltzT"
Content-Disposition: inline

--rXSRKR8H98tOltzT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--rXSRKR8H98tOltzT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan34bwAKCRB4tDGHoIJi
0jPmAQD3suLs4KD+gV95qtdRnqAAnSnqF0Dq1xP6Y9wXr7g1IQD/R6iza5bEduSZ
fWorzbmQ9vqxCuCV8H/B0cqrBm979AA=
=1OKO
-----END PGP SIGNATURE-----

--rXSRKR8H98tOltzT--


--===============6093624588445657146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6093624588445657146==--

