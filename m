Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC050C64ED6
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxA5FW7Coam9rsG7sUaIVYQIzozyQ/aG6jC514g8n34=; b=btKS8lTWeJXwO69y5Uwcub010X
	6GZGstCfCa25LHcGzG4EuZmNAZnOMj18I9rWUsMaZ8UHocaIHMEZOxEKV4fAXfEpG0Xkmpm/jR0Gh
	DxNGCmjuMwOwLartIwPkoPmNngFpg8e5p6hYTuYUFDDBSCAuI9V7onjXfglY9OdsHfDWKVvaz5xPk
	QAY+z5l9M87OlTvAhyGdT5DLhAbZIVGi2EYHDoahD0DXfH/nLCYls0d846M29dVR3nOzh2jF+cIDf
	N5rfrdekInR+bW3md+HD5+DVbuh5ezQKK6OH+vsnTsq2NtxUZWh17CKFvPxhWpa6j17lkLwkM41Q7
	ZhPeU6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXQHI-00GyXb-Px; Wed, 01 Mar 2023 17:30:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXQHG-00GyWf-Jx; Wed, 01 Mar 2023 17:30:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37D2C6142C;
	Wed,  1 Mar 2023 17:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12B3C4339B;
	Wed,  1 Mar 2023 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677691803;
	bh=AnretRIAHtjSZSeScp081+39dAq1WeF3Q30drGyIvNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNlOs5oHEUeriuLQ0tPh5AZJIms2ZfTXq5EsS95+7CZwTZHgBa0UdRRysmQbfmIsL
	 Azu8dl9O9JT8DfJP6NUmyIzlMgg67uoky1AgqY+St20CiFYmdsYUZqPoY8mqQB1a1x
	 MQpRSpynT+Ho+o3oDPI2B+0+XwrreNPjKENeRlBi6+YHsbd/6WDDg5sMFrb5uC1qvA
	 86MaHKo41acG/uaVnhJKqvlQt+afP8fF2/NHOTIKuJmuOQxFgeeAtKzZxyMlhwGuEt
	 WfnSUn13oH9liVLV0jfUGpIPIlqINpCAaiRY2+Y+HNTO+XwyQZRRJj/iVZT8cNK3oM
	 dN6KtoB3FRJCw==
Date: Wed, 1 Mar 2023 17:29:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Rolf Eike Beer <eb@emlix.com>, Huacai Chen <chenhuacai@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH -next v14 11/19] riscv: Add ptrace vector support
Message-ID: <Y/+LlNjJKA93FM7w@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-12-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-12-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_093006_737910_13A139F9 
X-CRM114-Status: GOOD (  18.04  )
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
Content-Type: multipart/mixed; boundary="===============4492935759067075172=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4492935759067075172==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GhW3vsjuT8BV+9si"
Content-Disposition: inline


--GhW3vsjuT8BV+9si
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:10PM +0000, Andy Chiu wrote:
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
> ---

> +static int riscv_vr_get(struct task_struct *target,
> +			const struct user_regset *regset,
> +			struct membuf to)
> +{
> +	struct __riscv_v_ext_state *vstate =3D &target->thread.vstate;
> +
> +	if (!riscv_v_vstate_query(task_pt_regs(target)))
> +		return -EINVAL;
> +	/*

With the tiny nit of a missing newline after the return, both here and
in _get(),  this looks grand to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--GhW3vsjuT8BV+9si
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/+LlAAKCRB4tDGHoIJi
0jjGAP92sCBHnExQMUSTyKYLd77FpiWjp8SKxLmkOQQwlbv8GgD+Ou8ZyiCtToLB
UeLZqVr9O+2U0WRJtferBBTYXdSbWwo=
=dJVN
-----END PGP SIGNATURE-----

--GhW3vsjuT8BV+9si--


--===============4492935759067075172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4492935759067075172==--

