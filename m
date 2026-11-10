Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D23606A330
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3sWs0O3P;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k/0Z+8zO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2/SfKhdglfWxhs8v0pXpiM0V4msEDQ7QA+EPdYRBjjU=; b=3sWs0O3PlPtcrPKAIJb5ngSy82
	6nU56N8SfHWkZ06bS6W5Tlu1pTyz/aEtEeJwb8zLBQYebKtdLofZmNjvZNNO87gO3B65irw1A2hLo
	oLIzZi4MKDeLLBlZzV4bNtUnoQ9cHkzqDBlsqa/csbS5tm7X5iBczISG4eIH9zSQZ3u3xfa/LjEDe
	zvvDy/EskWSTGmHLGv4x8dmSrwml8FSmRGsRS9xkVMMyhwFcdYnbPs8h6DvaQ7WhzsQE+DNgVeEP0
	jDkRMWLy+oqCZRHfKkNRUTWWAnA8/OjWUKSjM5ucklVd/c5cXEw4zcvFKCq09+koPAGzFPIb9TE+z
	7ErnoQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgGF-00000002uSA-0ei0;
	Tue, 10 Nov 2026 07:27:19 +0000
Received: from out-43.mta1.migadu.com ([2001:41d0:203:375::2b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgGA-00000002uQd-1BrO
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:27:17 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Jlx3khHmYf11Kc5Nu+VRaLVD/aQQv854yonbfkQB8wE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794295631; v=1; x=1794900431;
 b=k/0Z+8zOfgOMl6NA4BEOQ0qeKBitu62vgo/5NeIS+mb/A6RUrUwOXZPmtW9s+5rx3nfrmDwn
 djwe7x7oGcf5Wha9+pT2n+LPB2suxhSq1LcWHzUgxaprv1fE5tNqIIIemoTvB3BxKgDTfuGPbGV
 1EEnxS0xRYXPtPrabdMqv9Jw=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 354d447854a25624;
	Tue, 10 Nov 2026 07:27:10 +0000
X-Mizu-Trace-ID: 354d447854a25624
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 10 Nov 2026 07:27:07 +0000
Message-Id: <DMRCPRZVNPGZ.3HTEULWLQ76YL@linux.dev>
To: "Anup Patel" <anup@brainfault.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.dev>, "Thomas Gleixner"
 <tglx@kernel.org>, "Radu Rendec" <radu@rendec.net>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams"
 <clrkwllms@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Anup Patel"
 <apatel@ventanamicro.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH] irqchip/riscv-imsic: Synchronize remote state with IRQ
 work
From: "Troy Mitchell" <troy.mitchell@linux.dev>
In-Reply-To: <DMM1ZNXOFC8Q.HXUWNWMD6LKE@linux.dev>
References: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
 <CAAhSdy26R41W6OsTpEjMCf6iQXrtn4WrzziuGg+S9pHOHtM--A@mail.gmail.com>
 <DMM1ZNXOFC8Q.HXUWNWMD6LKE@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_232714_568849_854F5DF2 
X-CRM114-Status: GOOD (  20.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8923258758456839231=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8923258758456839231==
Content-Type: multipart/signed;
 boundary=ce428c8fa94fa432a281a32dcc895308571207f4b952ac431a0f37b483fb;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--ce428c8fa94fa432a281a32dcc895308571207f4b952ac431a0f37b483fb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 4, 2026 at 9:59 AM +08, Troy Mitchell wrote:
> On Tue Nov 3, 2026 at 11:52 PM +08, Anup Patel wrote:
> > On Tue, Nov 3, 2026 at 1:34 PM Troy Mitchell <troy.mitchell@linux.dev> =
wrote:
> > >
> > > Remote IMSIC state updates are deferred to a timer on the target CPU.
> > > If that CPU has stopped its local clockevent and is waiting for a
> > > broadcast interrupt, enabling the broadcast IRQ can depend on deliver=
y
> > > of that same interrupt. This can stall timer delivery when the broadc=
ast
> > > IRQ is unmasked or moved to another CPU, including during CPU hotplug=
.
> > >
> > > Queue hard IRQ work to synchronize remote state independently of time=
r
> > > delivery. Keep synchronous updates on the local CPU and the timer ret=
ry
> > > for an unfinished vector move. Hard IRQ work also avoids depending on=
 a
> > > schedulable worker when PREEMPT_RT is enabled.
> >
> > Using timer retry for local CPU and IRQ work queue for remote CPUs look=
s
> > strange. Why not use IRQ work queue even for local CPU ??
> On the local CPU the sync runs synchronously, so there is nothing to
> queue. The timer only retries an unfinished move, and by then the new
> vector is already enabled, so it cannot stall on the broadcast IRQ.
> Requeueing IRQ work from its own handler would just keep self-IPIing
> until the old CPU catches up.
>
> I'll add more comments and modify the commit body.
That was not the whole story. The retry cannot stall, but it can be
late. The local CPU is usually the one entering idle and taking the
broadcast IRQ, and the timer it arms on itself there is not programmed
because its tick is already stopped. Nothing tells it when the old CPU
is done, so the move only completes on its next interrupt. On K3 with
deep idle I see move windows of up to 0.5s.

So you are right that the timer should go, just not by requeueing on
the local CPU. In v2 the old CPU will queue the IRQ work on the new CPU
once it has released the old vector, and the retry timer will be
removed. Move windows drop to about 100us. This will be a separate
patch on top of this one.

--=20
Troy Mitchell

--ce428c8fa94fa432a281a32dcc895308571207f4b952ac431a0f37b483fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iI4EABYKADYWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavLHSxgcdHJveS5taXRj
aGVsbEBsaW51eC5kZXYACgkQmAnvgPkzNC/vOAD/WlHPe+g+zvOYYsakVCaeWRP6
QCEqDrKkV4pXEccSnO0BAI1kWUqD4O/X7XbtTiBVBJQEtacNA95laJHyT3AOg2EA
=Q5bv
-----END PGP SIGNATURE-----

--ce428c8fa94fa432a281a32dcc895308571207f4b952ac431a0f37b483fb--


--===============8923258758456839231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8923258758456839231==--

