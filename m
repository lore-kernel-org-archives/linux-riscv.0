Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68843C678D4
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 21:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yeeAcSfXq/MFJALOiBBK8WeD5WTlAZWSpcnsmJ3I8c=; b=UclPCpjeJBLba3QSjObZxHVikE
	evuaLSM3A+kFhiLiiA4bcxs09l+BX0HfkyhfatMYvRhmo3az7kD75fbauwx3xlXCfXmmPj8b/7NKw
	FGINYaLUW++HUXWjyTJ8O/GYQiuS7EHYrOrpJZW8CCxlm8CIaExHUOf/QEHh17kZYCqz7P3yCFnLZ
	xMp/ElOQQivFcoDQik7xc8bF44eCHzQRBA+de2gTIz+w4mCQzqDW/Kgbz2oMUQb32sMsPCeRoGAgI
	/TmONEDpWM4RbsMPY1MkJSvwN0T4SFakwwvjQPi/6Gx1+U9CfXjgg8dmN7qxY8qiTvVtzLhBoo6rq
	bMw8kgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXTZU-0000pY-Vw; Wed, 01 Mar 2023 21:01:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXTZO-0000mn-FD; Wed, 01 Mar 2023 21:01:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1985CB81147;
	Wed,  1 Mar 2023 21:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD31C433EF;
	Wed,  1 Mar 2023 21:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677704459;
	bh=uFiPEF5SLKILtrhcsofkjCqm4Khs84ThWqK5VyBLNYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+ZZ9hB7I+/6C3jmNSVw3DxwrR5rwTjJ2pKiWKvB/KvD6RBzoDb2lErFkyOq+MwYJ
	 e33C6QQ4faJnC2r80J+BFxK+anYRRWPtX4RS+tbAMul2JSv+Ggdz/ZydjDulWwRTG5
	 rhmDZDgGUZQstigcwrqVWBu8AG1oxb4PrlMrZ2YqRsQ7sW3nKEWs47CLPrgTywgm9A
	 jLZR2RqSwdjKFsVoxZyLiUvOl4LE80xhNAqv3LM/Djs/febwoXHGmJQ11lPa4ioZMa
	 rGlgNNRkhoT56socCiZ1aWlqoWSvcn+s/odcXDVOOhwZVRoIw5huySEefWhXhfHsxP
	 pSkgY1AdPeacA==
Date: Wed, 1 Mar 2023 21:00:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: Re: [PATCH -next v14 15/19] riscv: signal: validate altstack to
 reflect Vector
Message-ID: <c9ae64d6-c11b-4309-a836-aa6d4eabc6e5@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-16-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-16-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_130102_842916_7E38DA2E 
X-CRM114-Status: GOOD (  26.00  )
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
Content-Type: multipart/mixed; boundary="===============5451434711984168807=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5451434711984168807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gCgIlrwmSokGHDIR"
Content-Disposition: inline


--gCgIlrwmSokGHDIR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:14PM +0000, Andy Chiu wrote:
> MINSIGSTKSZ alone have become less informative by the time an user calls
> sigaltstack(), as the kernel starts to support extensions that
> dynamically introduce footprint on a signal frame.

This sentence is a bit difficult to understand. I find re-hashing the
wording often helps me understand, so does the following mean the same
thing:
"Some extensions, such as vector, dynamically change the footprint of a
signal frame, so MINSIGSTKSZ is no longer accurate"
The wording "less informative" doesn't really mean anything, what could
happen here is that the sigaltstack could be larger the MINSIGSTKSZ and
would therefore be outright wrong?

> For example, an RV64V
> implementation with vlen =3D 512 may occupy 2K + 40 + 12 Bytes of a signal
> frame with the upcoming Vector support.

> And there is no need for
> reserving the extra sigframe for some processes that do not execute any
> V-instructions.

Can you reword this sentence like the following, substituting for "so xyz"
please?
"Processes that do not execute any vector instructions do not need to
reserve the extra sigframe, so xyz".

> Thus, provide the function sigaltstack_size_valid() to validate its size
> based on current allocation status of supported extensions.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/kernel/signal.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index aa8ee95dee2d..aff441e83a98 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -494,3 +494,11 @@ void __init init_rt_signal_env(void)
>  	 */
>  	signal_minsigstksz =3D cal_rt_frame_size(true);
>  }
> +
> +#ifdef CONFIG_DYNAMIC_SIGFRAME
> +bool sigaltstack_size_valid(size_t ss_size)
> +{
> +	return ss_size > cal_rt_frame_size(false);

Seeing it here made me wonder, what does "cal" mean. I assume it is
meant to be "calculate", but "cal" in my head is usually "calibrate".
s/cal/get in the patch adding that function IMO.

> +}
> +#endif /* CONFIG_DYNAMIC_SIGFRAME */

The change itself, if my understanding is correct, looks fine...

Thanks,
Conor.

--gCgIlrwmSokGHDIR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/+9BgAKCRB4tDGHoIJi
0haLAPwO9CPhIOqvecgqTm+lWOANRXu+OJbVk5zrQgMt8AJprAEA0WiJw1aWRwhu
ahSMEbkvlNYFf/HJF2dCDI7DhQEPAw4=
=KcKm
-----END PGP SIGNATURE-----

--gCgIlrwmSokGHDIR--


--===============5451434711984168807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5451434711984168807==--

