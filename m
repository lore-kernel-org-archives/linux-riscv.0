Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDEAC7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8c9e0RYTdnvl6MyDPXHh9UchDXtHspwcKLmHcA/7is=; b=PO3z99ua2i3/CObGPXIn0/PHVt
	vwAGPJTnIg9XOjT+6278pwk5xO000poj/MkWLxJqxf7dabS9HTUpWc1GZU/wHfoavGjFrGuSXvxf+
	mw1yx37hEkiZTt+KvYYjgBq/32ChjGpiu373xaUPveC3xm+RgvDgnCjYBLvm2Fp+7aiwmYqZcaUCj
	nt9JygtGPsoV07cbyEF1zcgVAFaglPvch75iFHuoy1o2mWNukm+DhKPbdpUHBgRpVbap4lw0pHI06
	sL5gIxH1Alcwx7NtyrlSileslFCGqSMmPohyU2wDsERM1twMj4VC/TxcdCfHHGD9nybZWIDADC2C1
	fXS0HTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peEkd-008ysX-2v;
	Mon, 20 Mar 2023 12:36:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peEkc-008ys6-0P
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 12:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679315794; x=1710851794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c4fTS22EntYkPyJ7LZfkV/isNWtd+bG5rciJpOFRr08=;
  b=K8S/meiHCef0KXxFjipXW3PVKvD7bOC7PkFKfRIXtFe34+M5HeOKaFen
   Dvyae5xwb2E/mRyzH/m4dquSaUw+IaLQkxLdkZUuMiDkaI02A1B36Y5gW
   K2TqcFqp0JgIcFcLqhNW0qGn8rk4SCS1MH/Vv35KpiyMyTz6XK9b8wf0V
   qM89T8vo70b/8FScuUJSK2HpJoohbWIItVALHV6RGTLX5f8V7aBBNAJOy
   W3TLzC91XOn2wjHu8utaV53IGRqp4Zgm2wv6Bql/J6E30/qstoXtquUF6
   lr843GA+1zcNUrr9leNNa1tqaPZGUCwYQNqGC4IVgvLeyW9Qlhovsxyoq
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="217085399"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 05:36:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 05:36:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 05:36:31 -0700
Date: Mon, 20 Mar 2023 12:36:02 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<leyfoon.tan@starfivetech.com>, <mason.huo@starfivetech.com>, Andrew Jones
	<ajones@ventanamicro.com>
Subject: Re: [PATCH v6 2/4] RISC-V: Factor out common code of
 __cpu_resume_enter()
Message-ID: <e4cbdcec-585b-4e82-8f74-3799592b1308@spud>
References: <20230314050316.31701-1-jeeheng.sia@starfivetech.com>
 <20230314050316.31701-3-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230314050316.31701-3-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_053634_170434_01552869 
X-CRM114-Status: UNSURE (   4.52  )
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
Content-Type: multipart/mixed; boundary="===============3940112028624824250=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3940112028624824250==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="87p31Ihj7t7GhMZ6"
Content-Disposition: inline

--87p31Ihj7t7GhMZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--87p31Ihj7t7GhMZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhTMgAKCRB4tDGHoIJi
0tVZAQCD0PqDy7i1j0jcRVMZZCw3usZtoykmyLeexRgU5oeodgD/bJEqeA2/L9nK
fgWqwx5DPJAzeU6xjtUxnyEon3UxJgc=
=sH0e
-----END PGP SIGNATURE-----

--87p31Ihj7t7GhMZ6--


--===============3940112028624824250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3940112028624824250==--

