Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69CFC7EE30
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbUGmeYuf1kxX6c14EXr7PO2yAdv9mzZ8DuSYhhi85Y=; b=BtZB15HGQmMuIEeSf3kY9AviHI
	jvuwaosvKd/gFGL2QErndV5sKEW9kqG3exJIrS/IBxDeJCXtXlxD7uGwWdjfh20VUMo/dTnouobuV
	x6QXFUeBsbsnM7azgcRnqcdGXXaKDJQD5zySfHkfTw2Qc2ODw+8cCqkxQTUvdu8B9D4oLsKHCg9o5
	akCnXul9gyhM670Dxhn0mf0bcOxwf5/Q3qHNc3hx59zQIhKcWNcxt+LB8HNNmtMSRJvigQZgEQnmE
	q5SdujTWodkTCOL465B91umgRmMOHIAUmjnSp/M45eEUTM8qzRoiVcYoxbtJSBzRig1Llt5xMWeP1
	hJR9h0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8aW-00EUk3-HI; Tue, 28 Feb 2023 22:36:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8aT-00EUj8-MO; Tue, 28 Feb 2023 22:36:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8510FB80ED2;
	Tue, 28 Feb 2023 22:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4B0C433EF;
	Tue, 28 Feb 2023 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677623802;
	bh=ptAS0QM4D9CG7kJPSoXq64AQsB5YqS9PtOBPFZXM3k4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAsXd4Z5OzYpB2xwVIfDmc8gharrVl0pD29ToeHgbQzhQTRTrtH2ADJ32lR/pWF+l
	 ZGWoaKoGisLmQAs3M12M2llqKYp85jr3dAdRxIAEHTPCNp3bbIhXBpPpPOQwS40o6+
	 2o/JfBjbi4joIVXoM0scWMdF/XFRYLZKa/89HsGpwSSadMUrNZMtC4+ja34sbEDibC
	 a1KC1qxMM2rdfoXZzPH+ezCT7YKh4LJoqVw/uuIlWoJ8qTnij0mEst4peN1Ur83fKR
	 CifdmPc1bjmSQ5t5VfFhQj77FwLA/mmc3zlaB/UBjepO3mq9ptZoUL7G3/85xhTicz
	 lQToFaTb601tw==
Date: Tue, 28 Feb 2023 22:36:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH -next v14 06/19] riscv: Introduce Vector enable/disable
 helpers
Message-ID: <Y/6B9DEhO0hivJVA@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-7-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-7-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_143645_894554_B97F7980 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Type: multipart/mixed; boundary="===============6571747714951703657=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6571747714951703657==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WVh929Q4jXKSeDNh"
Content-Disposition: inline


--WVh929Q4jXKSeDNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:05PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> These are small and likely to be frequently called so implement as
> inline routines (vs. function call).
>=20
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> [vineetg: create new patch from meshup, introduced asm variant]
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> [andy.chiu: remove calls from asm thus remove asm vaiant]

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--WVh929Q4jXKSeDNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/6B9AAKCRB4tDGHoIJi
0qc0AP9vXPKSWRTJRZliQ5rly+kzB4+mfJwXqzlyHMotRU3nXAEA0/sXWoNJRsNq
GPR6/R/evHNQERjySHjirtXBOUO20wY=
=WyBS
-----END PGP SIGNATURE-----

--WVh929Q4jXKSeDNh--


--===============6571747714951703657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6571747714951703657==--

