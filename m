Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94A5C83F10
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RggKTVf2NIZQzRjh9NJNiyiBsnN5HCg49r0ri2dIrvc=; b=U6V1CnWWFkwsUB8J4zZvorxpd1
	iCZXNPihZhgxIxoqzkLcHdmNj1hBDTztWE4rkIc5KN6YlfVwajEYwtWq0tKinmhEx+YR0Q1qiY/om
	Y7T4WvzO+kOpaIPngT86oIKQiBR4hmLvTFp0dkqFf4sWoEmyy6oPj1sBUyYxjNSiUtzicGN+bHTOD
	REEnJ45oEkWREl/jVmQvLsbdvN8zgeHygB4y6ZLDmfkvzP41U8aC0nIB3e+8jGxIs1WWp7oInvJTT
	IqxlN1jjhc/Jq0RW5vMWjux1tvNLpaC6zAypJLGDv3nZf6HdQt8RBYuMLtYVakosI/c8GO9cyN61g
	3VGvtrPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkYJ-00FZn7-1l;
	Thu, 31 Aug 2023 16:29:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkYH-00FZmf-1a
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 16:29:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E2B0BB82347;
	Thu, 31 Aug 2023 16:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA047C433C8;
	Thu, 31 Aug 2023 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693499386;
	bh=9Pr9fegNoNUn//WzmCMU1Histd8f9wgBhE+pRfO0JRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuPs3RaYJA/9emJHcwCOySVCskILTl6kosxIZvHqkUtS3d4eylDKQknnFeQGEuMk/
	 bDUFH28qqwkrlKsh19PS6GBfVNTFVuUV41Tk51hAkeiATEEJlKdeCkTQAdWDw31DXk
	 u3E8hos4Qn3n0GQNALOvmIzjpgdeeDdU4B2e4YoenkyV46esTgKFUlYE7ixJHfW7lZ
	 uTC9Spt4h5wSrUJSM0eqlaR1wCkQYlXdjdE2HgDZ+vf73GJNNPgkrbDMiv2f9rP9rz
	 b2SgNof35GV+eWEp/mvsFFc3ydeNnS86dgPW/DYdTXq+G3KsGSIlWbKyJmwOEelR/P
	 Qzz73QAPDzP6w==
Date: Thu, 31 Aug 2023 17:29:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Nam Cao <namcaov@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bjorn@kernel.org
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
Message-ID: <20230831-untidy-geologic-8c8232eb3cac@spud>
References: <20230827205641.46836-1-namcaov@gmail.com>
 <CAJF2gTQysBBSbtFcx1uY_ztTnzN5jRWpG2OD4O3aJ0u9Ekwsag@mail.gmail.com>
 <20230829-unbridle-condense-2fc45a442bb6@wendy>
 <ZO2p1tScBT1UFMh1@nam-dell>
MIME-Version: 1.0
In-Reply-To: <ZO2p1tScBT1UFMh1@nam-dell>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_092949_680739_481636B8 
X-CRM114-Status: GOOD (  12.39  )
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
Content-Type: multipart/mixed; boundary="===============8204614699197839178=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8204614699197839178==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pX1jrx4hiKgkc+Cg"
Content-Disposition: inline


--pX1jrx4hiKgkc+Cg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 29, 2023 at 10:18:30AM +0200, Nam Cao wrote:

> Now I'm not sure what you mean. But I agree with Guo Ren here, users can use
> compressed instructions but kernel does not have it enabled. So we should
> always check c.ebreak regardless of RISCV_ISA_C.

I think I was just being dumb, apologies for the noise.

--pX1jrx4hiKgkc+Cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPC/9gAKCRB4tDGHoIJi
0iNIAQDlFOLhVRwewDs3RynOY+M19AyVbnv6fuCWrcIVf6rtpQEAuxuaR9YxMsh/
J1iTji590xUIscZGwQx0MV/Mn6UZTgA=
=Oo6H
-----END PGP SIGNATURE-----

--pX1jrx4hiKgkc+Cg--


--===============8204614699197839178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8204614699197839178==--

