Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00155C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAz6zsRyN+ME+K//wqpng9lxHxkrRDMB1oCTEpREXwE=; b=ffIkeY0W1xBioTXjReEKko4ZE3
	GsjhVPVK/Z0fC4PrBAs0EceF3L1gvlHfq33/zQa9/+3f38PGM09iJ1iMZATnFsxRYgbNnOVVL6ZSb
	k1GuA5R6tM6qx3P0FFjBFoMbpPyVRCODJ4owL49nl6Io+frs3pZ66pB8CWJitJ7O7ph55+AFwX7r6
	IK32dmXx+PM25qyS7gLiASuwUoVWbn/51V1SvbWzaG8pT7MJerOrVfvZRiJSmqUOXhwGRZT7mVg3o
	eJl7WNAk5ZlSwW2xAFAMCcmYWraFPYD8HAMzVeQ1bPTMqhanoIrCLybG0wgewUnmQdx7JbjWCFLDO
	PTqDUyUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q405m-00EBo3-0X;
	Tue, 30 May 2023 14:12:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q405i-00EBmW-1L
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 14:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685455971; x=1716991971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WEVu+mlvG0A1jNh0gMO3FS1zwOln0/CKg69F1Wt0HZ4=;
  b=uSI2073EMpI6UpRAYMz/GdViDIDiTvwHYHPPp8W00IPxMqU3UjRM8ul1
   haZksZhJckEHnneTFjwlSDPFoym5+fG0dX6g39FM51Wy6Ydr6ZgEefByZ
   4yDGhAPDNEJuEKxE7pXZitaWp9/W5DMs8XX04Ziq5JTsr4pYcqdBgOnqy
   H2jM9vgIOHcmKaCBcBJa7TK2Sr8rzN8hs3yc3nTpNFCzyBnO2Mz+xN5NY
   p2qs3YU9+/S1WyfF+fzm+e8MmTIicgh5p3SXhsymHmt8xrFUlp6/qP9q6
   +TcpIoGdOLu2zYBIAsuDuyXBLDIVvMaCvHODvmyVuKLVi69HE+S7Ojwqx
   A==;
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="asc'?scan'208";a="213732970"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2023 07:12:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 07:12:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 30 May 2023 07:12:35 -0700
Date: Tue, 30 May 2023 15:12:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Sean Anderson <sean.anderson@seco.com>, Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>, <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis
	<alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra
	<atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen
	<rick@andestech.com>, Leo <ycliang@andestech.com>,
	<linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>,
	<u-boot@lists.denx.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230530-duller-reset-a34ae111f207@wendy>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
MIME-Version: 1.0
In-Reply-To: <20230518-monkhood-dispersal-6749b1228b0d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_071250_623514_6BA586F6 
X-CRM114-Status: GOOD (  17.11  )
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
Content-Type: multipart/mixed; boundary="===============0323088487446768073=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0323088487446768073==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ljjWyKcHLn9dJQRC"
Content-Disposition: inline

--ljjWyKcHLn9dJQRC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:

> >=20
> > Why not just have something like
> >=20
> > mycpu {
> > 	...
> > 	riscv,isa {
> > 		i;
> > 		m;
> > 		a;
> > 		zicsr;
> > 		...
> > 	};
> > };
>
> Naming of the node aside (perhaps that could be riscv,isa-extensions)
> there's not something hitting me immediately as to why that is a no-no.
> If the size is a concern, this would certainly be more efficient & not
> like the probing would be anything other than trivial more difficult
> what I have in my proposal.

Having started messing around with this, one of the main advantages, to
me, of this approach is proper validation.
cpus.yaml has additionalProperties: true in it, which would have had to
be sorted out, or worked around, but creating a child-node with the
properties in it allows setting additionalProperties: false.

> Rob's AFK at the moment, and I was hoping that he would take a look at
> the idea, so I won't respin til he is back, but I'll give this a go in
> the interim.

Mechanically, the conversion of the patch isn't difficult, but I'll still
wait for Rob to come back before sending a v2. But that v2 will more
than likely implement your suggestion.

Cheers,
Conor.

--ljjWyKcHLn9dJQRC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYEPAAKCRB4tDGHoIJi
0gU0AQC4+rB11CsvWYlWy1TRnq5jU9IikN+9XHIPda7SYYnZMQEAo6jPRTwwWFo7
hJxgKpYYRrcYOdotg5wYkneWq4yBCQs=
=BG8u
-----END PGP SIGNATURE-----

--ljjWyKcHLn9dJQRC--


--===============0323088487446768073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0323088487446768073==--

