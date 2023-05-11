Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86A6C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTgYoqRk/cvHrJmK+mNH7jtl2Xd4NNQvaZLtIRLEBQ0=; b=XMm4WTQ74RjfKKNqMuRbFsZdiv
	961+fDjj7cWVMgDEm17p7DTLq96S4gOHSio8pfMMl7T23IxXkLQVHl1EMxBh4277gR70Z1WtDaux9
	MnOrDpAAKn6WaThcLQEZVfzP76w4OetOQOyXTikDwBuWlhQjUhN6641gQ3kKsoKq6keLxBBAkfRFk
	CC1WgGPPNpO9nn6v/Koa6dKCeD2qh48d37Td/3+Nkcy6/ip1nDdt18wRSuEDI7aF/VfiGsz9qPaN4
	9sVJ1zXG5hfVJi2WblZSHal2iROk3iW68yPeCd1xRLrxg9id2Vnl6/0HdX2jaI9N/528tCt/ZiPXN
	TlDfHA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvT-00AD5m-39;
	Thu, 11 May 2023 22:38:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvQ-00AD3X-1o
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:38:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19C2D6525E;
	Thu, 11 May 2023 22:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2CFC4339B;
	Thu, 11 May 2023 22:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683844695;
	bh=bmkyDue9zuybIbd/bUm7zldOyRuw0dCz29un7llr9gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nf+OSUxU+jX/Q7r5PUlHVNe4JilMMBp/2adGAhWB4POVovvicXgaNjS3f2PRK/N0e
	 rhvQ1od/OplE9pCTv5nKpJD8FgsHNNGocxyR6oxg+PpjUnu2twSNJakLn6S1gyI95E
	 kFNurR+w0/a8dGFYmYEBbrrQa5VeU84wTTx6KJxqEZaSIzdhBc+vtSiSvQA9BEanbJ
	 8UbnYpxSwRUMInTW1U0Ad/mqoRa/cubrWySFF6qXvGHZGCMI5WXTMuihiphtkpUBu8
	 j412zv9MyGXoHcEa+FrmiEqnQVIhTskqiuBnMLEtbwqBCJgsdzkR1iM/h6b23L+o2b
	 eIElnRGrO5kAQ==
Date: Thu, 11 May 2023 23:38:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
Message-ID: <20230511-occupancy-cleat-06e532e3ea11@spud>
References: <20230508-hypnotic-phobia-99598439d828@spud>
 <CAOnJCUKM13+qzR-rKJZj6OD=-DWiu0z9atzBJ89j_bRwByiowA@mail.gmail.com>
 <20230511-punctuate-dinghy-0dd9be94270c@spud>
 <CAOnJCUL-JTNJMCrAOgnk80pMxOQq9k2+fv84D6cPWHjZmrkqRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCUL-JTNJMCrAOgnk80pMxOQq9k2+fv84D6cPWHjZmrkqRA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_153816_644241_06157770 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Type: multipart/mixed; boundary="===============7100075479361525751=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7100075479361525751==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y28Ar8z5vXm+hkkJ"
Content-Disposition: inline


--y28Ar8z5vXm+hkkJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 03:34:24PM -0700, Atish Patra wrote:
> On Thu, May 11, 2023 at 2:47=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Thu, May 11, 2023 at 02:27:44PM -0700, Atish Patra wrote:

> > That's more than last year at this point, and nothing has changed in the
> > documentation! Talk's cheap, ehh?
> >
>=20
> Yup. I will poke RVI folks to check if it still is the plan or changed !!

Sounds good, thanks!

> We will likely have a vendor specific string parsing logic.

Complicating the parsing logic is the exact sort of crap that I want
to avoid.

--y28Ar8z5vXm+hkkJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF1uUgAKCRB4tDGHoIJi
0oHoAQDsXD1xVu2MRd7UgGS3hGkcLGRIhge63XwoUWoFuEli4QD+NSZ0BPZnA2gn
UVfDoVPZ/htjd8KkbCW/Ui+aa3piEws=
=2bn2
-----END PGP SIGNATURE-----

--y28Ar8z5vXm+hkkJ--


--===============7100075479361525751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7100075479361525751==--

