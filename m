Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD14C47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 18:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UV0P2wlrFE1vAz9Lk9DD3sltZKIgv0xY/2gWbyWr+zQ=; b=h/J/7iiSDnUjN85jUnWmu8N6DF
	kamvh1zQxvul5Zl9x1P1ytxEw9De8zm02G5oaaklOtL0U2oyjduwZHKd7iVoK/qDPxQRbL6sk11HE
	hwH3Gs7uFq+dTT4R1Cm3+uEsgvXGLGb3pau4dJZ3mAA/KNNjCnkj7MyxMk67HTzQ8/y2S/h7ewcR3
	HWyDQfP0ze+OAit/CQZBIYhknfRZ7FnAlGNnZfUbwBmFN8QMvZ1zFyksXNgrI1rBHf9VrAyYx1L1M
	vB8fD24SULJMX+nQeQGWKJRXmw0QTC5/lMAwbhqxuUnOlHmG0BX51HhwleFLmovLFTeCFUykhD8PN
	qhkFGyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWBA-0000000DtlQ-47GZ;
	Mon, 29 Jan 2024 18:16:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWB8-0000000DtkE-13ik
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 18:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBB2C62377;
	Mon, 29 Jan 2024 18:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE0AC43390;
	Mon, 29 Jan 2024 18:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706552177;
	bh=4eYLj/Lm5IOPUr7af+2C6a/UQ1OO1uxY23YBH7rnuMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6KeVEXSToGyeem1pchNMajeFGtoD9G9sIiQiQEfXKACNlusnFQ+nElZ28J5l1dTf
	 2lHc6BUcIcO94lv0eiRCXRNh0PlwylRLi2AunxuduIesrx0mL3dkIJk6lK8Ve6bEu3
	 5MBuCN43X5Ny0/9blfPv5VhHJ+Tfi2JuTdxn/UpCS5yrXTcy70VDCmLzt0ONykvGWB
	 kGKs+4RzzGHSW+Vl8Y66WkEPa99kpss/UvoaBlITv7TiXCtcippQI836W5nadNMS4u
	 tDu+oKcjn7DlPvMBaJNzYGrlLGtpCvdWDh1Ena/LF8pHJAQHApmlpohzNX0zey340P
	 VBAHcZ7w/z/mA==
Date: Mon, 29 Jan 2024 18:16:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: optimize memcpy/memmove/memset
Message-ID: <20240129-prelaw-tweet-ae59a90ded20@spud>
References: <20240128111013.2450-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240128111013.2450-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_101618_398911_9F70ED30 
X-CRM114-Status: GOOD (  19.22  )
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
Content-Type: multipart/mixed; boundary="===============4902725379320510370=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4902725379320510370==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d1n2JiHAv+OvTEWE"
Content-Disposition: inline


--d1n2JiHAv+OvTEWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 07:10:10PM +0800, Jisheng Zhang wrote:
> This series is to renew Matteo's "riscv: optimized mem* functions"
> sereies.
>=20
> Compared with Matteo's original series, Jisheng made below changes:
> 1. adopt Emil's change to fix boot failure when build with clang
> 2. add corresponding changes to purgatory
> 3. always build optimized string.c rather than only build when optimize
> for performance
> 4. implement unroll support when src & dst are both aligned to keep
> the same performance as assembly version. After disassembling, I found
> that the unroll version looks something like below, so it acchieves
> the "unroll" effect as asm version but in C programming language:
> 	ld	t2,0(a5)
> 	ld	t0,8(a5)
> 	ld	t6,16(a5)
> 	ld	t5,24(a5)
> 	ld	t4,32(a5)
> 	ld	t3,40(a5)
> 	ld	t1,48(a5)
> 	ld	a1,56(a5)
> 	sd	t2,0(a6)
> 	sd	t0,8(a6)
> 	sd	t6,16(a6)
> 	sd	t5,24(a6)
> 	sd	t4,32(a6)
> 	sd	t3,40(a6)
> 	sd	t1,48(a6)
> 	sd	a1,56(a6)
> And per my testing, unrolling more doesn't help performance, so
> the "c" version only unrolls by using 8 GP regs rather than 16
> ones as asm version.
> 5. Add proper __pi_memcpy and __pi___memcpy alias
> 6. more performance numbers.
>=20
> Per my benchmark with [1] on TH1520, CV1800B and JH7110 platforms,
> the unaligned medium memcpy performance is running about 3.5x ~ 8.6x
> speed of the unpatched versions's! Check patch1 for more details and
> performance numbers.
>=20
> Link:https://github.com/ARM-software/optimized-routines/blob/master/strin=
g/bench/memcpy.c [1]
>=20
> Here is the original cover letter msg from Matteo:
> Replace the assembly mem{cpy,move,set} with C equivalent.
>=20
> Try to access RAM with the largest bit width possible, but without
> doing unaligned accesses.
>=20
> A further improvement could be to use multiple read and writes as the
> assembly version was trying to do.
>=20
> Tested on a BeagleV Starlight with a SiFive U74 core, where the
> improvement is noticeable.

However, with allmodconfig it doesn't compile:
  Redirect to /build/tmp.zzMIlhgQQo and /build/tmp.vxnoxu8G5e
  Tree base:
  0c526539d432 ("riscv: optimized memcpy")
  Building the whole tree with the patch
  ../arch/riscv/lib/string.c:118:7: error: expected identifier or '('
  ../arch/riscv/lib/string.c:118:7: error: expected ')'
  ../arch/riscv/lib/string.c:143:7: error: expected identifier or '('
  ../arch/riscv/lib/string.c:143:7: error: expected ')'
  ../arch/riscv/lib/string.c:118:7: error: expected identifier or '('
  ../arch/riscv/lib/string.c:118:7: error: expected ')'
  ../arch/riscv/lib/string.c:143:7: error: expected identifier or '('
  ../arch/riscv/lib/string.c:143:7: error: expected ')'

Seems to be the case both with llvm and gcc.

Cheers,
Conor.


--d1n2JiHAv+OvTEWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbfrbQAKCRB4tDGHoIJi
0tfSAP9CXefieMdiPqbq7pdjY+14U99AxgMlsgdjf8Ba7tagMQD/bq4CepFhnrUJ
AmdXmVbmVEhI6YWXz3uuEssFY1Sg5A4=
=DP0s
-----END PGP SIGNATURE-----

--d1n2JiHAv+OvTEWE--


--===============4902725379320510370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4902725379320510370==--

