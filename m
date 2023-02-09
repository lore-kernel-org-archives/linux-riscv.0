Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9057BC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9PSjFfKgkm2LFh+NQhs+RGUY2640tvk2U10Bb+p9lw=; b=PWnqhP7/BvMfntLw+uuw5z5Arx
	6cHWgV5j5AYjykoPdiR0wrNBN8aFNQdp10GgnCImJ/LU8I7Su3BVrX0gOrotlKmS9BY9w6CEcmglh
	0hC8dYng+cUGesGgzpAEDXo8Lw2NvWYCgwlQz+Rn06bJZMsR6iNW9N4hgb2HJ95lbIsWgVYLfw7XQ
	1JczqGHj/PaIkEcA5CmC9wbWBz8dEBZHJggQanN0HIvNyDJD1Yzv7Sf987kVJ2VI7UgzVUwUOGwph
	2TpEycJFCnJtLBzqVO7WNfVgfiS1w90gSK0pp4JnqB/zTBdWXDJSIM2FiueFaNM7AUbbWQSELQeyF
	SC6IP10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7PR-001sPm-VH; Thu, 09 Feb 2023 13:56:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7PO-001sNP-IU
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 13:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675950978; x=1707486978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mFETGPylXKDhgem1asSidam4fK+zuxCYPJ01s2tooMU=;
  b=Gdd8OFoxchLOYEWsNU26BGPcXaOXoA0kmrHWicHmqJ3+Qt08CHaoCvUF
   a9WOFwciJqgOQ9TUrrfqSxjzHE0Nhuv8237nZd63klgwIP+BbfpF3T7WR
   89X9iPKXmfv7npWIuspbuZ+NjvrPZ2M7o+ZxuRWbh1uXA4pMh/tOuin3q
   TAn83RjxbZSFemJM5PVc6tGYYnc+ILAQiaUYv7iqjIpE/OyvlSKBO725Y
   L3NHd2leVy7EK00flh+wnUDgdi85Kns7gwnuErLNFXzlMZTE8pxRIuadx
   peAmGCpzmCE+Q+kxksMq4uzsFaDBCxp8DIZEycXp/8bFl1j2nvpABxI8y
   w==;
X-IronPort-AV: E=Sophos;i="5.97,283,1669100400"; 
   d="asc'?scan'208";a="136355799"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Feb 2023 06:55:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 06:55:44 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 9 Feb 2023 06:55:42 -0700
Date: Thu, 9 Feb 2023 13:55:17 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Qinglin Pan <panqinglin00@gmail.com>
Subject: Re: [PATCH] riscv: hwcap: Don't alphabetize ISA extension IDs
Message-ID: <Y+T7RQU/069DPwOF@wendy>
References: <20230209123636.123537-1-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230209123636.123537-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_055618_695500_44FFCFD0 
X-CRM114-Status: GOOD (  13.33  )
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
Content-Type: multipart/mixed; boundary="===============6861263708677344169=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6861263708677344169==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wQmqi5yCyjA9Bhaa"
Content-Disposition: inline

--wQmqi5yCyjA9Bhaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 09, 2023 at 01:36:36PM +0100, Andrew Jones wrote:
> While the comment above the ISA extension ID definitions says
> "Entries are sorted alphabetically.", this stopped being good
> advice with commit d8a3d8a75206 ("riscv: hwcap: make ISA extension
> ids can be used in asm"), as we now use macros instead of enums.

Yes, this ideally would have been removed by the commit doing the swap
over, but as both were in-flight simultaneously it was missed.
I intended going looking to see if this was dangling but clearly forgot.

> Reshuffling defines is error-prone, so, since they don't need to be
> in any particular order, change the advice to just adding new
> extensions at the bottom.

This aligns with what we "agreed" on Jisheng's patchset was the sanest
way to handle this.

> Also, take the opportunity to change
> spaces to tabs, merge three comments into one, and move the base
> and max defines into more logical locations wrt the ID definitions.

Sure, why not...

> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for fixing this up Drew!

--wQmqi5yCyjA9Bhaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+T7RQAKCRB4tDGHoIJi
0jYWAP0Quc5G3kr52HuInpZIRfMYJcJsIkBnzSQDCH8MQXtqOQEA23TV+FmkeOTj
sM1WC1gUqMuzRFn/Rkem7leJhx7N5wI=
=Xy3Q
-----END PGP SIGNATURE-----

--wQmqi5yCyjA9Bhaa--


--===============6861263708677344169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6861263708677344169==--

