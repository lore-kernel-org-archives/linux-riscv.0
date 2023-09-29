Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A7FE7F154
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ye9vbXpU/gcPlf1SrlxQTtaaUJMqtmC84+sbXEGDhFU=; b=g9TvzHCHcpry6E0XH+MBiRbA3E
	Z5OBB0Gy9zgP/m1scZVu7L4GDbh7vdVYmvM2BrzBH5LkWAB9IInxtKT4nnCRyPUrzyByA3JpWOVC0
	1WYlE6k5opefLdPhFm+eVKV+G0JNpQ3SstTDKyxQrCrsW2avNiRr4tQDxXubCbOxNox/HEAHFg7PY
	0y5Dxrg8/usORCW5tMRnkjeas1vT8CE1VcXTKex/vk5TFPetlytJJMadCAS+0OLRYLLCxV2Kd8xn3
	kcsL+ZgeTIiLk3xNt7oJAwL8IAKG30fnD+GRQhG/LS6P7cMjUD5NhCc/JtzaQL1Mi1K1+1FUUBCZw
	Xufijc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmBXR-007mQM-2w;
	Fri, 29 Sep 2023 11:20:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmBXN-007mPK-2B
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 11:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695986402; x=1727522402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2wd8hNfqDmjF7C1js4hPPPyB77InnQk/OjtqUahMXdE=;
  b=tFSxSFEAa+m9e2XffY0PNlTCmNvEM5kfX79p76pSleqyfQIo0tpo+M3Y
   grYJHdJ+xtsVViU+JqZCB7dpRLvae201jwoAd6HbcrtgUhATaWX3WtfR3
   nnGDQsGyiVuTl66RbWTbjozv/UdK4D9t0KYJS0EyIP2ZZtIImAy4Legk0
   3/fHi/zlxisCeZ8PRWg2Hmbhm5M+1A6Nu3/42QDHZQdqosUs+wNBj5HFn
   ohojV2E909zxJTrRLX2+/GabPlKZUEmQ+RdAo6Um/yznCPSW5mugjyEwq
   hY6YZEZy/01e+PoLdmCruoUGtSiHtG3kRqMHRmyim5qABHsL7YIEhTfbG
   A==;
X-CSE-ConnectionGUID: IYH1bGf2TOSQ6Juu165OUw==
X-CSE-MsgGUID: uZW3FtkeQPCosKMKt797xA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="asc'?scan'208";a="7236322"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Sep 2023 04:19:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 29 Sep 2023 04:19:53 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 29 Sep 2023 04:19:50 -0700
Date: Fri, 29 Sep 2023 12:19:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Evan Green <evan@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, Anup
 Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Stuebner <heiko@sntech.de>, Marc Zyngier <maz@kernel.org>,
	<linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, David
 Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, <linux-riscv@lists.infradead.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
Message-ID: <20230929-swarm-overhear-d3c7f69c7235@wendy>
References: <20230920193801.3035093-1-evan@rivosinc.com>
 <20230920-98a392b40f88c69e852e2c88@fedora>
 <CAOnJCUK7KTO0n_8wDYDxh2ULtEvMWF-re2dEX6nng_tX1AGgPw@mail.gmail.com>
 <CALs-HsuurXBZ2p=jYKvPq6ZMScugm5rBchttD6Wv9Mtupfx3NQ@mail.gmail.com>
 <20230920-0e2bce9821557cce8d022157@fedora>
MIME-Version: 1.0
In-Reply-To: <20230920-0e2bce9821557cce8d022157@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_042001_872642_9E1451C5 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Type: multipart/mixed; boundary="===============3307875590029005913=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3307875590029005913==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s8A/BcJmznzPFheQ"
Content-Disposition: inline

--s8A/BcJmznzPFheQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 20, 2023 at 11:25:02PM +0100, Conor Dooley wrote:

> Ahh great, thanks for the explanations!


Just to make it clear that the questions I had were answered,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--s8A/BcJmznzPFheQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRaywwAKCRB4tDGHoIJi
0jofAP0QFEyUKQAoRC/Kmp6Oy+LGwnwIo9OxX/4zFLNLLg3tHwEAvGw8jgsEPOcv
UFHujmQbxa/tUHBXMXcLxBne6TpNVQw=
=yL0v
-----END PGP SIGNATURE-----

--s8A/BcJmznzPFheQ--


--===============3307875590029005913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3307875590029005913==--

