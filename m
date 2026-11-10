Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF728606A32A
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R73anSYf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QnYqvRA+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oAPLKKlUJqrI6IXraldFI/OEehT4EP6JeemNDZrE0OQ=; b=R73anSYfV4tVzO3041EvZ4TQH3
	LbidJP/hRfFnoRALs3V36w7nUD48iQVtieh3eWLC3kzPDYPXju9csv0wLBtMjZFEr9gjrXN+y4PWp
	W3gXiGNs57BjJafu7XAXXxhYgYFVlRoCj7zMvJ15Hu0X+xB1yWOiFk+n51f08aA/02DmAB5Yt65p8
	C5SRWRu6TXLqQVz9TPMYq4F7NbBVGvh1tk27e9BKFTZQP0v6OwMwmlqiO1QOOr/UJFrOopLjOarz/
	i8oMCc2b1BFuFb8gIQ2v8ZbrunLgCTRmVQiEDJ2xRP6qpQh5x28tT5Dv865XWDKIGOW/1R/lEqj2j
	QStfzi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg4Z-00000002o89-06kv;
	Tue, 10 Nov 2026 07:15:15 +0000
Received: from out-162.mta1.migadu.com ([2001:41d0:203:375::a2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg4W-00000002o5v-0W8L
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:15:14 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BR31hFYX7ugXl+k+lRcU21WmDOzclg21QUBA2b36L8s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794294906; v=1; x=1794899706;
 b=QnYqvRA+dU4EglY5aQWdaTowT/kCIZS3wjVg3ybXmqmF2v4VW6Xp33tSJ+RZ3mgDROGADK/z
 33vatliDbrQb4Y3+0ffHVjh8EM0NFtyC6tlilCUWSBdAyQQKlOHrZ3tJW6BI3Fc6f10Js9V2hFm
 cJ1T5BKxz6Wn8ZGRrtTtPb1w=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id c22059331bb8cc3a;
	Tue, 10 Nov 2026 07:15:05 +0000
X-Mizu-Trace-ID: c22059331bb8cc3a
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 10 Nov 2026 07:15:00 +0000
Message-Id: <DMRCGHS3V729.FIU61TS3JYWD@linux.dev>
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Thomas Gleixner" <tglx@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Radu Rendec" <radu@rendec.net>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Anup Patel"
 <apatel@ventanamicro.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] irqchip/riscv-aplic: Process pending affinity changes
 on EOI
In-Reply-To: <87pkweuxbe.ffs@fw13>
References: <20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev>
 <87pkweuxbe.ffs@fw13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_231512_745106_42553D3E 
X-CRM114-Status: GOOD (  12.44  )
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
Content-Type: multipart/mixed; boundary="===============7556370816177531099=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7556370816177531099==
Content-Type: multipart/signed;
 boundary=af7ee67bc87fefa4170dac5c33b97ab56aa3ad2b31310ec7f4d32e37af50;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--af7ee67bc87fefa4170dac5c33b97ab56aa3ad2b31310ec7f4d32e37af50
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, 09 Nov 2026 11:13:41 +0100, Thomas Gleixner wrote:
> On Wed, Nov 04 2026 at 14:21, Troy Mitchell wrote:
> > IMSIC rejects an affinity change with -EBUSY while a previous vector
> > move is still in flight, and the IRQ core then records the new mask
> > as pending. The change is meant to be applied by irq_move_irq() in
> > the IMSIC irq_ack callback, but APLIC MSI interrupts are handled by
> > handle_fasteoi_irq(), which does not call irq_ack.
>
> Which is a bug when the interrupt is edge type.
>
> Edge type interrupts are fire and forget from the device point of
> view. So you want handle_edge_irq() for them, which issues the ack()
> _before_ the handler is invoked. Otherwise you can lose interrupts.
Right, I can reproduce the lost edge here. v2 will use handle_edge_irq()
for edge sources and handle_fasteoi_ack_irq() for level sources.

--=20
Troy Mitchell

--af7ee67bc87fefa4170dac5c33b97ab56aa3ad2b31310ec7f4d32e37af50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iI4EABYKADYWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavLEdBgcdHJveS5taXRj
aGVsbEBsaW51eC5kZXYACgkQmAnvgPkzNC+MxgEAvXKrxdr5nWdz6rjiKdD+6t/x
HGW/Hn2FtzS5PQRn8sEBAJUrJYMPaqwzzMOhG7+quaURlSe0tHDC6E6pCQw95GUD
=VXTx
-----END PGP SIGNATURE-----

--af7ee67bc87fefa4170dac5c33b97ab56aa3ad2b31310ec7f4d32e37af50--


--===============7556370816177531099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7556370816177531099==--

