Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C468EC54EBE
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iw77Sb24CjuJF/2uIkxk59vecqyYI3yNucXfRgv/+Vw=; b=00WHGJ3VAkhkyPN/AZPlfTfw94
	AxfoUIBDKk4tES0r+BTPWTa3NomeTssCivXP+hQh6hUMadcI8WVvbnCofNvN/19eHVADacQyZ2XX7
	1OWXuq7fxPr7HwHZuxO4wxogasgpTn6CeaT8bY2gflM+7nwyN+2WMLr9i7mVXDIptiPYDmIDSroBF
	Fawsqdpzv5EcPT9bSmRB7p0t2So7aMmDHVHbWftFZK3owH5yRcCsnHptI4rMNcxjM0YmruLvEVMSz
	6e4Hnl9x5wxkyEZAMOEHLbu1OZJs0JEY2EnSADsXDpiSWGRrrsbTrxoHeFxA5SBxK+v1WtK0CnYwH
	WvOELElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHSZl-00BR2E-DS; Mon, 16 Jan 2023 16:43:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHSZj-00BR16-4k
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 16:43:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15BE461042;
	Mon, 16 Jan 2023 16:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7DCC433F1;
	Mon, 16 Jan 2023 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673887389;
	bh=bJWUaCc2w1rlVJWeE+Jz7P/GrJRv4ILhxlymmlrf4FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQZst3BVrnfUKziaoY68mYDCoXbbc/SJRC1Yl1/J8e2AxUhvOG89IF5lZD7ichxt8
	 2Lkcp3qVBsgP7ikKtzJa6RYChCgZh9E8l41HbCRlmYWjhfznzeP9pYqHIFVFTWcyD4
	 UtQhtc2F8zv6l5T+kZNrdai0g+IL4GNWujAvfznze/WxekHx6K3krVA0gRRN+xRoPc
	 42mnj9n0TAiBe5MM51JOCikhOe2eRzLwROqzaRzBZdkrM4PY8yacuXT32MPABkrlnd
	 3J3WwZtjzBbF54Rch+wSVp72CC6dyQXjB0xi4GVqHXy4jdbx7BLCWtLadJHToe7vte
	 RmJKoheYEm4sg==
Date: Mon, 16 Jan 2023 16:43:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] riscv: lds: define RUNTIME_DISCARD_EXIT
Message-ID: <Y8V+mXWZfA62JYvJ@spud>
References: <20230116154800.2396-1-jszhang@kernel.org>
 <20230116154800.2396-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230116154800.2396-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_084311_260126_63AE033B 
X-CRM114-Status: GOOD (  19.10  )
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
Content-Type: multipart/mixed; boundary="===============5838708189670460791=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5838708189670460791==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cLS7twstJ6CgHUU1"
Content-Disposition: inline


--cLS7twstJ6CgHUU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2023 at 11:47:57PM +0800, Jisheng Zhang wrote:
> riscv discards .exit.* sections at run-time but doesn't define
> RUNTIME_DISCARD_EXIT. However, the .exit.* sections are still allocated
> and kept even if the generic DISCARDS would discard the sections due
> to missing RUNTIME_DISCARD_EXIT, because the DISCARD sits at the end of
> the linker script. Add the missing RUNTIME_DISCARD_EXIT define so that
> it still works if we move DISCARD up or even at the beginning of the
> linker script.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.=
lds.S
> index 4e6c88aa4d87..07c19f2a288c 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -5,6 +5,7 @@
>   */
> =20
>  #define RO_EXCEPTION_TABLE_ALIGN	4
> +#define RUNTIME_DISCARD_EXIT
> =20
>  #ifdef CONFIG_XIP_KERNEL
>  #include "vmlinux-xip.lds.S"

Since the diff is identical to:
https://patchwork.kernel.org/project/linux-riscv/patch/20230102124936.13635=
33-1-conor@kernel.org/
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Your commit message is better anyways.

Thanks,
Conor.


--cLS7twstJ6CgHUU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8V+XQAKCRB4tDGHoIJi
0ii7AQDv33/mIthfIt67nkcS3Hu/G62BVbaAEwsGL2gLAaM1QgEA0I8HxFQ4G5Uv
Abu5Zyjmb26ygqwQB8k1rf4GRpgJcQU=
=Y15L
-----END PGP SIGNATURE-----

--cLS7twstJ6CgHUU1--


--===============5838708189670460791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5838708189670460791==--

