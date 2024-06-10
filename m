Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6D9C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkVwdZP9UWeUCC3AX/Ruxw3E965qq4ZJAIW62IrPnl0=; b=YoAp2djKuAmOJQ8atS+2oP3G/q
	dQpkf8IG+LNLP3OdcoGZ7Pi5K8Mxpbh/1ynucLog3gDb9zh78Du/ue/q3ksQU8zlCpSEsSvOP4vV1
	nwuqpoP+tid3c1kJTl1xpJdOuRXPy+Zp4uJ7qeF1jy1MyxQOhGnjY1ZNlkK0+ZplRZYBe/zz1ZoG7
	DpBQQFRN9/boUlp1jD0K3acpIFl7mpjSAR7HvMkChIBlDA/dTdn9VhsRtUzj3vADKqjnK1ci5AOB9
	WeU0oXtI5QUTTw5NiPC33WLggLczz5z88YXCd+7co5gBCcM8IDS5uKn4t0JVXDys7+f8icPk5x42K
	mta/dlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGd1E-00000004muw-12Iz;
	Mon, 10 Jun 2024 11:16:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGd1B-00000004muY-2gIa
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718018213; x=1749554213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dtvBZszD4/Vqs6KPzqFYXCBmOXS3fGEk+Thu0tP+ric=;
  b=hWbkzu+isQDqLf5a4oj7nMGA+HZYQZpyrFeVEDpl+kfQaAHGMh22MF+3
   qd+IU//dhyaelLbKng4f3FwGL+jFITeJSVAnor7+9Hha1wd4/Nr11uOTN
   k2W3LDFp1TFwhYNHL0VTm+tfiY8yI3tYpRJpbJoUDzyVdD1g3Mbi379hn
   Px/iGqKdNoOgLVnVEhC3QhZDvO+iRSmXhYgGldoOfga2QcCOLQYKiAue0
   pglwX77jxEgByY1PyNYoo/dsHkmaM4EMZuN3NXG+vp8idaJTW9/RR1Ckh
   J193K572cLfLd8JRI4wrEEuW6fpJRFgRRXydFYHadN1yajF2zU70ynm9B
   w==;
X-CSE-ConnectionGUID: lmrGKgelSzewyKo77auReg==
X-CSE-MsgGUID: wVROv9NETh6+h7n3FpQBFQ==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="asc'?scan'208";a="29624183"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 04:16:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 04:16:51 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 04:16:50 -0700
Date: Mon, 10 Jun 2024 12:16:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 0/5] PolarFire SoC Icicle Reference Design PCIe
 ?support?/fixes
Message-ID: <20240610-gatherer-chitchat-8923cf476bfd@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy>
MIME-Version: 1.0
In-Reply-To: <20240610-vertical-frugally-a92a55427dd9@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_041653_828149_CAEDFA8E 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: multipart/mixed; boundary="===============2030807162226415677=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2030807162226415677==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qlGHyB8ctu6mxznk"
Content-Disposition: inline

--qlGHyB8ctu6mxznk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 12:09:12PM +0100, Conor Dooley wrote:
> Hey all,
>=20
> Here's some patches that add an Erratum to enable non-coherent DMA
> support for PolarFire SoC...

My local mail client shows that I sent two copies of this series, but I
only see one on lore. I accidentally ran the wrong command, and didn't
set an stmp server in `git send-email`, so I think that only one copy
actually went out and my mail client is confused.

--qlGHyB8ctu6mxznk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmbgkQAKCRB4tDGHoIJi
0jswAQC4PxTtQ7QAEWyZowxZCrKpu20AE5f3tI0HFvrAF9vUwgD/TXusMzotMGdA
mg/3/I+upXJ31HMLjfX2xJDspWfO3ws=
=LUEj
-----END PGP SIGNATURE-----

--qlGHyB8ctu6mxznk--


--===============2030807162226415677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2030807162226415677==--

