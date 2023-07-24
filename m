Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9195C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPYqf0JGagPw43tf1ku+ZGwvtuifE0V9a8ky8ilasQU=; b=n4QBEDUO4lIRyXapycGEowqpL/
	/Pt7gTqeoVK7NeT0kS6a3Jd0m7x9jtYy1gK4wZk3bHOp31pEjjT7zhexdoMVN3IUP936ckfxwwO+U
	ni67gpJPpoBNqHJI87ZDD1eqOwqMy4T7LRfAfj5g85jB8wcD36FegwWU9V1prYIxMJlkLPeGNVZrL
	Wc/Iw80Pz16/0w56TQV/RuxAYdCAdNUQyERED7zc+q/72BwebivqyyhRwEZbl3Ti72QOjfz80xk5h
	tKIG/T+MRtHfLISw2Ut4oCYwqYqMnwCBY31+lqBInKT/csgdM3NrFhDhByUsoQ+kfhHzfc3Bv7LOH
	x6UstpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqDA-0037ic-2v;
	Mon, 24 Jul 2023 07:42:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqD8-0037hc-0v;
	Mon, 24 Jul 2023 07:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690184550; x=1721720550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1drItQh+Ic7VhCXN0ZQ9nvUPqiHy8kxf8EtJRB0mVOQ=;
  b=yKSOkiO+sziACb0yI3WO4XrrUeQOLAm3oh363v4kiEWZvfEXuVxAVbXG
   +Tr6Mop9v1oi7JIZCTfudiRVrJCK53uDLQe2N+K9uwwosDRt5eRxybAA6
   EU5husP7Sp7H68/Gmi72+p3z41ivh+VUPiT+3/hxYea2/fvCn6sT5Y8eU
   R3hn/LaslsLXCxrvKXBUeRmjm/gZrYlI91ukGg0Atq6tXSm+VwrDMOr3f
   JdmmMfyuoVnQvoLQ39UQWgf5Va+BpYPdvffURM3ECAGP+EObT716D/qjb
   8aBdwlrLwTN66cCEP2g1SfJAcsGAAFnzqWPWWiVBUNU1GCilecmZJsq5d
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="224718540"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 00:42:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 00:42:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 00:42:24 -0700
Date: Mon, 24 Jul 2023 08:41:50 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <xianting.tian@linux.alibaba.com>, <mick@ics.forth.gr>,
	<heinrich.schuchardt@canonical.com>, <guoren@kernel.org>,
	<k-hagio-ab@nec.com>, <yixun.lan@gmail.com>, <lijiang@redhat.com>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>,
	<crash-utility@redhat.com>
Subject: Re: [Crash-utility] RISCV64: Use va_kernel_pa_offset in VTOP()
Message-ID: <20230724-sandpaper-raving-9ad883223e6d@wendy>
References: <20230724040649.220279-1-suagrfillet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230724040649.220279-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_004230_502298_7B91319C 
X-CRM114-Status: GOOD (  13.53  )
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
Content-Type: multipart/mixed; boundary="===============6092140871869999365=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6092140871869999365==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qSAR5XtQXtoq8aIt"
Content-Disposition: inline

--qSAR5XtQXtoq8aIt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Jul 24, 2023 at 12:06:49PM +0800, Song Shuai wrote:
> Since RISC-V Linux v6.4, the commit 3335068f8721 ("riscv: Use
> PUD/P4D/PGD pages for the linear mapping") changes the
> phys_ram_base from the kernel_map.phys_addr to the start of DRAM.
>=20
> The Crash's VTOP() still uses phys_ram_base and kernel_map.virt_addr
> to translate kernel virtual address, that made Crash boot failed with
> Linux v6.4 and later version.
>=20
> Let Linux export kernel_map.va_kernel_pa_offset in v6.5 and Crash can
> use "va_kernel_pa_offset" to translate the kernel virtual address in
> VTOP() correctly.
>=20
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
> You can check/test the Linux changes from this link:
> https://github.com/sugarfillet/linux/commits/6.5-rc3-crash
>=20
> And I'll send the Linux changes to riscv/for-next If you're ok with this =
patch.

If you want this to go into 6.5, you'll need to send it for riscv/fixes
instead. It sounds like a fix for this would need to go into 6.4 too,
no?


--qSAR5XtQXtoq8aIt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL4rOQAKCRB4tDGHoIJi
0jtHAQDdIo50cqEA9Q0lAcmgfeK6vOXZJIi/cxfgEP9cqAO+KwD/XfFisMSAWHeo
uMI5pKwhVehyG9T6KrdEpldYeJiJ2wQ=
=RVHU
-----END PGP SIGNATURE-----

--qSAR5XtQXtoq8aIt--


--===============6092140871869999365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6092140871869999365==--

