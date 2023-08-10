Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78527C001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsWcft6ozK/bp0PW51p6DYd+Gm3KWGe6iCYjxnFNvrc=; b=0E1Lo/ZkwW+50kI6WyysM8rvGE
	PQSJHFN5uPaoIvsx0p3N0v1eTxE21D/DHCaOOmsOSX6QGn20fsRVcwpOzbqEoMzWYT6+CnjCJNMed
	As3AYAwnT+SuTlX2a/URYrFZ7pPArDAOnK4XAgA4/Uqm5ooqjZNMNK+ENe85k3pB9Ub0BfZZhkjuo
	jB3lCPb/ZBBO/NLbA9C0Cj2WM8w+1tFrNkUWldEwSb5lN+w7aRn0AKvjWgeJLlSxmwv7ja0CmkLDu
	WFNtAP2mCZdS/EjCO5F07yaPF3W9HgbE5BqExRRMq8RuuvzRpnX9ytOnf72KYx6NW3Vav+cYndjQD
	MCY/d4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU25i-006zcr-2O;
	Thu, 10 Aug 2023 09:36:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU25g-006zbU-1h
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 09:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691660184; x=1723196184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rL45776IPmL57D/5io9UPcwm2kvRst5ojuX/oAivELU=;
  b=J/7C0jOlW9/CJIROeEczRxzwE+KneXAENaVVBUTFmXrEeOYQ4Z1Ad95c
   /rrAEVL2SNoNYiSJQkp5v5jZX+dhAbWjIbkEHpQt/FNCf+C8yArfBwgmk
   uXKtoIox9fHsg3HbWHrkUfWOmXFOBKFvLB6hkqvHpungtlhq/3dmMLgsw
   WY2josWXn1Sk4q3ItOo3U4zY+T50ub+BYZ2N204xXis+w/J8Xs2sdDaRS
   rKvwuUJLs1EhaLyk+upn6YzqwZoPLPITM8qUdD0a8R+F7GxieMcl1Hl7B
   JEgfDyXn77AAUk1znv5HmfKqSkTZC3aFoUhtrLa+Hf8o2laeaIdDy+J/g
   g==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="asc'?scan'208";a="228207918"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2023 02:36:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 02:36:12 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 02:36:10 -0700
Date: Thu, 10 Aug 2023 10:35:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <evan@rivosinc.com>,
	<apatel@ventanamicro.com>
Subject: Re: [PATCH 1/6] RISC-V: Make zicbom/zicboz errors consistent
Message-ID: <20230810-tusk-handclasp-b6f36329ee3a@wendy>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-9-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230809115516.214537-9-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_023624_570774_73E63856 
X-CRM114-Status: UNSURE (   9.16  )
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
Content-Type: multipart/mixed; boundary="===============0267657656804074108=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0267657656804074108==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BorbsbH7As8xu1hF"
Content-Disposition: inline

--BorbsbH7As8xu1hF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 01:55:18PM +0200, Andrew Jones wrote:
> commit c818fea83de4 ("riscv: say disabling zicbom if no or bad
> riscv,cbom-block-size found") improved the error messages for
> zicbom but zicboz was missed since its patches were in flight
> at the same time. Get 'em now.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--BorbsbH7As8xu1hF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNSvZQAKCRB4tDGHoIJi
0ue2AP0cSFj+KQWumN/wefjes2j9XvpJCYFITX2hmWgVS0/r+QEA6eK0nQLclvB9
C7oHdaIZUkc79hEo7lpiLL5gR5lVZgk=
=eubG
-----END PGP SIGNATURE-----

--BorbsbH7As8xu1hF--


--===============0267657656804074108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0267657656804074108==--

