Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92433C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 20:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t96vBodFjlVPNP0nTK/d6DfIpfERSM/Qx/tf5P52eZ0=; b=ySHE4LprvYr7u/hdihc3ImNatr
	mF7PKfMF3Q8s+1J+LkfMT3yuxZMq+1bqwlIA0OjQFRQb0A3MAuv/KL8Fd2CWeGPTdwWR2MnbtS2ff
	afxU/YOCrCtBEDyx6fd2TbfwvOsH2ofVe3kmRb1O0bPzI4bNPUxBs8ijdabLNUHXaIoNtCiCY7z68
	nihyGJL7McQ+H9zRgM2QNDaoOLV0wdG/1Y1hC3++JtVffFjbOq3MbiGRkA+PDjsIsG9k3L8N0ZaGN
	CMXTKK6PFutxdVvaji4y+kSMissO43uU7nTrVjL8eaumlE9PTfydqfGVGwdFhPQtjdkFPqFAmG8a6
	77UnrZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5XHu-00000006R9t-3KmO;
	Fri, 10 May 2024 20:56:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5XHr-00000006R97-2bK9
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 20:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA46161E7D;
	Fri, 10 May 2024 20:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF9BC113CC;
	Fri, 10 May 2024 20:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715374574;
	bh=cByeZ/lC6AB3uZmC/kZETxlLuSZiIR/cTU3FsQbCfIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hcX1OJQmLlYLWY4DVkqGz99mxPY7Md3b6PeC4zeEj3znodufL9/snjgAXDo74z6Nh
	 QBcLqcOUTIjNUn03dWuJtdPlU6Edy7WtXcaDdiJFAjyO8PubOS/n4GKlkLRY/GomP2
	 E401y5gPBQ5wM0cY4NVwWYsZW/tqifWQVavW7TRLvxdq5KK0rQ0nFsFszL/Hpv85Zi
	 UrNGc5lHz/7erFAkz6nSz/HH1vWWpwgM+q/73U8kdiSIHG7n5CyXcrm6SLpOxt3KTW
	 AENf5HG+0MeICek8ytlk1KaL+0pOiYikl1bfs//wxis1KVvwKijPTwvanB8hkfY255
	 ekmW3goYlpWiw==
Date: Fri, 10 May 2024 21:56:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	pulehui@huawei.com, haicheng.li@intel.com
Subject: Re: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
Message-ID: <20240510-essay-subwoofer-e055375ff1cb@spud>
References: <20240507104528.435980-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20240507104528.435980-1-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_135615_828814_7C113F8E 
X-CRM114-Status: GOOD (  17.31  )
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
Content-Type: multipart/mixed; boundary="===============3941096168068104333=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3941096168068104333==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jtU1AroXrzjM0WOG"
Content-Disposition: inline


--jtU1AroXrzjM0WOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 06:45:28PM +0800, Xiao Wang wrote:
> The Zba extension provides add.uw insn which can be used to implement
> zext.w with rs2 set as ZERO.
>=20
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/Kconfig       | 19 +++++++++++++++++++
>  arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
>  2 files changed, 37 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6bec1bce6586..0679127cc0ea 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -586,6 +586,14 @@ config RISCV_ISA_V_PREEMPTIVE
>  	  preemption. Enabling this config will result in higher memory
>  	  consumption due to the allocation of per-task's kernel Vector context.
> =20
> +config TOOLCHAIN_HAS_ZBA
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zba)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zba)
> +	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
> +	depends on AS_HAS_OPTION_ARCH
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> @@ -601,6 +609,17 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>  	depends on AS_HAS_OPTION_ARCH
> =20
> +config RISCV_ISA_ZBA
> +	bool "Zba extension support for bit manipulation instructions"
> +	depends on TOOLCHAIN_HAS_ZBA
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZBA
> +	   extension (address generation acceleration) and enable its usage.

Recently I sent some patches to reword other extensions' help text,
because the "add support to dynamically detect" had confused people a
bit. Dynamic detection is done regardless of config options for Zba.
The wording I went with in my patch for Zbb was:
	   Add support for enabling optimisations in the kernel when the
	   Zbb extension is detected at boot.
Could you use something similar here in the opening sentence please?

Thanks,
Conor.

--jtU1AroXrzjM0WOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj6J5wAKCRB4tDGHoIJi
0hI6AQCwdFRVZ6kbYjLkxwS53moo/SJNNSnkuYEOouupqPCGPwD/XT7r7ko4jzGW
TgQCNlEOK7C1NRhLOBJ754MCcA84/wM=
=wgKo
-----END PGP SIGNATURE-----

--jtU1AroXrzjM0WOG--


--===============3941096168068104333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3941096168068104333==--

