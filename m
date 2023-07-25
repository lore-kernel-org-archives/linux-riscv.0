Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D13C001DE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 21:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsoOM4yHXEOAPiZ/SMwhRVbu8OieQ88AQ4MfyCQ/tFg=; b=PigmzQWFfWVOVJ6NAG34CeHOL5
	oN+T6rnxHypnXG2d2lRJ57doDeDOhHjstlq5cSq5zaYqZb/iOSk/6SRpv4hpT6/C9mVexhFligj/S
	7EAzxFCN134t43t3xqYqxeshrzeEe52W8/UJ+m6xxckgNxO5HZ+KtjBH1TCitn+Z+aTcar7X3jgDi
	NB7U968eAGt7XHlSIBK9T/KCJfO9AErIgKcp8Ke6g6zmGaXnFqstLSAl1RtWSS/NYz8ncvSVfM0ly
	/yJfk9QCC538MzCGoVXWmJhQQiFQj1f+WL43f1As8FY9h3i0iUpEl/Xd7o7BrTBYo18Z1W683aX23
	tT9pIxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOPtv-008ZFe-3A;
	Tue, 25 Jul 2023 21:49:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOPtt-008ZFD-0E;
	Tue, 25 Jul 2023 21:49:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5EE0E61901;
	Tue, 25 Jul 2023 21:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85582C433C7;
	Tue, 25 Jul 2023 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690321739;
	bh=giBk76Wu2CNxIKQ+bWSMybNrR4Xwdbrb7bfqe39jKGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTmiPxbosiW2nQ1ygwQpI0u0A4jO+VTQXLpQm8gykr4mpHK3Nbw0GxqExmFvJhKuo
	 K7gyCPZSlS34qRrp6CqEERKzht3NHErcrghZVkiqAvTGB5YnBfjKD8TDu64naG0m9+
	 0WdQ5D2fH9aiZ+BTkjukoVJeYUlPba/5saeEmpjCOAsqR3mOdVd7nB1nOdM13z4RRk
	 a2zClPLVbB77kQa2iQYXWUUkva6q41jzfJKrKzmfPn06MF0U1N/ptqUc5T7KicqYLW
	 HttCu5Irc4LxKIo1jgHA2dktF2NeeoDppcsSg5e2rqsipXR6/4h6hFmSxBtDRHsxKL
	 RJcaZWEpIopkQ==
Date: Tue, 25 Jul 2023 22:48:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Jiahao <chenjiahao16@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, guoren@kernel.org, heiko@sntech.de,
	bjorn@rivosinc.com, alex@ghiti.fr, akpm@linux-foundation.org,
	atishp@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com,
	horms@kernel.org
Subject: Re: [PATCH -next v8 0/2] support allocating crashkernel above 4G
 explicitly on riscv
Message-ID: <20230725-judiciary-auction-ef50be622175@spud>
References: <20230725214413.2488159-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20230725214413.2488159-1-chenjiahao16@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_144901_173612_D07FAF4F 
X-CRM114-Status: UNSURE (   7.40  )
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
Content-Type: multipart/mixed; boundary="===============2567986572581481297=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2567986572581481297==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tppZMEkMOmCgNS1D"
Content-Disposition: inline


--tppZMEkMOmCgNS1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey,

Your $subject says -next, but the patch failed to apply to
riscv/for-next. What was the base for this patchset?

Thanks,
Conor.

--tppZMEkMOmCgNS1D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMBDRgAKCRB4tDGHoIJi
0sf8AP4uEgceSAb5yQVnixLMnccgleBSjQoafJCHM7CMGvRtRQEA9nabe9G4Ghc/
Xbr6ZvQqp/XMXGdRmePLtK0/PKv2pQs=
=nSay
-----END PGP SIGNATURE-----

--tppZMEkMOmCgNS1D--


--===============2567986572581481297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2567986572581481297==--

