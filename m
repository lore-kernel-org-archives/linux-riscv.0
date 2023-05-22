Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB4C7EE2D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+5mrVKuKwuCWOGFto8uKJtZ6upYgjGzw78XhpzvQRU=; b=EmWnvvBBrzppYFxbeWvk5/+wxN
	dwPr0Q7TehJEMSnb4eOvLiClE+6j1idMopns1631KcKiqbTvzR0lwtYZXrfFvwflHP/9R71sbMVWq
	iQtDh3kYqxroMkdFp2zI2SoEhYXYHr9c3kdtH8+of250cpCmMO41/oA6XJ5wwz6JFXe9LVBot3SDy
	9KTp+DexyphZDYZtOksIDDad59T8bCImpYRflUSUaNlKLdmGbceeQm+Msj5Wd4Xv93clRO7shb0vF
	RQeKMpuHd8r+MwM83bjE90TsioAoCBbipgwphSjXSc77/BbAt2D/BgrHfVb1UidbbKO+MNHKjvDdT
	X3/BXd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zjc-005blN-2x;
	Mon, 22 May 2023 07:13:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zjZ-005bk4-12
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 07:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684739614; x=1716275614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w/k9h1UfGfI/AZPgaI1qAV5bL2MNw9A/V2b2Qrn5ntY=;
  b=vfWcnD9ikzuedszlEx7TnQeBUbCPkMU2onoZ44NcypcHftX6lLMHfJnn
   datwA8ljFsrDlOXA+blGvfAd7HcLTegkEDzEe3ry2kxVG3rX7w41ZvTch
   3YvRQ7g4YQguD7qECb4rXgCn7czyDdhAtSsgRtFJQbSL5s27yts+NsSJP
   f8ZYAxdT1p8n3MYFne8YrA448SeZu2trSaJlhnlhY2Ig47x9yUdpX7xa2
   y1bH/p050gTq/TN1MXGgyExtDg3hBAGKL2/cj/ti/aalyL4ydtDwKkt2f
   XD3EJP72OTplCzjSTGd9s8TpFNIgBJUqtdu8PwQxiZpyjXqfiATMqq9TZ
   g==;
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="asc'?scan'208";a="214867004"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 00:13:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 00:13:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 00:13:26 -0700
Date: Mon, 22 May 2023 08:13:04 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Samuel Holland <samuel@sholland.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v4 03/10] dt-bindings: serial: add documentation for
 Bouffalolab UART Driver
Message-ID: <20230522-cedar-undertow-a4f274ef1cec@wendy>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-4-jszhang@kernel.org>
 <b5869cb0-1eab-4ab7-6dd7-16b06f91d93f@sholland.org>
 <ZGngwijxAKRpzmh7@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZGngwijxAKRpzmh7@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_001333_371428_951CF1CC 
X-CRM114-Status: GOOD (  15.77  )
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
Content-Type: multipart/mixed; boundary="===============0247531917555374807=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0247531917555374807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1eDfFFL/98DJ7Ge8"
Content-Disposition: inline

--1eDfFFL/98DJ7Ge8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2023 at 05:13:38PM +0800, Jisheng Zhang wrote:
> On Thu, May 18, 2023 at 10:00:50PM -0500, Samuel Holland wrote:
> > On 5/18/23 10:22, Jisheng Zhang wrote:

> > This is not complete. There are separate APB and module (baud) clocks,
> > as well as a peripheral reset line. If we are going to keep the binding
> > stable, these need to be described up front.
>=20
> IIUC, the only requirement is to keep the driver compatible with both
> new dts and old dts. clk tree and reset can be added latter. I have seen
> sevral such examples from other SoCs' mainline progress.

It is generally preferred to add bindings in as complete a state as
possible. The driver doesn't need to actually make use of all of the
properties though, and can add the other bits as if/when they are
required.

Cheers,
Conor.

--1eDfFFL/98DJ7Ge8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGsWAAAKCRB4tDGHoIJi
0tUZAP4xFzpnPXGNvSX7grsLiurDrx4Hcr8BrIW1/vGAaKftmgEAurntuZJHchju
rEhU8AQ0jC/jDWmfjG4A+v/JrI1IxQM=
=em4o
-----END PGP SIGNATURE-----

--1eDfFFL/98DJ7Ge8--


--===============0247531917555374807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0247531917555374807==--

