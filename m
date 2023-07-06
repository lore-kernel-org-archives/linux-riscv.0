Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BAFEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 09:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YP19HMMXgVKLm7asK26NRi6tNhWqzn5pFhtvIXWpGfA=; b=H2KmWYH0B6oh/wqzhDxOnsp1Rw
	9kSz1tbUwF7YSpW5aroQpK1vfDum1s5kpay5BNkPIxzgPStZ0iN+caMuQG1D22t7Mzrcjy0DwGdto
	XNT6J8zGEP9Xv6nTxaB2cJW5D37c14XWovE0IP2ce0/n237HYFRYULjNHJuVcMl8QBoaT9KfRy8iV
	5RMidvRQjHMyzYKtftjZaNOKr7a7Xi9iINdGTxeViYJHDOmzwiEewxSiZJFVr0A8w7Ab5m/V3Fq02
	v6hYZPedT9X9giv7MUe8BQj8fMYFBGpSKsM7W0l9cDzNDP3zy9/KZkRM7NDj30cW3ydrIbCQUaVzE
	BLBq3LBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHLgK-0018UP-2H;
	Thu, 06 Jul 2023 09:53:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHLgH-0018Tk-0C
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 09:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688637224; x=1720173224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZCTwEarZVfz6L7OhWE+2PAwDTd9f66HzYjjis2h0zro=;
  b=N6TKfDe0ygQOFcFQ7qzzQOrIrABawZPKwKcbAJgCDVlIo/rqwu8OuhFG
   MZH6ilay6TbVVdTksuquNIqvpCtaN/VfVn35Gu/IEsak/gccpsUtVoTgv
   +lYVtbjwReQD+rw17yRaD/IeJ6XP+4APQkmm2nyl46lOP8DepqMCqEqgc
   I7S9vjQ8P0oRm2cVRwkJUFJ8Xcs3a1RUkem4Av86g+HiiLUE46Bt2vKYc
   n8tMpEFfjNvK9fwLHQTCDYX8uKlyabIOHD1bwucLSDPjMyVhtD9vA+SrN
   ZZ3i/eie3Z24VoDjUgTAGwZzo+F3O3dl5sn07tkFc0Kas5/JaRPwxtfb3
   g==;
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="asc'?scan'208";a="221603502"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2023 02:53:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Jul 2023 02:53:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 6 Jul 2023 02:53:35 -0700
Date: Thu, 6 Jul 2023 10:53:05 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<rostedt@goodmis.org>, <mhiramat@kernel.org>, <mark.rutland@arm.com>,
	<guoren@kernel.org>, <bjorn@rivosinc.com>, <jszhang@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <songshuaishuai@tinylab.org>
Subject: Re: [PATCH V11 0/5] riscv: Optimize function trace
Message-ID: <20230706-crumpet-chemist-84b1dce8b155@wendy>
References: <20230627111612.761164-1-suagrfillet@gmail.com>
 <c7090e76-b054-1f0d-8c05-18f041904b22@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c7090e76-b054-1f0d-8c05-18f041904b22@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_025345_226035_CD7F140F 
X-CRM114-Status: UNSURE (   7.71  )
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
Content-Type: multipart/mixed; boundary="===============1311269958893735347=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1311269958893735347==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TsUbL/pzvtHwGmhl"
Content-Disposition: inline

--TsUbL/pzvtHwGmhl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2023 at 05:35:49PM +0800, Song Shuai wrote:
> Ping...

A context-less ping is not very helpful - what are you looking for here?
More reviews? For example, someone to look at 5/5?

> =E5=9C=A8 2023/6/27 19:16, Song Shuai =E5=86=99=E9=81=93:

If it's application you want, you sent the patch only last week - which
was during the merge window, making it unlikely to be applied.

Either way, please try to explain what it is that you are looking for
when you do a ping!

Cheers,
Conor.


--TsUbL/pzvtHwGmhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKaPAQAKCRB4tDGHoIJi
0u7zAP4m9nHeOnzNDjd07uvtTYVoMTRG9PlPI7TMsYAWdsPwBgD+Ijw30cnV0FLL
OmYhxUULMKySX5DeeB8VLFHiJXnLcg8=
=9Z22
-----END PGP SIGNATURE-----

--TsUbL/pzvtHwGmhl--


--===============1311269958893735347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1311269958893735347==--

