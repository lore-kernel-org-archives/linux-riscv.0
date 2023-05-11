Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5D4C7EE24
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Euhqee9Zgc1XxP9Ek921uC95r9zpsZ5TigHVMLSmrc=; b=VigY/3/juxmgxkyMqC1V7acywY
	46u/U9vv1DYv4NkhmzfGHg5jnAbGtnkQ1Dv/nqJpPs2ldnpDw16JRfuyzcfdmejp1ZWDlAAVUgySw
	DPALOvaDrles+lBwhkZOV1ezam3VXNfj1k6nvrsdq9M2ouMdoAO7lntH5M0MrMbzUlub6rOYXDKmI
	zMCkipI2vV/wxD/ygFdeq74SR/boHXXqKF/Damb93PS8u2J/rQs3KO/di8YIAMIX4fL4Jgt7iWHJg
	6aq9wYJu13UnSShFdhdNiA/pxEREGN5+l+6FA3vP77GAQ16qCJhYhQpylcESkHZEL2qGRgFsBeSu0
	w6oYLBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0jO-0088Hy-30;
	Thu, 11 May 2023 07:28:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0jM-0088H1-0r
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 07:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683790132; x=1715326132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uJ3+rSSCVgRwRP1p8wI15bvqJ+LZjvxecomrsBtB0eI=;
  b=SATewahYYddKJcPkPKnx0Gdbg5s977dr/VF/upgHA22gjHAg/Rz/l/Im
   XFLdyvpxW4b0Rv2OngVycqUo0hIgrG1oVYsxA9togWPNrlMitMZDEIBgy
   MdYyALVTQLXjeU65NMo0D+mkDaW0FF+DEkH5MhcDhaF7SJupOxdlF/Y/c
   /5QF6CmH/vKjRgSbxCtCZtF7RCNmPjCssGMuvMi88flNS1PhZe7Y9bmRe
   lT07xA550f8V4IS2rfwvSMsUCHfNe8k1atsy+4LsS8ORqlvm9Q3hdjlw4
   eVYNBUfncq9IP0KO5d7UwLpt3tzzYc1CyGJ0mc6xesJwcmDw3CXMh4YIf
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,266,1677567600"; 
   d="asc'?scan'208";a="214819223"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2023 00:28:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 11 May 2023 00:28:49 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 11 May 2023 00:28:47 -0700
Date: Thu, 11 May 2023 08:28:27 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Pranavi Somisetty <pranavi.somisetty@amd.com>
CC: <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
	<palmer@dabbelt.com>, <git@amd.com>, <michal.simek@amd.com>,
	<harini.katakam@amd.com>, <radhey.shyam.pandey@amd.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH net-next v2 2/2] net: macb: Add support for partial store
 and forward
Message-ID: <20230511-drudge-scrounger-e850f112d497@wendy>
References: <20230511071214.18611-1-pranavi.somisetty@amd.com>
 <20230511071214.18611-3-pranavi.somisetty@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230511071214.18611-3-pranavi.somisetty@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_002852_359908_944CAF00 
X-CRM114-Status: GOOD (  11.18  )
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
Content-Type: multipart/mixed; boundary="===============6225769523317103535=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6225769523317103535==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SCdDR1RMamuy5fAc"
Content-Disposition: inline

--SCdDR1RMamuy5fAc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 01:12:14AM -0600, Pranavi Somisetty wrote:
> When the receive partial store and forward mode is activated, the
> receiver will only begin to forward the packet to the external AHB
> or AXI slave when enough packet data is stored in the packet buffer.
> The amount of packet data required to activate the forwarding process
> is programmable via watermark registers which are located at the same
> address as the partial store and forward enable bits. Adding support to
> read this rx-watermark value from device-tree, to program the watermark
> registers and enable partial store and forwarding.
>=20
> Signed-off-by: Maulik Jodhani <maulik.jodhani@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Harini Katakam <harini.katakam@xilinx.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> Signed-off-by: Pranavi Somisetty <pranavi.somisetty@amd.com>

In passing, this looks like an odd SoB chain. You are the patch's author
and the sender, what did everyone else here do?
If these people helped with the patch, should they have Co-developed-by:
lines too?

Cheers,
Conor.

--SCdDR1RMamuy5fAc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFyZGwAKCRB4tDGHoIJi
0h7zAQDofuyYk2C7X+aRDtla/7I1koSaX1omCjWvq9I0kpLpagD/X+kDLq6Wb7XR
M9UpbuAJiYODjZUvbtK1V/SrbnxQOQU=
=CMDY
-----END PGP SIGNATURE-----

--SCdDR1RMamuy5fAc--


--===============6225769523317103535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6225769523317103535==--

