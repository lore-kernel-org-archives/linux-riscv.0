Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B229C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wnwl4Ppk4g9hDI6fAomhpWr4crCSgYAHqaee6sR6/zY=; b=K1kEp1U7EWlD5N28nGd8JEutdb
	NnSvLGHReDbnzbvul9V0S4ppgjYo0D6z4NTe+BEoCNeHci8MKtcRPf4RJpGOtGfFs7w23n6uv2TMR
	d8vGzjPeTLTWxCmWfUl4U70tE/axBtykzI/IaMiUXOK6fTUu3WQRddIuwUMULcp3sCq0shwXZ4CIo
	z9A6Cho18prNXWPQwPM2yWisygWtcvOHh3lZtBoMA0EgJ0z3W0f23w/LiMGZGRWJqU8N1Q9P+ttI9
	MtQAKliA9692EsasKcIIfvdUx9n34PwSn4a0f1B1i4YyLjAqZfJw+awD3/U7FCwckY46TTqhwvvhD
	Z1Z7yhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DRq-004qWr-U2; Mon, 05 Dec 2022 15:32:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DRo-004qT8-7O; Mon, 05 Dec 2022 15:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670254320; x=1701790320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L3TUDdEfVXXA4C8sB36l+K0kaLbB0aPyJJYOu8pH7JM=;
  b=hTFUaYUlT7cfEtRQZIAzNEkb0Jk7OZ7t0xXkaLj3Y2KdSAtwp4a19zda
   ekbl2Pdyej7t6rhtjqDNpF2USBf2Ovdvc8Xk/twMxJdxXXSh2IFt4l8Mz
   u4R62StkvBzwjXZ+m3rIP+qCYSgn0kE2xkO/3K1XVxrIne4VdIrRazAUq
   wCxImJoC1GtZG1dSgpP+Unr2RMxkPrwIGfIg49TnIshxlsVKHOAqdyS3I
   YqLtBhP5fwqW1vHFNqRmj1O4bXjYYzat/qw6Kk2kf5dm0VPffX1eXyKxf
   yo+FJ0Gm1RW1/dF/ffqyn+5ShPNEMKtWMUkXdBWVzHTqWSDsumvFkKYrz
   g==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="asc'?scan'208";a="126542243"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Dec 2022 08:31:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Dec 2022 08:31:57 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Dec 2022 08:31:55 -0700
Date: Mon, 5 Dec 2022 15:31:36 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Atish Patra
	<atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 02/13] riscv: move riscv_noncoherent_supported() out
 of ZICBOM probe
Message-ID: <Y44O2K1zBbYYuO0e@wendy>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-3-jszhang@kernel.org>
 <5629547.DvuYhMxLoT@diego>
 <Y44LTqySUMCtKoUi@xhacker>
MIME-Version: 1.0
In-Reply-To: <Y44LTqySUMCtKoUi@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_073200_343133_63501B77 
X-CRM114-Status: UNSURE (   6.68  )
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
Content-Type: multipart/mixed; boundary="===============9172845874172377995=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9172845874172377995==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jz/SVZxvlhBLeUjF"
Content-Disposition: inline

--jz/SVZxvlhBLeUjF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 05, 2022 at 11:16:30PM +0800, Jisheng Zhang wrote:
> will wait for one more day for more review comments, then will send out
> a v3

AFAICT, the patches were only sent yesterday? It'd be nice if you could
give us more than 2 days between versions of something please :/

Thanks
Conor.


--jz/SVZxvlhBLeUjF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY44O2AAKCRB4tDGHoIJi
0g44AP9T9glXMSJHOi4ecObAgE+gc0gODsNLSnzUijjLs51fjgD/dS8LZHDmZ80i
joINNAZsV3++O3M7VnMGG5SYyw5jdwQ=
=A9Uf
-----END PGP SIGNATURE-----

--jz/SVZxvlhBLeUjF--


--===============9172845874172377995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9172845874172377995==--

