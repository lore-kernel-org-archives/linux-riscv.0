Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BE6C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+DO5217Djs0vcmIehUcsv81YJ/fzn89itSEM8y/CTk=; b=YS8fFRZcn9i4CwLZGEq+XHa57z
	XtCktL1ewxbX185xI6BdrX5e//sgyRrCq4F6wMpRy2O884S1Wkse64saRFeCjNExEscThmkYn4Dcq
	u4nqntYmhm3fq/2W1N4NpHnjbCl3bETLEiLqZsB4C5TMOe9hfKGA+BvNdHtA7SEVyn3O04EFhH2gf
	Kl/+sUYKilwBSVGp7tdo8RHqAOQYhfxNfV9Lc6W5Agm2p8tUvmvTxYSGN/ahGLbrTK1T0+FgNiryA
	IUDstmpsr8+wdcOxQXqAzkWMWUCyLDViHUxhK/SCybsfSQBEk1XSQ0i/HY35FCwOvHSEeavDwV+zk
	MOiufQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cz4-00DEvG-0v;
	Fri, 09 Jun 2023 14:20:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cyz-00DEt7-17
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 14:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686320453; x=1717856453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KygAYWp1IXX26i2WNOBztQci6E+XF/eMw6ckvbNgMvI=;
  b=JLjuYyb0OQzn0QxPTPppsKgQ/OKp4k0/l6hSWunOf689Hngg0BOh9KaO
   2DWA/cqxeahWJG5DyrXbGONNb2vPj+aCxwrafTB/UOkgcAH84tMsVVQbO
   JYi6GDTpQQBmi9kyMW4Gf7ClyQA+oIE5q+4Jq6ZEdajrjjC1F+PhMZugk
   5H7P6xlzN6g0b2Ic0tvvJ6rch5Ty6f1aDIZ1CV56iDuDyEuGNzlMKLDdm
   kQ55XEBdOLg3tSUwU374VzZeU9cG8qfS3702yUgr2PX8Oy5TAqxKe067Z
   EC2v9g21csyKsF0/udZ3el256y8MIY7h+zGrEm/dLsHB+RjPRWUHgPUZ9
   A==;
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="asc'?scan'208";a="156290892"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2023 07:20:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 9 Jun 2023 07:20:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 9 Jun 2023 07:20:33 -0700
Date: Fri, 9 Jun 2023 15:20:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Oleksii <oleksii.kurochko@gmail.com>,
	Anup Patel <apatel@ventanamicro.com>, <qemu-riscv@nongnu.org>,
	<u-boot@lists.denx.de>, Andrew Jones <ajones@ventanamicro.com>,
	<palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, Jessica Clarke
	<jrtc27@jrtc27.com>, Paul Walmsley <paul.walmsley@sifive.com>, Alistair
 Francis <alistair.francis@wdc.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Rick Chen <rick@andestech.com>,
	<linux-kernel@vger.kernel.org>, Leo <ycliang@andestech.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230609-glamour-immovable-4211c564745d@wendy>
References: <20230608-sitting-bath-31eddc03c5a5@spud>
 <168624654839.3085745.9088493205796442132.robh@kernel.org>
 <20230608-unlucky-carpenter-b3a95f269712@spud>
 <CAL_JsqK8pr5itTr8xTOf=h7zOan6giGsQcwQ-zUCbjtpUsosfw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK8pr5itTr8xTOf=h7zOan6giGsQcwQ-zUCbjtpUsosfw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072053_462445_E46AE413 
X-CRM114-Status: GOOD (  11.08  )
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
Content-Type: multipart/mixed; boundary="===============0347178546177464458=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0347178546177464458==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NHIeqlNPMBycrKLW"
Content-Disposition: inline

--NHIeqlNPMBycrKLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 09, 2023 at 08:03:44AM -0600, Rob Herring wrote:

> Nope, vendor prefixes don't go in node names. That's not explicit
> anywhere, but goes against using generic node names.

Yeah, that makes sense.

> Also, note that looking at the DT spec, there's already prior art here
> with PPC. See "power-isa-*". Though that appears in .dts files, but no
> kernel code. Maybe you already saw that as your v1 is similar. There's
> not really much advantage to align with it, but also not much reason
> to deviate.

I went back and forth on riscv-isa- versus riscv,isa-, picking the , for
consistency with other properties in the file. I thought that doing it
like power would be frowned upon & that it might've been done like that
for historic reasons, especially given existing properties we have for
riscv ISA related things are vendor properties w/ the comma.

I don't have strong feelings either way though, so if you say s/,/-/
then that's good by me!

Cheers,
Conor.

--NHIeqlNPMBycrKLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIM1GAAKCRB4tDGHoIJi
0iJ5AQC4YXI2egYa7v+UQPBEhR84/skUnWg8zWRti453CRoG9gEAs/ydmwxka2yf
TYI7LPHSIav0274f4+OcOXgyL+YNXAc=
=XW8B
-----END PGP SIGNATURE-----

--NHIeqlNPMBycrKLW--


--===============0347178546177464458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0347178546177464458==--

