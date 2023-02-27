Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE44FC64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1fQy3XQ9vrKOEWXj9AgqTVkemJnqfLj8IOQMTTI/y4=; b=XfBeX+OKsGrqvTwkI9OchFqluf
	agP/K2lM9GObnyDe8QIpnjvKiOIebke+YMiYGGXEtG5AgR7BE7tBe+s0xj7by8hxnbnE5pP/ckkbf
	Y8HmjN/sJvKGF+BhHZSdXuo8P+O/U/gTDrK8nevvnsW4AdVz4HHTZcgoQOzFHvwb3q4Nz5efAaFmE
	uvxpFRYyLVHG+JbHFVdPVNVelyQuxa4hw0jHBwke9YHLt5/E8kZmwjQLUeXiUn6k9j5dtt//McfaN
	sPj4X561LAADipJ7ER9gYUfvadgm+hHUUwbsjWD9zNVOrwmhZQeqrxgfRoq9wRpVQ2X/6osqICi5G
	gdgLxYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdmm-009pZb-DZ; Mon, 27 Feb 2023 13:43:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdmj-009pWq-F7
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 13:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677505402; x=1709041402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B8kKgrBjxWQyCV0wZXde3NVGF5SDI0kmpRoxcky0ObQ=;
  b=fs/LOIKqQzr0ylFUwF5Y4X3eSwwJPYrJfwYGtjKXrVqnoYn0YZjlQrYZ
   D1YKeLCZ6LrHOwL/oIlw/3QcmT+iLW4qCx0UJ+V9NYNkBIoKvIS+O5yq8
   hAGTIa8RBSL5WFE3WcVG0+4Aaa3XUqhHI+tORsUqIcJZWmB5MkQkF9qIs
   dbCxrhi6NoudXtVY7qfH0GjYYmVhLNxEQ60xMPyTBkjPKPJgnv+rSy7Qa
   1AaGfnyzl7T7wfd+DWaNXVrU4l1M97Mqzu+YWrvBAcO0RnRqx+3GxUVXc
   MicN+EoHRS9+6Lb1VIascOnEMVX75hIBYtRg9+NrvKXL9MbWR2wBN/aax
   g==;
X-IronPort-AV: E=Sophos;i="5.97,332,1669100400"; 
   d="asc'?scan'208";a="198931385"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2023 06:43:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 06:43:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 27 Feb 2023 06:43:13 -0700
Date: Mon, 27 Feb 2023 13:42:46 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Ard Biesheuvel <ardb@kernel.org>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, <nathan@kernel.org>, <llvm@lists.linux.dev>,
	<ndesaulniers@google.com>
Subject: Re: [PATCH v7 1/1] riscv: Allow to downgrade paging mode from the
 command line
Message-ID: <Y/yzVv717htZLuRY@wendy>
References: <20230224100218.1824569-1-alexghiti@rivosinc.com>
 <20230224100218.1824569-2-alexghiti@rivosinc.com>
 <Y/yilORflGv3vXjX@wendy>
 <CAMj1kXGCkqpHY7rHZv0EFKhPNk6jpbh1OfG_Jm3vSW8c5Y+9_A@mail.gmail.com>
 <6bd8012a-7311-7956-b0ae-966b8534a64a@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <6bd8012a-7311-7956-b0ae-966b8534a64a@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_054321_646085_E65A9771 
X-CRM114-Status: GOOD (  10.00  )
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
Content-Type: multipart/mixed; boundary="===============3976301208921319769=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3976301208921319769==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i8ZwX1OEi/syzAPO"
Content-Disposition: inline

--i8ZwX1OEi/syzAPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2023 at 02:27:11PM +0100, Alexandre Ghiti wrote:
> On 2/27/23 13:56, Ard Biesheuvel wrote:

> > Note that we switched
> > to --orphan-handling=error on other arches, as the linker sometimes

> It seems orphan-handling is set to "error" only when WERROR is set (see
> CONFIG_LD_ORPHAN_WARN_LEVEL).

My CI explicitly disables CONFIG_WERROR for allmodconfig builds so that
it can run with W=1, it is indeed set to "error" for regular
allmodconfig runs.

Thanks Alex/Ard,
Conor.


--i8ZwX1OEi/syzAPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/yzVgAKCRB4tDGHoIJi
0v7sAP97bImU6hzDN3fw3MI74GR1HLzo1JA7yvIRvToGW+BFVQD9E0SqjMsSvsa0
8IM3znP8VY/yIXWltmbmNqpvKDHp5QI=
=46Kj
-----END PGP SIGNATURE-----

--i8ZwX1OEi/syzAPO--


--===============3976301208921319769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3976301208921319769==--

