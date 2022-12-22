Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593EEC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 23:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzEqLfn6v+uGYVF0MQ3geNO/XZnzV/ia2EGVwa3occA=; b=ifwVBb4SgXA7yQeJxE1o/Ddz+M
	GT0LqxC9y7WjHHQd3pDf/sRgasvZpqIZajJ4+3AarWG6L0k3yatxVdlGVNftF0sAevqDrYUySl/q9
	zfiQD/vAiTGS6lryVgS6Z5uk/DIv+Ch1O/SJ4Hv1g/F08bJgaiQchsZllfQV0SDYsZJ9gQpw0DY/Z
	suyC4phKA93oemYw3ijtAHgF46KQBBRuAEtNkRtDLkyb3rpfTRgOL/I/oDyyt4az8pIJ/CAtxEnen
	k5+Ov0UzH3eiyK6TaVt0fNgUc9meLjewaMb5EmJ8T4wL0KKm7Qcvu6OB3lZOsh+iPsjJC2nc5I0FB
	L1pA5ktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8VJV-0013Nb-H9; Thu, 22 Dec 2022 23:49:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8VI0-0012dQ-JQ
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 23:47:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D6094B81B05;
	Thu, 22 Dec 2022 23:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B7CC433EF;
	Thu, 22 Dec 2022 23:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671752869;
	bh=zVqSDNpdT+kFJDxvwXHswUM2OPXCEhuAADp3ua0H6Mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3lJx1MgLaFWKEE03DBLZeawGlQLFGUKIaOYkc2Y0iiFEhkH6jJouCD0OCLSaiPv8
	 RoRVuJphMMZDWhNewxZlV4aXOmbMVeEkZfYpbHM1krZRCswbofguQzgi2bdwpwkNKq
	 +dukYYocg3yuPUDhFKG7+liFqs+PZoPQoQQBDYWQvvQ5kWcwp8iGg2arn/gLkBox4C
	 1BVL3etaUkfizK9jvScJuGLKMKvqkptLRb8jiuKMvUn/c6qjAXMv4nTdGI2HVg7ykK
	 P2U3LsiMMmtiNppwQJO5qYkGo2fJt9N+aav8ceqgRvKd8WJxlntDkD25UrhOCenBCP
	 xU6qfdPxmiwmQ==
Date: Thu, 22 Dec 2022 23:47:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Vineet Gupta <vineetg@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
	Andrew Waterman <andrew@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Szabolcs Nagy <szabolcs.nagy@arm.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Aaron Durbin <adurbin@rivosinc.com>,
	Andrew de los Reyes <adlr@rivosinc.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	GNU C Library <libc-alpha@sourceware.org>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Message-ID: <Y6Tsn3RZ4tt8k/2m@spud>
References: <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_154752_982606_69DD5BF3 
X-CRM114-Status: GOOD (  15.38  )
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
Content-Type: multipart/mixed; boundary="===============5412892798342438127=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5412892798342438127==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SlzGxRmkgYghrVNX"
Content-Disposition: inline


--SlzGxRmkgYghrVNX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2022 at 02:33:26AM +0800, Andy Chiu wrote:
=20
> I wrote a PoC patch for this and it has been pushed into the following gi=
t tree:
> https://github.com/sifive/riscv-linux/tree/dev/andyc/for-next-v13
> I tested it on a rv32 QEMU virt machine and the user space can get/set
> Vector registers normally. I haven't tested it on rv64 yet but it
> should be no difference. The patch is not the final version and maybe
> I missed some basic ideas.

> But if everyone agrees with this approach
> then I would like to start formalizing and submit the series.

Between yourself and the Rivos folk, you should probably sort out who is
doing what with the series at the very least, so that you're not both
working on "competing" v13s...


--SlzGxRmkgYghrVNX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6TsnwAKCRB4tDGHoIJi
0jcVAP0ZcNf7qkgZIPl5LDPs6yIWKy3lpHvX0/0WWigiYyIjvAD+L8d4fpCOJ05A
m/jktFE4OegjNls7rNA+comvLSVpyQk=
=rXN0
-----END PGP SIGNATURE-----

--SlzGxRmkgYghrVNX--


--===============5412892798342438127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5412892798342438127==--

