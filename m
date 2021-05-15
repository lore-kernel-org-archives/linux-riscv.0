Return-Path: <SRS0=yiB6=KK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0140C433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 15 May 2021 07:14:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55907613CA
	for <linux-riscv@archiver.kernel.org>; Sat, 15 May 2021 07:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55907613CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mEDDyX4EVPJLqndok4oSp3pOtLVLLqLloL+72RI5afY=; b=rQkIus67FCENCZb3BjYWsM/W8
	e4yHq9FKMuw4y2/vq2HolJ7RkY/wUkMBisadl2rl+jGGOjIDXkrx5/q4ZXHXJUuVgE8GbhTrFaI+s
	4+xhZO0dcCfIkpHRUKVnc+X1FxcYOdIUS4F5t5laOhB444ldgFbPaTKwHFs/0NIFIzWOs3JBs3MHF
	1f7veKn0a3/7tmJyUV5cRN86C7Tj8xREp00D7DtQ3LC2MSSGFmcLPP4+HyjKKDv64me5NFSRWXdqe
	EolS/xRPLHUTQ3Rnx9U/qn345xpDLwPgT0g+k0StdZhoBW9jTEjUYWsvbnkni8Q2C87ULYfPQgkNQ
	jqVuVIumg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhoVN-009sVu-AS; Sat, 15 May 2021 07:14:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhoVB-009sUv-76; Sat, 15 May 2021 07:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LsYnJ4YVipaCQaZycxi+jjR5TuT2fpHYr9Ieo+p4bq8=; b=jCUvcRlkZCCk0MEkKPW5gStAhx
 fvreVj2PdNabe8AvDd6gRZO90NZSnZFY0Y09YL6ArtDMbGguCTd2V3EalKa3yPzSgEzDgnSEmlwC9
 WEc5xyKcQLDGHRldpzW+8ia53NHZcxu3w//dBhIwKR0uFx6Ka1dMCZT23pLFtIMSgePl/Xy25bWpj
 EwqFYDRFUfzDDrysYXZG4uRSMqe/PcLxwpuRHFoIbjz/m3jR9fcyzHRMczO8riRDphxuBd5fYYXuS
 rIWEZqoK5INfRZiHD8/jwva/A3n1T/aXqjN0nTEQ2AU4SX6yY0wti4YR0Lr76HY47QYOWEt/n87C2
 NQq/pzZQ==;
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhoV8-00CQUS-6y; Sat, 15 May 2021 07:14:19 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 6324B1C0B80; Sat, 15 May 2021 09:14:11 +0200 (CEST)
Date: Sat, 15 May 2021 09:14:10 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210515071410.GA27201@amd>
References: <20210501151538.145449-1-masahiroy@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210515_001418_423719_97B40AAA 
X-CRM114-Status: GOOD (  13.26  )
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
Content-Type: multipart/mixed; boundary="===============2767414084060625232=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2767414084060625232==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-05-02 00:15:38, Masahiro Yamada wrote:
> The current minimum GCC version is 4.9 except ARCH=3Darm64 requiring
> GCC 5.1.

Please don't. I'm still on 4.9 on machine I can't easily update,

>  Documentation/process/changes.rst | 2 +-
>  arch/arm64/Kconfig                | 2 +-
>  arch/powerpc/Kconfig              | 2 +-
>  arch/riscv/Kconfig                | 2 +-
>  include/linux/compiler-gcc.h      | 6 +-----
>  lib/Kconfig.debug                 | 2 +-
>  scripts/min-tool-version.sh       | 8 +-------
>  7 files changed, 7 insertions(+), 17 deletions(-)

and 10 lines of cleanups is really not worth that.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCfdMIACgkQMOfwapXb+vJRuQCgkvFNWySx/cRHndnAzB2BNEcE
fUgAoLeFGahKOr8VmTLEps0tT667xra4
=bRN/
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--


--===============2767414084060625232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2767414084060625232==--

