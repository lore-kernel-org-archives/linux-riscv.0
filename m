Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDB9C3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 20:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fniwxnOKtOSDsypm1YkgZzXnGEBpMjEcOS0UyRsUyVU=; b=DI5rrQmlGJA8+naQKJn6Bv4YiC
	q4cowAp2UL2BNFfwLVPzP+rqt3NK4Nsic8c9W3vaskNvWPVuUqK9l7iyZs0mrdbN85TayhgR9d1Fj
	IH7htd+QLAuYC/z5ikgaG7reO1gVn88vFJYAxpt1QAP8+uL/7JUw5xIaHp++lrEJqM+CmlGi6Fp7P
	c/urwMnnBowOwS8MFy4BknFRv/f/FtzAcydw8Mp8wR05g8EbiRgXKAbBUeRkZ/DpCexhmUtkWp75F
	EndxqOMPmU9xLvg+TtcwVczoLgI6lhOEhThoV7MMozF4knLktVA1pLx6YRJ9vFrBQecTyYOfcKeKZ
	9hlYwQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCRUE-00E5To-ID; Mon, 02 Jan 2023 20:32:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCRT3-00E5GJ-Gb
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 20:31:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EA9C61123;
	Mon,  2 Jan 2023 20:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6BBC433D2;
	Mon,  2 Jan 2023 20:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672691491;
	bh=dBZ79ZS65SsdqLWl+ytWpYgrm/9T6xr5xkyeaJ0IYNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKntLNsz60+f+K5l0L7V5T7SOG/RzNteswjWnudkIoSk5OEngciVMVqhX8Mm17Crx
	 wqPPosDnuPOs1ZcbzLyhXuT0Yk2ofZFgKWDh5AUOgIYOn2cfft+zC5v23nVmCzHtad
	 P7nj6y3KynrETQO47N4FLANkPeIF/VX0FExi6N6WTd/n9ueYELocBNneAiY1RfKpKj
	 5RkUYJobOTi2xAZzvyYBKIwRrYc0Cp9pcMrHEgKg9Q1ldGyNdVblUpOya5n38/0RLp
	 iIMoPgDRBwm+6xxYmIFXNtcah769joIv8RKatLlEkAbOdrHGzGAdb34jCpoATV5igi
	 TmUbYu9f+LrqQ==
Date: Mon, 2 Jan 2023 20:31:26 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv, kprobes: Stricter c.jr/c.jalr decoding
Message-ID: <Y7M/HlcF3u0qWIDJ@spud>
References: <20230102160748.1307289-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230102160748.1307289-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_123135_354646_661A5039 
X-CRM114-Status: GOOD (  21.68  )
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
Content-Type: multipart/mixed; boundary="===============0025756229714623646=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0025756229714623646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8sp2DkIA9MjAU0eb"
Content-Disposition: inline


--8sp2DkIA9MjAU0eb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Bjorn,

On Mon, Jan 02, 2023 at 05:07:48PM +0100, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>=20
> In the compressed instruction extension, c.jr, c.jalr, c.mv, and c.add
> is encoded the following way (each instruction is 16b):
>=20
> ---+-+-----------+-----------+--
> 100 0 rs1[4:0]!=3D0       00000 10 : c.jr
> 100 1 rs1[4:0]!=3D0       00000 10 : c.jalr
> 100 0  rd[4:0]!=3D0 rs2[4:0]!=3D0 10 : c.mv
> 100 1  rd[4:0]!=3D0 rs2[4:0]!=3D0 10 : c.add
>=20
> The following logic is used to decode c.jr and c.jalr:
>=20
>   insn & 0xf007 =3D=3D 0x8002 =3D> instruction is an c.jr
>   insn & 0xf007 =3D=3D 0x9002 =3D> instruction is an c.jalr
>=20
> When 0xf007 is used to mask the instruction, c.mv can be incorrectly
> decoded as c.jr, and c.add as c.jalr.
>=20
> Correct the decoding by changing the mask from 0xf007 to 0xf07f.
>=20
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> ---
>  arch/riscv/kernel/probes/simulate-insn.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel=
/probes/simulate-insn.h
> index cb6ff7dccb92..de8474146a9b 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.h
> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> @@ -31,9 +31,9 @@ __RISCV_INSN_FUNCS(fence,	0x7f, 0x0f);
>  	} while (0)
> =20
>  __RISCV_INSN_FUNCS(c_j,		0xe003, 0xa001);
> -__RISCV_INSN_FUNCS(c_jr,	0xf007, 0x8002);

Hmm, I wonder where the mask originally came from!
I had a look at the compressed spec, of which the version google gave to
me was v1.9 [1], and Table 1.6 in that (Instruction listing for RVC,
Quadrant 2) seems to list them all together.
Tedious it may be, but future instruction decoding bits probably need
more scrutiny as Drew found another clearly wrong bit a few weeks ago
[2].

Anyways, I checked against the doc and the new versions look good to
me. How'd you spot this, and did you check the other masks?
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

[1] - https://riscv.org/wp-content/uploads/2015/11/riscv-compressed-spec-v1=
=2E9.pdf
[2] - https://lore.kernel.org/linux-riscv/20221223221332.4127602-2-heiko@sn=
tech.de/

> +__RISCV_INSN_FUNCS(c_jr,	0xf07f, 0x8002);
>  __RISCV_INSN_FUNCS(c_jal,	0xe003, 0x2001);
> -__RISCV_INSN_FUNCS(c_jalr,	0xf007, 0x9002);
> +__RISCV_INSN_FUNCS(c_jalr,	0xf07f, 0x9002);
>  __RISCV_INSN_FUNCS(c_beqz,	0xe003, 0xc001);
>  __RISCV_INSN_FUNCS(c_bnez,	0xe003, 0xe001);
>  __RISCV_INSN_FUNCS(c_ebreak,	0xffff, 0x9002);

Worth noting that this code is gone in riscv/for-next thanks to Heiko's
de-duplication:
https://lore.kernel.org/linux-riscv/20221223221332.4127602-7-heiko@sntech.d=
e/

>=20
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> --=20
> 2.37.2
>=20

--8sp2DkIA9MjAU0eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7M/HgAKCRB4tDGHoIJi
0g3uAQCrIqCVSY2Ner5nVfbrgXxXUgzZBnB1WJgV/h3Gy/yWCwEAzgIqIInoxLDh
6A0Nb+FbZWE5HQN8llxfGWsWsO89yAM=
=dd46
-----END PGP SIGNATURE-----

--8sp2DkIA9MjAU0eb--


--===============0025756229714623646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0025756229714623646==--

