Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDE1C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64tEKy419yqv3oAbc3YH5mH2e70pKiqvRNLNTHcGVc8=; b=AgEmaiikoVPr8doFQU22Et21ki
	MYEmUnr7pTey3gfBsCN0hWFQ3LjJfTRdAnZMDMWNOGJqoNbiuPvs4HYy3dcLUcNewM+X3Si9bXYxP
	54DZIenuPdPq28WFdCZSh1NpZKw+tfDIlLfVcoNzWVMmmqCTu3nRhWKKu829q5ff82qSD5Saq4RVH
	I3GC1eVypnsCQ/+SHjdG4p0Tzem69fOfoED2mI5P44FoUtcoobiK6qK0TDO2RaiatAu5NTRQTg4/m
	nSEwnuWMxkcyfzS5orSChPWX8nAWruS2c/unzeREqaeQ7/VYboB8J2KJpjbySd+qP6yyRgkS0Kn46
	BpxP4ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3EM-000000014iE-2j6y;
	Thu, 25 Jan 2024 17:09:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3EJ-000000014fr-2DWO
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3FFA6217D;
	Thu, 25 Jan 2024 17:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A36C43390;
	Thu, 25 Jan 2024 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706202570;
	bh=pu8IV/oM2GXGcXE2FRrF9Az35Or5t0xaqQKFZwXlfCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DatNNHTpMR3nUM8xW0u0Sza8gYNdNaU0vGnczxG30GBqGHudI0IEVdQIT2CwZ+n8z
	 Jdi+/bn2IlJ5yA0DRAlkljGe1aMgcpyPufzsCsRNdniNv4KvykSr9FftuNq1g0zOLO
	 Q+kpaQ8TxuE6v+pMFgcbyIOGPZ2Oq3h8SqTqRzreEZMZgQrpt26Zl2Xv6PcqBJZIJ0
	 e7QuP5gsVBH59vIpBkwiMBUZfxouEtCFlVKaesVGvQ6DInL/EsbJN5zE0BThiV6u3N
	 gdGA4uK4KOGztLePEZ6SaroUkOtzIljOgbQhdS3qm4rR1JPB3Do4BF2TigpxQXE8MJ
	 iP59zSeaGvJBw==
Date: Thu, 25 Jan 2024 17:09:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: AnnanLiu <annan.liu.xdu@outlook.com>, chao.wei@sophgo.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Message-ID: <20240125-gurgle-mute-03c6cad0b972@spud>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
 <MA0P287MB2822D37F523A075320BDA99AFE7A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB2822D37F523A075320BDA99AFE7A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_090931_686630_F644C316 
X-CRM114-Status: UNSURE (   9.28  )
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
Content-Type: multipart/mixed; boundary="===============3620366586756906969=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3620366586756906969==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SIZWS90p3InuhLKb"
Content-Disposition: inline


--SIZWS90p3InuhLKb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 25, 2024 at 08:15:32PM +0800, Chen Wang wrote:
> hi, Annan, I see another email with same title, any difference between them
> two? Which one you want us to review? Maybe you should void one of them.

This one I think, the other did not get sent to the mailing lists.

--SIZWS90p3InuhLKb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbKVxQAKCRB4tDGHoIJi
0pF+AQDKYDVWZwKYqeMxVI0xdihLBxXitCKFLCCodXag9cndjgD/Wddnsu6w9uKh
uAAm31GYUWE0rEgZgKBpGRKH84OoyAY=
=cf4g
-----END PGP SIGNATURE-----

--SIZWS90p3InuhLKb--


--===============3620366586756906969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3620366586756906969==--

