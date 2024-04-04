Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8E1CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 15:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1l724EKqpY+4VAeNN8zuYP2VSMdGXkRVEzyClG2TSMQ=; b=dg+jcpiOsYXNderukxK8vtWpps
	VGLNaYlm+Mjr88cYRGdg18KHmzzE8kr8nNEGDuzvBEWyyHF/kq2GN9n8bo+dJo+JcVtq9q+nF/F3H
	/+QzvEofWxOywbEHYWc3ZQHfyVIloRnJtKVGJmKPSnLY5z6qryqFmtTKTJ9q6aEGEvz3pHRkVJx5m
	ni3fAyA4DlrXvBajYl4l1Tcez/n/kgyng0VyJ2DpiK9LoJ6U/gT2DzdUDGqPzoQNwFM4nwfAeKsG/
	nB7paeJWOrRBldHXoAWnwNOcPhW2bHa+O6M5axEcgedPUpRXVuIm05CyvNgbrVMNYaah8+qd6VD0E
	hLKU0uXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPQr-00000003LFB-2WTf;
	Thu, 04 Apr 2024 15:55:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsPQn-00000003LBw-3Ngd
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 15:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2043616F5;
	Thu,  4 Apr 2024 15:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D92DC433F1;
	Thu,  4 Apr 2024 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712246111;
	bh=QCZhhAi2IfI/C1X4OG5OteKxlexOeyNRa+UFstr4Z1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8G5JjnFYhpyVd72/vt+yRhHZsfCsxia00x2zFU1pfRCqMt4j3zxPLko4lL+6iIdN
	 CRHrX26+60Jam3GIxjzzr79h8wGLgLsH+WON+CUZ7nRl7P3vC7U+n8Twmy3h0zie6B
	 e9npyR2HcW7Ip06hHliSt9JUqCVGUNrisOrUHi3Y4yRov3BTHa6fGM3TqhoJ0esdSX
	 5bW0LsQt2IbsZ+9r4naRbvOohbSxR2XUJBjmPzZ4jcjbh9L7AkPTt8/2lroWXyfPc4
	 CdLXJv75z2r3azPbxbE7G34ErS4zKLkaG5eZSac3JJn5fLvD/ZlQRm5vxTSCUfIDap
	 Gv13d+AGP2Wwg==
Date: Thu, 4 Apr 2024 16:55:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
	Ramon de C Valle <rcvalle@google.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
Message-ID: <20240404-valid-sixtieth-9b8fa0f3ad7e@spud>
References: <20240404-providing-emporium-e652e359c711@spud>
 <CANiq72m9YAu=dr1=WMSHOqfpszj4S6OkMEQ05vqbv_zKO5pOsg@mail.gmail.com>
 <CAGSQo024u1gHJgzsO38Xg3c4or+JupoPABQx_+0BLEpPg0cOEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGSQo024u1gHJgzsO38Xg3c4or+JupoPABQx_+0BLEpPg0cOEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_085514_275613_09FEA802 
X-CRM114-Status: GOOD (  11.67  )
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
Content-Type: multipart/mixed; boundary="===============5143400776065730725=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5143400776065730725==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ywt68H1Qj7pbb+ly"
Content-Disposition: inline


--ywt68H1Qj7pbb+ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 04, 2024 at 08:25:11AM -0700, Matthew Maurer wrote:
> >
> > Cc'ing Matthew & Ramon as well so that they are aware and in case they
> > want to comment.

Ah crap, I knew I forgot to CC someone from the last conversation,
thanks Miguel.

> This patch is fine by me - the last patch needed for KCFI to be
> functional in Rust just landed upstream last night, so we should
> revisit this (in the form of enabling it) once we move to
> `rustc-1.79.0` or later.

That's great news, thanks for working on it :)

--ywt68H1Qj7pbb+ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZg7NWQAKCRB4tDGHoIJi
0q8YAQD58we+6Ow/LjNjeDbYjbV+gc/42O61F+M6UlffcXE9MAD/fGp5kccAaKmb
/RxEeaa3gQh5m7NgNUiwxZS1/cHnnQY=
=jQb5
-----END PGP SIGNATURE-----

--ywt68H1Qj7pbb+ly--


--===============5143400776065730725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5143400776065730725==--

