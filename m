Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7761CC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 22:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMdyBHZYviwuZ26p1tK5rJddWgK/7YoHbYC1JPMEtIY=; b=pooosJlPD7UWJGazkWfM9rAmcG
	ekKeatf72C4mftA+KDALG4ZmnFZj9VBWYTwr1WXZj51GDlOWAUqjr9GEGk7SQbJrlx3rSE91036bx
	cmV5fekjWmuEG2J1IvhxVUttaKDFaTxdiGvWi/iRn4/f5bkl4PgOAhK0T2YBiH6UcaNOvmrfPCg2A
	DU85+ZKjRT1TJ+HGStUpvTShiMYip2ZONHN1gxVjO76XgL2JO+S66vJw4pdsDPI/rx+VbZVuYDIX+
	zMXOcagPBwoI2MbP1o3/YS14ODpSQbFF6WHep7ye9wdG/LPzTKZPJTqhySJl9I7lf5f1kMnMsgj9A
	iqPy7zeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8VJ-00EUB6-3j; Tue, 28 Feb 2023 22:31:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8VE-00EU9U-1I; Tue, 28 Feb 2023 22:31:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6011FB80ED2;
	Tue, 28 Feb 2023 22:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34D0C433D2;
	Tue, 28 Feb 2023 22:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677623477;
	bh=7/qNXPrtsBGH9MKoywHXDwQvHhOKCm3REudFDrbnPHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pRR2Z+u2PWE1yIvGGi2EGc5X+9NDnuJyz0PKr96VCyllLMlmSQ5EjuDXzk1RXOUle
	 woDPeyxP/cIVb1Wc1Iapel0hgsH6bXjfHrQhIBlnX8vDijyxyUtmXwaT9PdqZf4dsX
	 RK2ya0kWGQjgHbs8/t/ZC9BZQOUNLELpdfYPSwZhuqLq7c8TEhbvoeU4psFAvYCHuB
	 Dmdpm+ObbjALB8Hvwl9oOSBMHCk9NxVK/4lq6nVLrPul1tpKazc1pBv1Jsjpe0o1Sv
	 uJyTAsSJhx66NyiNu7K96OGetT3ljeJadYdS80nubWJ0Gp1tL18XYY4XMY0PNmjTyZ
	 cCp+/P3evcsIA==
Date: Tue, 28 Feb 2023 22:31:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH -next v14 03/19] riscv: Add new csr defines related to
 vector extension
Message-ID: <Y/6Ar88HPkwocNUe@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-4-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-4-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_143120_386585_1E71D0B7 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Type: multipart/mixed; boundary="===============2887647435874529502=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2887647435874529502==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wht2Hpp5etlnN4NY"
Content-Disposition: inline


--Wht2Hpp5etlnN4NY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:02PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> Follow the riscv vector spec to add new csr numbers.
>=20
> [guoren@linux.alibaba.com: first porting for new vector related csr]
> Acked-by: Guo Ren <guoren@kernel.org>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> [andyc: added SR_FS_VS]
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/csr.h | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 0e571f6483d9..add51662b7c3 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -24,16 +24,24 @@
>  #define SR_FS_CLEAN	_AC(0x00004000, UL)
>  #define SR_FS_DIRTY	_AC(0x00006000, UL)
> =20
> +#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
> +#define SR_VS_OFF       _AC(0x00000000, UL)
> +#define SR_VS_INITIAL   _AC(0x00000200, UL)
> +#define SR_VS_CLEAN     _AC(0x00000400, UL)
> +#define SR_VS_DIRTY     _AC(0x00000600, UL)

I just noticed that these are space-aligned, while the file uses tabs.
Could you please fix that up when you resubmit?

Thanks,
Conor.


--Wht2Hpp5etlnN4NY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/6ArwAKCRB4tDGHoIJi
0jCFAQChM2oiWmbuWIMy/5wEHYV4fPQQL3uCLSl4v07VLhZ3oQD+NTWvLvIRHkNk
SuJ8AMj4XJriJFSSCrcxOCIYLjqULAc=
=Gg4o
-----END PGP SIGNATURE-----

--Wht2Hpp5etlnN4NY--


--===============2887647435874529502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2887647435874529502==--

