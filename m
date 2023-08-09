Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A28AEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SB0s3P3qhO6KzrRUL/GTILEFcYuPhqIWSQfCXPlgMCQ=; b=li+SiDt+O1BTLTWprm23VtPzjr
	LKT/uF+0E/g+QOAyUfJEM75HSt3CeqWyKN3iKmQxzdRvRZT87ftQC6aBdGUwBeDAiY/bsyufV1byM
	UL28Eu6ew+SHxAAnIyMALqof8M0dfk0vWUy36CNkrBZ/E05wEvtz+0DkPze//MhV9CWeeWaPexldZ
	AzkGPH/iYV6vGH4oPtZs/07Dww0YlQBdqEQBpm6QsGT376QgTtSL/JWeIdPUCBdNiF7DY3dKGbl1a
	u86vtCWbOZ0IfiroL8dPlJuFj25LPJF2VpiBKv2LWSMrq7Vc4tUeTajboUbL5FSvSxAlBTdb52r3P
	iJzsfPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdrA-004ILX-0h;
	Wed, 09 Aug 2023 07:43:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdr7-004IJH-0U
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 07:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691567025; x=1723103025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HuXummq6uv9hFMS3gI/cgU0Nts7uJ2PXzQVBGPzY1O4=;
  b=0m3Y7z/5x5/YDUT++im9hZPNHeecY522OM5XZGjSOge3iFoFNXht8/Dz
   ZJ2sedE1QvZHQvNun01ZfaShGKwLIcNARqGy0BKPX/oJzv1Ol6p670vhF
   hxkf28PZ51FrGJGMkJg8ctmeuxNWtVhF5ZOlgWNnwYMlc8WPUULr/S2Nv
   ex5/SBa+FH3XojLzdU/f3fwBuBWt+hEYDLh/t+nsXu0aUZloRNu6d/BFG
   gfNURZ/3ht5pBuvl/mzXZIQMjRpYHSUz0E8h1hgFbi9gls0MGGJvX9CvT
   3+LGTyqLhThOEQEKCZNzo1YkBwHwEAtg/I53nT8czJVRyp0SW+64khbD/
   A==;
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="asc'?scan'208";a="228926534"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Aug 2023 00:43:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 9 Aug 2023 00:43:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 9 Aug 2023 00:43:36 -0700
Date: Wed, 9 Aug 2023 08:42:58 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<conor@kernel.org>, <paul.walmsley@sifive.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <anup@brainfault.org>,
	<konstantin@linuxfoundation.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>, <mick@ics.forth.gr>,
	<jrtc27@jrtc27.com>, <rdunlap@infradead.org>, <alexghiti@rivosinc.com>
Subject: Re: [PATCH v9 0/4] RISC-V: mm: Make SV48 the default address space
Message-ID: <20230809-bobbing-unleaded-c3d5e1c57d96@wendy>
References: <20230809015110.3290774-1-charlie@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230809015110.3290774-1-charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_004345_274175_6924C132 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Type: multipart/mixed; boundary="===============7299647903508720635=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7299647903508720635==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZhUejAXXtaoh38r5"
Content-Disposition: inline

--ZhUejAXXtaoh38r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 08, 2023 at 06:51:06PM -0700, Charlie Jenkins wrote:
> Make sv48 the default address space for mmap as some applications
> currently depend on this assumption. Users can now select a
> desired address space using a non-zero hint address to mmap. Previously,
> requesting the default address space from mmap by passing zero as the hint
> address would result in using the largest address space possible. Some
> applications depend on empty bits in the virtual address space, like Go and
> Java, so this patch provides more flexibility for application developers.

This still does not build:
../fs/binfmt_flat.c:900:30: error: call to undeclared function 'is_compat_task'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]

Reproduceable with allmodconfig.


--ZhUejAXXtaoh38r5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNNDdQAKCRB4tDGHoIJi
0pKlAP9dAJGh/wx49urMOMdOw7ZHVw3eaZHfEZbF/KpUB2e7swD/bAaM+fW/Bo4h
OlseGLmV9tXQdUh6lMq7DZtA8p/WUQQ=
=xVAA
-----END PGP SIGNATURE-----

--ZhUejAXXtaoh38r5--


--===============7299647903508720635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7299647903508720635==--

