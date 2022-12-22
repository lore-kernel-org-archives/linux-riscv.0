Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E3C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 23:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnKIrBjKoPIYOl2fWT3yBiFKCkEkA/Q90w8oIv/tYIo=; b=YjI6hm+xLHMn1JtxmRxMAAU6hF
	IcSveCup88Gbz//8RKQcPb6woyIH16aDI3OOzrysCu3ddQtKxKqWBvmfq/FisXSAwgjTU6ZFMIzbo
	uBgIlihxjcM6MMDE7YAAs2pgsZN35WK2mszEOYxa0OtjCl4aYU8HPBdXXuOx8IyuNx0o+am3El3QI
	Qe83wAjdbYhsjw5kGiy++LHE7qP+aSrTKf/rJeGNOain8yqRnSrOKUaF07QZGbdh1pHC0jG123eTt
	IESXJQCkRhst0qaWjuie78TkvcbOQ2OyyXCaX2yWHTcvGqJBRQa8TQTjQG9JCLDHULFN7+Srl+WcB
	WkCQHn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8V6D-000sbT-MI; Thu, 22 Dec 2022 23:35:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8V5n-000sC1-A0
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 23:35:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5954461D9F;
	Thu, 22 Dec 2022 23:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5F4C433D2;
	Thu, 22 Dec 2022 23:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671752113;
	bh=uRTGfdUSt6JeTxEk5/yQs12pDG8jXKeMzxBjgWoV/N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Og8qzK7OY/DiEylUUjZz43s7kneuFX0VwNbYSrFevOOeuNcUrHeeFcO85j+PxWOau
	 bWNof3F/8YI8enl7R1CBdDsXA7/qozcMOiOtgdMsSj9iU7Ryy1uNNnE/VeT+IEhkeQ
	 6y/OgJMg+D9N3OgvlM0UJwCUXh2VtaocO4acfEKSMtMkYMOPT0qNUP+F3LIXvYj2Xu
	 M7+r+RXRhimrorWZox+fnEhNgpyX9PAKJlckEGK6xvc9bPmLuUNVwEFM15s22yeBZW
	 SXiHozyVRqFDie1gUYaZz10A3AFP8f91v8xlGjbIGLLn+NoXSBHlldRU7ySO5gne9N
	 mQg0j3mlWhXjg==
Date: Thu, 22 Dec 2022 23:35:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux@rivosinc.com,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: add base extensions to enum riscv_isa_ext_id
Message-ID: <Y6TprjVBPX6CRvOm@spud>
References: <20221222224104.3449841-1-vineetg@rivosinc.com>
 <Y6TgAxg3csoQqaFr@spud>
 <1cd24228-847f-61a1-2466-07f0cc4c221a@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <1cd24228-847f-61a1-2466-07f0cc4c221a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_153515_444298_54017BF8 
X-CRM114-Status: GOOD (  15.63  )
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
Content-Type: multipart/mixed; boundary="===============0196210706080795834=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0196210706080795834==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GVM1s7mHDhSOMupk"
Content-Disposition: inline


--GVM1s7mHDhSOMupk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2022 at 03:13:56PM -0800, Vineet Gupta wrote:
>=20
>=20
> On 12/22/22 14:53, Conor Dooley wrote:
> > Hi Vineet,
> >=20
> > On Thu, Dec 22, 2022 at 02:41:04PM -0800, Vineet Gupta wrote:
> > > This allows for using the enum in general to refer to any extension.
> > What is the point of this patch? It's hard to understand the rationale
> > without having any user, especially...
>=20
> Right I'm trying to build a cpu feature enable API which required handling
> of all extensions.

Does it matter to you if it's defines or an enum, as long as every
extension is exposed to you via the same mechanism?

> Ideally yes this needs to go there. But it seemed more like a cleanup type
> patch to warrant a standalone submission.

Meh, dw. Not expecting people to know about every patch under the sun.


--GVM1s7mHDhSOMupk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6TprgAKCRB4tDGHoIJi
0r+lAP92I1Tmjj7OH1W2hdK99tm3LqmKJrj/H1eIK/m115ryPQEA6z29ZhLKb5gx
N0rAXqgO7H0jhGV1QeWXfNQ5x+iKDAk=
=vdDQ
-----END PGP SIGNATURE-----

--GVM1s7mHDhSOMupk--


--===============0196210706080795834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0196210706080795834==--

