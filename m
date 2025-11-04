Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B8DCCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAP8I0WPbnpd4qon4MwysFqOMbOx2mjwrPqul8Q057E=; b=w4ihMUp4VWB5Mr+v0uHQM6C5cW
	xm2czhqn/HG5ZlqMWvdNKPvIYcLBj0+A/kX5YFHUUdKI4VzfVJqTp7BJFMuCKM6/l+XxkZFeqoaxt
	dWwIcdjxmTPHWGiNwDHFVQRcGmnachIDWfYMPODofIHZ4BEZyhxOTEJFMiTLIlC4DKAIdCtpyy2Da
	OqUb7YP42qySpXVnYH+aplujJKIL0fi3QdV29YMkYag2Q1wMrybAn1z8lmTIl2Fxo+RUSjY3eoEdw
	LIALPBG7uq1N4EzSWbfYIv04vsiWEjgMY3AmELbkA8Iirs1A35bfDyZM80bLkqX2tMkP3qunKx1TU
	zVYH95dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCkq-0000000BSxQ-1DDD;
	Tue, 04 Nov 2025 08:51:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCko-0000000BSwo-3YtU
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Nov 2025 08:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UQDCjwioHc+CBKu9bQI9yHzGAmAxgJEyxRIyI6V9LfM=; b=BLD176G2dCxeQepkSycUj8UcR6
	ldUT6PpTZbg5Hp/VNNm/Qb0xur2w0y2qqw4y2Twa1kKQMpKHto6ceMkV8PJ4PTTthjMD4ScLLEOEm
	GFHvnXceDDOhHSVZ18bQ0/dTv97uosKB5ZqJdkAapKFA5RkzbEMVbuwKoBFrAvmjM1UB/256SjoT8
	jK1eirwmzLwbNWyU6WisMrfguOv+cJPfw97zejEy8IOju2Y4iQEuBbOKS5tBWUX77yROgoUP3uaL6
	4IbpMa9UEGvBCkXlENj10AZHqstb6nnUAeBrWcEYBH2uILBWBwkxlfZ04uvl5BgrJQqdc71t3tdyD
	2XcpyukA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBt3-0000000HBvC-3FAs
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 07:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762246259; x=1793782259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UQDCjwioHc+CBKu9bQI9yHzGAmAxgJEyxRIyI6V9LfM=;
  b=gCnyF2iQtMwoi0amXGz2MGt/MRgJlzVlByInImqX+wO3O+3gyH+b25Mw
   LHsNI/e/HFvXfR29LqVp3WMKz6frziQmICpV2LoNUbcXjxOhWsyZ3x5fZ
   Y7xrCTgW9MS3ZYXK7NSo0Ty9a+29iQu7lwDO0WGblTSETHUsZ5fcut0TZ
   s/3ukXiCVydFUkFZV7G73rEtvFnGVQIYqoyN8B/CyzCM/UbiNFBOoVGNg
   pgogSpebtLoELuQ6cV/PXrm0pmuhaL/yNXEBHQsa2/1MZnkRGiWkCOU0w
   N8Izu8BkXxGxuOrsv4dfLpaTc0DO78JgYGjotLMg3+65x9Vp4HfLTaK2t
   w==;
X-CSE-ConnectionGUID: 5k+cQZ2HQAygUastOXmusg==
X-CSE-MsgGUID: HlMcvepoQAyxwiqc7ny3WQ==
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="asc'?scan'208";a="49160518"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:50:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 4 Nov 2025 01:50:40 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 4 Nov 2025 01:50:38 -0700
Date: Tue, 4 Nov 2025 08:48:55 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>
Subject: Re: [PATCH v1 2/3] spi: dt-binding: document Microchip CoreSPI
Message-ID: <20251104-ground-cosponsor-83409ccea3f0@wendy>
References: <20251103160515.412706-1-prajna.rajendrakumar@microchip.com>
 <20251103160515.412706-3-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20251103160515.412706-3-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_075530_201253_47F99772 
X-CRM114-Status: UNSURE (   8.52  )
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
Content-Type: multipart/mixed; boundary="===============7996447218468981157=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7996447218468981157==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2/B7q90WIyt1Y5JN"
Content-Disposition: inline

--2/B7q90WIyt1Y5JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 04:05:14PM +0000, Prajna Rajendra Kumar wrote:
> Add device tree bindings for Microchip's CoreSPI controller.
>=20
> CoreSPI is a "soft" IP core intended for FPGA implementations. Its
> configurations are set in Libero. These properties represent
> non-discoverable configurations determined by Verilog parameters to the
> IP.
>=20
> Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--2/B7q90WIyt1Y5JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQm99wAKCRB4tDGHoIJi
0tBHAP9rYYtl2NuaGODKf5vCQUDwJqqxQ7MM9ujFyrKJn11ZqwD8DhBMykUFFOS3
ywi/TIV7uDWo4vi1SO5ItGH2opA16gk=
=inU1
-----END PGP SIGNATURE-----

--2/B7q90WIyt1Y5JN--


--===============7996447218468981157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7996447218468981157==--

