Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A769CD37B9
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xd85ujVj3md8o9187B/s6BEw7Z5Hxi7fgrfuv3FQ84E=; b=YrvOY6vzsBTw+CRGa6M209C2bX
	0/VLRJPry9nnlQmlTNjR16jbFpfUbMmF0llj8tCp5hlgf3ny41hjBpTpjpntkK4ks9jwprR6ZMpWJ
	JmDImxkJBiTA5WMJ6mAm65Khj68AXnpXmUROa6d3DjJuQIT2y7XN9Y/5ivbpRYpdjFNgFS6EocoBV
	xkfjq2wSS3d7n5ltAcwWwvJVn0OG9MrPki0PrDkKXUzabahFMIHXYeW1kUETPUC/24q0RR0VUeest
	7OXQsWtSW9pzUzME1l+6rSJRI0Nx+rMlnU4aY2UzwceLKcf9FB4XuPtvhLlclESJUvyWp5iFfJU//
	zNXLG5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhR0p-00CCty-0D;
	Sat, 16 Sep 2023 08:50:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhR0m-00CCtb-1f
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 08:50:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4F0B2B80A71;
	Sat, 16 Sep 2023 08:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AADC433C7;
	Sat, 16 Sep 2023 08:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694854241;
	bh=40ylAetvH2D45aO5J/08CkEvM05rm1lwgoMuurgAuH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gC+VjBFi06GNrUV4aejNhpXtveOVkoTOJURdSDxNPs+L1wLQuki8wXleFcffnq9Xj
	 X6PW2HOI5TlnVkKC591doTM7l1THmFUSQB1Jlhx+3uRq0UhlHHiZ3+p97Na0Qtfg2K
	 bsD5I6szMJPGak1RUxwzIs6upcyErp1/s+Xp1mHqDjtHjnkTugyv7vANcepK86Xpa+
	 aFAIMbolhjbh59Ge0hy1eVd/nWSAq2zQOF8PmqxOcN11bATns2sTU/wkdxq3y7jdaK
	 kQBUNNwtA6EDXCOucwung84Z5syZ82le1aiY0yVEe+oxASsns0Wn/HTYHuajwtILlm
	 l9AVHz3LY2Zhg==
Date: Sat, 16 Sep 2023 09:50:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v6 1/4] asm-generic: Improve csum_fold
Message-ID: <20230916-jackpot-guy-01c2024c6a63@spud>
References: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
 <20230915-optimize_checksum-v6-1-14a6cf61c618@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230915-optimize_checksum-v6-1-14a6cf61c618@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_015044_839945_6DFB0138 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8754139419144630856=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8754139419144630856==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="60Aaxr3gdQT472cE"
Content-Disposition: inline


--60Aaxr3gdQT472cE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 10:01:17AM -0700, Charlie Jenkins wrote:
> This csum_fold implementation introduced into arch/arc by Vineet Gupta
> is better than the default implementation on at least arc, x86, and
> riscv. Using GCC trunk and compiling non-inlined version, this
> implementation has 41.6667%, 25% fewer instructions on riscv64, x86-64
> respectively with -O3 optimization. Most implmentations override this
> default in asm, but this should be more performant than all of those
> other implementations except for arm which has barrel shifting and
> sparc32 which has a carry flag.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: David Laight <david.laight@aculab.com>
> ---
>  include/asm-generic/checksum.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/include/asm-generic/checksum.h b/include/asm-generic/checksu=
m.h
> index 43e18db89c14..37f5ec70ac93 100644
> --- a/include/asm-generic/checksum.h
> +++ b/include/asm-generic/checksum.h
> @@ -31,9 +31,7 @@ extern __sum16 ip_fast_csum(const void *iph, unsigned i=
nt ihl);
>  static inline __sum16 csum_fold(__wsum csum)
>  {
>  	u32 sum =3D (__force u32)csum;
> -	sum =3D (sum & 0xffff) + (sum >> 16);
> -	sum =3D (sum & 0xffff) + (sum >> 16);
> -	return (__force __sum16)~sum;
> +	return (__force __sum16)((~sum - ror32(sum, 16)) >> 16);

Breaks the build on RISC-V in a way that is repaired by later patches in
the series, so you likely did not notice:

=2E/include/asm-generic/checksum.h:34:35: error: call to undeclared functio=
n 'ror32'; ISO C99 and later do not support implicit function declarations =
[-Wimplicit-function-declaration]
=2E./include/linux/bitops.h:134:21: error: static declaration of 'ror32' fo=
llows non-static declaration

Cheers,
Conor.

--60Aaxr3gdQT472cE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQVsXAAKCRB4tDGHoIJi
0mnEAQCTLnl3iMEBVo3Tzp6o42hU6amG6PduNyUQd8smnnQAVAD/RhsXtPuthkcC
tk+v8xXjpz227mU8sGL65Usl2rfDRgk=
=GX46
-----END PGP SIGNATURE-----

--60Aaxr3gdQT472cE--


--===============8754139419144630856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8754139419144630856==--

