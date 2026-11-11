Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B479606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 01:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O+XpCf1T;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NtmP/+Rc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f7Gyra0tobNo9QF8A9WAM6YTPbYwTTPXA6wLYQHyOy0=; b=O+XpCf1TfbMwhDvnKi3bN0B0cs
	AeLtB/lr3Y0LT+qXyOKxJUIOukm7MFNodRsdstfx9RWeV/w2JOg0zbnN5y2ZQXgBGTX5ZqGwEcCYx
	mZuB3uL9jNu16TXEsgnuT8D8sjn0zUeKw7ZMnLnDQ3PFK6jo8rPAmNezu0hgFWFoCH+Zrjk29nPy6
	P+ak/64UzHrqEis6nb45y+Y2vMtwGTwgdfnjJJ3W/jT05A96eBwVwbhPS4hP2C7lofdgcFGxdS8NF
	u28ZXgOxxCJZg1jLXYTPkG10SIxIw2J9zOpjS9QJguZ5uCwWZPSDMA+IWEKTM3tOu1aFAR9zWvBZS
	4tfC+uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwsO-00000005M19-1G8M;
	Wed, 11 Nov 2026 01:11:48 +0000
Received: from out-55.mta1.migadu.com ([95.215.58.55] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwsJ-00000005M0l-2ITP
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 01:11:47 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bF/s9Eh+bsdrjEWqer0i7ryNUlXG2OzjJkfX9ENKl+o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794359500; v=1; x=1794964300;
 b=NtmP/+Rcp7qgfUY4bkpOKWxPgWjvawC2d3RoZibsSji56xk+92MIFDvhEPywj0vuES/5b7mD
 +HIsTAaebOqdwSuJ/GhEm4t/Wh2kkkZjeTyTactMdLg9PI5iInzEJPEqoyvqEns1py0cVbOUcha
 YP1u9Y2fZtL0jWSLOTxuH8O8=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 01af7b6ba4ef9efc;
	Wed, 11 Nov 2026 01:11:40 +0000
X-Mizu-Trace-ID: 01af7b6ba4ef9efc
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 11 Nov 2026 01:11:36 +0000
Message-Id: <DMRZCSZ0W7NS.K8CUKB6WCX01@linux.dev>
Cc: "Anup Patel" <apatel@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] irqchip/riscv-aplic: Use handle_edge_irq() for
 edge-triggered MSI sources
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Thomas Gleixner" <tglx@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.dev>, "Anup Patel" <anup@brainfault.org>, "Radu
 Rendec" <radu@rendec.net>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@rivosinc.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
 <20261110-aplic-affinity-fix-v2-1-6c143b8b4e8c@linux.dev>
 <87ik24telo.ffs@fw13>
In-Reply-To: <87ik24telo.ffs@fw13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_171144_793894_333BBA03 
X-CRM114-Status: GOOD (  19.24  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8558652867480653985=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8558652867480653985==
Content-Type: multipart/signed;
 boundary=dbbf7b4062f21184826499ede7d5460c438b26e25673e1cb068044142669;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--dbbf7b4062f21184826499ede7d5460c438b26e25673e1cb068044142669
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Thomas,

On Wed Nov 11, 2026 at 12:07 AM GMT, Thomas Gleixner wrote:
> On Tue, Nov 10 2026 at 12:06, Troy Mitchell wrote:
>> In MSI mode, all APLIC interrupts are handled by handle_fasteoi_irq().
>> For an edge-triggered source the APLIC forwards each edge as an MSI and
>> keeps no state after that, so an edge which the CPU side drops is lost.
>> After an affinity change, the next MSI can arrive on the new CPU while
>> the previous one is still being handled on the old CPU, and
>> handle_fasteoi_irq() then drops it.
>>
>> The fasteoi flow also never calls irq_ack(), which is where IMSIC applie=
s
>> an affinity change that was deferred while a previous vector move was in
>> flight. Such a change stays pending, and later affinity changes of the
>> interrupt only update the pending mask.
>>
>> Use handle_edge_irq() for edge-triggered sources. It acknowledges the
>> interrupt before invoking the handler. If the interrupt is still in
>> progress on the previous target CPU, it either waits for it to complete
>> or marks it pending so that the handler runs again.
>>
>> Fixes: ca8df97fe679 ("irqchip/riscv-aplic: Add support for MSI-mode")
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>
> Not that I care at all about showing up in some made up git-tag metrics,
> but in general it's a matter of courtesy to point out that the solution
> to the problem was suggested by someone else, no?

I'm so orry about that. Will add your Suggested-by in v3.

>
>> +	/*
>> +	 * Edge-triggered sources are fire and forget, so they must be
>> +	 * acknowledged before the handler runs. The edge flow handler also
>> +	 * replays an interrupt which arrives while the previous one is
>> +	 * still being handled on another CPU after an affinity change.
>> +	 */
>> +	if (type & IRQ_TYPE_EDGE_BOTH)
>> +		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
>> +						 handle_edge_irq, "edge");
>> +	else
>> +		irq_set_chip_handler_name_locked(d, irq_data_get_irq_chip(d),
>> +						 handle_fasteoi_irq, "fasteoi");
>> +
>
>   https://docs.kernel.org/process/maintainer-tip.html#bracket-rules

Will add the braces in v3. Thanks for your review!


--=20
Troy Mitchell


--dbbf7b4062f21184826499ede7d5460c438b26e25673e1cb068044142669
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iI4EABYKADYWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavPAyBgcdHJveS5taXRj
aGVsbEBsaW51eC5kZXYACgkQmAnvgPkzNC/ATwEA68tz0LWjoLhQ6lydmRmFFbH4
SqBX5eKqpNjMrVEbw78BAJVfavwwDwGaomM3yvjCdAxmfV9e269wEMCMPm3Cz1UN
=57iv
-----END PGP SIGNATURE-----

--dbbf7b4062f21184826499ede7d5460c438b26e25673e1cb068044142669--


--===============8558652867480653985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8558652867480653985==--

