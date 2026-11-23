Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37071606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mpTLmUFj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3VkflIru;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kAAiYpzk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i2Voha0werHV+c/UBpgS6XKEZX0bHX8qpPwjx0DybqY=; b=mpTLmUFjdQZapewONMI0u1208T
	Yo3CuFlajWkYgVfEuwJx8CBoM6KlSmjEiZjCh09Ij7I/UKGBlrAIv8PV8ALdjLWweXudR1IsRxu/q
	f99axbaoIYBJdP2ZLND8j8wnn1XEzHK16ltBE6LtCiDNDEGIevnn3FF07DVuKPheXlmBvh6puLwY6
	CFVw/68xXoj0BtGFAwxqfL/ta2eVEuUixydAMk+T1HzKj9TKauSTS/MEyAw1Hn08zLojfn1oAAJGw
	foofxRQTk1g5yy9JAqIazUOkNQ52ZOv1IDSqSTVQ10VaL6QN+SQVxD92EsqFzXevK62njER1cWKgz
	W9QSeX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQtV-00000002sfO-31Lc;
	Mon, 23 Nov 2026 10:03:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQtS-00000002sdJ-05Sk;
	Mon, 23 Nov 2026 10:03:27 +0000
Date: Mon, 23 Nov 2026 11:03:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795428203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CD4ic9Gltp6sjM8mfIwiECFvv0TUSDYXBdZI3py6+Hs=;
	b=3VkflIruKARozyrkLHlX2mQ95+oFUmmPQ9g7O4L3WFJ+V/4YkuEfXhftFZgsdG9N+ReUrC
	3ECXYSLczZ5sfXJmW/dp9rUJNM/FMjQfywHZgZtQzuHb0kSoe7hHEhJUgFIKC0qG05v5/W
	deQUhf+pARzVbGBEEIbo6yBX9OA7AK30MKgGM9nFf9PO5zjwkdkfGkZM9cxjaj34VKvOsw
	myOUpmdrBt4nOPgZIRTrtBBjy4he4UJ8IukvSGDbAO08UnI4M4oCeuCrk04sAimvWyNpHh
	OeIZxe3E8yO3AcaESf76ss7nR72GuxDw2HX74Yv5N4Yb5IVJ8j/g7DgcR1hCiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795428203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CD4ic9Gltp6sjM8mfIwiECFvv0TUSDYXBdZI3py6+Hs=;
	b=kAAiYpzkfztPq6MYwun6e1Y8Vy2mVk9Secfye9usXniusBTfN7Fozg38iBhnOT33Y8lwOo
	+hHvYlvL/ixDdMDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v3 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Message-ID: <20261123110111-6431e85f-39a4-427e-b545-2e7a590a6c19@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
 <ec5359c1-c16e-4177-8dfa-2ae5ab8a874f@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec5359c1-c16e-4177-8dfa-2ae5ab8a874f@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_020326_211868_9B154548 
X-CRM114-Status: GOOD (  17.37  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 10:44:40AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 23, 2026, at 10:37, Thomas Wei=DFschuh wrote:
> > There is nothing userspace can do with this value. In the kernel is
> > always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
> > userspace and also changes from time to time.
> >
> > Move the symbol to kernel-internal headers.
> >
> > Meant to be applied through the asm-generic or execve tree.
> > The default recipient list was huge. I trimmed it to only the
> > architecture lists.
> >
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> =

> Hi Thomas,
> =

> I'm happy to take this through the asm-generic tree. I've already
> made sure it all applies and the patches look good to me. I'd
> wait a few more days for additional Ack or any other replies,
> let me know once you think I should apply this version.

This v3 is functionally identical to v1 and v2 which have been on the
list of a long time. I am not sure how much more feedback will come.
IMO it can already be applied to gain more exposure in -next.


Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
