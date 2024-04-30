Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ADEC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LniN8nUDtujUdmfOmwq2miN620SqZdSPvM7pkU+D1w=; b=mCeZHmKYtU0oX2iliMewtV7NgP
	kYxdbdF1PuSzM54TsWpJekniXJaGjZjrfOeTn6LDUjlfENHnOrfUBP/XYREzHgWk8rYyHxdqISRCv
	ivsDYzhtfF7DRiqtUxBoi4qJ9HNCIJFPagQkdfA8rPhTV9OMDXdjLsK0aexUgmJs/VMF51cdFOoT9
	cXLgr+cEOTwED94RPK+l0xJEFBpJgS9vz0HgYR0vk2atReiXDZpbj8pzK7/ca3yAqQKt3DPOqrC1U
	b64gptB5mh56FcwPC3IDBqmPEGznPdOk/FgG5Ltfjv5Zto1xnGzbQ67w+U9G04UzWPZOdGTgnREID
	MxsbFoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1mMH-00000006J38-1ImI;
	Tue, 30 Apr 2024 12:13:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1mME-00000006J2j-3zZP;
	Tue, 30 Apr 2024 12:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714479194; x=1746015194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=doLKeQy4TExi5QdhktMBd2IZ1vpBh5RzTkVFTj89drA=;
  b=iq39YaZcFwUzIWCSDeHlLmn0X/Ix/zIRb8/fuiAAs9RwOCZj9+wGQuz4
   J2ym+Gwg7KqBEV8+G5zuJJveIUr119qt42UFJ+MiMAoCzsbKkF2UP4Yfm
   RtY1sLuqrGesrtF12EUYnpujltujJdIRIkd5093hGgHVkRv1coXdfyeMQ
   4t8X4ng7DX6MOGecYtQVFD5UyXI2IV5gDUKIit2UAFsPQxenBcAYdUMmG
   gXzWW20CEbVLWmSSD285KL60NmY1tTP5vhe+Ium46pYTcr8y4Ncaz5wqO
   KyUKIKaC0pacn5d61uAELzTHUu7hjSD+ZJixOwSsrSthtIAUVeJBkA5YT
   Q==;
X-CSE-ConnectionGUID: uObasyPdQ16WgqrK/xhteQ==
X-CSE-MsgGUID: onc3MT8LRSmj1H2yRHI51w==
X-IronPort-AV: E=Sophos;i="6.07,242,1708412400"; 
   d="asc'?scan'208";a="190594512"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Apr 2024 05:13:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 05:12:53 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 30 Apr 2024 05:12:50 -0700
Date: Tue, 30 Apr 2024 13:12:32 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel
	<anup@brainfault.org>, Shuah Khan <shuah@kernel.org>, Atish Patra
	<atishp@atishpatra.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v4 02/11] riscv: add ISA extensions validation
Message-ID: <20240430-gratuity-refinish-29abb136c958@wendy>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240429-subtext-tabby-3a1532f058a5@spud>
 <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
 <20240430-payable-famished-6711765d5ca4@wendy>
 <dbcf0be9-eae6-4776-bc5b-c6fad58df9c3@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <dbcf0be9-eae6-4776-bc5b-c6fad58df9c3@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_051315_203269_64ED6346 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: multipart/mixed; boundary="===============8256989088089407201=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8256989088089407201==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ucTtHBCJgf8Riu/"
Content-Disposition: inline

--8ucTtHBCJgf8Riu/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 01:58:11PM +0200, Cl=E9ment L=E9ger wrote:
> Yeah, see what you mean. I think we also need to define if we want to
> expose all the ISA extensions in /proc/cpuinfo (ie no matter the config
> of the kernel) or not. If so, additional validate() callback would make
> sense. If we want to keep the full ISA string in /proc/info, then we
> will need another way of doing so.

If extensions aren't usable, they shouldn't be in /proc/cpuinfo either
as there's programs that parse that to figure out what they can use,
possibly even only checking a single cpu and using that as gospel.
That's why there's that per-hart-isa thing that was added by one of your
colleagues last year.

--8ucTtHBCJgf8Riu/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjDgMAAKCRB4tDGHoIJi
0neYAQC5KDKxLwVlxUktx/6ZGxEKZ7t0/TmIWfR2P7wsLDIFPQD/YOo01ylZOQ90
q2ipRVfjcUwY9iXnlr4411pWO+cJBAA=
=u/5V
-----END PGP SIGNATURE-----

--8ucTtHBCJgf8Riu/--


--===============8256989088089407201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8256989088089407201==--

