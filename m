Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2B2EE14D8
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOv+h4Mmpe0ffwA55eZ2onENoh/9Q6UeYl4v5/n5dCU=; b=ua9P4gXuy/A53JMUYPqe1MshKb
	k9BKd6wGx8I44Vu9OCxncA/x6MW6hNlNgTjRUdlXmVNHnC2h8hl+29EFacDHl5EcILcx6rlB+9BEr
	VmFRBpwZBxPKJkMJ5DzD74gym9T6PxIuj85j0TlVFpatFwowQHzZZj7KUfFlKoUpkRPRCx8FUDcgW
	3KI/mTJ7TUScG055F3DJsnlddngTRcUfnmvjpppr9zNlNMMi021FkHv/C2w1M2S5FXq/je5epznlo
	QyHB7NLqypCXG+s6KwGc/NQ1C5TRyCFxcEIF5CDzHd6PdhZQS+440xWhlWRwHCwv49NaSo8VKOVEA
	2WPmnB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGnV-00GM0G-1V;
	Sun, 10 Sep 2023 09:32:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGnS-00GLzZ-2L
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 09:32:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB66D60BA8;
	Sun, 10 Sep 2023 09:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32285C433C7;
	Sun, 10 Sep 2023 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694338320;
	bh=H01H+tItBe/f1HBCTNs9RWw8RSW5Ihqr0eB54UsfjNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLUdhKDjftvjjo7I97DfdR/Y2b94DcrttCeU2mgWCfkA36iPV5RrQX27R8+zBzEco
	 UdBW7niCueVDE0H3zp3Sat3xAsLficyB4Y3NC1EMmqjfnc1Ovbezs2hhsqbi9bL3/h
	 /KKpLA9Iv7PGn9ObdSonVy/aeo85HrlnUZNqnShT0FuvXUwgM4RxoJcjlvKkVrllqp
	 dKR74igmnnKbIBSedUXCnvUlcUdfT4Gq4rhVAAfJIi0aZsqbdK3mTmH2vVXOcJxhdz
	 CurNJ6HGgQZzaZ5AuyB50k98GeaHZQEhxp9n8Ly6DjrMeWr9f9GqpvoEoXysAGInyw
	 rA9HF39FXFJcA==
Date: Sun, 10 Sep 2023 10:31:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	leobras@redhat.com, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
Message-ID: <20230910-baggage-accent-ec5331b58c8e@spud>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910-esteemed-exodus-706aaae940b1@spud>
 <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_023202_850099_E9C1B584 
X-CRM114-Status: GOOD (  15.71  )
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
Content-Type: multipart/mixed; boundary="===============5156437876743181839=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5156437876743181839==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yqGJs2961AMnEwR5"
Content-Disposition: inline


--yqGJs2961AMnEwR5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 10, 2023 at 05:16:46PM +0800, Guo Ren wrote:
> On Sun, Sep 10, 2023 at 4:58=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Sun, Sep 10, 2023 at 04:28:54AM -0400, guoren@kernel.org wrote:
> >
> > > Changlog:
> > > V11:
> > >  - Based on Leonardo Bras's cmpxchg_small patches v5.
> > >  - Based on Guo Ren's Optimize arch_spin_value_unlocked patch v3.
> > >  - Remove abusing alternative framework and use jump_label instead.
> >
> > btw, I didn't say that using alternatives was the problem, it was
> > abusing the errata framework to perform feature detection that I had
> > a problem with. That's not changed in v11.
> I've removed errata feature detection. The only related patches are:
>  - riscv: qspinlock: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
>  - riscv: qspinlock: errata: Enable qspinlock for T-HEAD processors
>=20
> Which one is your concern? Could you reply on the exact patch thread? Thx.

riscv: qspinlock: errata: Enable qspinlock for T-HEAD processors

Please go back and re-read the comments I left on v11 about using the
errata code for feature detection.

> > A stronger forward progress guarantee is not an erratum, AFAICT.

> Sorry, there is no erratum of "stronger forward progress guarantee" in th=
e V11.

"riscv: qspinlock: errata: Enable qspinlock for T-HEAD processors" still
uses the errata framework to detect the presence of the stronger forward
progress guarantee in v11.

--yqGJs2961AMnEwR5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP2NBwAKCRB4tDGHoIJi
0qdtAP45u4IT5Oy1yj6BJRwFwC1nba3CaGiLPESurC9aK1qQAAEAo61KQJ9HCnaq
YE+L9eAoD9bEJUZxgPzyucDNIHRrhQI=
=7tv3
-----END PGP SIGNATURE-----

--yqGJs2961AMnEwR5--


--===============5156437876743181839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5156437876743181839==--

