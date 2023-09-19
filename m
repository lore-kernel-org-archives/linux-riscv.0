Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B36CD5489
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JK9esrLIY2ayHCc6OXLP1aCgySUO2dh+iBomNA11c94=; b=cR5dCQtjnc11GdUG9UncluhjpP
	6A/ar9rm99Z5fy7AbjqXCtmHXqlpzvy30b8fR4eIaDsx7elbiSLGJzOEwsmgyvXVjdb2Fzxsp1Vbu
	AC/Obx4SynhL6ea/0KBkN5+kow3o+yVOAqpoUItYhjeP58TTCkFI5/lm5Z/ndyed41BUB2bSHzV60
	2Vrps6GhYN9+v3NRo9E1kJBkj7jTDuOhh7lyhIEdQK5gVRli6gJFz1a1GsbOF28zdVG5ubJIVWNxY
	rQEjQKnc9DGhKSejncbFLO2IOU+vnKh7+iw8qgagJK7OMnwQDx4UqtdDa9K6XFMlLr/J/UuQjdkjf
	EAX/MdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVK8-00HGvW-2h;
	Tue, 19 Sep 2023 07:39:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVK6-00HGtL-0W
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 07:39:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 98D92B8111A;
	Tue, 19 Sep 2023 07:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B066C433C7;
	Tue, 19 Sep 2023 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695109140;
	bh=tqhb6QuF9hoxfX+sFDBQeHAQY+NCiWISygxA74bHCkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qljvadyU8i1dKNJYd5S2NBbgyPTxwRVodAIwSYx0jnK/YMp916+44PyJ/qv9ul5d/
	 LOg8Tyk7Gb42tu0mMJL8nUrhrxNgEyTVxuXpreFGSUZ/MpOpxHyWcFLFjb4Kv6iODJ
	 GYA38agpajhieXpTYCBFMdLL2/QE3BbcNzZmrWUSY/8Kv2b13FGnzBWOgiF9rRZUeb
	 cP+1m8SlXpvB4bJ8coXf/NfR4t4j4mH5vKB6iE2NEHDPqxpYMYaxzGuYgg7dG+Qxax
	 Gr5hejjnI0q2Vx0hIZGrhHZfqRp8PwNy+M4YbJX/MkskXeRXXTssJIL+IaOxNP4/iV
	 ECjO83WhEOl5g==
Date: Tue, 19 Sep 2023 08:38:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v2 4/6] riscv, bpf: Add necessary Zbb
 instructions
Message-ID: <20230919-a19c47b423c995826615a89e@fedora>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <20230919035839.3297328-5-pulehui@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <20230919035839.3297328-5-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_003906_348147_CC2FE4ED 
X-CRM114-Status: GOOD (  17.04  )
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
Content-Type: multipart/mixed; boundary="===============0387082444024554800=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0387082444024554800==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HjsL0/k0GTfRnZzz"
Content-Disposition: inline


--HjsL0/k0GTfRnZzz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 11:58:37AM +0800, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
>=20
> Add necessary Zbb instructions introduced by [0] to reduce code size and
> improve performance of RV64 JIT. Meanwhile, a runtime deteted helper is
> added to check whether the CPU supports Zbb instructions.
>=20
> Link: https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bit=
manip-1.0.0-38-g865e7a7.pdf [0]
> Suggested-by: Conor Dooley <conor@kernel.org>

Nah, you can drop this. It was just a review comment :)

> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  arch/riscv/net/bpf_jit.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index 8e0ef4d08..4e24fb2bd 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
>  	return IS_ENABLED(CONFIG_RISCV_ISA_C);
>  }
> =20
> +static inline bool rvzbb_enabled(void)
> +{
> +	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && riscv_has_extension_likely(R=
ISCV_ISA_EXT_ZBB);

This looks like it should work, thanks for changing it.

Cheers,
Conor.

--HjsL0/k0GTfRnZzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQlQCgAKCRB4tDGHoIJi
0lAsAQDKMczQeQ/9Tni+mAdtBKZ4QBYclutkynXdaOtsX2NFfQEAzlo6khw9xQPQ
X8o8jzqe3bZK760pii4CZijKVT/WQQo=
=Pjuk
-----END PGP SIGNATURE-----

--HjsL0/k0GTfRnZzz--


--===============0387082444024554800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0387082444024554800==--

