Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D922C05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 21:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxBnnPo8J7pWtDCYZb5ob5vFeBI0wg35QD6Rb888cLw=; b=L55SBqJZhTDT7QWLkcz7Zdyq/E
	e584pYlanbYBmf0KElRclue0yNfqImx4LvdEWjOso426G+2iwIIWimkybfJq2+kUWnwWDeqsLIry9
	SoHpgRGdp8StTWfrMhD+x9OcEgeDPrOv034pmG3qZi//jwZseUrKGojdSV4dEsaebwX0uhbQV304y
	TTL41QMu8deSRKtjmujM4O0GekoYYk+FPHvPrq81if1BRD6Ig4le5NgPyZinfnKFZY1Itbv10AJoJ
	cC5CWqmvzLrD/LVzzjsoJoK7FXoo0OOZf8iTMjMvuHiDDPZciK2EyUifP+5a5xZ/hmHLqs50bMxRB
	W07chH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP91V-009zYO-JX; Mon, 06 Feb 2023 21:27:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP91T-009zXV-3q
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 21:27:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EAA34B81626;
	Mon,  6 Feb 2023 21:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D9CC4339B;
	Mon,  6 Feb 2023 21:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675718850;
	bh=6fIOqeNi3vF8HalHNxYru+WNebNeboOgDccO3l/RKP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CL4ucl87U0F8GbsfXhz7gntr4An+rQhXUAvd484L5VYV6F900jD+fEkljrxTp/v7+
	 jINgL2Ex1gR05VKvyORXPTwEb0pYtJ5jNAXruUF1w+t4qmU6akzAIdU4a1CfmbHUC6
	 OIc40lE8GEoomm2I6zYH7lezvNHywdlifNZMQe2amWmtEAsQrInrikg17EKMnt1qD9
	 75n+V4pRoUNCEeK3LBPZW8BVnmVCtGOpfPWLEtgqUAFKVs+e0q7mS2QHzzlMBx+HoS
	 hKKe3qAdZd+JV6/OOicbliyrxFH7P0uZODoyOwaNJ5j1DpA5/6+QbA1vW1wrSH83/s
	 zJhw4Ddi+4T0Q==
Date: Mon, 6 Feb 2023 21:27:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	vineetg@rivosinc.com, heiko@sntech.de, slewis@rivosinc.com,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 6/6] selftests: Test the new RISC-V hwprobe interface
Message-ID: <Y+FwvI+xRg7zMhSx@sirena.org.uk>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-7-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230206201455.1790329-7-evan@rivosinc.com>
X-Cookie: Hope is a waking dream.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_132735_460038_AD4718DE 
X-CRM114-Status: GOOD (  12.03  )
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
Content-Type: multipart/mixed; boundary="===============4513254700461390023=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4513254700461390023==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jIK7x70KbUt5/QNK"
Content-Disposition: inline


--jIK7x70KbUt5/QNK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 06, 2023 at 12:14:55PM -0800, Evan Green wrote:

> +int main(int argc, char **argv)
> +{

> --- /dev/null
> +++ b/tools/testing/selftests/riscv/libc.S

> +.global _start
> +_start:
> +.option push
> +.option norelax
> +	la gp, __global_pointer$
> +.option pop
> +
> +	la sp, stack
> +
> +	la t0, heap
> +	la t1, brk
> +	REG_S t0, 0(t1)
> +
> +	li a0, 0
> +	li a1, 0
> +
> +	call main

This looks like it's just a standard program entry but I don't speak
RISC-V asm so I might be missing something.  If that's the case might it
make sense to use nolibc here?

--jIK7x70KbUt5/QNK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPhcLsACgkQJNaLcl1U
h9AXOAf+KvTREbTPWHZKIdO47p4iBbiY9FSOG3Y7Acvd7aMmaPWWLQU1wRTSig9V
SfnXNrxRcXT7f9eKvDnU7SAYblPQOcEkK5tv6E2OWOY6H8VarpTCKT7rUvfKaV7A
+FKsr/AZsIH27agEvbS4fgCjyFR/MJtyK/PwzpwQ7bYPXQPAo6NVF/vniJj40HP0
5VGzoxXa+2r8AK0fbe3qDEeNcNe5piAGtK9BCUkaADpF3BZ/8qEhmGlM5bA39itb
qvgV/4NJ5VfUfWg+Te8h5j3VUprcPaX4epNacV5HP8lgfr3bO4ms4nl8pAqCGoTK
oPnl54sP9qzvh6fzkZropoE6/ek4AA==
=/PL7
-----END PGP SIGNATURE-----

--jIK7x70KbUt5/QNK--


--===============4513254700461390023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4513254700461390023==--

