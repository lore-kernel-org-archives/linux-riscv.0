Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872BB606A329
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 01:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xAU0evIW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lJOD7Ac4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EF+odPv/h43N2GrdveuCEDtzMUsOCzZxnT5oyYeCfyY=; b=xAU0evIW1sIextKniu1gdyZGZu
	SXBU6ETTaDM73A5DxJ49PkzOU4U7qMldsIHSuGVWJAU33YAJzqIlV076qVLzLkJXs3Zc758/z8gqh
	KsW+HEkZZPMGN6cyyuH/ypLrGqUNv8A1SPtqPryScZeqdSjm6zYKRLMOHclHEgFi/2VTybZzzxRrf
	rEifJ1gUE1IjhmYkFfwxRlt5+uvhveJD4UVKMaGx34jKg1x0ttYim7mkV23MYbt06Jkrii09E1Row
	BjkkP2h+AglthNS+wvtH9QIhqYEgdr4V33Lg+eyVNLpb0FBilumdWj1axAD87YEhwxg3nHE3qp191
	UaBJEI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQHu-000000046ZU-2ifb;
	Wed, 04 Nov 2026 01:59:42 +0000
Received: from out-250.mta0.migadu.com ([2001:41d0:1004:224b::fa] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQHs-000000046YM-0u9v
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 01:59:41 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6g32PsKdkRLeTZ4LSwatErJCU5OnLPMMaSmgKWyS70g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793757578; v=1; x=1794362378;
 b=lJOD7Ac4EGChVBpEu2cuuOf9e69qfAQ8xuHZjosHZDJlHOaD/546BerZoXVDF9OGAEZfZog4
 3KX6Ha+Cb2FxhwVI/piA9jDBfg3eszdj3qeVEj2YcAYQzzW7QLj2vgEIwVhgXIGVEgPrKTX+EAb
 nzYIfcvzXfGM6x7kez45dQSM=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id b85e7a3be548a814;
	Wed, 04 Nov 2026 01:59:37 +0000
X-Mizu-Trace-ID: b85e7a3be548a814
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 04 Nov 2026 09:59:30 +0800
Message-Id: <DMM1ZNXOFC8Q.HXUWNWMD6LKE@linux.dev>
Cc: "Thomas Gleixner" <tglx@kernel.org>, "Radu Rendec" <radu@rendec.net>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams"
 <clrkwllms@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, "Anup Patel"
 <apatel@ventanamicro.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH] irqchip/riscv-imsic: Synchronize remote state with IRQ
 work
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Anup Patel" <anup@brainfault.org>, "Troy Mitchell"
 <troy.mitchell@linux.dev>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
 <CAAhSdy26R41W6OsTpEjMCf6iQXrtn4WrzziuGg+S9pHOHtM--A@mail.gmail.com>
In-Reply-To: <CAAhSdy26R41W6OsTpEjMCf6iQXrtn4WrzziuGg+S9pHOHtM--A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_175940_388581_C08C2C2D 
X-CRM114-Status: GOOD (  11.11  )
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
Content-Type: multipart/mixed; boundary="===============6665476522030022806=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6665476522030022806==
Content-Type: multipart/signed;
 boundary=56d7954e1823c29e3c2394602d9e592c14ea976c474f7a6637894a247bbc;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--56d7954e1823c29e3c2394602d9e592c14ea976c474f7a6637894a247bbc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 3, 2026 at 11:52 PM +08, Anup Patel wrote:
> On Tue, Nov 3, 2026 at 1:34=E2=80=AFPM Troy Mitchell <troy.mitchell@linux=
.dev> wrote:
>>
>> Remote IMSIC state updates are deferred to a timer on the target CPU.
>> If that CPU has stopped its local clockevent and is waiting for a
>> broadcast interrupt, enabling the broadcast IRQ can depend on delivery
>> of that same interrupt. This can stall timer delivery when the broadcast
>> IRQ is unmasked or moved to another CPU, including during CPU hotplug.
>>
>> Queue hard IRQ work to synchronize remote state independently of timer
>> delivery. Keep synchronous updates on the local CPU and the timer retry
>> for an unfinished vector move. Hard IRQ work also avoids depending on a
>> schedulable worker when PREEMPT_RT is enabled.
>
> Using timer retry for local CPU and IRQ work queue for remote CPUs looks
> strange. Why not use IRQ work queue even for local CPU ??
On the local CPU the sync runs synchronously, so there is nothing to
queue. The timer only retries an unfinished move, and by then the new
vector is already enabled, so it cannot stall on the broadcast IRQ.
Requeueing IRQ work from its own handler would just keep self-IPIing
until the old CPU catches up.

I'll add more comments and modify the commit body.

--=20
Troy Mitchell


--56d7954e1823c29e3c2394602d9e592c14ea976c474f7a6637894a247bbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauqRgiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/RwQEAqJNvz80iRJkb
Z8Yz+vUyyAzhmceho0CtFhLRHQoE9vYBAOdmpp4WhNu9TMxAAt7VNSpFhr/ABrrn
evvi3vN5+msG
=Sb+D
-----END PGP SIGNATURE-----

--56d7954e1823c29e3c2394602d9e592c14ea976c474f7a6637894a247bbc--


--===============6665476522030022806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6665476522030022806==--

