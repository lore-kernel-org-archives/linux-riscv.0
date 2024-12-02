Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2C7D7830D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpNwm0YmrRQsty5hBEvz+L7DT1XRvDAPWC0ST/LBOho=; b=GyMpKA2v7Q9FR6tDF/qzN9Oa3F
	Zdq2B6m6q1+Z8CPErI7aGUiPMCS76BxwmPr9D2P7ac3CkAoYNtpgeb9LT6WQD37FLqa0W6AX4/3E1
	K4EhpjtMzSOjfAswHOCqInmXLHEpyd8LWhxZCUl1qyRKh/1ICeISON3ztdMdceQUdnPMc/CPcDBbg
	e2XT1xTwC2WJfbKywZKRTy+qBKVRsvx+EdeiwMVNY1mGjM5yRoYzBafuzMgeF7idAAXDHtDbNTjr2
	ZRKfzUQ1hKQ46iQ6YMjSbyFe5hNzsJ65Bq0gx07mdYxU+/Ei660m4/FYFlQHRZKVkzb40UDsg5Y+Z
	py5YOF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4f3-00000005uPk-28v9;
	Mon, 02 Dec 2024 11:32:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4VE-00000005s6b-44bs
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 11:22:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DDB6A40B03;
	Mon,  2 Dec 2024 11:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4627C4CED1;
	Mon,  2 Dec 2024 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733138527;
	bh=aKC5m8Te3KxTEdZNz2E/rO1mlGWhjourLbO6QpI5uH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c87NugaEjNKKTPM/z0lz9VdoOrDqtpqOTBEC8jUCWTMoK0S2qJsJP3NzuKbW5TJsC
	 D1Glbqrc0nYR1ID+fmI1ciPx7PUfvYtOzPiTytdAE/fBqYv7Qr2VGTxfbzEWnsVChY
	 HxrwOPGLYFP1wmPJx/JyYAFewQbBX63RfFltsEWNT8gNe4w7bqfsv8RiVi1iQwMgw+
	 CrLk7qGQTP+ujusSnnzVEL6tisVVYR/g7TzMsWGhPoNWNK2uqgWPlEpQJwdxhjHcUc
	 b2ZLoQj5Y+aOG2kxU+t9jNZDHV42G2fSaswlIs7ImaMGxwKV+NB0l8PMwKA+ChL2Y/
	 RqTMYKQuWq54A==
Date: Mon, 2 Dec 2024 11:22:02 +0000
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com,
	leobras@redhat.com, peterz@infradead.org, parri.andrea@gmail.com,
	will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
	arnd@arndb.de, alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RESEND PATCH] riscv: Fixup boot failure when
 CONFIG_DEBUG_RT_MUTEXES=y
Message-ID: <20241202-vertigo-dreamboat-4bf6b61a4ef6@spud>
References: <20241130153310.3349484-1-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241130153310.3349484-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_032209_308915_2954E17B 
X-CRM114-Status: GOOD (  11.61  )
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
Content-Type: multipart/mixed; boundary="===============3124972203304772719=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3124972203304772719==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PNVedD9oKqNR10oc"
Content-Disposition: inline


--PNVedD9oKqNR10oc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 30, 2024 at 10:33:10AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> When CONFIG_DEBUG_RT_MUTEXES=3Dy, mutex_lock->rt_mutex_try_acquire
> would change from rt_mutex_cmpxchg_acquire to
> rt_mutex_slowtrylock():
> 	raw_spin_lock_irqsave(&lock->wait_lock, flags);
> 	ret =3D __rt_mutex_slowtrylock(lock);
> 	raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
>=20
> Because queued_spin_#ops to ticket_#ops is changed one by one by
> jump_label, raw_spin_lock/unlock would cause a deadlock during the
> changing.
>=20
> That means in arch/riscv/kernel/jump_label.c:
> 1.
> arch_jump_label_transform_queue() ->
> mutex_lock(&text_mutex); +-> raw_spin_lock  -> queued_spin_lock
> 			 |-> raw_spin_unlock -> queued_spin_unlock
> patch_insn_write -> change the raw_spin_lock to ticket_lock
> mutex_unlock(&text_mutex);
> ...
>=20
> 2. /* Dirty the lock value */
> arch_jump_label_transform_queue() ->
> mutex_lock(&text_mutex); +-> raw_spin_lock -> *ticket_lock*
>                          |-> raw_spin_unlock -> *queued_spin_unlock*
> 			  /* BUG: ticket_lock with queued_spin_unlock */
> patch_insn_write  ->  change the raw_spin_unlock to ticket_unlock
> mutex_unlock(&text_mutex);
> ...
>=20
> 3. /* Dead lock */
> arch_jump_label_transform_queue() ->
> mutex_lock(&text_mutex); +-> raw_spin_lock -> ticket_lock /* deadlock! */
>                          |-> raw_spin_unlock -> ticket_unlock
> patch_insn_write -> change other raw_spin_#op -> ticket_#op
> mutex_unlock(&text_mutex);
>=20
> So, the solution is to disable mutex usage of
> arch_jump_label_transform_queue() during early_boot_irqs_disabled, just
> like we have done for stop_machine.
>=20
> Reported-by: Conor Dooley <conor@kernel.org>

Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--PNVedD9oKqNR10oc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ02YOAAKCRB4tDGHoIJi
0u4tAQD6SZZZiL32ZYOosf6OYXIcB58LwhhQx8q9rpkdOJ83MwEAz5fGQp47QqnL
p4h17qAfQMMQncnXded5i6hV9r39kQo=
=MpJM
-----END PGP SIGNATURE-----

--PNVedD9oKqNR10oc--


--===============3124972203304772719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3124972203304772719==--

