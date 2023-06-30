Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A737EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqPVahC87LS/6t7IdzMnCDCQDXYbx3HGOaRyEU4jU4U=; b=2p+adKc3FBspv/q2xoU33w7TH9
	bwueh+4cvT+OKNRYGF/AeVE4yL0Rpm1cnR9+pIkeIsqzHZTE6ZNv8/HIQceITg3KDs4RT9aX98h/9
	CCQhaZhNYsvHx5DR70dB56oIWjI+WD9id4IWCuv1Mms8DgSItaGF4i32lpI/CyJRMnwR6ARJJtj3m
	umymeFgehlWL4oa77CLIP0qqMEvpx8HjAZXN1bOxABNC19wg6CohHO40VbGvUZaoub1u6gCpwoZgK
	y9UPozS0XiBVurQQEiIE5pY9Wj8b86+Vh8A3OaY3BMpT/8dT61Ms8FoO/eYvZ2xTNAHt+OUCAQSUM
	2NRTBpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJTP-004Nqv-2Z;
	Fri, 30 Jun 2023 19:08:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJTN-004NqX-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 19:08:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2003A617F3;
	Fri, 30 Jun 2023 19:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7867BC433C0;
	Fri, 30 Jun 2023 19:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688152080;
	bh=17MXOGeiI3F3FBpWaJtF9ruFS/NqAZ5ZllRZXut7AOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgwsTvAvkh4gCPbOx2sT1SZmELaQ8AlxcMn4Y4vR8uravryYhFKtVaqyfFatd3Lwg
	 h1qs8GsBfu/X4timESeOK4csKXK9w/vwGrB897jXL9Amps+ksxBuk1KYs3h9u1sVhG
	 MVBpTiVVoBxaiQdXxwF5LjBu76UmBa9oLcg4ZBm9K6w3Y/6m9dIQebsRcZ/06IjzPk
	 9uj+dIc5E+uzQFUjp0sBWv9d9nQeobGBaPX+DQTbyYZSs3e5HDrQzaKEkSM8HCI1ZG
	 83tvDErk8o04Xe7qWN+IucnZRL0w6neppqbWb7BfYai4eERz/HBtfnTSeaHKSo7apR
	 odtwAbfzF6tLw==
Date: Fri, 30 Jun 2023 20:07:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
Message-ID: <20230630-rake-clubbed-bba8a9c27219@spud>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-14-samitolvanen@google.com>
MIME-Version: 1.0
In-Reply-To: <20230629234244.1752366-14-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_120801_878776_26999595 
X-CRM114-Status: GOOD (  16.41  )
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
Content-Type: multipart/mixed; boundary="===============4263385928090333718=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4263385928090333718==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nIytQ0cE4OI/O9o2"
Content-Disposition: inline


--nIytQ0cE4OI/O9o2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 11:42:51PM +0000, Sami Tolvanen wrote:
> Select ARCH_SUPPORTS_CFI_CLANG to allow CFI_CLANG to be selected
> on riscv.
>=20
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 20a40927175e..2699e1f8fe33 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -44,6 +44,7 @@ config RISCV
>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>  	select ARCH_SUPPORTS_HUGETLBFS if MMU
>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
> +	select ARCH_SUPPORTS_CFI_CLANG

Please add new entries in alphanumerical order, thanks.

>  	select ARCH_USES_CFI_TRAPS if CFI_CLANG
>  	select ARCH_USE_MEMTEST
>  	select ARCH_USE_QUEUED_RWLOCKS
> --=20
> 2.41.0.255.g8b1d071c50-goog
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--nIytQ0cE4OI/O9o2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8oDAAKCRB4tDGHoIJi
0tBQAPjbTVlYsXsyPEXbChKm896xE4tK0LzcWglSDjocpk2uAQCf4jf8R7g7Veb7
13b70HROD+koWjNEGZd6gmiTTxBFDQ==
=/P/0
-----END PGP SIGNATURE-----

--nIytQ0cE4OI/O9o2--


--===============4263385928090333718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4263385928090333718==--

