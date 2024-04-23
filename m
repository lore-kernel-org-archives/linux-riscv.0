Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B583C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbgMIUaJfvrmhrEh4XAfKe8M3X1G8hMRogS09h7AfCA=; b=49HV2QH7Lw2O/fzHUVchgRkNbf
	lBH/ylPWjmKODKlySSYZFnH7WQLkEO8b0IGnJf6nszFVne3u2Ckdvjcw+NPM6KI8eDgOVlS0UIUEG
	j6qoRZDSAFxMBYhcPUmYT2DWQ2d6utQTflzROqIQNjyVrgkr+eTfIn5vrCc7ENwD34bOelp1EbU7Q
	LpeSiaqWYCr89O8qc4ImzAgeNWdfe4jfwuH4ryzsD8jxWD4mSAaTKcSVeHKe8dtVoyVP+ZAv/y7ji
	mqboGby0Z/PSY5CjGtzYRUbTWZ4GaLyWkeMcEo1hTb73oQdvIexpSdJNFH6JpoDmK39OTKrwqONvM
	fMijAuAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzC6a-0000000Gauu-10es;
	Tue, 23 Apr 2024 09:06:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzC6T-0000000Gasv-2ZT3;
	Tue, 23 Apr 2024 09:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713863177; x=1745399177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XMn7M08VAzGCI53VtoGQoqVtWefSLc/r2dxdCOixMlg=;
  b=tBJblzsJhyDF4VlPWGSTUDsS8GLShFoLKDL9CC98IRcF6hWNnE0iwJI5
   fHMjfbYQGOtR3hPtGnXvpPIxXQL9kM+QWBCP3DGuvzYTvHN8IhTnxgIMT
   XDWGzjCQm2u3AJaKo2SUmI+kfgf/W7xKZ+K+bxksLQHOVSEYzwuiMPtUE
   ltnYRQ1KMv0lyg+2VsTJnFKys+yjWauTo5pC4SoLHTGHkZW+SKOVSryME
   vda7PzAvXw2deI6flY5uLGuqFuzOaVzXGveOBHu7i/vnXYjpbuSZa5sVY
   Mf8RwmQT2a8+ajuSQqXpwn8HK99Kfyd0yy43X64Ad6ac2zz+1Q6gKt/G0
   w==;
X-CSE-ConnectionGUID: yLK00K/sTo+kTWIrIYKswA==
X-CSE-MsgGUID: ojhUeRPgSNOFyMORz/qOQw==
X-IronPort-AV: E=Sophos;i="6.07,222,1708412400"; 
   d="asc'?scan'208";a="22226831"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Apr 2024 02:06:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 02:06:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 02:05:57 -0700
Date: Tue, 23 Apr 2024 10:05:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	<linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <anup@brainfault.org>,
	<atishp@atishpatra.org>, <robh@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<christoph.muellner@vrull.eu>, <heiko@sntech.de>, <David.Laight@aculab.com>,
	<parri.andrea@gmail.com>, <luxu.kernel@bytedance.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <20240423-bulldog-mace-400ace9e7bde@wendy>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
 <20240421-f63f90c2146deb0695b84441@orel>
 <ZibmfbLnGCb9gmow@ghost>
 <20240423-ed9ddb701be1df4a25e29f31@orel>
MIME-Version: 1.0
In-Reply-To: <20240423-ed9ddb701be1df4a25e29f31@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_020617_893781_D54438AB 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Type: multipart/mixed; boundary="===============2043962135396521046=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2043962135396521046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oEfHuumaEi7etN6s"
Content-Disposition: inline

--oEfHuumaEi7etN6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 23, 2024 at 10:46:01AM +0200, Andrew Jones wrote:
> Maybe I'm attempting to document it in the wrong place though. Maybe this
> is more of a Documentation/arch/riscv/boot.rst type of thing.

It might be good to document it there also, but I'd like to avoid being
unable to rely on what firmware tells us is supported because we have a
stricter requirement.

--oEfHuumaEi7etN6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZid55QAKCRB4tDGHoIJi
0ubLAQCfajys3aX4THyXKluE7/jtW8pkxRCwLx2RfN61L243GQEAjF/xlRCeiW6q
3gUVqOwFCcfHQK4ZftTZJvSz3Y0QzwQ=
=bNT1
-----END PGP SIGNATURE-----

--oEfHuumaEi7etN6s--


--===============2043962135396521046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2043962135396521046==--

