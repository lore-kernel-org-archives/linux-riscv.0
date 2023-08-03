Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBEFC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgMJ8XMkIuMP2LmnfEFh3yLFu9URsM92SSbyUsFEeaI=; b=GqtABR73BLMyBbCDIHK3eweOmW
	nbujtQ+rCqLY36jXa+B2cZsDcP8XQZkDy3hmKid0+OJowx9TQ6QwS65ofszqFcjbNLf2s5n/vntwU
	SeB9hSA30VfTLsXKzgFoyZjL5pJvo5hAkog77N4qjGGdpVQRRvm290dUFpjkefpnBNFozPRIVDJ9D
	my27Cj2dLq9Q9LYCZYLT+s6Jaqe59mIIG97NK4txZkPHzvUUYaiHMpwsa18Z2kyFogkVTPjvC/6SR
	202A0bSq8o44OCtcuNU+wFB6c7BXB/jZB25piwMh7aOYbhTtbWZ37ggR2jBxVOW2qVeiZG3DKOn82
	SOSb/N1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRVbe-007Mxw-19;
	Thu, 03 Aug 2023 10:30:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUUK-007AYu-2U
	for linux-riscv@bombadil.infradead.org;
	Thu, 03 Aug 2023 09:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iyu2F1JT8sOFPz+Gp6fcbz1PovWQBilZGpXmG0uf2ys=; b=hwBQMDbKJArwChF6auuuX8sTOn
	CZgSdP1u42SYJMo7PS3ay3Sl1G5CK+pWzMMol1qob5O6KOIHVejKazQZ+MNQhgSiSV9B5IBOf2Dut
	HE944pcfhmOfLHcQ3Abh/IswdVxTnsJLZIjleSnH95ZZARZbxJt+TLDviUVNbjL0oFsCbe+TIv+fz
	j/kRtt57fIPmSjNvgzNH5twD+etWQQXLmsEjDA10xHMici7TaNG45V+dvWVkhbGnmklHP8/jwY0XS
	1cwE5dlD+PD5ASS3Z9vGhGkmB0BggT04WbQ9DkJXl5DoLlT5ZfGeWZmAVZDKNknGLUiH502e8dMAi
	narRPytQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUUH-00GiCv-0y
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 09:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691054358; x=1722590358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iyu2F1JT8sOFPz+Gp6fcbz1PovWQBilZGpXmG0uf2ys=;
  b=LA0/HH/rQemNF04bsFjRiVYR7z8vPw3Fo+ZACAbE/8gJxU/k+t4lRNit
   HNcdU/OWKg2+IZAyYOluQ6TPsqN2P+rEhfupy0dxyT+3HaqHcmrhz7Isg
   hQrQhbBx8yyQ5jyyLe2vJnWM7+Ip1vnoyyM3puGBwF6CmiAgkDqjJOQRa
   pBr3ON+dIEA3VmtGFwZ71A6oP6ddYdqLRYox7adrB10Rz276qLNWi90Vn
   nb0ZQAH3KAK7ZxsB2K0Ca2v/0VDzxYEWRct2F+C43SIy17KaV/YI9v1IO
   kI/HKVIZSGZsMK5z3/IZtubrGgd3e/u05ybztXsqvSYFHN7KpNKIs+MZh
   A==;
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="asc'?scan'208";a="227772059"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2023 02:19:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 3 Aug 2023 02:19:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 3 Aug 2023 02:19:06 -0700
Date: Thu, 3 Aug 2023 10:18:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Nylon Chen <nylon.chen@sifive.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <geert+renesas@glider.be>, <pavel@ucw.cz>,
	<vincent.chen@sifive.com>, <emil.renner.berthing@canonical.com>,
	<aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
	<conor@kernel.org>, <zong.li@sifive.com>
Subject: Re: [PATCH v4 1/1] riscv: dts: sifive: unleashed/unmatched: Remove
 PWM controlled LED's active-low properties
Message-ID: <20230803-avenge-vaporizer-8258cd3ed423@wendy>
References: <20230803085734.340-1-nylon.chen@sifive.com>
 <20230803085734.340-2-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230803085734.340-2-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_101917_715095_EBA425CF 
X-CRM114-Status: UNSURE (   9.18  )
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
Content-Type: multipart/mixed; boundary="===============7410291389473176028=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7410291389473176028==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ttHvIlaft4ITbXCH"
Content-Disposition: inline

--ttHvIlaft4ITbXCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 04:57:34PM +0800, Nylon Chen wrote:
> This removes the active-low properties of the PWM-controlled LEDs in
> the HiFive Unmatched device tree.
>=20
> The reference is hifive-unleashed-a00.pdf[0] and hifive-unmatched-schemat=
ics-v3.pdf[1].
>=20
> Link: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf845=
3f8698_hifive-unleashed-a00-schematics-1.pdf [0]
> Link: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce7=
6f4192_hifive-unmatched-schematics-v3.pdf [1]
>=20

> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Since there is no PWM driver patch for this to go along with, this ack
doesn't mean anything anymore. Please drop it if you resubmit.


--ttHvIlaft4ITbXCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMtw5gAKCRB4tDGHoIJi
0tnFAP0Zc9lgzavW5BcBnULMuCokFPIRFh6giiSMIiiNxXtIIAD/UOJ7eZR4vZrq
G8wToCxvQNYV0/XzSojKzSKqZODO6As=
=DKmS
-----END PGP SIGNATURE-----

--ttHvIlaft4ITbXCH--


--===============7410291389473176028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7410291389473176028==--

