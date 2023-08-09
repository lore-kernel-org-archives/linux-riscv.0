Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FC5C001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 23:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAFCmAdmmmldWZbvGXs+NpKG9zrCwwShfx+RBjzpjLk=; b=WwOoTj0ZDNXIlGGHuc2UOW0hH/
	aFqswfswKJdMCDtEjI4pB8SPkK9sGD+IDvZw2iI3/mv5o/fkUy50yePMk3B3uDwwzXb8GVhHeih1D
	s8lvAFlgHHfifaOxxNwEnV22lv4r1PJM+uss9Iuv28dvMwikDgc7Y7OfyXHTpzmUbGTKijKv2wsY9
	GtCxjaiiyNYbuIpHAy2s3dqPX781oq1MS4ypyltHv0v6yqDCac0GKbn+dwDnBdNKijXb5k/D2Lr7Z
	U6Vs6ybNc/Vj6EjbiFfscUQtQaAsOmXtv7Tc/1stJVHOPWH4y4B8OE8ftqEOfTd66rshTTqg7+g9v
	qt4FrXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTsGw-0062WT-36;
	Wed, 09 Aug 2023 23:07:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTsGu-0062VQ-1w
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 23:07:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2C0B64C06;
	Wed,  9 Aug 2023 23:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06029C433C7;
	Wed,  9 Aug 2023 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691622439;
	bh=+dEkcrkOf/6DcgjLocwePkEkWflhZSGJZZSQWzBYHGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSILKFd8wS38f4oavtvjQ501JfhIpp5IY8YiqwpIe3vNWWZ08fgrD3X4Xfci6uwtr
	 kMbEfKDegKeeSmHH6Yvfv/CDRFe7fjTZ52gWWxMoCUw5JbXEr2f0aTuKOZRgQj18Bt
	 ZHjAVbcPoXk5wIDMwn3qq4PTXaBS2kkH+5IOlSt6dlrOmcuCKUZ+guEGkg50b3y9rx
	 mEG7UOX56dGTRkST1iQaCam1DJGE/6LH5evYbSRi7XvaRHk6UL2rnjO8D5wC9S2vmn
	 jo/SI1ihD5LMR50r6zClX0VBmWaOJlhlhZZorMWl9uozgeMLUjiEzd/zKvHG/XoFkn
	 RrabOl7AWSTcQ==
Date: Thu, 10 Aug 2023 00:07:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: Re: [PATCH v9 0/4] RISC-V: mm: Make SV48 the default address space
Message-ID: <20230810-endanger-motive-83096266ab26@spud>
References: <20230809015110.3290774-1-charlie@rivosinc.com>
 <20230809-bobbing-unleaded-c3d5e1c57d96@wendy>
 <ZNQXC+UQ+a0s69Bs@ghost>
MIME-Version: 1.0
In-Reply-To: <ZNQXC+UQ+a0s69Bs@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_160720_686867_F4FA2F3D 
X-CRM114-Status: GOOD (  18.62  )
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
Content-Type: multipart/mixed; boundary="===============6821720498371917602=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6821720498371917602==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xYlUSbAm7YzipPhu"
Content-Disposition: inline


--xYlUSbAm7YzipPhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 03:45:31PM -0700, Charlie Jenkins wrote:
> On Wed, Aug 09, 2023 at 08:42:58AM +0100, Conor Dooley wrote:
> > On Tue, Aug 08, 2023 at 06:51:06PM -0700, Charlie Jenkins wrote:
> > > Make sv48 the default address space for mmap as some applications
> > > currently depend on this assumption. Users can now select a
> > > desired address space using a non-zero hint address to mmap. Previous=
ly,
> > > requesting the default address space from mmap by passing zero as the=
 hint
> > > address would result in using the largest address space possible. Some
> > > applications depend on empty bits in the virtual address space, like =
Go and
> > > Java, so this patch provides more flexibility for application develop=
ers.
> >=20
> > This still does not build:
> > ../fs/binfmt_flat.c:900:30: error: call to undeclared function 'is_comp=
at_task'; ISO C99 and later do not support implicit function declarations [=
-Wimplicit-function-declaration]
> >=20
> > Reproduceable with allmodconfig.
> >=20
> There is some weird interaction with compat.h. Moving the definitions
> in pgtable.h into the #ifndef __ASSEMBLY__ guarded section resolves=20
> the compile error. I will send out another version with this change.

Just be sure to run an allmodconfig build this time before doing so ;)

--xYlUSbAm7YzipPhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNQcIQAKCRB4tDGHoIJi
0gh4AP0ZHirwBgSAjTZzsYgQWx0puWLpButSxiuoRHlyGjJHRwD8C6jANtDOeMif
IiUgQCa5S8zKtEanNEt/wf4f6auvfgY=
=E3pw
-----END PGP SIGNATURE-----

--xYlUSbAm7YzipPhu--


--===============6821720498371917602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6821720498371917602==--

