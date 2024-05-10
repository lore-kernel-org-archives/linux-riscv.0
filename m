Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75415C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 20:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1p/tUs1C3Pg2nuJFwqOmZzlpbdAA+DJk1HixfCHDoo=; b=4KJDepFTYtmECbX+DShkoNSvpF
	xpR6pYw1OLna0xFNNcxwe8dQFgtcpYLPgxUPdl50EqmZcBa4Zqlmo/vc9rucibsNSUcEWZ6vuM3Ml
	9XTJVdsUYfDE65WnwKPOIji9sA2As8U6aFGJoH2euXdFxkRt7GYDeAErvF276DdacQZTj0lshcdm+
	M57P23u86EshtCqrGzZs3mpMqygRV5VvTE5hZx/uSavmKN1N/jDqopEr4u96XUR+lr52Pl/jy5TrJ
	cI0Iwbwd5r6j4guarVmdn1FN7iWROtzSX0S4hIeODki6Xcrn3dqD4BSuTcIthcLCwNnz3uOgbGnNr
	YovOdM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5X5l-00000006Ppt-2LEq;
	Fri, 10 May 2024 20:43:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5X5h-00000006PpC-4Bmk
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 20:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D5870CE1ED8;
	Fri, 10 May 2024 20:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824FFC32781;
	Fri, 10 May 2024 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715373818;
	bh=V1weiyqYUi8cf0/ypiHaTqUR1iBXGA2Jxo6KOzagAx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZXZkQa3pJnj42KiEXIR1BP+TayP4gESPmBa6+RH8LUZrZlcAKDsgA8sI5IK3F13vB
	 +ibcG3vY+8oNiJJJOu+DsPmfvRnKbaL0pf4Fxa9Yi6k89Tnn+zOAAoIDdmc5wIwS0E
	 jmh6xA+pLxIcHfDHR4qZsqnL5sccoupfGTEJwaqq920X/OeZJtrYU/BS8YwgHmSN9q
	 JQWYjqzbAFrgImdxj7kaIJmGMd7LAIJD4ET03kSwowkAGljZorS8YvpKF2Sj2GordG
	 jePeLEMLyNSi4szrut/FoCSe70RPX79lSrYdHgnfMGHzPKwluHdRAS9qhVE/yM2gFu
	 03vgHJeLDBY3Q==
Date: Fri, 10 May 2024 21:43:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_V
 Kconfig option
Message-ID: <20240510-earthly-regress-7a8c8dba55db@spud>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
 <20240507-compile_kernel_with_extensions-v2-2-722c21c328c6@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240507-compile_kernel_with_extensions-v2-2-722c21c328c6@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_134342_343585_7A1BACD9 
X-CRM114-Status: GOOD (  13.41  )
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
Content-Type: multipart/mixed; boundary="===============5469006252773111894=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5469006252773111894==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kt7YioCjm2Pco75f"
Content-Disposition: inline


--kt7YioCjm2Pco75f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Charlie,

On Tue, May 07, 2024 at 06:36:28PM -0700, Charlie Jenkins wrote:
> Current versions of the kernel add "v" to the march and then immeidately
> filter it out such that "v" is not passed to CFLAGS.  Instead of doing
> this filtering, code blocks in the kernel that want to use vector
> assembly have been changed to locally enable vector (using ".option
> arch, +v").

Other content in the series aside, since this is a change that could be
made independently of the main series objectives, I figured it was worth
pointing out that this is not a change without downsides: I think that
it would drop support for vector with most versions of LLVM as
.option arch support there is much more recent thing than it is for gcc.
Off the top of my head I don't know exactly the versions involved, but
it is something like LLVM-14 supports vector but only LLVM-17 and later
supports .option arch.

Thanks,
Conor.

--kt7YioCjm2Pco75f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj6G9QAKCRB4tDGHoIJi
0q+gAPjjKuRZgtdpysJjkfjOXgAbIViLfJa9YW6kDhN9A8nZAP9+kEU1aZXKxvFD
4McVJZQgAsM/xY3ZI7ahJNfgyKE5Bg==
=hfje
-----END PGP SIGNATURE-----

--kt7YioCjm2Pco75f--


--===============5469006252773111894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5469006252773111894==--

