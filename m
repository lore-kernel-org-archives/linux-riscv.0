Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5104EC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKXPrLFhEYra1dqXEg+gkvJiUkNnAce0GJjWMVsg/sY=; b=aav0cZxG8qbaQuDcDm+7zTW98L
	mIJRu5R7tQ6vQqvzJIfq9nfg2ErQ1kkiaa2UQQvlfUhheoz2F2An8h4DTYxZCjTW+vhEzFmrMZnnT
	nFua7IoSMqfXweemE+GZmYz4DHV3yiC4jIzHjfNeUMjzL53Q17/HdDaGCTxFTgFxv/742iGGgrExm
	d3vLwxyFEH71tfNWOLY3NCnHMgbHR6KqhvG6Sv/2nvksj/3ICndC4UhT0YelW/RGnk/Qv6nMNhXll
	Wu8W2PbjfMVGEVLoEmy7vztkrLLtv8/SuExJ5vzc+PCHF4Tc4sjpB0DGkVFFQpue9jv9+Uij6rnq4
	y+echYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFAf-0092jK-0V;
	Mon, 20 Mar 2023 13:03:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFAb-0092hy-1P;
	Mon, 20 Mar 2023 13:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679317405; x=1710853405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QnIQEdsaltLoEekuM+H+lCcrHRVvNLxa0nPOqc1ZZTI=;
  b=XbCAOGFHrors2g1EN3LIr2YgYVXcrkHxvFVHiTLNVSzUbwFam5/AUA0l
   i9/fhfJeTPGFyevRlJGzQDydD7KxLFpoGneOVXAMa5HPHGUi5h4rTRvNj
   H3ErGZVCDBvovXjpOwKfFLl1lw4D5iBpFIZtM7zh1WlPUAH8Hnf4kqamX
   l9ifVIiiZpHxnGqGMe9Ukkywey9RFsEKo4VtolaFHpFjdFr9Psab4dEFu
   UjObnsBa3Oa/7nMMCnZ68eJWfZDSn2Z4dfP/j8wrYPg4nllN6Y49q7CNX
   vyguCi2KmfOn5elQ5/VjTEcFeI9qLiRK8y1OQHMIoaRfhSjYcPiCykkow
   g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="217100347"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 06:02:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 06:02:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 06:02:50 -0700
Date: Mon, 20 Mar 2023 13:02:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Vincent Chen <vincent.chen@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo
 Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Li Zhengyu
	<lizhengyu3@huawei.com>, Xianting Tian <xianting.tian@linux.alibaba.com>,
	Liao Chang <liaochang1@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>, Richard Henderson
	<richard.henderson@linaro.org>
Subject: Re: [PATCH -next v15 07/19] riscv: Introduce riscv_v_vsize to record
 size of Vector context
Message-ID: <78b957cb-c41d-4152-8f5b-b4bae615c8be@spud>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-8-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230317113538.10878-8-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_060325_490220_790B7CB9 
X-CRM114-Status: UNSURE (   9.08  )
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
Content-Type: multipart/mixed; boundary="===============2607981592371263243=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2607981592371263243==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8aLMBB9LeTn6xA3i"
Content-Disposition: inline

--8aLMBB9LeTn6xA3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 11:35:26AM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This patch is used to detect the size of CPU vector registers and use
> riscv_v_vsize to save the size of all the vector registers. It assumes all
> harts has the same capabilities in a SMP system.
>=20
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

FYI git am complains while applying this patch about whitespace issues:

Applying: riscv: Introduce riscv_v_vsize to record size of Vector context
Using index info to reconstruct a base tree...
M	arch/riscv/kernel/cpufeature.c
=2Egit/rebase-apply/patch:90: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Falling back to patching base and 3-way merge...

Thanks,
Conor.

--8aLMBB9LeTn6xA3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhZXAAKCRB4tDGHoIJi
0u98APwJ8zUVWiesDKpZT8SZ5IEnhsEcvqYCecLiJjvP1cXnYwD9HBdKPe8bVLxX
KRBwZMrG5PtnYzQMTMR+8E5Gr+W4/gY=
=Aqxv
-----END PGP SIGNATURE-----

--8aLMBB9LeTn6xA3i--


--===============2607981592371263243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2607981592371263243==--

