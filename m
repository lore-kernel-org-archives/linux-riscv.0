Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603BEC64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 23:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDdObCWr2vLAhMRIyQ3a+Jn+0TNXaeP6Jj/xvEaVKXA=; b=m8bK4sIPEekcf2xb2EVMkwvXhA
	Lxa23g597yaJoQhFnWUmMQ4tk4W9P5MMh3Ekr0Xs9WmQ290qL+WI5Nmuw/2M59IJlLKLLBn9Vkoz9
	n3wPrE6i4Z2ByrZIDG6tll2WkNH7HkQ2ewAIXZZ/4d0Sdd4XtRyauKyA+qu4HqUAL5/QY/0F/FsLE
	PWCN+u2V9HgWkBhC8KMqevG13cqSZI06B9l5ssYJKLzhEamMex1Fycbl2PT1dlYPF+gz/ccS+NzlI
	NdGLZNieSIPFj9rILXQlZ3S5kT9QgsyYP7YTy7FxdZTppnKOvzz+hiswgoJux+oyxCW2cLAnnBhgn
	x9gn7h/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmi7-00BZ6c-4y; Mon, 27 Feb 2023 23:15:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmi4-00BZ5u-7g
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 23:15:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 35EC1B80D2B;
	Mon, 27 Feb 2023 23:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517B4C433EF;
	Mon, 27 Feb 2023 23:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677539703;
	bh=ZBHNECAhstQhQIfVxLmWfx+9U+cYMlGgp/4GCzlwY7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wyz6inJ15Jx6h5dTdXCZ3dH4iI+pz9TdOdJUXWaXHhUonQok4QQcBdUyDzZRKguQM
	 TbnM4hZPKpBZ42SfWVuCPW/DEDqpEzxvhj3GDPcnd6qdozMy0xTXJKQKimjclhKPDm
	 JQ48flxE+75mOSfDL2jY2l55m9r9cQYXRnfxNQaQ5cwKjKbTclzY83dh7Y/QIxNy7O
	 5zehXy/JXEYRr2M1/SX/uEqhlLNVp3mLZ8p+ehelDLnTiZ8en7IwudA+Mvvn8HZeNL
	 nxumQjw+SA78S0ueupBRgZf9guvmCsB/M6MUN6YB0SPAykR0xOT4cpO5MeFbNXesBc
	 i4IluDXdXUxMA==
Date: Mon, 27 Feb 2023 23:14:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v3 5/7] RISC-V: hwprobe: Support probing of misaligned
 access performance
Message-ID: <Y/05cBMyrYSiaNL5@spud>
References: <20230221190858.3159617-1-evan@rivosinc.com>
 <20230221190858.3159617-6-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230221190858.3159617-6-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_151508_596400_4EA4CA7F 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, slewis@rivosinc.com, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: multipart/mixed; boundary="===============7182674334196553945=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7182674334196553945==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SxTha3qIYXZ4YGJ0"
Content-Disposition: inline


--SxTha3qIYXZ4YGJ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Evan,

On Tue, Feb 21, 2023 at 11:08:56AM -0800, Evan Green wrote:
> This allows userspace to select various routines to use based on the
> performance of misaligned access on the target hardware.
>=20
> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
>=20
> ---
>=20
> Changes in v3:
>  - Have hwprobe_misaligned return int instead of long.
>  - Constify cpumask pointer in hwprobe_misaligned()
>  - Fix warnings in _PERF_O list documentation, use :c:macro:.
>  - Move include cpufeature.h to misaligned patch.
>  - Fix documentation mismatch for RISCV_HWPROBE_KEY_CPUPERF_0 (Conor)
>  - Use for_each_possible_cpu() instead of NR_CPUS (Conor)
>  - Break early in misaligned access iteration (Conor)
>  - Increase MISALIGNED_MASK from 2 bits to 3 for possible UNSUPPORTED fut=
ure
>    value (Conor)

I'm not quite sure why we don't just go ahead and plumb this in already?
Whether the specs allow this or not, someone is going to end up doing
it (and it sounds like the specs now do allow it).
Is it wise to plug the hole in the syscall now, rather than leaving the
gap?

Otherwise, this looks fine, modulo Joe's comment about types.

Cheers,
Conor.


--SxTha3qIYXZ4YGJ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/05cAAKCRB4tDGHoIJi
0ih+AQDO+TBU5dt3vbjyzYvBj2OYRSRoj+m7fOk3ZiuU/t6iewD+K9qpmYRNlEdh
cLzg0+K2QIc1GWFWHR++hP2QHlQnTAc=
=xn/p
-----END PGP SIGNATURE-----

--SxTha3qIYXZ4YGJ0--


--===============7182674334196553945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7182674334196553945==--

