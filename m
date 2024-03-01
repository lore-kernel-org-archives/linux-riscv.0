Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82388C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hILS59sqyhvI2ityitCH3av2coooskAcZEPDKUUsc8=; b=RxAfP0mK1uxXO7oAx0GD5ogf2X
	ys/DZ/G2S49nnOIxi2+3nUy2oPer2P8Bnya4azIJ0kd6J7lVMz5HqA1Rhfsg/D5FIJdPunXTmkML8
	GR4xPkL4Y0Xxck29im9wyFU7LOhmG2ZpwLRu1S/YBWh0TqVJq1e6UX6L1veg/+UxHBFZZvXpMLurp
	CCRJI/Vi1UWBJ/xCAi+iFOEmkOAJQ3ZXw+L0AX978rjKbWK1mYEhvZWb51OpvWD5hUGWj8zieLvZV
	FjE/IXU7lzmecO41e/PCI1MQl2eKwC0vV2CXbaDG1SwEIyprlAGC6jbfwrR6CXbADydgonKOs2OqE
	ILXIpdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzFT-0000000HBKH-3eja;
	Fri, 01 Mar 2024 09:32:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzFR-0000000HBIQ-11mG
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709285529; x=1740821529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DsLvThxyye5L9p+9g8PJUi8GdFQh8lzXSAENkivdX3w=;
  b=jh4Fk0kiCS1kpb5LD9Qq293YG1IpHMwm+nw4UidJhVraBBEa4+Rl3W9w
   3rRkxnUAdmvOU9rKf1oUCGcpUTQOC1bMlOK+mikGKdNh+1a4/bDtVCP6h
   ctcY1tU3yyRedqJo7ZL9Px/qdzXSGgav0Ygaihh/m1KMEAaTejhM9Lizu
   6+l5gOJUQARRw7pUjWqCnigk700/zR6UYEB1ClOax2hpkP4QrPiFXzRP7
   OAMz3HBc1ER2wi9Gohu+/SHLsrAx37GlTTm3Ezcnt818jFjvF9f2AlzlB
   RoUK+HIOsP81Ntps4R71A7p3Kq8JfLpct/IOk6u7o8eJvq+jXSGqj4KoS
   g==;
X-CSE-ConnectionGUID: M/vfrS4FS22yqV9NCgJOCw==
X-CSE-MsgGUID: AaMFphW2QQqFpaO8uyVc3g==
X-IronPort-AV: E=Sophos;i="6.06,195,1705388400"; 
   d="asc'?scan'208";a="18671665"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Mar 2024 02:32:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 02:31:49 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 1 Mar 2024 02:31:47 -0700
Date: Fri, 1 Mar 2024 09:31:04 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Yunhui Cui
	<cuiyunhui@bytedance.com>
Subject: Re: [PATCH v5 00/13] riscv: ASID-related and UP-related TLB flush
 enhancements
Message-ID: <20240301-dreadful-discourse-6f1bb453d9c6@wendy>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_013209_315123_A58CE040 
X-CRM114-Status: UNSURE (   8.58  )
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
Content-Type: multipart/mixed; boundary="===============5903857754846984980=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5903857754846984980==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KuBrCPUMUGSkl7W1"
Content-Disposition: inline

--KuBrCPUMUGSkl7W1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 03:21:41PM -0800, Samuel Holland wrote:
> Samuel Holland (13):
>   riscv: Flush the instruction cache during SMP bringup
>   riscv: Factor out page table TLB synchronization

=46rom here onwards, fails on 32-bit, bunch of
implicit-function-declaration stuff.

>   riscv: Use IPIs for remote cache/TLB flushes by default
>   riscv: mm: Broadcast kernel TLB flushes only when needed
>   riscv: Only send remote fences when some other CPU is online
>   riscv: mm: Combine the SMP and UP TLB flush code
>   riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
>   riscv: Avoid TLB flush loops when affected by SiFive CIP-1200
>   riscv: mm: Introduce cntx2asid/cntx2version helper macros
>   riscv: mm: Use a fixed layout for the MM context ID
>   riscv: mm: Make asid_bits a local variable
>   riscv: mm: Preserve global TLB entries when switching contexts
>   riscv: mm: Always use an ASID to flush mm contexts

--KuBrCPUMUGSkl7W1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeGgWAAKCRB4tDGHoIJi
0j7VAQCqyB+uhdk++uoEdTRPw9kB9GZ2ogwRdC1lz8x5plLgMgD/Qgdj+Kj5he2G
JsKRaE3rZaO3XisZfINqKJi6qkDmZAc=
=5gaT
-----END PGP SIGNATURE-----

--KuBrCPUMUGSkl7W1--


--===============5903857754846984980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5903857754846984980==--

