Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5E1C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRji+vNj7OJLztxTr3gg5+9XvVZFMYnRP8dlczU3n1c=; b=yTRO4h5Pd0rpdZ0KU9vnkCnmar
	+d+Hz84Mtrd63xs62aDNPLkalfcG0aFGPh2FVaqsETYf8VMw63X9Wm2zxw0UdF1IezgwUXTM/GWEV
	kR5yKYSizTIjhDLuy2jmAPgvfIR5xb453WENhFfSXAhkLppmCN2LA5GAoTbtpUAdyNelap4mY08zi
	i7mhesui/Bmktp/elRPhHIEHSxn+VrEuOIRa4TJf1lO4O+jn2ERJK+NVtSw9//XXYU1hPZ6mNnQvq
	XqtEbEQsuxs9ycPo7scSpQpTsc5YVS6XZiY1vQLBMtuENRkYvtRAZP9Ij6wItwgBC5AfM1Kl0Ffzf
	E4rQ+Lbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMg8-00E5OR-Gf; Fri, 27 Jan 2023 11:13:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMg4-00E5NY-L0
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 11:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674818032; x=1706354032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=no1En9x29CtZ9fZVT34CIJmSYilJ9YDPJ3JKw7YN+O4=;
  b=nGNoX0K2s0d8yuFkfiucsWdFXSzp/uyHSp2kK2x/x6OH4BpTLUAvKcfr
   C/dSZ+m78b9+FSOd1/NHfiVyIgK6Ag42PUEcrKKR39RruyA60/E0KaGPe
   Sk2DIXd6y4k6tbM3f0ka9eaoHzY8bzgXHIJxuSQAEpYbGcf9PU3vGSBFo
   NFzMWpBL951RzSDw4e8qbmtwt82aAoBRPW9sUAo79W4lz//FfKwuEmO9w
   B98RzG7wwN4Ti4o2QRheEmIew4D6pXBRufzfl3eRuNEOd7f1vE5ydWSpC
   sE96nwKbjz2ZXbKN0pf/g7uyqm8AMkxYamoB6KgMy8Tz0dTWiVdm9nZLK
   A==;
X-IronPort-AV: E=Sophos;i="5.97,250,1669100400"; 
   d="asc'?scan'208";a="194133952"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2023 04:13:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 04:13:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 27 Jan 2023 04:13:44 -0700
Date: Fri, 27 Jan 2023 11:13:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Jia Jie Ho <jiajie.ho@starfivetech.com>, Olivia Mackall
	<olivia@selenic.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] hwrng: starfive - Enable compile testing
Message-ID: <Y9Ox0M3fW7Lqr2P6@wendy>
References: <20230117015445.32500-1-jiajie.ho@starfivetech.com>
 <20230117015445.32500-3-jiajie.ho@starfivetech.com>
 <Y9OveVKTkX8cRhyP@gondor.apana.org.au>
MIME-Version: 1.0
In-Reply-To: <Y9OveVKTkX8cRhyP@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_031352_790757_AC1DCC88 
X-CRM114-Status: UNSURE (   7.50  )
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
Content-Type: multipart/mixed; boundary="===============8833049086761144592=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8833049086761144592==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EPnwagEDOKKyRmai"
Content-Disposition: inline

--EPnwagEDOKKyRmai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 27, 2023 at 07:03:21PM +0800, Herbert Xu wrote:
> Enable compile testing for jh7110.  Also remove the dependency on
> HW_RANDOM.

Checked, the latter is because the whole menu is wrapped in a if
HW_RANDOM, so seems fair to me!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--EPnwagEDOKKyRmai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9OxwgAKCRB4tDGHoIJi
0rz1APsH+L8iRJIRtnC9eGhBl+yL7xG/S/IqVBLiqtq+xLZvEQEA+dihIHwbCj/K
rFMXj7DUd8lIg/MTF7MeyTkdQzvT2QM=
=83bB
-----END PGP SIGNATURE-----

--EPnwagEDOKKyRmai--


--===============8833049086761144592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8833049086761144592==--

