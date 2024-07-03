Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B051C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 06:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTv50tfDRqJXj1jfuF4ecObHvOjrjsmkSnlKTGSJx7k=; b=sxe29xTRnGVbfsk32wCJbj+q/h
	amXYngVJ1XO89WH9ahrVwXr0BlFJoINkqkHyR4PUSrwyLCEnJSVgE0L/UnhdkkXjISGZBrbVP7cua
	S8THaWf0ROAuC3Ust/m6JY2xxk9W4ko3YV4OfjUYRjaKV88w0N3bg39jj/j+xtB4kwsxXlqST8vfm
	FudQO3TLuAQAxv4tyxFHfqq4BWs+uphdjugN5tcVgwlXf1LjrsEo2RWZ1OoYdV7/UtIndZv1vPtWG
	BTQfHKFjbt83iHJMYni83JGOz3JOmbnfUWhPcd62CnZE2KJRcsQpBB47TGszGqtoUwT+KQmRhbCEg
	jWdWAgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOtVA-00000009Dcd-1UJ5;
	Wed, 03 Jul 2024 06:30:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOtV6-00000009Dc3-37q5;
	Wed, 03 Jul 2024 06:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719988196; x=1751524196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uNhuDjLWZorDbXDOWnVhHDPlY99NnQewwMxhnvVsgtQ=;
  b=Gxsoe0HDr1vqSeikiipVO5TI/gFLTolVGrIn0jHuD0KYVjfCBy1UEBSZ
   BpRYiUfnCkff/9qnCQ/66s7om2eDgQhzRramGfsq0ofYBKt6ovGOuxD4p
   L3rqkMjoVJq1x3N9qU7Ad23WyCHMDsySnLd7M+kdKfVHRgXYZ55Lrbkvt
   bWW+7NYk6yDaSSaPabbtDt/H1D3dqxqPp2abyJm0KRvzmRlmtXOSMW9v1
   Gj6syKdrKT8gsFo5Q3dlaBpwOUYypWKzlaa+f3iV4/Im69c5JdnNLkZ4d
   04MEJkypyA8ZfmuQN9+0piLgjC2U7qdhCBpqQm0e+oXr9xYQ9mm5UaUTh
   A==;
X-CSE-ConnectionGUID: uIiTarkbQoeuHwrRiGsmdg==
X-CSE-MsgGUID: 7MEjGxCjQO6357/Nmml1zg==
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="asc'?scan'208";a="31406626"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jul 2024 23:29:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jul 2024 23:29:26 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 2 Jul 2024 23:29:12 -0700
Date: Wed, 3 Jul 2024 07:28:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Tengfei Fan <quic_tengfan@quicinc.com>, <andersson@kernel.org>,
	<konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <djakov@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <jassisinghbrar@gmail.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<manivannan.sadhasivam@linaro.org>, <will@kernel.org>, <joro@8bytes.org>,
	<conor@kernel.org>, <tglx@linutronix.de>, <amitk@kernel.org>,
	<thara.gopinath@gmail.com>, <linus.walleij@linaro.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>, <vkoul@kernel.org>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
	<robimarko@gmail.com>, <quic_gurus@quicinc.com>,
	<bartosz.golaszewski@linaro.org>, <kishon@kernel.org>,
	<quic_wcheng@quicinc.com>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
	<bvanassche@acm.org>, <agross@kernel.org>, <gregkh@linuxfoundation.org>,
	<quic_tdas@quicinc.com>, <robin.murphy@arm.com>, <daniel.lezcano@linaro.org>,
	<rui.zhang@intel.com>, <lukasz.luba@arm.com>, <quic_rjendra@quicinc.com>,
	<ulf.hansson@linaro.org>, <quic_sibis@quicinc.com>,
	<otto.pflueger@abscue.de>, <quic_rohiagar@quicinc.com>, <luca@z3ntu.xyz>,
	<neil.armstrong@linaro.org>, <abel.vesa@linaro.org>,
	<bhupesh.sharma@linaro.org>, <alexandre.torgue@foss.st.com>,
	<peppe.cavallaro@st.com>, <joabreu@synopsys.com>, <netdev@vger.kernel.org>,
	<lpieralisi@kernel.org>, <kw@linux.com>, <bhelgaas@google.com>,
	<ahalaney@redhat.com>, <krzysztof.kozlowski@linaro.org>,
	<u.kleine-koenig@pengutronix.de>, <dmitry.baryshkov@linaro.org>,
	<quic_cang@quicinc.com>, <danila@jiaxyga.com>, <quic_nitirawa@quicinc.com>,
	<mantas@8devices.com>, <athierry@redhat.com>, <quic_kbajaj@quicinc.com>,
	<quic_bjorande@quicinc.com>, <quic_msarkar@quicinc.com>,
	<quic_devipriy@quicinc.com>, <quic_tsoni@quicinc.com>,
	<quic_rgottimu@quicinc.com>, <quic_shashim@quicinc.com>,
	<quic_kaushalk@quicinc.com>, <quic_tingweiz@quicinc.com>,
	<quic_aiquny@quicinc.com>, <srinivas.kandagatla@linaro.org>,
	<linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<kernel@quicinc.com>
Subject: Re: [PATCH 00/47] arm64: qcom: dts: add QCS9100 support
Message-ID: <20240703-manager-armless-b13b18c79192@wendy>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703035735.2182165-1-quic_tengfan@quicinc.com>
 <7417fd8c-e852-45ee-bac9-d92921036e2f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <7417fd8c-e852-45ee-bac9-d92921036e2f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_232956_865756_D5341720 
X-CRM114-Status: GOOD (  16.45  )
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
Content-Type: multipart/mixed; boundary="===============6979864301584913198=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6979864301584913198==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5oSvLfaqEVebv1DP"
Content-Disposition: inline

--5oSvLfaqEVebv1DP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 06:45:00AM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2024 05:56, Tengfei Fan wrote:
> > Introduce support for the QCS9100 SoC device tree (DTSI) and the
> > QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> > While the QCS9100 platform is still in the early design stage, the
> > QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> > mounts the QCS9100 SoC instead of the SA8775p SoC.
>=20
> The same huge patchset, to huge number of recipients was sent twice.
> First, sorry, this is way too big. Second, it has way too many
> recipients, but this is partially a result of first point. Only
> partially because you put here dozen of totally unrelated emails. Sorry,
> that does not make even sense. See form letter at the end how this
> works. Third, sending it to everyone twice is a way to annoy them off
> twice... Fourth,
>=20
> Please split your work and do not cc dozen of unrelated folks.

One of the extra recipients is cos that of that patch I sent adding the
cache bindings to the cache entry, forgetting that that would CC the
riscv list on all cache bindings. I modified that patch to drop the riscv
list from the entry.

Cheers,
Conor.

--5oSvLfaqEVebv1DP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoTvpQAKCRB4tDGHoIJi
0iuiAP9Wgtx8LiFpImc+BXo3h8CTF/4nY5kHoihO91fC51FsogEAnEhd56PAeLdE
Uxg8sGMCKh5qjR+u3kQIZlblyU1rmwA=
=Khim
-----END PGP SIGNATURE-----

--5oSvLfaqEVebv1DP--


--===============6979864301584913198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6979864301584913198==--

