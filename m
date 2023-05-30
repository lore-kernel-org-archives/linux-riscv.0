Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02560C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mh/FI/Gf7jC6NnetiCrPt0X9oRpaJChxJIG7WSJNzbg=; b=wxvD3XgVPrq5UAVxVIUxKRq651
	Faft6hGByELVLaNJEzC7fj1f2dVHvvgwj6VxqVWTj8Ce51MxQyADCWo39wQjt55W8lOoEjwb025IH
	PQeTQzsX7zbtK9n+WCR8cVZQB5uwO1g6SUGOoxWNSglaRQhtOPtD3S3ACnULCNp2liDPAf37Tbys2
	QdTNOuUW0ZTdXNgwiW61DQB7+U76taRv0IEZjgbFHX7F3hJfVXdm3sv8kLOQn7YXX9a7MfOivKSwc
	C5TAlsJDzRCTC1wuekpBOyQ8rINY7ejo7E70tEqF0Xz7TBzvLUYrc3ttycXCS4CXwxBcMO1rePh4T
	QntL7skQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q41pe-00EVjm-1W;
	Tue, 30 May 2023 16:04:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q41pc-00EVjD-06
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 16:04:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 41F83612BF;
	Tue, 30 May 2023 16:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EFAC433EF;
	Tue, 30 May 2023 16:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685462658;
	bh=Yj69QmTWwK6cmsHTZFVFghAHG3NQrjqLp245ggwaSko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1Xwpl1QOZYc5ci7nXYqKDdlB8S4ZH6uz7o3lQGZAZD1cb5YTh9CBESw1MwBgYTCX
	 SKQtnh+f9FH7tXpKmOWaPhjMK52r8hjO01ISa6zr0L9vnyLq0ru6L6Iw/4qw85u4R3
	 fjOxEdT7phXlDABBTDq3mPZTB+h6Qvd6l+uuWbo0gdyOjD7wd25YeHRWONeDlnzacz
	 5Scd+VmqqQggYRS793X7K7+6aQ4Jqtobxl7w1arcnk2arH2zneSdszdPMsfKxsmAdA
	 HSLrC97IXggqagAoM1pg052p8o541U9IfLpG+O+uSR5eBefqT3yAGzxDifL6QIysDB
	 Ws33qky6/gBcA==
Date: Tue, 30 May 2023 17:04:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
	vincent.chen@sifive.com, paul.walmsley@sifive.com,
	palmer@rivosinc.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: vector: Fixup modules compile error
Message-ID: <20230530-static-smith-96cf543bfda2@spud>
References: <20230529073845.2859178-1-guoren@kernel.org>
 <20230529-jasmine-amigo-6d01f6852b35@wendy>
 <CAJF2gTRSoZbexqka=_7nf4+dHZW2FGf++BiTMypfTbeoGAbUiA@mail.gmail.com>
 <CAJF2gTTzUfp7xDr8myA+xMcxGNEQ+XLEYMfoR91NShdBAQMu7Q@mail.gmail.com>
 <CABgGipXu7iq-J5v6GVMPrnHiGVLuMxabB0_hPb+o+04T2MAwpw@mail.gmail.com>
 <CAJF2gTR2fAkk1532VWmsWP5DSYN17ib80wa5QwwT=DC0LY9gGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTR2fAkk1532VWmsWP5DSYN17ib80wa5QwwT=DC0LY9gGw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_090420_112670_51B7B03F 
X-CRM114-Status: GOOD (  11.16  )
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
Content-Type: multipart/mixed; boundary="===============0235117946881426168=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0235117946881426168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wKgep0VmQpKYzP+E"
Content-Disposition: inline


--wKgep0VmQpKYzP+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 30, 2023 at 11:37:38PM +0800, Guo Ren wrote:
> I just found Linux-next build is broken, so I sent the patch. It seems
> you've solved that. That's okay.

Are you sure that linux-next is broken because of this?
This series should not be in linux-next...

--wKgep0VmQpKYzP+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYeewAKCRB4tDGHoIJi
0kXVAP9/me+cpNZ2EoHOp2pibeknmgHE+6JiDocXGYnp7HMhFwEA3/A7JlICORpJ
NaChZKEUEcSooaCXzu7RtqxCX7Fenwk=
=f3bL
-----END PGP SIGNATURE-----

--wKgep0VmQpKYzP+E--


--===============0235117946881426168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0235117946881426168==--

