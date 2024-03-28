Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A399C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oogfqZ1AujNKV7Xc7p/cYzuTQQSBorlDuzbDCCqtIek=; b=ZpRrartLfdzEgYH89tMSQuUEv2
	rGgWA4xRcwqR7ue3qu5GnBIyHj06x9/WihBb7qr9AmPuQc81FJFvfSHkukXwLMDGRwwwBRoBBCy5r
	APvAblO3Q15mUiMyQ1aL0U+5UXCHlrs17nhIJhzn33La3R8fk9ibs94CPADmMgh77LNZTPLueclye
	bVhPeTGBprp7FE/orK/oy2pjMm1fVHWPp3xy5bDX7ZYadrmOrR/rt+IcBh2cgDHdLuPcsYAKb5sW0
	w7D8gNTMh0+p+QiH6eIeteWCiYSzYpqDeWaC71HpNJsDrYLYV3221T0aW626oeY4kN+9vi3FZaMnR
	rwYGQ0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprDd-0000000EQPS-3cfk;
	Thu, 28 Mar 2024 14:59:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprDZ-0000000EQNA-1Qpc
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 14:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711637941; x=1743173941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pqcTdZsas/L2lLLi0r0tZaLc/T481Gjhve2hnITnqOg=;
  b=Nt2Dcgyi1PyG93pnMtvOnuoiKbu7B5n1Pir/bHSlEsWhifPDs7tWYrYK
   BUaW/XhlsUqyLHB0/N2M52V2o5xfg3Gp6bRfc0Dskm1ksZF2xrH7NBZgv
   18Y3Duu5/uE+WvUf9zAqW6BTOIbgJcEhLgP5jUvih6j0CnFH7TG8mhTS7
   JVwNllztrMXOsDVopwoRUvv4V1k273AGSBkDutx0tswn59u/0R1WCs82R
   /mr6b2RzGwqxYjXjvtflRszO6yIJeRDzHwdWi1ytbBSPEemzHUIU5KpVu
   9gKGi5R9BckruTdWlTL57vtHg7QQsFBOXmYi0gAeaxxoXYUl+AI5uBh2x
   w==;
X-CSE-ConnectionGUID: aoxufTLkQWq9+1EyrDTJqA==
X-CSE-MsgGUID: owMpyAaSQPuHzpD0jAx60Q==
X-IronPort-AV: E=Sophos;i="6.07,162,1708412400"; 
   d="asc'?scan'208";a="19071180"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Mar 2024 07:58:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 07:58:45 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 28 Mar 2024 07:58:42 -0700
Date: Thu, 28 Mar 2024 14:57:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
CC: Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Tomsich
	<philipp.tomsich@vrull.eu>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@kernel.org>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>, Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, Huang Tao
	<eric.huang@linux.alibaba.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH 2/2] riscv: T-Head: Test availability bit before enabling
 MAEE errata
Message-ID: <20240328-issuing-crouton-3448aba81b64@wendy>
References: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
 <20240327103130.3651950-3-christoph.muellner@vrull.eu>
 <20240327-imperfect-washbowl-d95e57cef0ef@spud>
 <20240327-77a6b64153a68452d0438999@orel>
 <CAEg0e7jyGZV3+04HNYzgfHMGYT9wV_c0A=ekpCRi3L-5yjxK=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEg0e7jyGZV3+04HNYzgfHMGYT9wV_c0A=ekpCRi3L-5yjxK=w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_075901_535366_A3787939 
X-CRM114-Status: GOOD (  12.88  )
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
Content-Type: multipart/mixed; boundary="===============0373634210803618610=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0373634210803618610==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DnbhxEf6LbaydUMs"
Content-Disposition: inline

--DnbhxEf6LbaydUMs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 03:18:22PM +0100, Christoph M=FCllner wrote:

> Switching from th.mxstatus to th.sxstatus should address all mentioned co=
ncerns:
> * no dependency on OpenSBI changes
> * no break of functionality
> * no need for graceful handling of CSR read failures
> * no need to differentiate between HW and emulation (assuming QEMU
> accepts the emulation of th.sxstatus)

Yah, th.sxstatus seems ideal here, provided it is accepted by QEMU - but
if they allow th.mxstatus I would hope emulating th.sxstatus would be
okay too.

> Also note that DT handling would be difficult, because we need to probe b=
efore
> setting up the page table.

IIRC the kaslr seed is also read from DT prior to calling the early
alternatives stuff, so while it would be a bit more annoying than usual
I do think it is possible. My (naive) hope here though is that we don't
actually have to deal with this scenario though, as things like the c908
support Svpbmt as well as the maee version. For the k230 the plan is
to use both Zicbom and Svpbmt rather than the non-standard T-Head
alternatives:
https://lore.kernel.org/all/tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq=
=2Ecom/

Cheers,
Conor.

--DnbhxEf6LbaydUMs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgWFcgAKCRB4tDGHoIJi
0ln8AP9fysABFrgqy3Okgc9O+ecA2rywWKxbBMYuyaLnrMihuAEA6mmXJ/4phDg3
D6YcC7uR47skvTGO9rKNLSUVk0G0bwE=
=rLay
-----END PGP SIGNATURE-----

--DnbhxEf6LbaydUMs--


--===============0373634210803618610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0373634210803618610==--

