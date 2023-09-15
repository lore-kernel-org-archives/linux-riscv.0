Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB24EE6425
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Z82Zy5Z9fiLDr708gb8ZRa1dKgkGEZZHCnVIjKxsKI=; b=b0WZ6kdEgykD5WV6xaDUJYNpUI
	H19k6wTKC9CDNGZ3jfZo2vE7vGJ8cm5M63e8N2VUN5ZpFxROgJZ7rWOaNWTzhNHP9Pcrs5+WYvoPn
	BUnnwTQJ72TlwaKuzSrOKLglcJKt7s+7yv5Q3P2abRtF6N38xUO7sPhgyxJrbprIPWPYO+hv4IDsB
	pT48tInzQZWa8CzB1urB1YWHFBVU/FxmExPCryhSxVq6nGNAGt8E3es5CD67AxiGvDmAqA5JSRKHr
	TULOcWVPr/A593AgonoCtSxBxGiHHuTWmJ/jLjTMi1ff4yEHSz98d0Wm/hX3tDOD9CT/LP8r16rmf
	49Q3QhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3DX-00A1xH-2k;
	Fri, 15 Sep 2023 07:26:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3DU-00A1us-3A
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694762776; x=1726298776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EyH0sB0gCaPFZjPgUffhDBAyq6GhY0/i50f+uPV8t/o=;
  b=JhhE5lGA6V5KJi7ANF+Of93uWCgoHx+lcPZK29C9hKUDxS8F0z1pj4IV
   O31P57jclKuUe5mJnnt1ukafHwCXTgDQVGiTL0QByvvdir97xrRGyO3T+
   D2YHHaAxPuez/OHIZuqYhZygJE/WC2/M/qrKyZlZfo7fJ6Xjc8DPRaYK9
   +/Ltcj61RicGzh/uG4IAt/DpM5YfC5kgUFiqkj7mgoi1Cb0E3QQA5c0ez
   PsDu7voIOKI3sPp/OaLyEw+2nsmBbeMnENBOvXQJ88WblCn6zUfQMlUrE
   nTtHLE/dpY5QRsHBzwENAWvODuWvGLD8VsEhhrTFb6V0ro9pv2+tS0JqF
   A==;
X-CSE-ConnectionGUID: V6gNLPcxR0GFNINxl3o+CQ==
X-CSE-MsgGUID: oMXifhVTQ7CSEyR0Xd1ocQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="asc'?scan'208";a="4993552"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2023 00:26:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 15 Sep 2023 00:25:40 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 15 Sep 2023 00:25:37 -0700
Date: Fri, 15 Sep 2023 08:25:21 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Wang Chen <unicornxw@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <conor@kernel.org>,
	<aou@eecs.berkeley.edu>, <krzysztof.kozlowski+dt@linaro.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jszhang@kernel.org>, <guoren@kernel.org>, <chao.wei@sophgo.com>,
	<xiaoguang.xing@sophgo.com>, Wang Chen <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH 00/12] Add Milk-V Pioneer RISC-V board support
Message-ID: <20230915-dill-gauze-922068730d7b@wendy>
References: <20230915070856.117514-1-wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20230915070856.117514-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002617_021691_1F84AD74 
X-CRM114-Status: GOOD (  14.65  )
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
Content-Type: multipart/mixed; boundary="===============5061983219957858979=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5061983219957858979==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IJenxqMWDwNwrYt0"
Content-Disposition: inline

--IJenxqMWDwNwrYt0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Sep 15, 2023 at 03:08:56PM +0800, Wang Chen wrote:
> Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
> in a standard mATX form factor. Add minimal device
> tree files for the SG2042 SOC and the Milk-V Pioneer board.

Cool, thanks for working on this.

>=20
> Now only support basic uart drivers to boot up into a basic console.
>=20
> The patch series is based on v6.6-rc1. You can simply review or test=20
> the patches at the link [3]. Hope this series will be merged soon.
>=20
> Thanks
>=20
> [1]: https://milkv.io/pioneer
> [2]: https://en.sophgo.com/product/introduce/sg2042.html
> [3]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal
>=20
> Emil Renner Berthing (2):
>   dt-bindings: serial: snps-dw-apb-uart: Add Sophgo SG2042 uarts
>   serial: 8250_dw: Add Sophgo SG2042 support
>=20
> Inochi Amaoto (1):
>   dt-bindings: timer: Add Sophgo sg2042 clint
>=20
> Wang Chen (8):
>   dt-bindings: vendor-prefixes: add milkv/sophgo
>   dt-bindings: riscv: add sophgo sg2042 bindings
>   dt-bindings: riscv: Add T-HEAD C920 compatibles
>   dt-bindings: interrupt-controller: Add SOPHGO's SG2042 PLIC
>   riscv: dts: add initial SOPHGO SG2042 SoC device tree
>   riscv: dts: sophgo: add Milk-V Pioneer board device tree
>   riscv: dts: sophgo: Add sophgo,sg2024-uart compatibles
>   riscv: defconfig: enable SOPHGO SoC
>=20
> xiaoguang.xing (1):
>   riscv: Add SOPHGO SOC family Kconfig support

One thing on sending patchsets - you've not threaded this patchset,
where each patch is a reply to the cover letter. This makes it more
difficult to apply the series as a human & ~impossible for the
automation to test correctly.
Git should do this for you if run send-email on an entire directory,
or you can pass the message-id of the cover letter with an argument.
The first option is likely a lot easier for you...

Thanks,
Conor.

--IJenxqMWDwNwrYt0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQQG4QAKCRB4tDGHoIJi
0mQUAP9WOBdSKZXk8ACK1UVixPMHRsarDWFDmAAa/uPxxRVXFgEA+jBK+Bq2J/xE
MtSEfbB0WAs8zdV+l3VW3oVLXhciAw0=
=lNkY
-----END PGP SIGNATURE-----

--IJenxqMWDwNwrYt0--


--===============5061983219957858979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5061983219957858979==--

