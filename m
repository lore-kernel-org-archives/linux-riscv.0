Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8801C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42/SpZArdg4f+U4xlsI0CIPcKcm6d8LWqiLiO/Ifgt8=; b=HSdzTwpfH76L1Ouy1Uy0hRcQX9
	NsqVbU9yWmbsxUYeo8XraMyUuuhVqL0ABNjsPnpYzEZwaaFDGD618Gc7Mk1g97xs3DADlh2R4+aJW
	RSp0JWQkWK+kD5jFE05jhqCRwCDi0Cbb3v1RjkjcNHSvJDjPoeYHcfAnBc6vb+AoL5NxBHQCQw/VM
	UShzt5jm+IZ5OaFRnYeRaMNcMNLhQqOaWwfWyXff2RWjYIWx5e5lYu/K10SxibN6GepujKGUBPoGp
	W4jeDL2ARPMrIDf0Gz3bcV2yEuP+X5psikIAiFtlmrcLqafdxskjTFgFbcHnEmgvbsbVaNh8j3fFS
	ovaxXN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAYh-001blo-BT; Wed, 18 Jan 2023 15:41:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAYe-001bjK-U0
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 15:41:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8550618B4;
	Wed, 18 Jan 2023 15:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A29C433EF;
	Wed, 18 Jan 2023 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674056456;
	bh=rO8HYV3RoFPoUMVXXwh7qd2rgWZuCNPeGdTghO2UUhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SXeciXBJN9E9sR362APlLjKv/nGI/SZUaSTt+V8pHOa4qHQKJnoJN5yKSFzgCXQ2j
	 4SaHytHBkoH3Odn65qQz3k745U7WNw1kkk7BXAVO17L6nTcouvKzOWpVytRoTMsmNp
	 8RJaxxcloHQl2oMQBi0GNLvsudlvhMNouHEbYLVB9THdkWPBPsUiSAG+anIxToFO2m
	 kBGQoIU6CQ983TmLprq+lFiVnSB5U9oGB5IwBEllVq1pOK7y1cjl5g50N0AqAix8zZ
	 PDVrTW0jVPVSZFRIAiJRW6bnnz6fJ0pFvnkbRq7d3wGoSss0v0w3Q+TMzVaYc7QK3p
	 7tlAJ0Yj4M3kg==
Date: Wed, 18 Jan 2023 15:40:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	abrestic@rivosinc.com, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH] RISC-V: Fix do_notify_resume / do_work_pending prototype
Message-ID: <Y8gTBJsB22LSzZFy@spud>
References: <20230118142252.337103-1-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230118142252.337103-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_074101_025157_42C41EAC 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Type: multipart/mixed; boundary="===============6283999597015972633=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6283999597015972633==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JL7jAprDZJCZidC2"
Content-Disposition: inline


--JL7jAprDZJCZidC2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2023 at 03:22:52PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> Commit b0f4c74eadbf ("RISC-V: Fix unannoted hardirqs-on in return to
> userspace slow-path") renamed the do_notify_resume function to
> do_work_pending but did not change the prototype in signal.h
> Do that now, as the original function does not exist anymore.
>=20
> Fixes: b0f4c74eadbf ("RISC-V: Fix unannoted hardirqs-on in return to user=
space slow-path")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/signal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/signal.h b/arch/riscv/include/asm/sig=
nal.h
> index 532c29ef0376..956ae0a01bad 100644
> --- a/arch/riscv/include/asm/signal.h
> +++ b/arch/riscv/include/asm/signal.h
> @@ -7,6 +7,6 @@
>  #include <uapi/asm/ptrace.h>
> =20
>  asmlinkage __visible
> -void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_fl=
ags);
> +void do_work_pending(struct pt_regs *regs, unsigned long thread_info_fla=
gs);

Is that an auto-builder blind spot as it gets jumped to from asm?
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--JL7jAprDZJCZidC2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8gTBAAKCRB4tDGHoIJi
0hKPAP4zC1ICCf8sd9GrWvccD8MxkPeqYLw1OzSITXzfTsbfVAD8DGNL5mt7dwSa
mGDVAT2eSZDz939/Md8SBF7NON3ijgQ=
=SGvW
-----END PGP SIGNATURE-----

--JL7jAprDZJCZidC2--


--===============6283999597015972633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6283999597015972633==--

