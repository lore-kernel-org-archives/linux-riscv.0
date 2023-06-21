Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27954EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xl9lLLHPuF5Rg/np4KDM/7jKCreH8Pq8gFQSYXlBMGM=; b=40SfeLavkZ+IyA0k3y6knOFbhG
	chcqeIyNu0OhAWLrHHwVlNQo+sVUkDt4rNbq6dHGazXsTY/HQTCyNXwcCF6uTYdk0kHMWV00kaoE5
	qTT7e5AjaeViP+6vTyccXSTJTWMyWLOfRBucYqkzBMkhhhUFcb2O+oiga7OaRSggSXeKpbmLHsgae
	FWK5C2yLrcyE8dKKFpzljmj+iIpdSv4fTNL1ZryA8yAI0L/LStW85DhL4xAuSb8DhV3powMnSqbcg
	tOuQop50jWTDGG4urHlQbBJSoKRo+bmKoUnI25G4ShLSmPjclEbue9MRcFz2eZFOIX0bwR34XqeAd
	t4bO/oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwkh-00EVZj-0I;
	Wed, 21 Jun 2023 12:15:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwke-00EVYI-0W
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 12:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687349756; x=1718885756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o33O9E/sTQij2wF7nfbm1fbzPvGMPtF4b4Czb9FyI8w=;
  b=CwedElHE0WETdCZrzpUOC+ikSju7y8U2PIWDOLDO+Vdzc48DAnsubwUt
   m0l9LHXgfd/Q4W81WeHWChsCNGhTVPkmQutgrK5zj/Z7bJtIlS4gkoeOM
   TZCmKFXx9XAssHAzRqYON5jRhh+Fl81a7N7Cv44tWrdUWsIAkZ+8hTCRC
   sciCkSDw6jXhhlhEjVfZALj3G5NpPfTNgoOu1XpUxleDPsQkE5dovAuJx
   28NfPyaHGk0Ot1XL4xyHxkGPnTj/Y3fCTkKqoMNG6mlGt/vVDTJPZLgCJ
   3V6UnG/POiLKw/W1LXTqnBIaxZiqQuO7B+nxVLxY20W22ArUo0p0yzcdV
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="asc'?scan'208";a="219694599"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2023 05:15:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 21 Jun 2023 05:15:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 21 Jun 2023 05:15:51 -0700
Date: Wed, 21 Jun 2023 13:15:24 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <20230621-attempt-unstirred-567b0352176a@wendy>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230621072234.9900-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_051556_380306_61BD89EB 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Song Shuai <songshuaishuai@tinylab.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2332722728048044189=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2332722728048044189==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n3xCvkrHFE9ObyCr"
Content-Disposition: inline

--n3xCvkrHFE9ObyCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Alex,

On Wed, Jun 21, 2023 at 09:22:33AM +0200, Alexandre Ghiti wrote:
> This document describes the constraints and requirements of the early
> boot process in a RISC-V kernel.

Thanks a lot for writing this & implementing the feedback :)
I had one or two minor comments about rather long sentences, but there's
little point I think in respinning for that, so I have ignored them.
Other than that, didn't spot anything new on this second reading.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--n3xCvkrHFE9ObyCr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJLp3AAKCRB4tDGHoIJi
0mK+AQCazV/48ocacOBemauABiD3W3ckxoRGUXlGgRGjJmhQPgD/Q0WBQAi95q/m
lAjRrZfXGyJ2XQqkfntxou17Ja1gXwU=
=KT1X
-----END PGP SIGNATURE-----

--n3xCvkrHFE9ObyCr--


--===============2332722728048044189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2332722728048044189==--

