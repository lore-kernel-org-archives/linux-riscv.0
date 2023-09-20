Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B46CE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc0M4yUodMBvwf5N75CUx3a01p3O8FcJ4TTXZDafsC0=; b=nn9EuK6hcMl+rrcwQnmrlnu14U
	xC/nzUQA1sPBotRZYeDzAU/u6CeXreeafB45+/yv/95npAV5/OMx2wYj25ttbPlAXuN8qjLM269qQ
	S0GfJtmVZR7S/huutYjCHGUqBvmWqtOba4oMRkW3fj9OAKCpqgJegmd14AJCM3BKBkvZpfo3ixGhz
	Mcsm2pW9BY9SEtBG92vdCmI7q/D7tEDvsRR39L9vz61o3Kcvj3sFZiw3wgzfCN1pqz8bqVId5Uzf8
	d6XUDzD+EzkXOLuXDEtpwav60D7houaadXX7Sst0Khgj+MrRlFqPnjhN7ENYiy5znboZiIRCznjiF
	r3uwgvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qishS-002IeI-00;
	Wed, 20 Sep 2023 08:36:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qishO-002IdU-1c
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695199002; x=1726735002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WoALuM+T0aLjrEyZpAlA/0pok6fMu8xvTQIzRRVoeN4=;
  b=rQwavQqpZY3MzKOvEVqNaNar1bczHboj7tSYxpCOP/H3TOi+WgveakFi
   WGSigUPVGaUqsUDXsOv4y3OtiKtO4tV+DdAkty/rq9Mz9Q491nEnjUxhf
   etwerIE0jmnRHCuWVz5VH1CfzNqEXW1wCWaPP1+GSHOT+gS6QiIcs3xb6
   8ZTdqSZzuLTrom3m8NsiBAvWvFOZ/EPZ8IQSR3JsxguKWtIts+tT0hEmB
   9lfNuYsOd97zRLI1Qnb3HIyjVq7KdAUdp3lP3ixJ3rl5aNh3T/oE1sjwS
   o2IsXHDjmN/33emIXJAfYcrgW5tdFosGOM0petdqF5LRyyq7gvX5uROp/
   Q==;
X-CSE-ConnectionGUID: egtUWndkSLy/5vEpLCYKng==
X-CSE-MsgGUID: 7RoY1gSJTG67+SFdEzbIbw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="172606441"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:36:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:36:38 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:36:36 -0700
Date: Wed, 20 Sep 2023 09:36:19 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Drew Fustini
	<dfustini@baylibre.com>
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <20230920-pesky-stalemate-88f5036b8084@wendy>
References: <20230912072232.2455-1-jszhang@kernel.org>
 <20230912-trailing-pampered-52738ec6f009@spud>
 <ZQHSLdPufI6CXApg@xhacker>
 <20230913-faster-spotted-9df41a0d7787@spud>
MIME-Version: 1.0
In-Reply-To: <20230913-faster-spotted-9df41a0d7787@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_013642_618475_AA925BE5 
X-CRM114-Status: GOOD (  20.25  )
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
Content-Type: multipart/mixed; boundary="===============5097702588362900897=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5097702588362900897==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FctfBnGm8Rn+9xje"
Content-Disposition: inline

--FctfBnGm8Rn+9xje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Wed, Sep 13, 2023 at 04:44:18PM +0100, Conor Dooley wrote:
> On Wed, Sep 13, 2023 at 11:15:57PM +0800, Jisheng Zhang wrote:
> > On Tue, Sep 12, 2023 at 05:27:31PM +0100, Conor Dooley wrote:
> > > On Tue, Sep 12, 2023 at 03:22:32PM +0800, Jisheng Zhang wrote:
> > > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> > > > dma coherent, so set dma-noncoherent to reflect this fact.
> > > >=20
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > > > ---
> > > >=20
> > > > Since v1:
> > > >  - rebase on v6.6-rc1
> > > >  - collect Tested-by tag
> > >=20
> > > Does this mean you're expecting me to take this?
> >=20
> > Hi Conor,
> >=20
> > I think I will take this and send PR to soc people. The reason
> > I send v2 is the rebasing on new rc1 and v1 wasn't in linux-riscv
> > mailist due to typo;
>=20
> Great, thanks. Please ask SFR to add your tree to linux-next.

I lost my main x86 box over the weekend (looks like probably a dead
motherboard), so I may have missed a response to this.

Did you see this email? Additionally, can you add that git tree to the
maintainers entry for the thead devicetrees?

Thanks,
Conor.

--FctfBnGm8Rn+9xje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQqvAgAKCRB4tDGHoIJi
0pjEAQCCEy4ws0w7ssYsmKIE1EQRcxLvCTdUqWoOFxg1nbM3fQEA1Du/hWefkLhr
EpqbC7FoifLUim+sBrFP7ataGcohSwI=
=PI2j
-----END PGP SIGNATURE-----

--FctfBnGm8Rn+9xje--


--===============5097702588362900897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5097702588362900897==--

