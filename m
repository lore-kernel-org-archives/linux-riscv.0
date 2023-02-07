Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6195C636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsXs2W3Fg09HKzyeRS0a068O7fjd9p7LyLejB5ufveM=; b=vTlskNuIhhUn4BZMj4uHQ8Hc8Z
	UNpZ/bGbcHIWwPwuGvTaxcnoI/P2gswUi+VHfh6v3lljcQUovrdjza+eblKrIx+qhvlsZs5lXNvNt
	neXVRkOtKpS93IcpZmn3B3UgzpTC0c6kyzGcu+YmfMOFepFI38pv6lbALz/Jjapqi5eGPNjCP1O1H
	S7K9MM3EiHyU+KTxcVm7vMgHhp+OcsvgVMsX5Y3nZA3eBNbJHyzVmazubgFfWpimypKOP4QdlGgUz
	Dbmao8iIb0NGaEc0MbxvMTwJCcPL3WGUtWUUrwEh7Vr1lc/iafSyIsPVaLK/mHCxF71I55AeMfbpN
	u+NPNEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPRQ-00CbAJ-VK; Tue, 07 Feb 2023 14:59:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPRL-00Cb8F-9G
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 14:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675781964; x=1707317964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OicyPzpRNU8Z1eFB4XpAJrafR2sRh80kAptfV3bDIBA=;
  b=Hhelz6fcEKegael2ZGUoQFgUarB/oQUCoATgDIBopcDC4dxcoNTFao0W
   bBg3K1ALbqS+FNCqiv3o3VOLf36pvv/qCK+0m+9aQ6AJU1V/vlGTJlxaS
   jhFGecVY5sS755f8UG2dcXjgpGW/dxM4M+YUJDFdGtlMSu2EYdPHNJCKR
   2M9kQCQN3RrXsTriVKXBnYZ5lMP6EFK18oNHwNMLzkmach8bwK75hQSFC
   lPz3yUFK4hZ3+QqibHLqS8hUqqUKYSsYEDPbMk04wVAwVxRbkmYLQdcTe
   WDS1mR6EHeW4Rd5XQEDbrYNkfFzRo+GTPDXOOG20Kx+EQYDm9izkDvqBA
   g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669100400"; 
   d="asc'?scan'208";a="199924994"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Feb 2023 07:59:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 07:59:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Feb 2023 07:59:19 -0700
Date: Tue, 7 Feb 2023 14:58:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>, <palmer@dabbelt.com>
CC: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <corbet@lwn.net>, kernel test robot
	<lkp@intel.com>
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
Message-ID: <Y+JnLkFlZ7ACW7A+@wendy>
References: <20230129235701.2393241-1-conor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230129235701.2393241-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_065923_361332_332B85FC 
X-CRM114-Status: GOOD (  17.75  )
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
Content-Type: multipart/mixed; boundary="===============3173946422142722383=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3173946422142722383==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hsTdfmcL9RL1SmJJ"
Content-Disposition: inline

--hsTdfmcL9RL1SmJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Palmer,

If you do end up having WiFi could you pick this up so that the
regressions report thingy stops whining at me?

Thanks!

On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> When adding the ISA string ordering rules, I didn't sufficiently indent
> one of the list items.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA strin=
g ordering in /proc/cpuinfo")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/riscv/uabi.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 2ebec4c52230..8960fac42c40 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -21,10 +21,10 @@ so for our purposes the following rules apply:
>     single-letter extensions and before any higher-privileged extensions.
> =20
>  #. For additional standard extensions, the first letter following the 'Z'
> -  conventionally indicates the most closely related alphabetical
> -  extension category. If multiple 'Z' extensions are named, they will be=
 ordered
> -  first by category, in canonical order, as listed above, then alphabeti=
cally
> -  within a category.
> +   conventionally indicates the most closely related alphabetical
> +   extension category. If multiple 'Z' extensions are named, they will be
> +   ordered first by category, in canonical order, as listed above, then
> +   alphabetically within a category.
> =20
>  #. Standard supervisor-level extensions (starting with 'S') will be list=
ed
>     after standard unprivileged extensions.  If multiple supervisor-level
> --=20
> 2.39.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--hsTdfmcL9RL1SmJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+JnLgAKCRB4tDGHoIJi
0jrBAQDo9V22DCMDGEeyZk6oNVd1BNfStf/m/MAnA0yL8FK5rwD/dgSF0mueCVBu
orU7PrVXdB5zobtEo9lCSWw1WvrVDg8=
=ryht
-----END PGP SIGNATURE-----

--hsTdfmcL9RL1SmJJ--


--===============3173946422142722383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3173946422142722383==--

