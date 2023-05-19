Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361F8C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 09:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPYvLrMLCEu1EBsoHPbxBGY5MdlKlvbZl7n7gsfQf8I=; b=rPwRJ7UGKAlS3t16iIUP0U/4Qr
	yf8VYopkgqoB9UyzEZbU3TNYJ1ytZGdeFnEJYMnVZpjXmj+tzCGhcgKt1D+SZ44CpcIfFnVuEwj7z
	ij7s4L9BftDiy9WdL+9hHGAm6oqeoTfI0PkE9YxVF3gbwMQXByjQbI+AliaUWSoBSIG0QG0FYPfuH
	ZdyJ+ssk6Zm5i9BuPmyvA67VcHIKFq3HSvPgpDAkN9pTxp1sIxmamMWwG9SyZsQDlTALx/lc1FkvK
	9OVZFFCPGwz+UG0vmu+x5TwI1yL9U5iktGT7A5amFNIyBUVaK9fr6sqY1TTYLo/tdi0YxsvIxuO1T
	OXCNE5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwbe-00Fkvl-2I;
	Fri, 19 May 2023 09:41:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwbd-00FkvO-2R
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 May 2023 09:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wANA/mLUg0aWRbZraxx4qd3wRwrzBIFFpvVhpCQ51tQ=; b=eDOx/aIAQAIFrAOXzLMPPoQnbM
	yEg6tyqJ6ZdpXXol5g5Sf0T4qjNjrRKH5CbBZEO+IQf992kDHkzNHO446ynC4myInSAVZSOWFh9rO
	kmoRjqGryi8rmenLpDPtwZ3gqWr4SQiNfR8I6tKmddE+MXqsz9CVXEh8KdolrMXf+QVpEL4XcTVoO
	9OTxmZFobde82qsXbBELuv2N89tvQYsMYpUmqGUaLEz3C/hanM1zPMLUtHj5c6v6PpKC91bpCiwQW
	ls5ooyqS6YRsuDhcoQdl7dMEugq43rbv2B+v5Mg3G51vt0VmD3uTua7iQPndS1n0gSiNAqZ4VCHyp
	bq5aSFIg==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwMG-00FqRs-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 09:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684488308; x=1716024308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=87nQKBC592NwT/Pd0f8zSjxOqvt3PLjwDId4OLffKFI=;
  b=Ul+lwLr6Ko3p4qR0y09itu68V4QpEUHq07QNNda7ZsRLB82JMVjbas0s
   fkD+L6IyPn8K7VS4A+F/d/cjaSPcxL7OkBiT/kISxN9S4MVRxOCinfmEc
   aG/JmmTjnFJnfGdbyfQj8pKvPSh+73G/biZwn929no7SHremvEHxlZ9/z
   ZAqLbQ2xsPNz6pJyVRcDJlBeT0S/gqXaLVsqGUQI6FUU/KEC/1gqPJb7h
   /BY016CPUHzh3FOzUREapfJFXcpNL6g7QewAxonZBFPKyh3ZpifMpW+L3
   vfb6FEZNNOSyM/eVtbXONTw3aiMsRpXvWI0MY3ZujT/mOcl/OYL4FWnQB
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="asc'?scan'208";a="216277062"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 May 2023 02:24:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 19 May 2023 02:24:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 19 May 2023 02:24:49 -0700
Date: Fri, 19 May 2023 10:24:28 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Jia Jie Ho <jiajie.ho@starfivetech.com>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, <linux-crypto@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v8 0/4] crypto: starfive - Add drivers for crypto engine
Message-ID: <20230519-moodiness-backtalk-cc838c53e8b1@wendy>
References: <20230515125355.624250-1-jiajie.ho@starfivetech.com>
 <ZGc4Wv0SU59dyVWV@gondor.apana.org.au>
MIME-Version: 1.0
In-Reply-To: <ZGc4Wv0SU59dyVWV@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_102509_427287_FEA2CAEB 
X-CRM114-Status: GOOD (  10.97  )
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
Content-Type: multipart/mixed; boundary="===============2217462942637232849=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2217462942637232849==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RwB4AI2nEmrRJqxz"
Content-Disposition: inline

--RwB4AI2nEmrRJqxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Herbert,

On Fri, May 19, 2023 at 04:50:34PM +0800, Herbert Xu wrote:
> On Mon, May 15, 2023 at 08:53:51PM +0800, Jia Jie Ho wrote:
> > Jia Jie Ho (4):
> >   dt-bindings: crypto: Add StarFive crypto module
> >   crypto: starfive - Add crypto engine support
> >   riscv: dts: starfive: Add crypto and DMA node for VisionFive 2
> >   crypto: starfive - Add hash and HMAC support

> All applied.  Thanks.

Can you drop the ea1aeba1b2e07b82f9eb7cce5cb169263a77d046 ("riscv: dts:
starfive: Add crypto and DMA node for VisionFive 2") please?
It depends on a clock node that has not been added to the dts yet, and
will break the dtb build:

Error: arch/riscv/boot/dts/starfive/jh7110.dtsi:505.22-23 syntax error
FATAL ERROR: Unable to parse input tree

Thanks,
Conor.

--RwB4AI2nEmrRJqxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGdATAAKCRB4tDGHoIJi
0tV4AP92cgUZfovlR07D11TLWvkZwuwwMjQ9l65227nnLEVvLgD9EmRW1kdZlybf
g9B4AdQr2KFmz9cAGuJErpHMqGrWqAk=
=ex4d
-----END PGP SIGNATURE-----

--RwB4AI2nEmrRJqxz--


--===============2217462942637232849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2217462942637232849==--

