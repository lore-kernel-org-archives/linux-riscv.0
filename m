Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32B7C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCnDgs8UHZbCGDrOtlYjdTL4oBEPfs3Hwre2ZEKdZ/c=; b=HWYIHb/9qkBi9skg2dltE3T2jZ
	W6y0thQO4JaQLqJ5sHoxXge0LjJOmkQqnwqbMHcfVeoiOK+qB5enYN/BEzX9kTrV6Yyl4q8fJGtsh
	femPCw2mophVj5iZZKojhiDlHOV5zxQYvKNEy8eeyr2cFw0H12WRL/Hw9eP7z8NFjnuwdubt27/pc
	NTXBdyCvGSrp4OEkZEAAjxWkYwRzOrGLsPAuvRM8XnxMnJJ0ZeRCQW/+UMnj4aAaETH4SwCCIX58P
	adVXhenU/gkJlADVwCoWkmKloueVCILKqwA9+u1txE6GmVJj049Or8RdtXRV0mExoCr1PjKUuVkgI
	iT+q5+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prybP-006780-1b;
	Thu, 27 Apr 2023 10:11:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prybM-00676x-0X
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 10:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682590307; x=1714126307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=llj1k7SyZo897TodgO+NWeNu2kbu92eWibZnQxYXlIo=;
  b=EVZy0N/UYJjqC5P2NPuarPBwMxeQ9EF+gLx6NnpBKAJYoq/35RgXVD1U
   IXCAlT3SpTc11WdRonFuxu4eRgeXkRTmoNjWFdcUBHuR6SaZkHBrtuP3N
   7dFgbUStZ97xqi6VlyIp/zsh+vHLd5RTxPHQXlYn7KCvn6WgXlycDrVUd
   RThnzxrIns+BGlhqH59YDxYxm7Q4U8XsJG5B4FMeFB28mLZtyD6jDT9TN
   ze1zUNaxkcPxX8T6PG2ChUgCjT5kvjPLieAJNuVbl/GUqeDhzm5VErGW/
   onGTpzu4QWNuTyH8LMYYmBgr0YMH8JKLlz4GRUqqKFx6Xr89wnUkmSzNd
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,230,1677567600"; 
   d="asc'?scan'208";a="149214073"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Apr 2023 03:11:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 27 Apr 2023 03:11:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 27 Apr 2023 03:11:39 -0700
Date: Thu, 27 Apr 2023 11:11:22 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alexghiti@rivosinc.com>, <heiko@sntech.de>, <guoren@kernel.org>,
	<anshuman.khandual@arm.com>, <mick@ics.forth.gr>, <samuel@sholland.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -fixes] riscv: mm: remove redundant parameter of
 create_fdt_early_page_table
Message-ID: <20230427-lecturer-goon-a7c1245fa2bb@wendy>
References: <20230426091511.674496-1-suagrfillet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230426091511.674496-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_031148_265202_F733435F 
X-CRM114-Status: UNSURE (   7.97  )
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
Content-Type: multipart/mixed; boundary="===============6590544769586961694=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6590544769586961694==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B4nDN1w4sHZ1Joe6"
Content-Disposition: inline

--B4nDN1w4sHZ1Joe6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 26, 2023 at 05:15:11PM +0800, Song Shuai wrote:
> create_fdt_early_page_table() explicitly uses early_pg_dir for
> 32-bit ftb mapping and the pgdir parameter is redundant here.
> So remove it and its caller.

"and its caller" sounds like you're removing the caller itself when
that's not what you're doing!
I am certainly not suggesting that you resubmit because of that though.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--B4nDN1w4sHZ1Joe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEpKSgAKCRB4tDGHoIJi
0tdyAP9IYmb79WDRFsH48lzLc2Tk5z6eDoSPuuP8mLa3KlnjRQEAjzhtySq7Mq/m
xlkT1FzflYgXZJShfdRO0yJ6DEQL/Qw=
=2zWl
-----END PGP SIGNATURE-----

--B4nDN1w4sHZ1Joe6--


--===============6590544769586961694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6590544769586961694==--

