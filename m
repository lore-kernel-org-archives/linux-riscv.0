Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235B9C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sg7ftrtcD1EB+rITHSM77uLhRZ/3KIxmoBmiUP5OTI=; b=Jj2piKitlb57BJNFziuSnbGU7v
	HC1dswlW5+wy3MZypBDQsx6o0CO8GFd5i6c9L3EdKd9rP1Rrq7bXT4PBgB//DMSfbaloeOhyJEh9M
	WEckYN7VHWKZaTDGFtJodjdYIzfl6gdNlqeHxoB1voFCTmCBUmXImH4qHUygd1igxaw9oThSDdhkz
	1g0Emis6JThDIPTV9XgQ1jp7p1HjJh6Xe8i371JLcXeEm0ij14uftLpdrKqnHm1hibovMUOtUEXxc
	DfXWIAbZjDWoE4/vqeumpFPN70pOu/eGimkwRV46jCDZ77wVqIZEj8AfNC0eckYl7BrOqkHSJVbEd
	RESDVGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiDl3-00FTHa-23;
	Mon, 18 Sep 2023 12:53:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiDkz-00FTGz-0f
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 12:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695041621; x=1726577621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AgeuhM5mFwcMMECK8wJlIRxhS3GYSuQUFHTrOyyDThM=;
  b=mYYRlWQAt5ql/AX+XnNHSAfXENvyerkorCrWHFjiPzqnMwCiGnT50UqQ
   hIRwPf8Zi6UYopi/Kwb3olqplsgQizohmiJWk/x8bEH3loPecuOtopsWd
   ta77oR035OcyP3umVVtRuJy1e3gsBVyHz9zHsTuLLODlo4oxD7HjNCepB
   bplm8tpf3E3r7KMyzSIdaNybwtCqJikve3qLNbECJ68KshGzS0UJB1RiP
   iPYcK2bk3HyKZkkhyoDvWX6igac1iW6zVQ9hWwwIluAqAimQiK188M5ey
   u88GVsPQW4jwTFoawLj3Sv2iKdbABaSd+eKJ0yeaR5Q6EcTsaqpLOed43
   Q==;
X-CSE-ConnectionGUID: jK+nVR2nQ4WzZmMpcAzzfw==
X-CSE-MsgGUID: IsmlXUQvT1iYP6FIUritTQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="asc'?scan'208";a="172211731"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2023 05:53:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 18 Sep 2023 05:53:32 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 18 Sep 2023 05:53:30 -0700
Date: Mon, 18 Sep 2023 13:53:13 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<david@redhat.com>, <akpm@linux-foundation.org>, <alexghiti@rivosinc.com>,
	<bjorn@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ycliang@andestech.com>
Subject: Re: [PATCH v2 1/3] riscv: Improve PTDUMP to show RSW with non-zero
 value
Message-ID: <20230918-cassette-exclusion-b2ce53745a5c@wendy>
References: <20230914014027.273002-1-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20230914014027.273002-1-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_055341_509111_2105C2CF 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Type: multipart/mixed; boundary="===============6973988237484273067=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6973988237484273067==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KvF02Mytm4H6tWzO"
Content-Disposition: inline

--KvF02Mytm4H6tWzO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 14, 2023 at 09:40:25AM +0800, Yu Chien Peter Lin wrote:

> +		val = st->current_prot & pte_bits[i].mask;
> +		if (val) {
> +			if (pte_bits[i].mask == _PAGE_SOFT)
> +				sprintf(s, pte_bits[i].set, val >> 8);
> +			else
> +				sprintf(s, "%s", pte_bits[i].set);
> +		} else
> +			sprintf(s, "%s", pte_bits[i].clear);
> +

just a nit, but checkpatch in the automation is whinging that you have
forgotten to add {} around both branches if this if statement.

--KvF02Mytm4H6tWzO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQhIOQAKCRB4tDGHoIJi
0tKoAP48Ts2kKoZnvEilgWMNNrGpn0bLVHjbJMaW8cCYEiYjUwEAo0VTnfi6Wo9O
wMNL4/Pv5uXtN6D5qqiXcogp6SzxIg0=
=xIw+
-----END PGP SIGNATURE-----

--KvF02Mytm4H6tWzO--


--===============6973988237484273067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6973988237484273067==--

