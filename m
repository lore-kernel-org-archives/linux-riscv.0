Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C0CEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYyfcYCjCXdH6zuhGJEXuo1EFe7XZo8ADJxSsL7b83k=; b=jhUcWquJbh6OdT2/XCFWAnCXuq
	37RpiX7E/t1G9c6yHNFvPKXl5pPju6i4hMrT6ZYcVoO9PX/NA7+XbyTvN8p3N809QQTa6jo0zDRKH
	qLAWSjFs1Q+mgk8zwsJ0shVRTkBMB5xMpnhlZ4TGPN+SxrHG7hreG8uMwsZ+EmeR26Z1495k0DAqL
	ln9HCg5PovcHfxVsoTqCMQyUMLzJx4wHXmXFQOirVFBvVHiCrMrBRBTyBdmvHMf9uQU+hdiLdsvaf
	5cZjepZVehKZ8mTVEE0sOkCh10SYIBLbkC9rtI/sxqmqTzS0PmBH/CI063dfAQk9f14KS/3EA2Y8n
	jyX2ivyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEkB-009ixF-1r;
	Mon, 03 Jul 2023 08:17:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEk9-009iwm-1y
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 08:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688372230; x=1719908230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hxLRx7MJ808MUU2NcCaCNzOa2IUOEx/fbiFCPUlHJNY=;
  b=iicbL266l8AT2U6HbIaJngaUw3TPfa+jKfJm3+MQY8RBrk3VIU7EnQ7l
   TRDD+sUKOBiI/FuHVOoFXcpSm+eEH7lzXop6F4p/xeLEpfi6Mo7UhcM+J
   +T9V/YiBgvV6mdtpSeCRTdpPbcC5BQzd13RRb4ZH8GMl2q6bYtlLg87GO
   zLQyzt7zmR/NrCviZd0eQd79zNnti690lUv6XD/M9L6697Ea+o4lm4biA
   x1JSLIBw7bpW98RhCu3QP7pn2c22ImvRJj4HqRZxXQnMeFV/xYPKRkNUJ
   s+0Tu2OLTwcV+ImMTsb3CiMIDWIbGw7FTaMIGVDF0w1vpulBTNfZR3bQI
   w==;
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="asc'?scan'208";a="221734702"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 01:17:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 01:17:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 01:17:02 -0700
Date: Mon, 3 Jul 2023 09:16:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?utf-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
CC: Conor Dooley <conor@kernel.org>, <ardb@kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <rminnich@gmail.com>,
	<mark.rutland@arm.com>, <lpieralisi@kernel.org>, <rafael@kernel.org>,
	<lenb@kernel.org>, <jdelvare@suse.com>, <yc.hung@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <allen-kh.cheng@mediatek.com>,
	<pierre-louis.bossart@linux.intel.com>, <tinghan.shen@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<geshijian@bytedance.com>, <weidong.wd@bytedance.com>
Subject: Re: [External] Re: [PATCH v2 3/3] riscv: obtain SMBIOS entry from
 FFI.
Message-ID: <20230703-escapist-granny-14faea3ab0ef@wendy>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
 <20230702095735.860-3-cuiyunhui@bytedance.com>
 <20230702-confiding-aqueduct-25c3c2852de3@spud>
 <CAEEQ3wkaazkV9MrfvWQMSXixtqahgdYVe=GT9ZZJnW-r1AQ1aA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEQ3wkaazkV9MrfvWQMSXixtqahgdYVe=GT9ZZJnW-r1AQ1aA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_011709_654604_7D45072C 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Type: multipart/mixed; boundary="===============5939904662782226673=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5939904662782226673==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BPBW6SBBuQNafGn+"
Content-Disposition: inline

--BPBW6SBBuQNafGn+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 03:50:57PM +0800, =E8=BF=90=E8=BE=89=E5=B4=94 wrote:
> On Sun, Jul 2, 2023 at 8:42=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > Hey,
> >
> > On Sun, Jul 02, 2023 at 05:57:34PM +0800, Yunhui Cui wrote:
> > > When we bringup with coreboot on riscv, we need to obtain
> > > the entry address of SMBIOS through the FFI scheme.
> >
> > What do you need it for?
> RISC-V will be server-oriented, and the system needs to be managed
> based on SMBIOS.

Really what this commit message is missing is something that explains
why you need the FFI scheme. Say along the lines of:

	Coreboot on RISC-V does not support EFI, and needs to use the
	FDT Firmware Interface (FFI) to pass the entry address of SMBIOS
	to the kernel.

Cheers,
Conor.

--BPBW6SBBuQNafGn+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKKD4QAKCRB4tDGHoIJi
0k2HAP9pmxxbrgHQrz6OmhH0sGOVhQtFoasv1XCYd14s7Vbq5wEAyAL2LCy+I4Bg
n7AZ/WcCZ+tcNDDs4NqNvkDFVNURsQA=
=dPYG
-----END PGP SIGNATURE-----

--BPBW6SBBuQNafGn+--


--===============5939904662782226673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5939904662782226673==--

