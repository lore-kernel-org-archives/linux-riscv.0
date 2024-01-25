Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0566EC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKyvqnf0CS1VAklgpsjWc6Ye1/YGNNm+Oq5ZpQw4uQs=; b=3OghG/aR8inQcS864i/AsuZ0RD
	ymZNiypfZDIFowpjbmRWXyZ9gs1f3ozV/xP029OGCdNv+NuHu/R6dZKITzCwpomHUHlpEQIC7i2KW
	Qlu/q4FT3bCGG4To9jVddgkYJBrZdOeFqawJlDVCyHaLrus6G0nxj0hDZPbGor2BUT6bGDF39Vc+N
	mSLAKpD8UJDbG/Ku5uxaaCYsdBxeCRMX07cAfs2ZGH/71XanQiWA9qs15k8Rs1Vt2JMkcUtNrmGVC
	BHY69w6daAfsHVMyqDBrzU38J5rcV7rq/CFK7J0XC5cBXHu+kiBVNR2a81yJSfWj4Q2Ttxqx0+I8x
	bBggDq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4k2-00000001QL3-1WCP;
	Thu, 25 Jan 2024 18:46:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4jy-00000001QIN-33wv
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 18:46:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ED07FCE34D2;
	Thu, 25 Jan 2024 18:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01409C433C7;
	Thu, 25 Jan 2024 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706208376;
	bh=BiLkqVgI1Un5YIaI3ap285wntHUZokIzCeY02xoir/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qu1G0Hi7rmFnF+2ZLbGGHHrSoG0BLvlZZP/xRzg1RH8ly9Rik3Su3lLqWik9BRe9d
	 c8QQDzcNXgWo+xKG+XVOWFviek68G9nTzBz5zol8I+bU6vlBWsypD93BcIYPYY5+ot
	 bij6bGl2icUbFUNTN966sOVcgZ5Ts9d36t3yXFTYV+OFkSdP5izT8mvowTKb97rlq2
	 C/QxWqQtvyIF1hZzL0kCrOdXKD7S2IB9af0ylNwFJZ20ghHmI/G5/zCILhMjJvvCkQ
	 J2DfEijCKdn86fx55+lMnY1k9qowdjr14vOrLCQJJqmdk9nxOJ7mj4zaxwjNxiOKHp
	 NajAyPjJIqGlw==
Date: Thu, 25 Jan 2024 18:46:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, ruscur@russell.cc,
	bgray@linux.ibm.com, alx@kernel.org, baruch@tkos.co.il,
	zhangqing@loongson.cn, catalin.marinas@arm.com, revest@chromium.org,
	josh@joshtriplett.org, joey.gouly@arm.com, shr@devkernel.io,
	omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 05/28] riscv: zicfiss/zicfilp enumeration
Message-ID: <20240125-ambulance-tingle-d72bf0e744d9@spud>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-6-debug@rivosinc.com>
 <20240125-unscathed-coeditor-31f04e811489@spud>
 <ZbKny7ZAG5FWHwwF@debug.ba.rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <ZbKny7ZAG5FWHwwF@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_104619_176610_B9E683B7 
X-CRM114-Status: GOOD (  11.36  )
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
Content-Type: multipart/mixed; boundary="===============4560977758042795663=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4560977758042795663==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dL0t2IReIcmPOkC/"
Content-Disposition: inline


--dL0t2IReIcmPOkC/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 10:26:19AM -0800, Deepak Gupta wrote:

> > Anything you add to this array, you need to document in a dt-binding.
>=20
> You mean Documentation/devicetree/bindings/riscv/extensions.yaml
> (or possibly any other yaml if needed?)

That one alone should be okay.

> > Also, you added these in the wrong place. There's a massive comment
> > before the array describing the order entries must be in, please take a
> > look.
>=20
> I see the comment.
> In my defense, looks like I missed it when I was rebasing.

No worries.

--dL0t2IReIcmPOkC/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbKsaQAKCRB4tDGHoIJi
0ikfAP98dLdRxWlp+Lhv6tFH9mw3Wm2hF//67S6BSZcJA+SbXQD/ZkpLxUZiV2vE
Hp0XM2ITtrvVej0ZmzRxbvJUoyE6cw8=
=roj8
-----END PGP SIGNATURE-----

--dL0t2IReIcmPOkC/--


--===============4560977758042795663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4560977758042795663==--

