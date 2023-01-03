Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7B4C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6K3I+FnjWMk7CJPvUoOrEFlXH6XPplV1tp5MyJdFTb0=; b=dnKuX3o1eEIhZ+FzLqhWMibTbf
	RWGrwRJz3hK5cTZaTlADUw2dcqh4VFY/m6VRUz34vwHsP3N1YYMK24no1aVT9J2Lx/9EGHeSWNaWu
	f72VLFjTPQaZhZvuuSi8nujUa+Me0LURApPJ/Pi0ly7ZpHBQ68hI3rUHFl22HM2y6lO7A0bk9gXha
	uNZEpxOvQsnLw7g+u66iA47mh8NF9Dj1CEZBxrkis7GVW0e8cbyPhP99UkSqi/XTGKpF9tlLVn+A9
	j/RLc7iyC/rD8slI+7ZvyEmDGLbfiVU8TlXWBKtY7PruLVvRNIAT6Bg+gbykPExhSVLreYZlVqvsp
	wW7wWviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCf58-000swl-3E; Tue, 03 Jan 2023 11:03:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCebm-000jRN-BR
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 10:34:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BEEC361251;
	Tue,  3 Jan 2023 10:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F04C433EF;
	Tue,  3 Jan 2023 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672742005;
	bh=3AtFsn/V/juhk9J0oV7s+OaMbFP/MvkSGNDZ0ydRtvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vw2+Z2C4u5t93OLfaYoVO4s9pW9NOMd3mATOojEfQT8jWa6DvrCg3J/DEyAfugHz3
	 K8P4yOBRPWgXv6Z5iVH0sBDAYQDSJjIot70cMVPktUU1q41G9ShYdpUd0TZh2CjKiV
	 EnLPkPp8Y9hR7c4/AXYpuN2qM+zFowH8BapQfnvKQY7QnWs1fhPB8EJfNY3iX//qIL
	 kt7mPQeqhDl3VpcqiqgLjopCHJeqZyqeDGZbBydOsFLcSvdhYIkfz56gOLhtGGaoB5
	 facVv+BEO3zN8sV0tSG2kiJDAFOyI6bdAZGF1GjGkH0xeJlpWYbI6QnhAl/9wa3SEo
	 Qo/y/q9zrgm6A==
Date: Tue, 3 Jan 2023 10:33:20 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv, kprobes: Stricter c.jr/c.jalr decoding
Message-ID: <Y7QEcDU0sMoKrpw4@spud>
References: <20230102160748.1307289-1-bjorn@kernel.org>
 <Y7M/HlcF3u0qWIDJ@spud>
 <87sfgsp15q.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <87sfgsp15q.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_023348_558719_7EA0B42E 
X-CRM114-Status: GOOD (  19.27  )
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
Content-Type: multipart/mixed; boundary="===============6518647829213885971=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6518647829213885971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mtGgv2hibrVtzGE6"
Content-Disposition: inline


--mtGgv2hibrVtzGE6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2023 at 07:44:49AM +0100, Bj=F6rn T=F6pel wrote:
> Conor Dooley <conor@kernel.org> writes:
> > On Mon, Jan 02, 2023 at 05:07:48PM +0100, Bj=F6rn T=F6pel wrote:
> >> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> >> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/ker=
nel/probes/simulate-insn.h
> >> index cb6ff7dccb92..de8474146a9b 100644
> >> --- a/arch/riscv/kernel/probes/simulate-insn.h
> >> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> >> @@ -31,9 +31,9 @@ __RISCV_INSN_FUNCS(fence,	0x7f, 0x0f);
> >>  	} while (0)
> >> =20
> >>  __RISCV_INSN_FUNCS(c_j,		0xe003, 0xa001);
> >> -__RISCV_INSN_FUNCS(c_jr,	0xf007, 0x8002);
> >
> > Hmm, I wonder where the mask originally came from!
>=20
> I think it's just a simple bug -- missing that "rs2" must be zero.
>=20
> > I had a look at the compressed spec, of which the version google gave to
> > me was v1.9 [1], and Table 1.6 in that (Instruction listing for RVC,
> > Quadrant 2) seems to list them all together.

> > [1] -
> > https://riscv.org/wp-content/uploads/2015/11/riscv-compressed-spec-v1.9=
=2Epdf
>=20
> C-ext is part of the unpriv spec:
> https://github.com/riscv/riscv-isa-manual/releases

Yah, I was trying to see if there was some period piece which was
misleading that would have explained the mask. I looked again & the v1.7
spec doesn't have that table, but also has no reason to suggest the
current mask either. Guess it was just a mistake :)

--mtGgv2hibrVtzGE6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7QEcAAKCRB4tDGHoIJi
0hc/AQDgWrBQHm8FFXQEP/Whoo4U/9qhcbi0j+i5qS/9Hizx1gD8CoDVSDxixlw1
e5x0w1UCvjDBlSP1MrtjpC21vo8UwwU=
=WCOx
-----END PGP SIGNATURE-----

--mtGgv2hibrVtzGE6--


--===============6518647829213885971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6518647829213885971==--

