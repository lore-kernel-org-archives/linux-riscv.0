Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B4ECE79AF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 09:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0TYeL9QJKvljumni8ppLI8B3QFV1b2acxsDfnFqjxA=; b=tDMJQ/8wazdev4bbvexaJNHBuI
	OP+eIUO0M+8gE6t8vkeDt4ZwWTTvW5/rXF2q9O1yzuWN42kXl5kUBytPzaurSaK0v24Us9R2Utp0y
	fq4MMQU8kEI2426jZpaZ5mo1sittVrnmqkSZxaM8rWDIidkixWSQazJcxgJTyuhu8a5aSqPaDQGsU
	CekQlvUDJZjv9Xn/YPcGHO1Z+jPmMbEm5pqxeBE2hCg77NwUiYkvGtXKPIr07fhzVl48q+jWHnwEg
	O8ly1OjG1A+i43pLUiIQMxgmdY3EU6JdelzmmosHo32m9nu8JmFSEIVHhIqdtuEA1r1Mt6zPPWZeV
	0getlikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qituy-002Vwk-0g;
	Wed, 20 Sep 2023 09:54:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qitur-002VvZ-22
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 09:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695203681; x=1726739681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xge9ahqJY3+sJNRIvwggXTWfNktjO7lkxZkLNMukJhk=;
  b=0HpGDWFyfgPwGm2KsyPgzXTWtqhhfIX46YOnAJ9UGR7W3vxz7qFABzbl
   ktJ2WyNyPgTBP1IpcNf33cUshl+SySyDxVOzGiNNsDRmUQfPN0w0m0Mc9
   0XU8zZX/5wb/rND9NVSGrfQNhj5mELmZ13nvjs9GKNnxdDDYnQ+10JoPR
   uevmwoIhCV0KEOpeTEq6lOqgoIYdy3uAT5AwTuHGPP9q9U7A4tO7AhPaK
   tHXwbv02HjjRiSPIRhnH5F3edcPfNTx5ZTc2OZEWz0RSlv/5FUQ6uQL+c
   A6jksgPwcN132MLUGeQtYFowHZtRtsWPrL1eJFFSkegVQlId3gPPOBh26
   w==;
X-CSE-ConnectionGUID: ugFauFS5Q5Gyvh5Ditk4gA==
X-CSE-MsgGUID: 4GR16S+KSeCRebeA/mGKEQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="172618278"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 02:53:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 02:53:42 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 02:53:39 -0700
Date: Wed, 20 Sep 2023 10:53:22 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Inochi Amaoto <inochiama@outlook.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<evicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Message-ID: <20230920-untimely-untagged-12b75e247afb@wendy>
References: <20230920-recount-chili-f80d5dc125e8@wendy>
 <IA1PR20MB4953F5FB42B8CAE4BEAC924CBBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953F5FB42B8CAE4BEAC924CBBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_025444_397036_EC71E70F 
X-CRM114-Status: GOOD (  31.04  )
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
Content-Type: multipart/mixed; boundary="===============1592765920350579445=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1592765920350579445==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fbzcNIeJ1H36uc+g"
Content-Disposition: inline

--fbzcNIeJ1H36uc+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Wed, Sep 20, 2023 at 05:08:41PM +0800, Inochi Amaoto wrote:
> >On Wed, Sep 20, 2023 at 02:39:39PM +0800, Chen Wang wrote:
> >> From: Inochi Amaoto <inochiama@outlook.com>
> >>
> >> Add two new compatible string formatted like `C9xx-clint-xxx` to ident=
ify
> >> the timer and ipi device separately, and do not allow c900-clint as the
> >> fallback to avoid conflict.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> >
> >Have you ignored Krzysztof's comments on this? I don't see a response or
> >a reaction to his comments about the compatibles on the last version.
> >Additionally, where is the user for these? I don't see any drivers that
> >actually make use of these.
> >
>=20
> Sorry for late reply and wrong message-id.
>=20
> The clint is parsed by sbi.

That needs to go in the commit message.

> As use the same compatible, the opensbi will
> parse the device twice. This will cause a fault.

Then only have one compatible with 2 register ranges? Then your SBI
implementation can use those two register ranges to find out the base
address for the mtimer bits and for the mswi bits.
I don't understand why this cannot be done, could you please explain.
I also don't see anything in the opensbi repo right now that is using
these (nor could I easily see any patches for opensbi adding this).
Is there another SBI implementation that you are using that I can take
a look at to try and understand this better?

> >Why do you need to have 2 compatibles (and therefore 2 devices) for the
> >clint? I thought the clint was a single device, of which the mtimer and
> >mswi bits were just "features"? Having split register ranges isn't a
> >reason to have two compatibles, so I must be missing something here...

> Sorry for late reply, The clint consists of mtimer and ipi devices, which
> is defined in [1].

Yes, I have looked at the spec. I went to check it again before replying
here in case there was something immediately obvious that I was missing.

> This standard shows clint(or the aclint) has two device,

The wording used here doesn't really matter. It's one interrupt
controller that does mtimer and mswi.

> but not one. In another word, there is no need to defined mtimer and ipi
> device on the same base address.

There's also no need to have two compatibles for the same interrupt
controller, so I do not get this reasoning. What actually _requires_
them to be split?

> So we need two compatibles to allow sbi to identify them correctly.

Why is it not sufficient to identify the individual memory regions?

Thanks,
Conor.

--fbzcNIeJ1H36uc+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQrBEgAKCRB4tDGHoIJi
0uE9AQDcuPiKQqOUfJofFw9tgJk/fYHI/izXyyDi+z1YBTla/wEAhRAmp8R3mIzv
GQ0/8xAitQFh1AQI59d7L68CJHPI0w4=
=FLtW
-----END PGP SIGNATURE-----

--fbzcNIeJ1H36uc+g--


--===============1592765920350579445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1592765920350579445==--

