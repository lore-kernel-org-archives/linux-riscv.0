Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CB4C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 19:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3aUnSeRf0gMB8jhKhKjycavIbbj6SiSz9sRnxG3nno=; b=rj63wUKco/N3nv/4eTHRweehP8
	h77V1vD441qGzzFvSkJT2jkJftYfYaRHnDM6FAi2J3y82BwtT2BfFDCl81/Y4dYjUqC4wucZGkUDe
	dChOSkGBBvnC7MkfMT1+smZorBZNNwFNcGSc8+BmU36PZxNJBX13F2G+74/QujK5gKN3lemApB54U
	zucoMeRtOr9zJ/ZxH3Epy5oEw24YW++6u+cOoav2nVSMKSxpBoIItftiWxqO28edWLEZpidivjfNG
	U1x6lEklpZNw6wA3lDHHmJHPeTwXfqINDTH3wCUNmGdfuR3kLGDy0nq9VVvB0Tr/ctqc9ovngoiKW
	5p4xMgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9VUH-00000000wvE-22EE;
	Tue, 21 May 2024 19:49:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9VUE-00000000wu6-1dUs;
	Tue, 21 May 2024 19:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68A5362461;
	Tue, 21 May 2024 19:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBDAC32782;
	Tue, 21 May 2024 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716320965;
	bh=5VxfSyKHqzOTEZZXzZT0aLiSoKTpopx0vsuhYEVZU44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKAcwqxMdvphissksxBIPo4FGq5KPKX5AEWVVQ7lfMWYqInRJAiv62MhaLPG8X/CJ
	 LPy2sNv63Ns1zkEtgNV5LYXsdZZxw2z9bmmmUBOV3XvxhyUmm4NLiRft4/a/9tvmAd
	 JgFA+/vxMLqr18xEdz4O8WjbWSLTvY6QSkQxiJ6Ch2Kk63BOeNCBoMoSppWHHAC6T4
	 u73/wl8C6JEKK1Dbz+0RbvlfAn/zKENyT8qj2OlRC6J9rtupS9o2Okfe8K2dsqSxoE
	 zSHmCE6ARjH+EqqoV+acJDZTEK2z5xBLiavm3H8wzLBpW9uDz+1021dqaMh7HmU4Ld
	 opUY8g2tiYyLA==
Date: Tue, 21 May 2024 20:49:19 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Message-ID: <20240521-spiny-undergrad-efa1a391ad3d@spud>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-9-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240517145302.971019-9-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_124926_542534_87E66ABB 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============8906106261232856963=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8906106261232856963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZUPGMxJHsaJik2Qb"
Content-Disposition: inline


--ZUPGMxJHsaJik2Qb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 04:52:48PM +0200, Cl=E9ment L=E9ger wrote:

> +static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
> +				 const unsigned long *isa_bitmap)
> +{
> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) ?=
 0 : -EPROBE_DEFER;
> +}
> +static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
> +				  const unsigned long *isa_bitmap)
> +{
> +	return __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
> +	       __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d) ? 0=
 : -EPROBE_DEFER;
> +}

Could you write the logic in these out normally please? I think they'd
be more understandable (particular this second one) broken down and with
early return.

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--ZUPGMxJHsaJik2Qb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkz6vwAKCRB4tDGHoIJi
0kLvAQCE6VdTKzQsLhuTCAot4T9V9f4Lr+mwFH/JYa+PN4XSawEA4Bpid+JyrYkM
5yKjg6DZQIn95XuoTjrLNnKL0qkRvw0=
=XDFW
-----END PGP SIGNATURE-----

--ZUPGMxJHsaJik2Qb--


--===============8906106261232856963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8906106261232856963==--

