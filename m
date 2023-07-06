Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694ECEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 13:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kVi9W3qxin0vYH+eszNqnzg7o3jqr+hW6PgA3+8Hgs=; b=Y+Yiyw3EHjriacqjN+RS3BR5iS
	P0/TRQhXpfP7jJFbH4SYir7UYgDUYCRkktraWwjUxKUzlhPahtZF2IEhUQBUiJRrklhwiQVo/vdI+
	KS3nYfUjTYZ/w8aH3PU/h/p91wYwLOQo491PAM90gZtiXeSc2mVc7it78Z3CGUfSM2O0fyoIqqjKD
	9GoydWzBtyuepSd0pUbaNTI/pt+DhOiR5KV5Tf+IYAmUToYrzRzkmsajW3kuUfYON0f9u7B0JrGMe
	VbtFVUnh+1oKtCykJzNm+DvA1yfq2CaAh2cYTKEbe0w18WBlycPomiWZR3jqHqXuO6s4HBspEoMvK
	BAwp15lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHP6P-001mFD-0D;
	Thu, 06 Jul 2023 13:32:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHP6N-001mEY-14
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 13:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688650376; x=1720186376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A0ITg5p0s9I1F/WCN2U7WmRQJ4A2utSLS9UEHI39G98=;
  b=Y7cMrf3F/lXnCGLdVGyYglyeRcThLTUsswtGOdnyT8yXhGN3eN3Tkchk
   S/+s/XKqs0sohnAxH7XfH1OuCVbgbPjPbUN9jm9H9YvqW2z6PSNWMlHkL
   ltxSPk/HIyzDCpveUMUqkKM4fswKmoMYfQsrdokBvoID7dqeYtlx4NZrW
   /roXSLZYtcZRsXuKrHsB/ftXqKo6fbmJqHWWMFAPLfJTWL4t/IssBP84l
   PMgZmVqKshwnc9N7maUxe2p8b1yf+Rmy7aZ/gVAZ9gcQ8X+XJ/bBA84Yg
   ekpjuMNO7w+Erzl9xnH9mF45gx1ZJabGqRK3lYZGS3UnSlZ9HD9C9w7Wz
   w==;
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="asc'?scan'208";a="222382636"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2023 06:32:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Jul 2023 06:32:48 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 6 Jul 2023 06:32:46 -0700
Date: Thu, 6 Jul 2023 14:32:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Ortiz <sameo@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux@rivosinc.com>, Andrew Jones
	<ajones@ventanamicro.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup
 Patel <apatel@ventanamicro.com>, <linux-kernel@vger.kernel.org>, "Hongren
 (Zenithal) Zheng" <i@zenithal.me>, Guo Ren <guoren@kernel.org>, Atish Patra
	<atishp@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2 2/3] RISC-V: hwprobe: Expose Zbc and the scalar crypto
 extensions
Message-ID: <20230706-overeater-dodgy-666f80dc473d@wendy>
References: <20230628131442.3022772-1-sameo@rivosinc.com>
 <20230628131442.3022772-3-sameo@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230628131442.3022772-3-sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_063255_382411_EE5189AA 
X-CRM114-Status: UNSURE (   8.55  )
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
Content-Type: multipart/mixed; boundary="===============0180595270438143256=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0180595270438143256==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QpzfrTlSAhHgCxB4"
Content-Disposition: inline

--QpzfrTlSAhHgCxB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 03:14:34PM +0200, Samuel Ortiz wrote:
> Zbc was missing from a previous Bit-Manipulation extension hwprobe
> patch.
>=20
> Add all scalar crypto extensions bits, and define a macro for setting
> the hwprobe key/pair in a more readable way.
>=20
> Reviewed-by: Evan Green <evan@rivosinc.com>
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--QpzfrTlSAhHgCxB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKbCYAAKCRB4tDGHoIJi
0tbXAQCIxfRmR+GN+J8R+D7XmU0NWeOqMMdJrYWW6TnKKys34wD/ShnmOs1Onsju
BlFI6gGbwYUXJ5X+igIw1MVZKKiGOQ8=
=Wil8
-----END PGP SIGNATURE-----

--QpzfrTlSAhHgCxB4--


--===============0180595270438143256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0180595270438143256==--

