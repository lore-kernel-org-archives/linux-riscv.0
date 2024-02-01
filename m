Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866B9C4828C
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDBFZVrJItU4ALqn4eqONEQj/e6qawDXO7LT2eQ2Rkg=; b=YacoOepue3DGEl7qEm6FbLNFjZ
	8MtIwgS6PCZsU5UktNUp/ymIIVxtztARNKVvGMq55hdnb5lB1JrAZCpF720oG+Updopubpih1rJoJ
	PcZWmFuD1jrDQBhFyneaCZ/0YPr+DvJ/dXNYFpQpYzFrjmCwxeooCSSy1fqq0Oimj48vSrHkzH5fp
	y2Ksy9DbNVkmazJgwXeipJbnQKkC7qHi4of1yS9/M+d/CfejU3ecK9wMpCctjTSwAfwsyoPH1tEr5
	hVYHNjgdycQ8PJihepK35u07zLretzMsmLBY6hyqjhXO8CBSFGpX7m5D9Lsh0y8NelvNNI6ivQ3W2
	ElcvUf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXI1-000000088Eb-3hxT;
	Thu, 01 Feb 2024 13:39:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWyC-00000007zhw-2F9M
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 13:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1706793548; x=1738329548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jn+xPN0GPUw3/463SkJJ8PbiXcmQAnj17oz7Lj+qSyk=;
  b=GoxMWNxrps0VDNj6Jc6ZrFRgmiBrefZvWWnXRaYoGKsSDZqJVOZRI2Yb
   F4smaXnEDTxcMQbM7gTXOrQPXGW9yzicTfUn5s/bTmAE4K/sNLCC04jDX
   dF5p63iqLz1gVOVGwgI4RMpvI5c/+WU/cmpuks6To3ZpSMLQj5Y7zk0d1
   nYEkO9a4EB3p/4LwWifz3i1OZ9bazk32yFGor0XNnlekz2YgcSIB1JMn8
   0S6v9UlIUj3SjLLbhYCwEsKsHjUiM580CHquXgxFrjuV0qMCTDzRxZbW7
   EdqtZ6/yAZJnj1yDd66fH+gNGq2ZpsAcIjI3Fbv1Yqm4e9pKHJ3QryOsU
   Q==;
X-CSE-ConnectionGUID: uEqx+vOgQfai2o2FgVbElQ==
X-CSE-MsgGUID: IPF+MlIWSpqLnzUSxccXDg==
X-IronPort-AV: E=Sophos;i="6.05,234,1701154800"; 
   d="asc'?scan'208";a="16123786"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Feb 2024 06:19:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:18:34 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 1 Feb 2024 06:18:33 -0700
Date: Thu, 1 Feb 2024 13:17:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Zong Li <zong.li@sifive.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: add CALLER_ADDRx support
Message-ID: <20240201-glacier-sheep-049045564f7d@wendy>
References: <20231205085959.32177-1-zong.li@sifive.com>
 <139cdbd6-73d9-4452-94ce-825689b7c0c8@ghiti.fr>
 <CANXhq0oA7LsKev+5gZCtNzCJ64RVOyimM1yQnY0kqs22VE6S4A@mail.gmail.com>
 <4bf64df4-43a4-4207-b7d5-ff07adb98193@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <4bf64df4-43a4-4207-b7d5-ff07adb98193@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_051908_683272_F1CAD859 
X-CRM114-Status: UNSURE (   8.05  )
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
Content-Type: multipart/mixed; boundary="===============0608009366257346425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0608009366257346425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HYeRZY6h66DPo2M8"
Content-Disposition: inline

--HYeRZY6h66DPo2M8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 11:07:48AM +0100, Alexandre Ghiti wrote:

> 5cb0080f1bfd was introduced in v5.11, so that will make the backport poss=
ible up to 5.15, I guess that's ok, nobody will ever use a riscv kernel tha=
t old (?).
>=20
> So I'd add the Fixes tag I proposed above, and let the backport fail for =
< 5.15. @Conor any opinion?

The stable kernels are 5.10 and 5.15, so there's no kernels that matter
which have the bad commit and are < 5.15.




--HYeRZY6h66DPo2M8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbuaAgAKCRB4tDGHoIJi
0qfLAP4koWDuVPDcVXYFtHVrzdhF1eAsAsPdz/1TZGZe7aSkrAD9EOXqNsc82ZRJ
95s2w9tShScq7Dv46eJxemyXBKHqywE=
=BEJH
-----END PGP SIGNATURE-----

--HYeRZY6h66DPo2M8--


--===============0608009366257346425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0608009366257346425==--

