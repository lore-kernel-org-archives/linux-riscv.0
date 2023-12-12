Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDD9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXZBhmodywI6s4cjuu8nRju1BwBLBLHyWg5KGhBitcY=; b=P77FIHfl1nBBiRndUvwc51NMcE
	amuJR+QNcMXNiLXKYBoMbGg5RGk6gRTH9gS1N4xrWEck3SoBMR1oyzZJt5lGwWbgF2juZCkvTcG6T
	DSoZspdakeuo95SnQ0XqX5eGSaHlRx8UCfyzRx0rwz30RAPXomec5vaaIYxf2nNCfXDZ9JUYGWMzY
	E5YtQ8geS/H2/86Lnv5euNrmwShNaEC5V4QdEDpnMzq6aWaTgsnlAmrb5tTxI3hn1eKG4yJQuejUN
	/huxA+vOIOwYOMZMrBGVwtU5x7T9FUewXKYdOtDgL10Qo9jUbzPTMVLKjPDeD2BDOJClvYNvIa+8y
	3TEPswLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2jb-00Bmyk-03;
	Tue, 12 Dec 2023 13:23:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2jY-00Bmy6-15
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 13:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702387416; x=1733923416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ObudWEFWUPe/g9pCDQ+nl/6o1bGXYJC6k72mCY/W68=;
  b=TnF30qLfQM887UpUD4PkqpsCu5EuNjSCpURjjNJD5EiLtZomJVLnVUse
   o/cNUOsArXHtmHxZ5qPDusqmWeluMtSYsrOZjBAX6BBDid5Ni9Rmtz/iD
   IWpH0hx/kDEWG55+Btgm5yiB99mksURFkZ4NZmY+F+9Byq1GucF9mz95U
   Wz4B45RL/0y/2m2YS6vfrPTfnVABNWUsY0k9ewZD4WUvgCL63qv1Ufvkf
   qCJAyTqehzE8XtmbI78esXkeMraHk07ljiIZ38YgwVTpiVTtFGeB/G/mQ
   RuCSuLxVWAGWzFg/ElSEvNBWjxlYXVWgVArBOMmdqT1b/yEdiZown1SQr
   Q==;
X-CSE-ConnectionGUID: E8h4WABqSWKzeAU7QsIu6A==
X-CSE-MsgGUID: OwNyOmFoQ6WtJyxN3Eqtcg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="asc'?scan'208";a="14074704"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Dec 2023 06:23:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 06:23:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 12 Dec 2023 06:23:17 -0700
Date: Tue, 12 Dec 2023 13:22:46 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Frederik Haxel <haxel@fzi.de>
CC: Vitaly Wool <vitaly.wool@konsulko.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, Andy Chiu
	<andy.chiu@sifive.com>, Heiko Stuebner <heiko@sntech.de>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, Sami Tolvanen
	<samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Guo Ren
	<guoren@kernel.org>, Nam Cao <namcaov@gmail.com>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, Anup
 Patel <anup@brainfault.org>, Baoquan He <bhe@redhat.com>, Chen Jiahao
	<chenjiahao16@huawei.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fix XIP boot and make XIP testable in QEMU
Message-ID: <20231212-customary-hardcover-e19462bf8e75@wendy>
References: <20231212130116.848530-1-haxel@fzi.de>
MIME-Version: 1.0
In-Reply-To: <20231212130116.848530-1-haxel@fzi.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_052336_508695_51200BF8 
X-CRM114-Status: GOOD (  13.56  )
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
Content-Type: multipart/mixed; boundary="===============1993334894726025830=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1993334894726025830==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xSuSDjmgmyqSuJoL"
Content-Disposition: inline

--xSuSDjmgmyqSuJoL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 02:01:11PM +0100, Frederik Haxel wrote:
> XIP boot seems to be broken for some time now. A likely reason why no one
> seems to have noticed this is that XIP is more difficult to test, as it is
> currently not easily testable with QEMU.
>=20
> These patches fix the XIP boot and allow an XIP build without BUILTIN_DTB,
> which in turn makes it easier to test an image with the QEMU virt machine.


Are you actually using XIP in something other than QEMU? The fact that
some of the blamed fixes are over 18 months old suggests that you are
not actively using XIP builds of the mainline kernel.
There is a desire to remove XIP support (among other things), so if you
do actually have a use case for it, speak up.

--xSuSDjmgmyqSuJoL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXhepgAKCRB4tDGHoIJi
0jcqAQCByPwOCiYOjlVouNbs/zKoh371UnfHZ1BeZJiI/QsL0QD/SOI4PuK+QXAU
+SeC5o/vGm6VXMQZICUQ9Qdax13aTA4=
=UatY
-----END PGP SIGNATURE-----

--xSuSDjmgmyqSuJoL--


--===============1993334894726025830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1993334894726025830==--

