Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE3CC6FA9D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v33UgyUQKQAKiaJV02x4R98XK8Dz/VXI4T2k65/gYBE=; b=T/OF7f/WhbsJvvrgASt3YkEGBa
	p09VdauyGWPdFqV7eZxpZRO5g2dbZ3f1AQSnZt9Ghv6piVL49Kbo2Tzkgbpt7ylgqqgoki4P0yPLY
	8tA4zWsDOIaH3nkrgccsvIaZw+mGGpY6mcvev+BjFsngLK7EF9PMLMTkCxJxonlKd6rvkyirVTarA
	h5YHBgOmxuSqWG99Xt5RHUJI+sxoi4QVv0fmQeJhRzZNQ2GHaUxXX+NOwvQxiKAxkyhVnzTzJLOKz
	blFEiPegzVCk50EsUpzJfPb3QtgO6EBOWy9IY2GmRM8+HpZFUobkzvkvQ9lnDv/LD5I13y7AivN37
	raKzOXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXS1H-00HHRI-6a; Wed, 01 Mar 2023 19:21:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXS1D-00HHQV-Ly; Wed, 01 Mar 2023 19:21:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1814AB81126;
	Wed,  1 Mar 2023 19:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD39C433D2;
	Wed,  1 Mar 2023 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677698494;
	bh=WBTBIUMKXFK23HBhf466NKgfhwM/1RJoj4OvR5ssJr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVXMIER63OwIeXDglCri2kFRaWldxO1CDZNitGfSCpd1Ld5E0H4ZAAQdtijTzbrk1
	 h/N5lVrtdAhSU1vyV3VhGbSy5F/91Kh15Am5bUvsTm5HJ/pCDnrsQF3GTKc4R2Go3l
	 X0gCizMu0V3627yDCAmCdOaAZn5WN1T7bNNlgbym2m3NVZ/k5EguxZHnYtboPnTlCh
	 P1Q2dYVXaziQYxhgz2rA/z9+oKdSdtDaf0/7MFxLWjCxZF6CLRtBX8p6ebwgYjaSVU
	 3NPSgbb/eFF9KV5F9iQyhMd2pjrVm5Hf6oHOL3dLdxgqQb1bqHdbsV2NMEsc7w1EW6
	 rqX18YJU3PpCQ==
Date: Wed, 1 Mar 2023 19:21:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v14 14/19] riscv: signal: Report signal frame size
 to userspace via auxv
Message-ID: <b004ddc6-ec0f-4c7f-8201-df870bf0a86c@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-15-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-15-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_112140_038076_261D912B 
X-CRM114-Status: GOOD (  18.82  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, atishp@atishpatra.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>, linux-riscv@lists.infradead.org, Vincent Chen <vincent.chen@sifive.com>, anup@brainfault.org, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, vineetg@rivosinc.com, Al Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Knight <nick.knight@sifive.com>, palmer@dabbelt.com, Eric Biederman <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6403836107723300715=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6403836107723300715==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D394b5UyBxRiFD12"
Content-Disposition: inline


--D394b5UyBxRiFD12
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:13PM +0000, Andy Chiu wrote:
> From: Vincent Chen <vincent.chen@sifive.com>
>=20
> The vector register belongs to the signal context. They need to be stored
> and restored as entering and leaving the signal handler. According to the
> V-extension specification, the maximum length of the vector registers can
> be 2^(XLEN-1). Hence, if userspace refers to the MINSIGSTKSZ to create a
> sigframe, it may not be enough. To resolve this problem, this patch refers
> to the commit 94b07c1f8c39c
> ("arm64: signal: Report signal frame size to userspace via auxv") to enab=
le
> userspace to know the minimum required sigframe size through the auxiliary
> vector and use it to allocate enough memory for signal context.
>=20
> Note that auxv always reports size of the sigframe as if V exists for
> all starting processes, whenever the kernel has CONFIG_RISCV_ISA_V. The
> reason is that users usually reference this value to allocate an
> alternative signal stack, and the user may use V anytime. So the user
> must reserve a space for V-context in sigframe in case that the signal
> handler invokes after the kernel allocating V.
>=20
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--D394b5UyBxRiFD12
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/+ltwAKCRB4tDGHoIJi
0vQ7AP0YSx4MnkgGVqWDk0+wp+vxnLj9imW9m5d8IMjgkIKecgEA6dhhbUlzkc4P
uRLPGfCn53oHACLzx9Goj7dgpnLcTgM=
=2iPH
-----END PGP SIGNATURE-----

--D394b5UyBxRiFD12--


--===============6403836107723300715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6403836107723300715==--

