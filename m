Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C93CC76195
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 05:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmfrnklMr+LRRGENoAKN0b9RYL9a0frfV+FeTf3tOL4=; b=X3q7MKOnMzF+A1/fFexw5vmyZC
	F1KygM/dna5GiEo/HFt7aAFRTZRygQVOBnxyphsMWKefhQHuofOa2KBKj3TvbWPUx6z9e/iK6mMpe
	lbarTjNrWJh0jAYY0mTFp2nBuZdQBtlHs1tYzG+baPjBU808CbYeyCzlo/uQ7C9UR3RMTgDpaDKTw
	oZR5KBabDYV7h5+1xlrSYG5iq2l4wdAS1PmHBOoTGpX0+TPbnfzH4AfnsS5BU3syq+01qO3Jc6x/r
	aW4omiFLqtZBmFM4W/bLrhDYzCwiR2Hr9Hhz7gwfFMdsLDXcLTyizvtHyq+jxszGGqqibfVYdNDDJ
	iYoqF4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2Gq-00DEId-08;
	Tue, 28 Mar 2023 05:53:24 +0000
Received: from mx1.emlix.com ([136.243.223.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2Gl-00DEHB-0h;
	Tue, 28 Mar 2023 05:53:21 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 0298D5FB8C;
	Tue, 28 Mar 2023 07:53:12 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Andy Chiu <andy.chiu@sifive.com>
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Conor Dooley <conor.dooley@microchip.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>,
 Qing Zhang <zhangqing@loongson.cn>
Subject: Re: [PATCH -next v17 11/20] riscv: Add ptrace vector support
Date: Tue, 28 Mar 2023 07:53:00 +0200
Message-ID: <5660672.DvuYhMxLoT@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <20230327164941.20491-12-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-12-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_225319_433101_8204A3B8 
X-CRM114-Status: GOOD (  25.04  )
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
Content-Type: multipart/mixed; boundary="===============5746332039436796448=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5746332039436796448==
Content-Type: multipart/signed; boundary="nextPart5919597.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5919597.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
Subject: Re: [PATCH -next v17 11/20] riscv: Add ptrace vector support
Date: Tue, 28 Mar 2023 07:53:00 +0200
Message-ID: <5660672.DvuYhMxLoT@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <20230327164941.20491-12-andy.chiu@sifive.com>
MIME-Version: 1.0

On Montag, 27. M=C3=A4rz 2023 18:49:31 CEST Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This patch adds ptrace support for riscv vector. The vector registers will
> be saved in datap pointer of __riscv_v_ext_state. This pointer will be set
> right after the __riscv_v_ext_state data structure then it will be put in
> ubuf for ptrace system call to get or set. It will check if the datap got
> from ubuf is set to the correct address or not when the ptrace system call
> is trying to set the vector registers.
>=20
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/uapi/asm/ptrace.h |  7 +++
>  arch/riscv/kernel/ptrace.c           | 70 ++++++++++++++++++++++++++++
>  include/uapi/linux/elf.h             |  1 +
>  3 files changed, 78 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 23c48b14a0e7..75e66c040b64 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -80,6 +84,61 @@ static int riscv_fpr_set(struct task_struct *target,
>  }
>  #endif
>=20
> +#ifdef CONFIG_RISCV_ISA_V
> +static int riscv_vr_get(struct task_struct *target,
> +			const struct user_regset *regset,
> +			struct membuf to)
> +{
> +	struct __riscv_v_ext_state *vstate =3D &target->thread.vstate;
> +
> +	if (!riscv_v_vstate_query(task_pt_regs(target)))
> +		return -EINVAL;
> +
> +	/*
> +	 * Ensure the vector registers have been saved to the memory before
> +	 * copying them to membuf.
> +	 */
> +	if (target =3D=3D current)
> +		riscv_v_vstate_save(current, task_pt_regs(current));
> +
> +	/* Copy vector header from vstate. */
> +	membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state,=20
datap));
> +	membuf_zero(&to, sizeof(void *));

No idea why I have not seen it in any previous version, but this "sizeof(vo=
id=20
*)" just made me thing "what is going on here?". I personally would have=20
written something like "sizeof(to.var)" or "offsetof(to.buf)" or something =
like=20
that. That makes it easier for me to understand what is skipped/zeroed here=
,=20
let alone making it a bit more fool proof when someone changes one of the=20
struct layouts. YMMV.

Regards,

Eike
=2D-=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix - smart embedded open source

--nextPart5919597.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZCKAvAAKCRCr5FH7Xu2t
/MJqA/43E26RHc98CNLURi6a5ci9ANMlv1pRjWuGyTEhG7ZIhzJwW/ys2IXttNkq
ffUrDmMgY9C24EggVrxESn9Qp2pn2tlZpE5+Xfn8tvULfzzhcO4HFRMJddIVI1pX
YdXWklrHCdQSwU6abUys9yyAkM/cK1G1VB36bANrm3nXoDQI7A==
=OeNr
-----END PGP SIGNATURE-----

--nextPart5919597.lOV4Wx5bFT--





--===============5746332039436796448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5746332039436796448==--




