Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D427ECF9C7B
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 18:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r5KvmesMkdqQnsYgGkk3QLowwK5hKOMVdNQehXYpCw=; b=qVQCJ5pkVhKnXHVFLLaH2n05PO
	K/1S51sNbydw1j8zMWriYSS5JhrNEEtmuAwMFWJB4qtCKfYu66yEYjOSxT8Fzkrs3sQqLTm9AZUxw
	uyMDq1r/QfAqii9ARNd4aT7aXdWw87R+D8wueGUFoRM7bm81XOwllc/mxeJYalRzF0jJCvGdJbZ6J
	zAMwJt0q8CFNqpMm2+m6vGYSMtx8d7Z+hSSWRStiUAfSCkYGdH9OB6/ecWpe04kKWfyDKGg49jOUL
	/Be5EuQPI0FNxtGAbFsnoIQHREoJPfI7PP7k1QB/FXYqIP+bB6SGKePKbWopBlgZrE26r0ezAJb1E
	PCKJBH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8yh-00000007C8g-1Xvx;
	Thu, 20 Nov 2025 18:01:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8yf-00000007C8Y-1jp3
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 18:01:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40F7060121;
	Thu, 20 Nov 2025 18:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D97C4CEF1;
	Thu, 20 Nov 2025 18:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763661711;
	bh=O1lgqQO1rPnioMIL/N11uQCIUh306m6w5d+VYhGjuK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3gqHlvk81twLDfgfnTcSW1SZMT/IioQDLEI93f+wxPQ/3qTlxH9DH1Y59vhukQdU
	 B3qrCGAEMlz67nHhAf//CASey5oQxIjGPTcd+mUK3mmlZ2lGmbYV02u2GTtepjVLZI
	 /oTau3cKm7wdNvZaMgjvG8+8pLqAKuFMXEm6w7F/obNukQduzONir3URlTKKJFNlJr
	 9HiNShZzl2f1Udc7lyZfT37eSU4bvZDYvqylpvjmDS7OqBRtkJlCxAB1VD7AZI+WWf
	 XhHO1K09yiz5qUho+C4MOMnmI9ne//6Bx+NL7QjUF23HJTWkqBK2R2AOaMICi8JBzt
	 0Fc1b6SO856vw==
Date: Thu, 20 Nov 2025 18:01:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 1/7] dt-bindings: clock: thead,th1520-clk-ap: Add ID for
 C910 bus clock
Message-ID: <20251120-counting-trapeze-ea03dcedf308@spud>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-2-ziyao@disroot.org>
MIME-Version: 1.0
In-Reply-To: <20251120131416.26236-2-ziyao@disroot.org>
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============6567071755786000803=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6567071755786000803==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hciV0fsKO5750iZC"
Content-Disposition: inline


--hciV0fsKO5750iZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 01:14:10PM +0000, Yao Zi wrote:
> Add binding ID for C910 bus clock, which takes CLK_C910 as parent and is
> essential for C910 cluster's operation.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  include/dt-bindings/clock/thead,th1520-clk-ap.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt=
-bindings/clock/thead,th1520-clk-ap.h
> index 09a9aa7b3ab1..68b35cc61204 100644
> --- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
> +++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
> @@ -93,6 +93,7 @@
>  #define CLK_SRAM3		83
>  #define CLK_PLL_GMAC_100M	84
>  #define CLK_UART_SCLK		85
> +#define CLK_C910_BUS		86
> =20
>  /* VO clocks */
>  #define CLK_AXI4_VO_ACLK		0
> --=20
> 2.51.2
>=20

--hciV0fsKO5750iZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR9XiQAKCRB4tDGHoIJi
0jtfAQDWP31/ok/XHSOAXY4rVTGjq8mwEOqTxwqsWpG4YLsddwEAlZHkUga5QIVC
JGylv23X3GaAaW8Z8PE5rjNZmFN6Rg4=
=R26s
-----END PGP SIGNATURE-----

--hciV0fsKO5750iZC--


--===============6567071755786000803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6567071755786000803==--

