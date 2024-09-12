Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ACBEEB584
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCXGaOxQbYdMtJXMyTFsliRvv7Ov0F416abIaEYnisU=; b=r+0bTownmvVHxT5kmqnlTECiw7
	PZTnorHFbwkKlN22jZ1YHtlV38wteuSxT8uLzA/O+yFpPSwiYKa+awBH0idXqNsK8RyFtT8aCEygo
	c5jd9C1REgiaFaeQ+mCDurbiDD4ZZn6AMtxHJS1NjJqYIwYQ4dfY+9ogjwA1pVBuanCqErslBcB5L
	2sdBlxle77qxcnYQzPqmL4bn9wypTDKcL0sAsdfz5hGm3i7aojgF7KTXdBqUC31xLRYbRjf+PtxkG
	4uymhuF41lUG8cHYbNMyBrRd44fsiU0um5BZfQfTvRtT0TmKDA+hvfH35lvlYoQ5tCRq1hQC63RSj
	asxUvEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sogjK-0000000CdnX-1mgv;
	Thu, 12 Sep 2024 10:07:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sogjH-0000000Cdn8-04Iy
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 10:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726135630; x=1757671630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EJCGgwOHi77U8FIKfss4VuvUdqHqZz530jawwjimG2E=;
  b=h21ds/VHwnbgTCNTooYYfPdGQbGlo0bx+2psOEzZi/y4Mr9EEv2QZqlN
   5UBDAwB31SYJLlPM9Fh58UB9vH5wITD39s4WeAwNSPsV191VR8fDl3O6/
   XE/NsLZLhWMtVSowo+rUWuMbx7YYTyzxt9/rzz32dlUJs52E7growl7Au
   JfoXllroykfJwhVYtesy/Whg8nM3vlsDsAT4z+wxdpR/6nDKvjLtG99af
   b4vW5fZv5H53gSe2Cnsi9R8F9H9TwBe9r1YCh0GQd0jsUa9eIGYuBcHxg
   fhLad/j+xMhIpMf42FclAfSWfTe9UnH8KmONEb1jzoLgVUIlAt0BaHr7L
   w==;
X-CSE-ConnectionGUID: awTA+CbwSDixD6oej565Sw==
X-CSE-MsgGUID: IsO8H+kRQHu3hyeZG9YDLQ==
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="asc'?scan'208";a="199122536"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 03:07:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 03:06:28 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 12 Sep 2024 03:06:26 -0700
Date: Thu, 12 Sep 2024 11:05:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: "daire.mcnamara@microchip.com" <daire.mcnamara@microchip.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com"
	<kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v9 2/3] PCI: microchip: Fix inbound address translation
 tables
Message-ID: <20240912-volumes-endowment-fe086922b7fb@wendy>
References: <20240823122717.1159133-1-daire.mcnamara@microchip.com>
 <20240823122717.1159133-3-daire.mcnamara@microchip.com>
 <SHXPR01MB08632D4FA056118612EA675AE6642@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB08632D4FA056118612EA675AE6642@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_030711_257599_7B0CE2CA 
X-CRM114-Status: UNSURE (   8.12  )
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
Content-Type: multipart/mixed; boundary="===============7884918990589370915=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7884918990589370915==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vvHfXKRD49Gr5X7v"
Content-Disposition: inline

--vvHfXKRD49Gr5X7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2024 at 09:49:38AM +0000, Minda Chen wrote:
> > From: Daire McNamara <daire.mcnamara@microchip.com>

Please trim unrelated content.

> Hi Daire
>   Could you please CC Kevin to this patch-set e-mail list? Thanks.

FWIW, he could get the series at
https://lore.kernel.org/all/20240823122717.1159133-1-daire.mcnamara@microchip.com/
and reply (if he sees fit) by downloading the mbox file from there.

Cheers,
Conor.

--vvHfXKRD49Gr5X7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuK9AQAKCRB4tDGHoIJi
0oRBAP9NuJLmcBaWRm34X+5yqIgA1dObMoxcaYKAHulHXLQLEAEAx3UXAVlXSIYs
GeqX7abkP2vR6fVEBHEWrMscpDqTfgU=
=Hs/l
-----END PGP SIGNATURE-----

--vvHfXKRD49Gr5X7v--


--===============7884918990589370915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7884918990589370915==--

