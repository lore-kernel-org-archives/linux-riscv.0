Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBCCCE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrruyNE5risx5MfouNWrHtXbsvA0C6krVxj7eZQmUos=; b=YZOBVRPosMuVAIEt8NaUKc4v+l
	Hb3XL53X+8NvbDVmndUiX6M63kGIWjcyxKzLKfuyjJ1Oo7XxwVsZOBpV3RKuuY5sMZwmo8n678gOu
	YJipBuDyzqHcWNZTzTtPcObKq/Q8a7fCfTcUjrWIm3MQIJf/HWldwuVeimdReqYXUT9/jWFkFvnRY
	IlKjNB7VulqAVD0Q269loesdpln/Nry+o8fbjz2lfUYstE1hK5YVPqGY3SYMnpWozhbpTSFba8qeR
	w+cpMQA8D4/3aZIcQIrN7zem0jzY7qqSuXn98k+1C5rL+WI4LddP3yb+xVYdDOp7uZYW3JM7CAsQn
	GbGg9YFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qitw4-002WI5-1i;
	Wed, 20 Sep 2023 09:55:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qitw1-002WHP-1u
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 09:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695203753; x=1726739753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kv+svYrMzGZXbsH49j8A5pkAvGfMZCYzhz6MSlWTgus=;
  b=o0fj6gQCAV0XUCKGyCCCQz7y2Y6q9ep/TdIYheR0nfNLLpAqu9Lzr1Jg
   u1x7TXGQOIfcA/3GzM75EvGptrjj/x9EOcDvqOZb6gje+ezrAJ/J/5q11
   Yt6ixttpjiG38W0ez7FbW9rY/UncpY//mlWnfy/0bDJ/dufGey3691yrM
   MHcj6avuI02ZkLfa/PjiHu+5Bp3gnhM962iPbEvJL9yqYHayUi2GwywaR
   ljP6P+XSTi66Rnb+YYwQAgnzU7jMO0X5xLEiqN7KDT7c5/kXjITMvd74f
   vr+HUnWGJYTBaL3yTj9DBVcNhn6uQnL484fQqSvHehNbDWZVkmGFpNItA
   g==;
X-CSE-ConnectionGUID: dbn6Zn3nR1qJCQIoTThVUg==
X-CSE-MsgGUID: 0qEvuKfASuicX6E2xi7s2w==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5487440"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 02:55:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 02:55:49 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 02:55:47 -0700
Date: Wed, 20 Sep 2023 10:55:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<david@redhat.com>, <akpm@linux-foundation.org>, <alexghiti@rivosinc.com>,
	<bjorn@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] riscv: Improve PTDUMP to show RSW with non-zero
 value
Message-ID: <20230920-pureblood-unwilling-f17aff1eef6a@wendy>
References: <20230920035522.3180558-1-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20230920035522.3180558-1-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_025553_689872_50EF405F 
X-CRM114-Status: GOOD (  12.84  )
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
Content-Type: multipart/mixed; boundary="===============1750623686373251921=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1750623686373251921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="egyxQ65o8DYutaoK"
Content-Disposition: inline

--egyxQ65o8DYutaoK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 11:55:20AM +0800, Yu Chien Peter Lin wrote:
> RSW field can be used to encode 2 bits of software
> defined information. Currently, PTDUMP only prints
> "RSW" when its value is 1 or 3.
>=20
> To fix this issue and improve the debugging experience
> with PTDUMP, we redefine _PAGE_SPECIAL to its original
> value and use _PAGE_SOFT as the RSW mask, allow it to
> print the RSW with any non-zero value.
>=20
> This patch also removes the val from the struct prot_bits
> as it is no longer needed.
>=20

Could you please add cover letters to multi-patch patchsets?

Thanks,
Conor.

--egyxQ65o8DYutaoK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQrBkgAKCRB4tDGHoIJi
0rl0AQDCTnGcbYIj3i57BCo5CDgqHtCeWpve6uDM+V8OgNsMhQD/cec9Sn6GA/BC
aY9PQc8PUSY8H4plXnnsX6z61H1msgA=
=3fdS
-----END PGP SIGNATURE-----

--egyxQ65o8DYutaoK--


--===============1750623686373251921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1750623686373251921==--

