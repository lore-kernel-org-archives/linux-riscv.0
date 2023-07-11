Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45028EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11Ukl7sJtMfYLmonCOzPgcHnVN0HhEIYhUFhHp+OgUY=; b=V8v6othV5ij5zeYRC+eUw/F6Us
	XaZTGUKvt2zYqKcyD9LaYrtRwFfpPLrtTrDoqzqoEf2pKV5SFQYyyrQ3T4Ch4nhj4Kkt98X2CFNsp
	3eJ/v90eMUaTPH4u7BhB6xBgpA48LEjGWL6ha3Uu718cSh26xfLJ+1eT7E08PEpvg5QjFUuEwtZXJ
	2xaZkyQeRBmbT37KHXcrbEDWkqzaaGxXSiNhVOcDgY4jvsIYrF6xFx7F9TuVXLE6ofARb4cMbxNHh
	PFKuyOW6p1UYGezTeE0Rj5pKI9nMpcee1z7okCQg4l6D9zjVR/M19xy4CpdZBoADvFUQ+Sueu8+v/
	+NVr/pjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBQr-00Ekpe-0W;
	Tue, 11 Jul 2023 11:21:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBQn-00EknM-13
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 11:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689074482; x=1720610482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BtwdLSiym59o1DrznC492yD2dJ/cAL9RGvqKk4h6Y+A=;
  b=chZGbwW6y1Li3mjJ+QjR8MVYVTbA9PIjhQFtgj2o0ldkWt6X+affEjuZ
   F9uzFONuBI02NNstgazkKI/g2/dPSOGfDjbpHYvFH8OgVmuc4rdmfsAnJ
   7P5QjmFNwW9PrWtE+1yO4zQ8n9LgAHGGyW43P9PCQf9/xBeZhqNSo6L5d
   k5yBbUlRmbtCo6xlhZxDWzi+cAA8vjW4zS9R3pE3ca8RvSGBrvGi34YIF
   KfuXWmHazEmSi5slELITIi3AzIYA4WAiqH4jOUZH9rhmvWr1RO5bwrrzp
   MkpYMi5PSp2gT1IBv2OBuqGt0E2oD8629k/f73UHur1yh9A9TbfGDAw/v
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="asc'?scan'208";a="223099167"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jul 2023 04:21:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Jul 2023 04:21:17 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Jul 2023 04:21:15 -0700
Date: Tue, 11 Jul 2023 12:20:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 0/2] Misc RISC-V timer driver improvements
Message-ID: <20230711-remission-from-581829b1ff05@wendy>
References: <20230710131902.1459180-1-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230710131902.1459180-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_042121_457442_FB1A2A11 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============8292689765461818269=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8292689765461818269==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pOCE+3HdPQhgGlY6"
Content-Disposition: inline

--pOCE+3HdPQhgGlY6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 06:49:00PM +0530, Anup Patel wrote:
> This series does two improvements to the RISC-V timer driver:
> 1) Keep timer interrupt enable state in-sync with interrupt subsystem
> 2) Increase rating of clock event device when Sstc is available
>=20
> These patches can also be found in the riscv_timer_imp_v1 branch at:
> https://github.com/avpatel/linux.git

Other than wondering why you opted for 450 (curiosity really), this
stuff looks fine to me.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--pOCE+3HdPQhgGlY6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK07CwAKCRB4tDGHoIJi
0j7pAQCJ35VuI5FCicsChC20YXbYXFS71ClF3UbO+6hIao19zwEAork915p5cLPc
U/+WO9wBead32JpGTrl+GduNOhTD0wg=
=i+Kq
-----END PGP SIGNATURE-----

--pOCE+3HdPQhgGlY6--


--===============8292689765461818269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8292689765461818269==--

