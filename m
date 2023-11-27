Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C762AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15mh4rucOWSYKebg5z3RkWfXRMfGiSsoU9r8H9JQAno=; b=ipguRRjnyde+dO241xonNlI0+T
	CqrZyELFn+1qBftE9skrljklVr+4Ty5fP5iDyfWsoV5mU6RSnE8QsuzZVR2kbTfdog++hR82uZxcU
	ShCAAEIGqWJfvQWQGItYHTwvwTXMhNJpTchosTM4lVFeXcFZv/Q7pWMECwUl/xWsQM4h4jdJ3hUyW
	h4+2v4NTWylF/ibIovahXznaTyfdn0tOAa9mgv0UYe25DVyPp07LecdF5Xhf254CDiEdEE8zjuiX9
	oqKRLTQte9vUHWeffnh4Nwi7aSP4OaRTTcockDYlxq/YF6Wd4Bo6v6JQfgLbBOJ+tTbJHUyT8X8et
	YYZCKd3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ccl-002heM-1j;
	Mon, 27 Nov 2023 14:30:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ccj-002hdz-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 14:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701095408; x=1732631408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yhykNXyZvalLGEmacnGcRuQpSVBCd7cLRjOG9XbiXxQ=;
  b=NqFDgCsXz6oQ5rMt719q2rS353gsb+cJlP33tY+mB78FOuuRd8OZN9lf
   /E7dB7wyKxmAqDN9wDcGEOrm36G6l1pveFVU/TdJhz0oziYp/SlGYIzCn
   q8ya+yMJiZko/jpsrAVZP/1jMNsXgGYFLD+IG70YA7rz7cGbPqZ0TEbtv
   FDfat1hQoLuVvKKxvpvveTg6PY5qa8pR2kYfOURiHBGNL6XzYXDVXMgA4
   DhFz245dYHQK19DzE3fQ/zVNfPvxf0yYtQutfoflJPunCiU1IZVEE0gig
   gvMhnDsMBjeEf5PZ70vZk6nRqwFAhKMKA7QzgT8FksfgB+SUNCrV3bShT
   A==;
X-CSE-ConnectionGUID: aW6Vx/uASBWsmmLGNLaICw==
X-CSE-MsgGUID: o7HKsLUXSMGfafdsAdFZ/g==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="asc'?scan'208";a="12260096"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2023 07:30:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Nov 2023 07:29:51 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Nov 2023 07:29:49 -0700
Date: Mon, 27 Nov 2023 14:29:21 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Woody Zhang <woodylab@foxmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <alexghiti@rivosinc.com>
Subject: Re: [PATCH] riscv: reserve DTB before possible memblock allocation
Message-ID: <20231127-trifle-film-2d8c940bab4f@wendy>
References: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com>
 <20230607-jogging-grudging-70dede86bc53@spud>
 <tencent_79F42B5A66F98A65266F989EC9C86A69F005@qq.com>
 <20230607-unruly-encore-e00661704b71@spud>
MIME-Version: 1.0
In-Reply-To: <20230607-unruly-encore-e00661704b71@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_063009_467681_7A6EF5F7 
X-CRM114-Status: GOOD (  20.21  )
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
Content-Type: multipart/mixed; boundary="===============3505670129131427657=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3505670129131427657==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tXbrPhgYMyqKwY6U"
Content-Disposition: inline

--tXbrPhgYMyqKwY6U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 11:23:31PM +0100, Conor Dooley wrote:
> On Thu, Jun 08, 2023 at 06:17:22AM +0800, Woody Zhang wrote:
> > Hi, Conor
> >=20
> > On Wed, Jun 07, 2023 at 07:17:28PM +0100, Conor Dooley wrote:
> > >+CC Alex, you should take a look at this patch.
> > >
> > >On Wed, Jun 07, 2023 at 09:35:19PM +0800, Woody Zhang wrote:
> > >> It's possible that early_init_fdt_scan_reserved_mem() allocates memo=
ry
> > >> from memblock for dynamic reserved memory in `/reserved-memory` node.
> > >> Any fixed reservation must be done before that to avoid potential
> > >> conflicts.
> > >>=20
> > >> Reserve the DTB in memblock just after early scanning it.
> > >
> > >The rationale makes sense to me, I am just wondering what compelling
> > >reason there is to move it away from the memblock_reserve()s for the
> > >initd and vmlinux? Moving it above early_init_fdt_scan_reserved_mem()
> > >should be the sufficient minimum & would keep things together.
> >=20
> > IMO, moving it to parse_dtb() is more reasonable as early scanning and
> > reservation are both subject to DTB. It can also lower the risk to
> > mess up the sequence in the future. BTW, it's also invoked in
> > setup_machine_fdt() in arm64.
>=20
> I'm fine with the change either way, so:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Mostly wanted to know whether you'd considered the minimal change.

What ever happened to this patch?

--tXbrPhgYMyqKwY6U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWSnwQAKCRB4tDGHoIJi
0m/KAQDEuZxT5JfailGBMUXOcjT5I61ojfuXfoRX4qyhLfCZagEA48qNAd6QNeRx
30HhIlbePUXhEb/osu5NNXdRus1JQwY=
=r2nN
-----END PGP SIGNATURE-----

--tXbrPhgYMyqKwY6U--


--===============3505670129131427657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3505670129131427657==--

