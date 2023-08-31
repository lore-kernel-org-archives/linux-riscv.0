Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D884C83F2B
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 05:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=in1Ptk+HSviCBG7HS8OiJFyRwaIQlw9QHw9As5e+iYc=; b=zIMNxk0TpZ5zrY1jyOldA64KjD
	BsvDqxwt+YieXZhtBu9ADrlEe2uQANUlF+KIv5DF25TFfxJa8ZZIjs9qRbsB+/Nq80O72PLijfi+e
	2lnHHnUbMtrx+amf11+lP9NMaHLNMWVSQyp6RX1RTysb04NXcYDMyBCKL9iPKLIHIJ9bBd4b1P5/z
	oiZRRoBlLDly0bzTey0bRO35jtwwhzWXYwFsqtLOVcEu4ahDlIQ4SA6pKijLqI5UUet30VCo4jMh+
	42JwEBzV5bhjhImI5tLBt7yVNCrocaYBJ81r012PJAAR3xHjkX3jeS0qM2Ih59ezYBbU+0KJ69mtu
	xFQX1L6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbaKA-00Egya-0c;
	Thu, 31 Aug 2023 05:34:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbaK5-00EgxO-0U;
	Thu, 31 Aug 2023 05:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693460069; x=1724996069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5fTpKtpTH7VHtgXBTshu0Z6bHpAk6pRiOhKHGWRzMK0=;
  b=Ns6G0SCuqW1oV4sj9hTYOmBUHnPWgM/DLjHKUkeBnA9JuDhjE58RdEFs
   uDLU3rl7CZ3FDvAyQKOEQYKKl33aL+WqD0qfB1XZInw3bOUuEXawz7Yfz
   ctyrmfsaq0ypUi8QX8fkiLFPyiPBPsVlFOXWXM4T7s0Up6tsAG8sP6XA0
   HGS16VbLM8GLV5Tn+04spddQkVopv7Er0kWAi48DN/RtBN6qAFxwYxdzR
   xjqdW1TOb/yOgaio8sGKSzAnM4wZiYMJ2hfleTCCzhLD3owlKh93bdlDJ
   1FfShAy4cVRapOM2XrAZR7lIYk4h/0AZOuGDeDcJdz9qsqVQvmKS4KkO/
   Q==;
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="asc'?scan'208";a="2169620"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2023 22:34:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 30 Aug 2023 22:34:24 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 30 Aug 2023 22:34:22 -0700
Date: Thu, 31 Aug 2023 06:33:39 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Sami Tolvanen <samitolvanen@google.com>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>, Kees Cook
	<keescook@chromium.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-efi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 0/5] riscv: Introduce KASLR
Message-ID: <20230831-reclusive-panning-f6a912e07fbf@wendy>
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
 <CABCJKucj78p4TBtXYmMdJ=vYK69XC=XU06uB+_fyfZLRnC4h0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABCJKucj78p4TBtXYmMdJ=vYK69XC=XU06uB+_fyfZLRnC4h0A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_223429_198387_91CEE89D 
X-CRM114-Status: GOOD (  10.98  )
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
Content-Type: multipart/mixed; boundary="===============5242016691429500759=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5242016691429500759==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XwDbeznsdT2oG++s"
Content-Disposition: inline

--XwDbeznsdT2oG++s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 30, 2023 at 02:30:31PM -0700, Sami Tolvanen wrote:

> Conor, in another reply you mentioned you're planning on reviewing the
> patches as well. Did you have any feedback or concerns?

I didn't even look at it again. Been really short on time & I guess just
deleted it from my queue when I noticed I'd tested it before.

--XwDbeznsdT2oG++s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPAmLwAKCRB4tDGHoIJi
0kjyAQDCH3DesLWi5bCCVWfpuHL32z+qMDgemCmZWh1kcLp/WAEA4qIw+dGQtQoi
81uNCBhySZ9MfnKpn2soFTsYUfMujwI=
=n/yh
-----END PGP SIGNATURE-----

--XwDbeznsdT2oG++s--


--===============5242016691429500759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5242016691429500759==--

