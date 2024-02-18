Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667C3C48BF6
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYSLlQa51jM8oyD0sI/5iRDLI+AtoE7HSyugvjSx9QQ=; b=2rJUgXpNJSmtwo9qDd0ICeJHFE
	wACLwMZgx+SavKdW2+N3OOSAC0Aa+JywQ6spz2lUwJC/Jf5afgWsB7QjpHqaIsPtzisFPZrcUmbPa
	tDavr42Rx9p44s+dGnqIAtLn33/Dt+rqeDc+Ne66F+5rlmW0Vi92FI/08kzCrqbIpzOF8VqJU1tY8
	9wG7xX6rs0t2pU8pOEYHGh7lcLChwrIc1RbEPiH67vP6iBZ95u4QulOLHRKQ3z4HK1k7L4YSYEZyg
	hWbDE9hx/1/whz5vkzzx1SrH8ol/L9OCcadUuwKkU13KiQUaAWHsCp2WaSKXYZ+PHuTPE1F1LLwCE
	6vrPpzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbgaK-00000007jKk-30ED;
	Sun, 18 Feb 2024 12:47:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbgaH-00000007jJQ-0n11;
	Sun, 18 Feb 2024 12:47:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 70868CE08CF;
	Sun, 18 Feb 2024 12:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E0DC433F1;
	Sun, 18 Feb 2024 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708260469;
	bh=sK2TmZpAQu9k8EAmihVlLcIiBryBY0eXzheo238yJWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbHkwCffzFslLALjB4HU3bL93ie308bi65wFrpZuI6Gpn7pfrfK7wd8UQWUCmoURn
	 8RyCLtsGROOHycaTrVINptPC4tVpYyDZi5l29aW0z1wefwZ3wGYQs9wCzr8M/Km/AH
	 oiKNs4yxhknja8YCDyCaq1/xaRKxTjvWuCBfQKMNOzoB0WKx/CX3/m2uOFlpONHwiE
	 c0ZOvnjVV2vMmVFxZzNwhP6+DUP3ctAF0LidKpYRs/pXjisDWnDsDRMk+2T25nXzV4
	 yf9fhltuGCsyiJf0u04XI2TaY05KfrCeShDca2tcH9MbncQzzObsP6Tj3FuqJnwx65
	 wUSC7qFLx9ALA==
Date: Sun, 18 Feb 2024 12:47:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	devicetree@vger.kernel.org, Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>, Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com, Yang Jihong <yangjihong1@huawei.com>
Subject: Re: [PATCH RFC 04/20] dt-bindings: riscv: add Sxcsrind ISA extension
 description
Message-ID: <20240218-struggle-grumble-43efdfb9515d@spud>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
 <20240217005738.3744121-5-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240217005738.3744121-5-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_044753_609440_0FB96B20 
X-CRM114-Status: GOOD (  16.78  )
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
Content-Type: multipart/mixed; boundary="===============3456730856282839818=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3456730856282839818==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mtQyaJDzucCfto0x"
Content-Disposition: inline


--mtQyaJDzucCfto0x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 04:57:22PM -0800, Atish Patra wrote:
> Add the S[m|s]csrind ISA extension description.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 63d81dc895e5..77a9f867e36b 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -134,6 +134,20 @@ properties:
>              added by other RISC-V extensions in H/S/VS/U/VU modes and as
>              ratified at commit a28bfae (Ratified (#7)) of riscv-state-en=
able.
> =20
> +	- const: smcsrind
> +          description: |
> +            The standard Smcsrind supervisor-level extension extends the

The indentation here looks weird.

> +	    indirect CSR access mechanism defined by the Smaia extension. This
> +	    extension allows other ISA extension to use indirect CSR access
> +	    mechanism in M-mode.

For this, and the other patches in the series, I want a reference to the
frozen/ratified point for these extensions. See the rest of this file
for examples.

Cheers,
Conor.

> +
> +	- const: sscsrind
> +          description: |
> +            The standard Sscsrind supervisor-level extension extends the
> +	    indirect CSR access mechanism defined by the Ssaia extension. This
> +	    extension allows other ISA extension to use indirect CSR access
> +	    mechanism in S-mode.
> +
>          - const: ssaia
>            description: |
>              The standard Ssaia supervisor-level extension for the advanc=
ed
> --=20
> 2.34.1
>=20

--mtQyaJDzucCfto0x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdH8awAKCRB4tDGHoIJi
0u4mAP9fsytyek6UcV7VwruVpbfAA+aCT8dvujmuE+Oy3Gzq/QEAgVGeiO4Z57ek
bOGtDZTcTAe8Vqrk2tSkrjGvbhOX2wQ=
=6anZ
-----END PGP SIGNATURE-----

--mtQyaJDzucCfto0x--


--===============3456730856282839818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3456730856282839818==--

