Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA30C7EE25
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 22:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/fUukKb6XrzvUiSgt8XSxsIVB2I6NeO8gFXP5/5TQg=; b=dCywMbT71cvIqq02jLU2SGgo4o
	jkSXLUhs7+pLYPeVnQkHdUpD9YF/y2emlf2uKlEKEBgF6TEl2N+kTG8yAMSlhSspG/qlKPLrM/Mn7
	+3CFpW9Qn8Wj/lHaDGQQLVXguWP0vj2P686vKrT1w90VrqWm4JhpKKN1tvLjbdTuKFCwaRLIyzXGq
	V8k4vqlgrr0GhmqSaDFyZJTSrPotU2VBPcsHI7ZWR9py++F+Sd+9vXt+9CC+0fAltnuz+lDxS+Or+
	vv6MCyFYtgbKKdJa2pEkPrbKgv79QDw7wjxNpMmMab1VP+9By8sLL4g61twXV2P3D2KiwHj3hJE6q
	0hDr5BKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q71Z5-007POd-1p;
	Wed, 07 Jun 2023 22:23:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q71Z3-007PO9-00
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 22:23:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8098564AA3;
	Wed,  7 Jun 2023 22:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6618BC4339B;
	Wed,  7 Jun 2023 22:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686176615;
	bh=7WZB//6TJZux+eIfVM5THT4BLYriCbmT8b7UggsWed4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k10EP806TuBF1JLTa/5s0Eogr6K+35AL8jjrWVMVXwMxFCd4ZgaEnV4O1kDnUbEXc
	 MHksuOROiiqDhm/CIifxeX3LZ5qYzA7o+7LQ1aAZVbhtpE4qZv60JlHxXtKtgaGkUY
	 tzZmcKEo5l2Eg+EOZ2jAXxNsaPXtE/psAYSHEASPUj99ST7KZobcdGgBukqq+/S1io
	 OyV7qVUPYadi5zvv4QZsVmmL7ob/gfP/otq05ftyXG4qWtsp77INJk2V4P1XIYPFnb
	 +fTbLOlLBTOni8S9oCEqA2mBrhwxOuWSuv/5a7dft1mgcwadeDO54e8bdGkgH/bLqF
	 9rWyrOdFb8lmg==
Date: Wed, 7 Jun 2023 23:23:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Woody Zhang <woodylab@foxmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, alexghiti@rivosinc.com
Subject: Re: [PATCH] riscv: reserve DTB before possible memblock allocation
Message-ID: <20230607-unruly-encore-e00661704b71@spud>
References: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com>
 <20230607-jogging-grudging-70dede86bc53@spud>
 <tencent_79F42B5A66F98A65266F989EC9C86A69F005@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_79F42B5A66F98A65266F989EC9C86A69F005@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_152337_109257_19B6EAE5 
X-CRM114-Status: GOOD (  19.07  )
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
Content-Type: multipart/mixed; boundary="===============1710593875243991717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1710593875243991717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iroTKYY20BMB+hrX"
Content-Disposition: inline


--iroTKYY20BMB+hrX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 06:17:22AM +0800, Woody Zhang wrote:
> Hi, Conor
>=20
> On Wed, Jun 07, 2023 at 07:17:28PM +0100, Conor Dooley wrote:
> >+CC Alex, you should take a look at this patch.
> >
> >On Wed, Jun 07, 2023 at 09:35:19PM +0800, Woody Zhang wrote:
> >> It's possible that early_init_fdt_scan_reserved_mem() allocates memory
> >> from memblock for dynamic reserved memory in `/reserved-memory` node.
> >> Any fixed reservation must be done before that to avoid potential
> >> conflicts.
> >>=20
> >> Reserve the DTB in memblock just after early scanning it.
> >
> >The rationale makes sense to me, I am just wondering what compelling
> >reason there is to move it away from the memblock_reserve()s for the
> >initd and vmlinux? Moving it above early_init_fdt_scan_reserved_mem()
> >should be the sufficient minimum & would keep things together.
>=20
> IMO, moving it to parse_dtb() is more reasonable as early scanning and
> reservation are both subject to DTB. It can also lower the risk to
> mess up the sequence in the future. BTW, it's also invoked in
> setup_machine_fdt() in arm64.

I'm fine with the change either way, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Mostly wanted to know whether you'd considered the minimal change.

Cheers,
Conor.

--iroTKYY20BMB+hrX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIEDYwAKCRB4tDGHoIJi
0qaSAP9p8WmnDgqGTpmUYr2HQW4T7TMTPFK2n+EWI1gMRejlQQD/b640SeGyJ73C
iIcpx6Qh2bBLuteKWiwmHGemZvXGBAE=
=Xh0P
-----END PGP SIGNATURE-----

--iroTKYY20BMB+hrX--


--===============1710593875243991717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1710593875243991717==--

